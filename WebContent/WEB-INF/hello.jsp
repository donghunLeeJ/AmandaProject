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
												Message </strong>
										</div>
										<div class="card-body">
											<div class="mx-auto d-block">
												
												<h5 class="mt-2 mb-1">
													<b>보낸 사람:${who}</b>
												</h5>
											</div>
											<hr>
											<div class="card-text">
												${text}	
												<form action="page?url=WEB-INF/main.jsp" id="form">
												<input type="text" placeholder="reply"><input type="button" value="전송" id="send">						
											</form>
											<script>
											$("#send")											
											.on("click",function() {
												$("form").submit();
												window.close();})
											</script>
											
											</div>
										</div>
									</div>
</body>
</html>