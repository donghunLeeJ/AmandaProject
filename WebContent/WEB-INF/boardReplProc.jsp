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
			alert("댓글이 업로드되었습니다.");
			location.href = "ShowContents.board?no="+${no};

		} else {
			alert("댓글 업로드에 실패했습니다.");
			location.href = "ShowContents.board?no="+${no};

		}
	</script>
</body>
</html>