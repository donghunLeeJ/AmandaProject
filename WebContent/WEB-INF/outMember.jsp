<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
<script>
   if(${delresult }==1){
      alert("회원탈퇴 되었습니다");
      location.href="page?url=WEB-INF/main.jsp";
      
   }else{
      
      alert("다시 입력해주세요");
      location.href="page?url=WEB-INF/deleteMem.jsp";
   }
   
   </script>
</body>
</html>