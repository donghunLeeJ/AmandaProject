<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
		<div class="card">
										<div class="card-header">
											<strong class="card-title pl-2">
											공지Message </strong>
										</div>
										<div class="card-body">
											<div class="mx-auto d-block">
												
												<h5 class="mt-2 mb-1">
													<b>보낸사람:관리자
														<%@ page import = "java.util.Calendar" %>

<%
Calendar cal = Calendar.getInstance();
%>
 
(<%= cal.get(Calendar.YEAR) %>-<%= cal.get(Calendar.MONTH)+1 %>-<%= cal.get(Calendar.DATE) %>
<%= cal.get(Calendar.HOUR) %>:<%= cal.get(Calendar.MINUTE) %>:<%= cal.get(Calendar.SECOND) %>)
													
													</b>
												</h5>
											</div>
											<hr>
											<div class="card-text">
												${text}	
												<form action="page?url=WEB-INF/main.jsp" id="form"> 												
													 
											</form>
											
											<script>
											
										        var webSocket = new WebSocket('ws://192.168.60.29/broadcasting');
											function onError(event) {
										      alert(event.data);
										    }
										  
											</script>
											
											</div>
										</div>
									</div>
</body>
</html>