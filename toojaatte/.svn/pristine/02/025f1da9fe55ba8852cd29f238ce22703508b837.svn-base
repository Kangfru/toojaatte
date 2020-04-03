<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>

<body>
	<div class="container">
		<h2>비밀번호 찾기</h2>
			<hr/>
				<div class="form-group">
					<span>비밀번호 찾기 질문</span>
					<span>${dto.question }</span>
				</div>
			<form action="sendPwEmail.do" method="post" id="findPwForm">
				<div class="form-group">
				<input type="hidden" name="id" value="${dto.id }"/>
				<input type="hidden" name="email" value="${dto.email }"/>
					<label for="email">비밀번호 찾기 답  : </label> 
					<input type="text"	class="form-control" id="answer" placeholder="비밀번호 찾기 답"
						required="required"	title="비밀번호 찾기 답" name="answer" />
				</div>
			<button type="submit" class="btn btn-default" id="findPwBtn">비밀번호 찾기</button>
		</form>
		<div id="findPwDiv"></div>
		<hr/>
	</div>
	<script type="text/javascript">
	$(function(){		
		const findPwDiv = document.querySelector("#findPwDiv");
		const findPwForm = document.querySelector("#findPwForm");
		$("#findPwBtn").on("click", function(event){
			var answer = document.querySelector("#answer").value;
			event.preventDefault();
			if('${dto.answer}' == answer){
				findPwForm.submit();
			} else {
				findPwDiv.innerHTML = "<p style='color: red;'>비밀번호 찾기 질문, 답이 일치하지 않습니다.</p>";
			}
		});
	});
	</script>
</body>
</html>