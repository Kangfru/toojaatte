import sys
import FinanceDataReader as fdr
import pandas as pd
import os
from datetime import datetime, timedelta

month_ago = timedelta(days=-30)
three_month_ago = timedelta(days=-90)
six_month_ago = timedelta(days=-180)
year_ago = timedelta(days=-365)


def getGraphData(code, term, path):
    term_fix = year_ago
    if term == 'six':
        term_fix = six_month_ago
    elif term == 'three':
        term_fix = three_month_ago
    elif term == 'month':
        term_fix = month_ago



    df = fdr.DataReader(code, (datetime.today() + term_fix).strftime("%Y-%m-%d"))
    print(df)
    df.to_csv(os.path.join(path, 'graphData.csv'), mode='w')


def main(code, term, path):
    getGraphData(code, term, path)


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2], sys.argv[3])