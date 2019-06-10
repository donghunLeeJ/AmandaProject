<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<Script>
		if (
	${result}
		> 0) {
			alert("게시물 수정이 완료되었습니다.");
			location.href = "ShowContents.board?no="+${no};

		} else {
			alert("게시물 수정에 실패했습니다.");
			location.href = "ShowContents.board?no="+${no};

		}
	</script>
</body>
</html>