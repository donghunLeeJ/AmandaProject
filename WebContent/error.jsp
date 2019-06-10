<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
</head>
<body>

<div class="container">
	<div class="row">
	
		<div class="col-lg-12 col-md-12 col-sm-12 col-12">
		<img src="error.jpg">	</div>
	
	<div class="col-lg-12 col-md-12 col-sm-12 col-12">
	<input type="button" class="btn btn-outline-info m-2" id="mainturn" value="메인화면으로 돌아가기">
	</div>
	
	</div>	
</div>
	
<c:choose>

<c:when test="${user.id == 'admin'}">
<script>
$("#mainturn").on('click',function(){
	
	location.href = "page?url=WEB-INF/adminmain.jsp";
			
});
</script>
</c:when>

<c:otherwise>
<script>
$("#mainturn").on('click',function(){
			
	location.href = "page?url=WEB-INF/main.jsp";	
									
});
</script>
</c:otherwise>

</c:choose>	
	
	
</body>
</html>