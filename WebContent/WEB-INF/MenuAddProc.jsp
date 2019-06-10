<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴</title>
</head>
<body>
   <Script>
      if (
   ${result}
      > 0) {
         alert("신규 메뉴 추가가 완료되었습니다.");
         location.href = "select.admin"

      } else {
         alert("신규 메뉴 추가에 실패했습니다.");
         location.href = "select.admin"

      }
   </script>
</body>
</html>