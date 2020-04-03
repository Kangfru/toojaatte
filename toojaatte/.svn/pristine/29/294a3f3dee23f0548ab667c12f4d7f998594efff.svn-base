<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류 정보</title>
</head>
<body>
	
	<!-- pageContext, request, session, application -->
	<h4>${exception.getMessage() }</h4>
	<ul>
		<c:forEach var="stack" items="${exception.getStackTrace() }">
			<li>${stack }</li>
		</c:forEach>
	</ul>
</body>
</html>