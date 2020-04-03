<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글보기</title>
<style type="text/css">
#pwDiv {
	display: none;
} /* 안보이게 처리 */
.chat {
	list-style: none;
}
</style>
<script type="text/javascript">
var rornType = ${rornType};
var r_cnt = ${dto.r_cnt};
var n_cnt = ${dto.n_cnt};
var writer = "${login.id}";

$(document).ready(function(){
//초기값
var r1 = document.getElementById("tup");
var n1 = document.getElementById("tdown");
	if(rornType==0){
		r1.style.color='black';
		n1.style.color='black';
	}
	if(rornType==1){
		r1.style.color='red';
		n1.style.color='black';
	}
	if(rornType==2){
		r1.style.color='black';
		n1.style.color='red';
	}
});
function btn(result){
	// alert("btn 시작");
	var result_ = result.split(',');
	result=result_[0];
	// alert("결과 : "+result);
	// alert("결과r_cnt : "+result_[1]);
	// alert("결과n_cnt : "+result_[2]);
	// alert("현재 클릭한 버튼 : "+rornType);
	$("#rcnt").text(result_[1]);
	$("#ncnt").text(result_[2]);
	var r = document.getElementById("tup");
	var n = document.getElementById("tdown");
	if(result=="1"){
		//처음으로 데이터가 생성 되었을 때
		//클릭한 값에 해당하는 것의 폰트 색 변화
		if(rornType==1){
			r.style.color='red';
			n.style.color='black';
		}
		if(rornType==2){
			r.style.color='black';
			n.style.color='red';
		}
	}
	if(result=="2"){
		//데이터가 수정되었을 때
		//클릭한 값은 red 다른 것은 black으로 전환
		if(rornType==1){
			// alert("여기왔니");
			r.style.color='red';
			n.style.color='black';
		}
		if(rornType==2){
			r.style.color='black';
			n.style.color='red';
		}
	}
	if(result=="3"){
		//데이터가 삭제되었을 때
		//데이터가 없으므로 모두 black으로 전환
		r.style.color='black';
		n.style.color='black';
	}
	// alert("btn 종료");
};//end function btn

	var rornService = (function(){
		function clickRorN(rorn, callback, error) {
			var writer = "${login.id}";
			var no = ${dto.no};
			//데이터 확인
// 			// alert("clickRorN : rorn :" + JSON.stringify(rorn))
			//ajax를 이용해서 데이터 넘기기 처리 - load(), $.getJSON, $.ajax()
			$.ajax({
				type : 'post',
				url : '/anaboard/rorn',
				//data : ?뒤에 쿼리를 의미 k=v&&k=v : JSON.stringify(json)로 변환
				data : JSON.stringify(rorn),
				contentType : "application/json; charset=utf-8",
				//등록이 성공했을 때 처리 -> 댓글 리스트를 다시 불러와서 표시한다.
				success : function(result, status, xhr) {
					if (callback) {
						callback(result);
					}
				},
				//등록 오류가 발생된 경우 처리
				error : function(xhr, status, er) {
					if (error) {
						error(er);
					}
				}
			});
		}//end fucntion clickRorN
		return {
			clickRorN : clickRorN
		}
	})();//함수 만들고 그 함수 바로 호출(맨뒤 ();)

	
	//댓글 객체 - 속성, 함수
	var replyService = (function() {
		//getList를 저장하는 프로그램 작성->필요한 데이터 param(no, page), callback-처리되는 함수, error-오류가 났을 때 객체
		function getList(param, callback, error) {
			var no = param.no;
			var page = param.page;

			//$.getJSON (여기서의 $는 jquery)
			$.getJSON(
			//데이터 요청 uri
			"/reply/pages/" + no + "/" + page + ".json",
			//데이터 가져오기를 성공하면 처리되는 함수.) data : 서버에서 넘어오는 데이터
			function(data) {
				//데이터 가져오기를 성공하면 실행되는 함수를 밖에 선언해서 넣어주는 경우 처리
				if (callback) { //사용하는 태그들이 다르기 때문에 콜백함수를 선언하는 것이 해당 코드를 다른 소스에서도 사용할 수 있다
					callback(data);
				}
			}
			//데이터 가져오는 것을 실패했을 때의 처리
			).fail(function(xhr, status, err) {
				if (err) {
					err();
				}
			});
		}
		//날짜 timestamp 숫자를 받아서 날짜 형식으로 리턴해주는 함수->json 데이터로 받을 때 timestamp로 전달된다.
		function display(timeValue) {
			var today = new Date(); //오늘 날짜 셋팅
			//today.getTime() - timeValue //현재 날짜 시간과 댓글 작성일의 차이
			//차이가 24시간이 지나지 않았으면 시간을 지났으면 날짜를 표시할 수 있도록 한다.
			var dateObj = new Date(timeValue); //댓글을 작성한 날짜 객체
			var str = "";
			str += dateObj.getFullYear() + ".";
			str += (dateObj.getMonth() + 1) + "."; //month는 0~11까지 사용하기 때문에 +1
			str += dateObj.getDate();

			//[yy, mm, dd].join(".") - 중간에 .을 이용해서 이어붙인다.
			return str;
		}
		// 댓글 등록처리함수 선언
		function add(reply, callback, error) {
			//데이터 확인
			// alert("댓글 등록 : reply :" + JSON.stringify(reply))
			//ajax를 이용해서 데이터 넘기기 처리 - load(), $.getJSON, $.ajax()
			$.ajax({
				type : 'post',
				url : '/reply/new',
				//data : ?뒤에 쿼리를 의미 k=v&&k=v : JSON.stringify(json)로 변환
				data : JSON.stringify(reply),
				contentType : "application/json; charset=utf-8",
				//등록이 성공했을 때 처리 -> 댓글 리스트를 다시 불러와서 표시한다.
				success : function(result, status, xhr) {
					if (callback) {
						callback(result);
					}
				},
				//등록 오류가 발생된 경우 처리
				error : function(xhr, status, er) {
					if (error) {
						error(er);
					}
				}
			});
			// alert("댓글 등록 : reply : ajax end");
		}
		// 댓글 수정처리함수 선언
		function update(reply, callback, error) {
			//데이터 확인
			// alert("댓글 수정 : reply :" + JSON.stringify(reply))
			//ajax를 이용해서 데이터 넘기기 처리 - load(), $.getJSON, $.ajax()
			$.ajax({
				type : 'patch',
				url : '/reply/' + reply.rno,
				//data : ?뒤에 쿼리를 의미 k=v&&k=v : JSON.stringify(json)로 변환
				data : JSON.stringify(reply),
				contentType : "application/json; charset=utf-8",
				//등록이 성공했을 때 처리 -> 댓글 리스트를 다시 불러와서 표시한다.
				success : function(result, status, xhr) {
					if (callback) {
						callback(result);
					}
				},
				//등록 오류가 발생된 경우 처리
				error : function(xhr, status, er) {
					if (error) {
						error(er);
					}
				}
			});
		}
		// 댓글 삭제함수 선언
		function deleteReply(reply, callback, error) {
			//데이터 확인
			// alert("댓글 등록 : reply :" + JSON.stringify(reply))
			//ajax를 이용해서 데이터 넘기기 처리 - load(), $.getJSON, $.ajax()
			$.ajax({
				type : 'post',
				url : '/reply/delete',
				//data : ?뒤에 쿼리를 의미 k=v&&k=v : JSON.stringify(json)로 변환
				data : JSON.stringify(reply),
				contentType : "application/json; charset=utf-8",
				//삭제했을 때 처리 -> 댓글 리스트를 다시 불러와서 표시한다.
				success : function(result, status, xhr) {
					if (callback) {
						callback(result);
					}
				},
				//등록 오류가 발생된 경우 처리
				error : function(xhr, status, er) {
					if (error) {
						error(er);
					}
				}
			});
		}
		return {
			//댓글 리스트가 처리된 결과를 만들어내는 함수
			getList : getList,
			displayDate : display,
			add : add,
			update : update,
			deleteReply : deleteReply
		}
	})();//함수 만들고 그 함수 바로 호출(맨뒤 ();)
	$(function() { //(여기서의 $는 jquery), 콜백함수이다.
		// 댓글을 처리하는 프로그램 작성
		var no = ${dto.no};
		//댓글 리스트를 표시할 객체 저장
		var replyUL = $(".chat")
		//댓글 리스트를 가져와서 보여주는 함수 호출
		showList(1);
		//// alert(replyService.getList);
		//댓글 리스트 : 글보기를 호출하면 바로 보여주는 부분이므로 페이지는 1페이지이다.
		function showList(page) {
			//getList({no, page}, callback function(data), error)
			replyService
					.getList(
							{
								no : no,
								page : page
							},
							function(list) {
								var str = "";
								//댓글이 없는 경우의 처리
								if (list == null || list.length == 0) {
									replyUL
											.html("<li class='left clearfix'> 댓글이 존재하지 않습니다. </li>");
									return;
								}
								//댓글이 있는 경우의 처리
								for (var i = 0; i < list.length; i++) {
									var dto = list[i];
									str += "<li class='left clearfix' data-rno='"+dto.rno+"'>";
									str += "<div>";
									str += "<div class='header'><strong class='primary-font writer'>"
											+ dto.writer + "</strong>";
									str += "<small class='pull-right text-muted'>"
											+ replyService
													.displayDate(dto.writeDate)
											+ "</small>";
									str += "</div>";
									str += "<p class='content'>" + dto.content
											+ "</p>";
									if('${login.id }' == dto.writer){
										str += "<span class='pull-right'>";
										str += "<button class='btn btn-default btn-xs replyUpdateBtn'>수정</butten>";
										str += "<button class='btn btn-default btn-xs replyDeleteBtn'>삭제</butten>";
										str += "</span>";
									}
									str += "</div>";
									str += "<hr>";
									str += "</li>";
								}
								replyUL.html(str);
							});
		}
		//댓글 처리에 대한 이벤트 처리
		//댓글 달기 버튼 처리-> 모달창을 보이게 한다.
		$("#writeReplyBtn").click(function() {
			// 댓글 등록으로 제목과 버튼이름을 바꿔야 한다.
			$("#updateModalTitle").text("댓글 등록");
			$("#updateModal_updateBtn").text("등록");
			//등록을 위해서 submit이 일어나도록 버튼 변경
			$("#updateModal_updateBtn").attr("type", "submit");
			//모달 창을 보여주자
			$("#updateModal").modal("show");
		});
		//댓글 등록 버튼 클릭 이벤트->폼의 데이터를 넘기는 이벤트
		$("#modal_form").submit(function() {
			//Ajax로 넘길 데이터를 가저온다.
			// alert("#modal_fom submit");
			var reply = {
				no : $("#modal_no").val(),
				content : $("#modal_content").val(),
				writer : writer
			}
			// alert(JSON.stringify(reply));
			// alert("replyService.add 전");
			replyService.add(reply, function(result) {
				//결과를 경고창으로 보여준다. -> ReplyController에서 리턴해준다.
				// alert(result);
				// alert("비우기");
				//사용한 모달창의 입력란을 비워둔다.
				$("#updateModal").find("input, textarea").val("");
				// 모달창 숨기기
				$("#updateModal").modal("hide");

				//댓글 리스트를 다시 뿌린다.
				// alert("showList 시작");
				showList(1);
				// alert("showList 끝");
			});
			//submit을 무시시킨다 -> Ajax 처리를 하기 위해서
			return false;
		});

		//댓글의 수정, 삭제 버튼 처리 -> Ajax후에 나타난 버튼이므로 여기서 직접 찾을 때는 Ajax 전이므로 적용이 안된다.
		//->그래서 on(이벤트, 선택자, 함수) : 선택자는 find()에 의해  Ajax후에 다시 찾는다. 
		$(".chat").on("click", ".replyUpdateBtn", function() {
			// alert("댓글의 수정 버튼이 클릭됨");
			//클릭한 것이 this, 그 것의 위에서 찾자 : closest
			$("#updateModalTitle").text("댓글 수정");
			var replyRow = $(this).closest("li");
			var rno = replyRow.data("rno");
			var content = replyRow.find(".content").text();
			var writer = replyRow.find(".writer").text();
			// alert(rno + "/" + content + "/" + writer);

			//모달 창에 찾은 정보 집어 넣기
			$("#modal_rno").val(rno);
			$("#modal_content").val(content);
			$("#modal_writer").val(writer);
			//수정을 위해서 submit이 안일어나도록 일반 버튼으로 변경
			$("#updateModal_updateBtn").attr("type", "button");
			//버튼 이름을 수정으로 변경
			$("#updateModal_updateBtn").text("수정");

			//작성자를 고칠 수 없게 readonly 설정
			$("#modal_writer").attr("readonly", "readonly");

			//모달창 열기
			$("#updateModal").modal("show");
		});

		$("#updateModal_updateBtn").click(function() {
			//같은 버튼을 등록과 삭제에서도 사용하기 때문에 등록과 삭제인 경우는 처리를 안하도록 시킨다.
			if ($(this).text() == "등록"){
				var reply = {
						no : $("#modal_no").val(),
						content : $("#modal_content").val(),
						writer : writer
					}
					// alert(JSON.stringify(reply));
					// alert("replyService.add 전");
					replyService.add(reply, function(result) {
						//결과를 경고창으로 보여준다. -> ReplyController에서 리턴해준다.
						// alert(result);
						// alert("비우기");
						//사용한 모달창의 입력란을 비워둔다.
						$("#updateModal").find("input, textarea").val("");
						// 모달창 숨기기
						$("#updateModal").modal("hide");

						//댓글 리스트를 다시 뿌린다.
						// alert("showList 시작");
						showList(1);
						// alert("showList 끝");
					});
					//submit을 무시시킨다 -> Ajax 처리를 하기 위해서
					return false;
				}
			if ($(this).text() == "수정"){
				// alert("수정처리");

				// Ajax로 넘길 데이터를 가져온다.
				var reply = {
					rno : $("#modal_rno").val(),
					content : $("#modal_content").val(),
					writer : writer
				}
// 				alert(JSON.stringify(reply));
				replyService.update(reply, function(result) {
					// 결과를 경고창으로 보여준다. -> ReplyController에서 리턴해준다.
					// alert(result);
					// 사용한 모달창의 입력란을 비워둔다.
					$("#updateModal").find("input, textarea").val("");
					// 모달 창은 숨긴다.
					$("#updateModal").modal("hide");

					// 댓글 리스트를 다시 뿌린다.
					// alert("update showList 시작");
					showList(1);
					// alert("update showList 끝");
				});
			}
			if ($(this).text() == "삭제"){
				// Ajax로 넘길 데이터를 가져온다.
				var reply = {
					rno : $("#modal_rno").val(),
					writer : writer
				}
// 				alert(JSON.stringify(reply));
				replyService.deleteReply(reply, function(result) {
					// 결과를 경고창으로 보여준다. -> ReplyController에서 리턴해준다.
// 					alert(result);
					// 사용한 모달창의 입력란을 비워둔다.
					$("#updateModal").find("input, textarea").val("");
					// 모달 창은 숨긴다.
					$("#updateModal").modal("hide");

					// 댓글 리스트를 다시 뿌린다.
					// alert("update showList 시작");
					showList(1);
					// alert("update showList 끝");
				});
			}			
		});
		//댓글의 수정, 삭제 버튼 처리 -> Ajax후에 나타난 버튼이므로 여기서 직접 찾을 때는 Ajax 전이므로 적용이 안된다.
		//->그래서 on(이벤트, 선택자, 함수) : 선택자는 find()에 의해  Ajax후에 다시 찾는다. 
		$(".chat").on("click", ".replyDeleteBtn", function() {
			// alert("댓글의 수정 버튼이 클릭됨");
			//클릭한 것이 this, 그 것의 위에서 찾자 : closest
			var replyRow = $(this).closest("li");
			var rno = replyRow.data("rno");
			var writer = replyRow.find(".writer").text();
			//모달 창에 찾은 정보 집어 넣기
			$("#modal_rno").val(rno);
// 			$("#modal_content").val(content);
			$("#modal_writer").val(writer);
			// alert(rno + "/" + content + "/" + writer);
			// alert("댓글의 삭제 버튼이 클릭됨");
			//클릭한 것이 this, 그 것의 위에서 찾자 : closest
			// 댓글 등록으로 제목과 버튼이름을 바꿔야 한다.
			$("#updateModalTitle").text("댓글 삭제");
			$("#updateModal_updateBtn").text("삭제");
			//수정을 위해서 submit이 안일어나도록 일반 버튼으로 변경
			$("#updateModal_updateBtn").attr("type", "button");
			//모달 창을 보여주자
			$("#updateModal").modal("show");
			
			//모달 창에 찾은 정보 집어 넣기
// 			$("#modal_rno").val(rno);
			$("#modal_content").val("진짜 삭제하시겠습니까?");
// 			$("#modal_writer").val(writer);

			//작성자를 고칠 수 없게 readonly 설정
			$("#modal_writer").attr("readonly", "readonly");

			//모달창 열기
			$("#updateModal").modal("show");
		});
		
		//게시판 글보기의 이벤트 처리
		$("#deleteBtn").click(function() {
			if (!confirm("정말 삭제하시겠습니까?")) {
// 				// alert(no);
				return false; //a tag의 href를 취소시킨다->location.href를 변경하는 태그
			}
		});
		
		//좋아요 싫어요 버튼 처리
		$("#RorN_RBtn").click(function() {
			//test용
// 			writer = "test"
// 			// alert("좋아요 click");
			rornType = 1;
// 			// alert("좋아요 rornType= "+rornType);
			if (writer == null || writer == "") {
				// alert("로그인을 하셔야 합니다.")
			}else{
				// Ajax로 넘길 데이터를 가져온다.
				var rorn = {
					no : no,
					writer : writer,
					type : rornType
				}
// 				// alert(JSON.stringify(rorn));
				rornService.clickRorN(rorn, function(result) {
					// 결과를 경고창으로 보여준다. -> ReplyController에서 리턴해준다.
// 					// alert("결과 : "+result);
					btn(result);
// 					// alert("btn 종료 후 : "+rornType);
				});			
			}
		});
		$("#RorN_NBtn").click(function() {
			//test용
// 			writer = "test"
// 			// alert("싫어요 click");
			rornType = 2;
// 			// alert("싫어요 rornType= "+rornType);
			if (writer == null || writer == "") {
				// alert("로그인을 하셔야 합니다.")
			}else{
				// alert(writer);
				// Ajax로 넘길 데이터를 가져온다.
				var rorn = {
					no : no,
					writer : writer,
					type : rornType
				}
// 				// alert(JSON.stringify(rorn));
				rornService.clickRorN(rorn, function(result) {
					// 결과를 경고창으로 보여준다. -> ReplyController에서 리턴해준다.
// 					// alert("결과 : "+result);
					btn(result);
// 					// alert("btn 종료 후 : "+rornType);
				});			
			}
		});
	});
</script>
</head>
<body>
	<!-- 제목 -->
	<h1>게시판 글보기</h1>
	<div class="container">
		<div style="line-height:30px; width:100%; height:30px; border-top: 1px solid #ddd">
			<div style="width: 200px; float:left"><span style="display:inline-block; width: 50px">글번호</span>&nbsp;<span style="width:5px">|</span>&nbsp;<span name = "no">${dto.no }</span></div>
			<div style="width: 150px; float:right"><span>조회수</span>&nbsp;<span style="width:5px">|</span>&nbsp;<span name="hit">${dto.hit }</span></div>
		</div>
		<div style="line-height:30px; vertical-align:middle; width:100%; height:30px; border-top: 1px solid #ddd;">
			<div style="width: 200px; float:left"><span style="display:inline-block; width: 50px">작성자</span>&nbsp;<span style="width:5px">|</span>&nbsp;<span name="id">${dto.writer }</span></div>
			<div style="width: 150px; float:right"><span>작성일</span>&nbsp;<span style="width:5px">|</span>&nbsp;<span name="writeDate"><fmt:formatDate value="${dto.writeDate }"
							pattern="yyyy-MM-dd" /></span></div>
		</div>
		<div style="vertical-align:middle; width:100%; border-top: 1px solid #ddd;">
		<div style="line-height:30px; width:100%; height:30px; border-bottom: 1px solid #ddd; text-align: left;">
		<span style="display:inline-block; width:50px">제목</span>
		<span style="display:inline-block; width:5px">|</span>
		<c:if test="${dto.titleType == 1}">[주식]</c:if>
		<c:if test="${dto.titleType == 2}">[가상화폐]</c:if>
		<c:if test="${dto.titleType == 3}">[기타]</c:if>
		<span name="title">${dto.title }</span>
		</div>
		<div style="display: block; white-space: pre-line;"><span name="content"><br>${dto.content }</span></div>
		</div>
		<div>
			<c:forEach items="${flist}" var="fdto">
				<img alt="" src="${fdto.fileName }" style="max-width: 80%; min-width: 30%;"/>
			</c:forEach>
		</div>
		<div style="margin:15px; width:100%; height:80px">
			<div style="text-align:center">
				<div>
					<button type="button" class="btn btn-default btn-lg" id="RorN_RBtn">
			          <span id="tup">
			          <span class="glyphicon glyphicon-thumbs-up"></span>
			         	 좋아요<br><span id="rcnt">${dto.r_cnt}</span>
			          </span>
			        </button>
			        <button type="button" class="btn btn-default btn-lg" id="RorN_NBtn">
			          <span id="tdown">
			          <span class="glyphicon glyphicon-thumbs-down"></span>
			          	싫어요<br><span id="ncnt">${dto.n_cnt}</span>
			          </span>
			        </button>
		        </div>
	        </div>
		</div>
	</div>
	<div class="container" style="border-top:1px solid #ddd">
		<div style="margin: 10px; text-align: right">
		<c:choose>
			<c:when test="${empty param.page }">
				<a href="list.do" class="btn btn-default" role="button"><span class="glyphicon glyphicon-menu-left">목록으로</span></a>
			</c:when>
			<c:otherwise>
				<a href="list.do?page=${param.page }&key=${param.key }&word=${param.word }&gradeType=${param.gradeType}&titleType=${param.titleType}&orderType=${param.orderType}" class="btn btn-default" role="button"><span class="glyphicon glyphicon-menu-left">돌아가기</span></a>
			</c:otherwise>
		</c:choose>
		<c:if test="${login.id!=null && login.id == dto.writer }">
		<a href="update.do?no=${dto.no }&page=${param.page }&key=${param.key }&word=${param.word }&gradeType=${param.gradeType}&headerType=${param.headerType}&orderType=${param.orderType}"
			class="btn btn-default" role="button">수정</a>
		<a href="delete.do?no=${dto.no }&page=${param.page }&key=${param.key }&word=${param.word }&gradeType=${param.gradeType}&headerType=${param.headerType}&orderType=${param.orderType}" 
		id="deleteBtn" class="btn btn-default" role="button">삭제</a> <!-- 처음엔 안보이게 삭제버튼을 누르면 보이게 -->
		</c:if>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<i class="fa fa-comments fa-fw"></i> Reply
			<c:if test="${login.id!=null}">
			<button id="writeReplyBtn"
				class="btn btn-primary btn-xs pull-right">new Reply</button>
			</c:if>
		</div>
		<div class="panel-body">
			<ul class="chat">
			</ul>
		</div>
	</div>
	<!-- 댓글 달기와 수정을 위한 Modal -->
  <div class="modal fade" id="updateModal" role="dialog">
    <div class="modal-dialog">
    
      Modal content
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-pencil"></span> 
          	<span id="updateModalTitle">댓글 수정</span>
          </h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form" method="post" id="modal_form">
          	<input type="hidden" name="rno" id="modal_rno">
            <input name="no" type="hidden" id="modal_no" value="${dto.no }" />
			<input name="page" type="hidden" value="${param.page }" />
            <div class="form-group">
              <label for="modal_content">
                <span class="glyphicon glyphicon-pencel"></span>
               	내용
              </label>
              <textarea class="form-control" id="modal_content" name="content"
               rows="3"></textarea>
            </div>
            <div class="btn-group right">
             <button type="submit" class="btn btn-primary"
              id="updateModal_updateBtn">수정</button>
          	 <button type="button" class="btn btn-warning" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> 취소</button>
			</div> 
          </form>
        </div>
    </div>
  </div> 
</div>
<br/>
</body>
</html>