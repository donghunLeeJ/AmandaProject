<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
</head>
<body>
<input type="button" id="btn" value="결제가 끝난 후 컨트롤러로 리퀘스트했다고 가정함">

<script>

$("#btn").on("click", function(){
	
	location.href = "angel.seat";
		
})

</script>
</body>
</html>