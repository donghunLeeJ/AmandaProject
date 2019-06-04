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
   <Script>
      if (
   ${result}
      > 0) {
         alert("메뉴 삭제가 완료되었습니다.");
         location.href = "select.admin"

      } else {
         alert("메뉴 삭제에 실패했습니다.");
         location.href = "select.admin"

      }
   </script>
</body>
</html>