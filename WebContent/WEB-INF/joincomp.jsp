<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
</head>
<body>
	<script>
		if(${result == 1}){
			alert("회원가입이 완료되었습니다.")
			location.href = "page?url=WEB-INF/main.jsp"
		}else{
			alert("이미 존재하는 아이디 입니다.")
			history.back();
		}
		
	
	</script>
</body>
</html>