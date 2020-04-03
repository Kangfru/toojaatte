import sys
import cx_Oracle
import FinanceDataReader as fdr
import pandas as pd
import os
import tensorflow as tf
import numpy as np
import datetime
import matplotlib.pyplot as plt

os.putenv('NLS_LANG', '.UTF8')
tf.set_random_seed(777)
connection = cx_Oracle.connect('c##dogfoot/dogfoot@402-oracle:1521/orcl')



# 너무 작거나 너무 큰 값이 학습을 방해하는 것을 방지하기 위해 정규화.
# x가 양수라는 가정하에 최솟값과 최댓값을 이용하여 0~1 사이의 값으로 정규화
# Standardization
def data_standardization(x):
    x_np = np.asarray(x)
    return (x_np - x_np.mean()) / x_np.std()

def min_max_scaling(x):
    x_np = np.asarray(x)
    return (x_np - x_np.min()) / (x_np.max() - x_np.min() + 1e-7)  # 1e-7은 0으로 나누는 오류 예방차원

# 정규화된 값을 원래의 값으로 되돌린다
# 정규화하기 이전의 org_x값과 되돌리고 싶은 x를 입력하면 역정규화된 값을 리턴한다
def reverse_min_max_scaling(org_x, x):
    org_x_np = np.asarray(org_x)
    x_np = np.asarray(x)
    return (x_np * (org_x_np.max() - org_x_np.min() + 1e-7)) + org_x_np.min()


# 하이퍼파라미터
input_data_column_cnt = 5  # 입력데이터의 컬럼 개수(Variable 개수)
output_data_column_cnt = 1  # 결과데이터의 컬럼 개수

seq_length = 30  # 1개 시퀀스의 길이(시계열데이터 입력 개수) -> 거래일
rnn_cell_hidden_dim = 20  # 각 셀의 (hidden)출력 크기
forget_bias = 1.0  # 망각편향(기본값 1.0)
num_stacked_layers = 1  # stacked LSTM layers 개수
keep_prob = 1.0  # dropout할 때 keep할 비율

epoch_num = 1000  # 에폭 횟수(학습용전체데이터를 몇 회 반복해서 학습할 것인가 입력)
learning_rate = 0.01  # 학습률

def ml(code, name):
    tf.reset_default_graph()
    raw_df = fdr.DataReader(code, '2010-01-01')
    raw_df = raw_df.reset_index()
    print(raw_df.tail())

    del raw_df['Date']
    del raw_df['Change']
    # print(raw_df.info())

    stock_info = raw_df.astype(np.float)
    print(stock_info.head())
    price = stock_info.drop(['Volume'], axis=1)
    norm_price = min_max_scaling(price)
    # print(norm_price)

    volume = stock_info.get(['Volume'])
    norm_volume = min_max_scaling(volume)

    x = np.concatenate((norm_price, norm_volume), axis=1)
    # print(x)

    y = x[:, [-2]]
    # print(y)
    dataX = []
    dataY = []
    for i in range(0, len(y) - seq_length):
        _x = x[i : i + seq_length]
        _y = y[i+seq_length] # 다음날 주가 -> 정답
        if i is 0:
            print(_x, "->", _y)
        dataX.append(_x)
        dataY.append(_y)

    train_size = int(len(dataY) * 0.7)
    test_size = len(dataY) - train_size

    trainX = np.array(dataX[0:train_size])
    trainY = np.array(dataY[0:train_size])

    testX = np.array(dataX[train_size:len(dataX)])
    testY = np.array(dataY[train_size:len(dataY)])
    # print("trainY : ",trainY)
    # print("testY : ",testY)


    X = tf.placeholder(tf.float32, [None, seq_length, input_data_column_cnt])
    # print("X : ", X)
    Y = tf.placeholder(tf.float32, [None, 1])
    # print("Y : ", Y)

    targets = tf.placeholder(tf.float32, [None, 1])
    predictions = tf.placeholder(tf.float32, [None, 1])

    def lstm_cell():
        cell = tf.contrib.rnn.BasicLSTMCell(num_units=rnn_cell_hidden_dim,
                                            forget_bias=forget_bias, state_is_tuple=True,
                                            activation=tf.nn.softsign)
        if keep_prob < 1.0:
            cell = tf.contrib.rnn.DropoutWrapper(cell, output_keep_prob=keep_prob)
        return cell

    stackedRNNs = [lstm_cell() for _ in range(num_stacked_layers)]
    multi_cells = tf.contrib.rnn.MultiRNNCell(stackedRNNs, state_is_tuple=True) if num_stacked_layers > 1 else lstm_cell()

    hypothesis, _states = tf.nn.dynamic_rnn(multi_cells, X, dtype=tf.float32)
    print("hypothesis : ", hypothesis)
    hypothesis = tf.contrib.layers.fully_connected(hypothesis[:, -1], output_data_column_cnt, activation_fn=tf.identity)

    # loss = tf.reduce_sum(tf.square(reverse_hypothesis - reverse_Y))
    loss = tf.reduce_sum(tf.square(hypothesis - Y))
    optimizer = tf.train.AdamOptimizer(learning_rate)

    train = optimizer.minimize(loss)

    rmse = tf.sqrt(tf.reduce_mean(tf.squared_difference(targets, predictions)))

    train_error_summary = []
    test_error_summary = []
    test_predict = ""

    sess = tf.Session()
    sess.run(tf.global_variables_initializer())

    start_time = datetime.datetime.now()
    print('학습 시작---')

    for epoch in range(epoch_num):
        _, _loss = sess.run([train, loss], feed_dict={X: trainX, Y: trainY})
        if((epoch+1) % 100 == 0) or (epoch == epoch_num-1):
            train_predict = sess.run(hypothesis, feed_dict={X:trainX})
            train_error = sess.run(rmse, feed_dict={targets: trainY, predictions: train_predict})
            train_error_summary.append(train_error)

            test_predict = sess.run(hypothesis, feed_dict={X: testX})
            test_error = sess.run(rmse, feed_dict={targets: testY, predictions:test_predict})
            test_error_summary.append(test_error)

            print("epoch: {}, train_error(A): {}, test_error(B): {}, B-A: {}".format(epoch+1, train_error, test_error, test_error-train_error))

    end_time = datetime.datetime.now()
    elapsed_time = end_time - start_time
    print("경과시간 : ", elapsed_time)
    print("elapsed_time per epoch", elapsed_time/epoch_num)

    # 하이퍼파라미터 출력
    print('input_data_column_cnt:', input_data_column_cnt, end='')
    print(',output_data_column_cnt:', output_data_column_cnt, end='')

    print(',seq_length:', seq_length, end='')
    print(',rnn_cell_hidden_dim:', rnn_cell_hidden_dim, end='')
    print(',forget_bias:', forget_bias, end='')
    print(',num_stacked_layers:', num_stacked_layers, end='')
    print(',keep_prob:', keep_prob, end='')

    print(',epoch_num:', epoch_num, end='')
    print(',learning_rate:', learning_rate, end='')

    print(',train_error:', train_error_summary[-1], end='')
    print(',test_error:', test_error_summary[-1], end='')
    print(',min_test_error:', np.min(test_error_summary))

    # 결과 그래프 출력
    # plt.figure(1)
    # plt.plot(train_error_summary, 'gold')
    # plt.plot(test_error_summary, 'b')
    # plt.xlabel('Epoch(x100)')
    # plt.ylabel('Root Mean Square Error')
    #
    # plt.figure(2)
    # plt.plot(testY, 'r')
    # plt.plot(test_predict, 'b')
    # plt.xlabel('Time Period')
    # plt.ylabel('Stock Price')
    # plt.show()

    # sequence length만큼의 가장 최근 데이터를 슬라이싱한다
    recent_data = np.array([x[len(x) - seq_length:]])
    print("recent_data.shape:", recent_data.shape)
    print("recent_data:", recent_data)

    # 내일 종가를 예측해본다
    test_predict = sess.run(hypothesis, feed_dict={X: recent_data})

    print("test_predict", test_predict[0])
    test_predict = reverse_min_max_scaling(price, test_predict)  # 금액데이터 역정규화한다
    print("Tomorrow's stock price", test_predict[0])  # 예측한 주가를 출력한다

    cursor = connection.cursor()

    cursor.execute("""
       UPDATE stockPrediction SET
       prediction = :prediction
       WHERE code = :code
       """,
        code = code,
        # name = name,
        prediction = test_predict[0].item()
   )
    connection.commit()
    cursor.close()


data = [
    ["035720", "카카오"],
    ["035420", "NAVER"],
    ["006400", "삼성SDI"],
    ["004170", "신세계"],
    ["267250", "현대중공업지주"],
    ["051900", "LG생활건강"],
    ["068270", "셀트리온"],
    ["005180", "빙그레"],
    ["100220", "비상교육"],
    ["000660", "SK하이닉스"]
]

for d in data:
    ml(d[0], d[1])

connection.close()