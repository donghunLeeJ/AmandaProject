<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
	alert("로그아웃 되었습니다");
	var webSocket = new	WebSocket('ws://192.168.60.20/WebSocket/websocketendpoint');
	webSocket.onopen = function(){
		webSocket.send("hi"); 
	} ;
	webSocket.onerror ; 
	location.href = "page?url=WEB-INF/main.jsp";
	</script>
	<!-- 	---------------------------------소켓연결  script--------------------------------- -->
</body>
</html>