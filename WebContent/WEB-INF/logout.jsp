<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<script>
	alert("로그아웃 되었습니다");
	
	location.replace("page?url=WEB-INF/main.jsp");
	function deleteCookie(name) {
	    setCookie(name, "", -1);
	}
	<%
	 
    // 전체 쿠키 삭제하기
    Cookie[] cookies = request.getCookies() ;
     
    if(cookies != null){
        for(int i=0; i < cookies.length; i++){
             
            // 쿠키의 유효시간을 0으로 설정하여 만료시킨다
            cookies[i].setMaxAge(0) ;
             
            // 응답 헤더에 추가한다
            response.addCookie(cookies[i]) ;
        }
    }
      
  
  
 
 
%>


	
	
	</script>
	<!-- 	---------------------------------소켓연결  script--------------------------------- -->
</body>
</html>