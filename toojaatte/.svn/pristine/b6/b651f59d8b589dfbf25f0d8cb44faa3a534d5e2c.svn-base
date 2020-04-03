<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>

<body>
	<div class="container">
		<h2>아이디 찾기</h2>
		<form action="findId.do" method="post" id="findIdForm">
				<div class="form-group">
					<label for="email">이메일 : </label> <input type="text"
						class="form-control" id="email" placeholder="Enter email"
						maxlength="20" required="required" pattern="^.{4,20}$"
						title="4-20이내의 글자 입력" name="email" />
				</div>
			<button type="submit" class="btn btn-default" id="findIdBtn">아이디 찾기</button>
			</form>
			<div id="findIdDiv"></div>
			<hr/>
			<hr/>
			<h2>비밀번호 찾기</h2>
			<form action="findPwForm.do" method="post" id="findPwForm">
				<div class="form-group">
				<label for="ID">아이디 : </label> <input type="text"
					class="form-control" id="id" placeholder="Enter ID" maxlength="20"
					required="required" pattern="^[A-Za-z][A-za-z0-9]{3,19}$"
					title="4-20영숫자, 맨 앞자는 영문자" name="id" />
				</div>
				<div class="form-group">
					<label for="email2">이메일 : </label> <input type="text"
						class="form-control" id="email2" placeholder="Enter email"
						maxlength="20" required="required" pattern="^.{4,20}$"
						title="4-20이내의 글자 입력" name="email2" />
				</div>
			<button type="submit" class="btn btn-default" id="findPwBtn">비밀번호 찾기</button>
		</form>
		<div id="findPwDiv"></div>
		<hr/>
	</div>
	
	<script type="text/javascript">
	$(function(){
		const findIdDiv = document.querySelector("#findIdDiv");
		const findPwDiv = document.querySelector("#findPwDiv");
		$("#findIdBtn").on("click", function(event){
			event.preventDefault();
			var email = $("#email").val();
			$.ajax({
				type:"POST",
				data:email,
				url:'/member/ajax/findId',
				contentType: 'application/json',
				success:function(result, status, xhr){
					findIdDiv.innerHTML = '<p></p>';
					alert('이메일로 아이디가 발송되었습니다.');
				},
				error:function(){
					findIdDiv.innerHTML = "<p style='color: red;'>아이디가 존재하지 않습니다.</p>";
				}
			})
		});
		
		$("#findPwBtn").on("click", function(event){
			event.preventDefault();
			var id = $("#id").val();
			var email2 = $("#email2").val();
			var dto = {
				id : id,
				email: email2	
			}
			$.ajax({
				type:"POST",
				data:JSON.stringify(dto),
				url:'/member/ajax/findPw',
				contentType: 'application/json',
				success:function(result, status, xhr){
					findPwDiv.innerHTML = '<p></p>';
					var url = '/member/findPw.do'
					var form = $('<form action="' + url + '" method="post"><input type="text" name="id" value="' + id + '" /></form>');
					$('body').append(form);
					form.submit();			
				},
				error:function(){
					findPwDiv.innerHTML = "<p style='color: red;'>이메일과 아이디에 맞는 정보가 존재하지 않습니다.</p>";
				}
			});
		});
	});
	
	</script>
</body>
</html>