<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>

<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>게시판</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
<link rel="stylesheet"
	href="assets/css/lib/datatable/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="assets/css/style.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>

<style>
#wrapper {
	margin-top: 50px;
}

div {
	box-sizing: border-box;
	text-align: center;
}

#upload, #toList {
	margin: 0px;
}

#footer {
	text-align: right;
	padding: 0px;
}

#text {
	height: 700px;
}

#contents {
	margin: 0px;
	padding: 20px;
	width: 100%;
	height: 100%;
}

#repl {
	margin: 0px;
	padding: 10px;
	width: 90%;
}

#replButt {
	width: 10%;
}

#title {
	margin-left: 10px;
	width: 80%;
}

#writer, #writeDate {
	margin-left: 10px;
	margin-top: 5px;
	margin-bottom: 5px;
	width: 80%;
}

.titleWrapper {
	margin-top: 10px;
	margin-bottom: 10px;
}

#titlerow {
	margin-top: 30px;
}

#writerrow, #daterow {
	margin-top: 8px;
}

#replHeader {
	margin-top: 30px;
	margin-bottom: 40px;
	width: 50px;
}

#replContentsBox {
	margin-bottom: 100px;
}

#repl_writer {
	word-wrap: break-word;
}

#repl_time {
	word-wrap: break-word;
}

#replButts {
	text-align: right;
	padding: 0px;
}

#eachRepl {
	margin-top: 20px;
}

#repl_text {
	width: 100%;
	border: none;
	text-aligh: center;
	padding-left: 10px;
}

#showReplBox {
	border: 0px;
}

#replBox {
	margin-top: 20px;
}
</style>
</head>
<body>
	<!-- Left Panel -->

	<aside id="left-panel" class="left-panel">
		<nav class="navbar navbar-expand-sm navbar-default">

			<div id="main-menu" class="main-menu collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="index.html"><i class="menu-icon fa fa-laptop"></i>자유
							게시판 </a></li>
					<li class="menu-title">UI elements</li>
					<!-- /.menu-title -->
					<li class="menu-item-has-children dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i
							class="menu-icon fa fa-cogs"></i>Components
					</a>
						<ul class="sub-menu children dropdown-menu">
							<li><i class="fa fa-puzzle-piece"></i><a
								href="ui-buttons.html">Buttons</a></li>
							<li><i class="fa fa-id-badge"></i><a href="ui-badges.html">Badges</a></li>
							<li><i class="fa fa-bars"></i><a href="ui-tabs.html">Tabs</a></li>

							<li><i class="fa fa-id-card-o"></i><a href="ui-cards.html">Cards</a></li>
							<li><i class="fa fa-exclamation-triangle"></i><a
								href="ui-alerts.html">Alerts</a></li>
							<li><i class="fa fa-spinner"></i><a
								href="ui-progressbar.html">Progress Bars</a></li>
							<li><i class="fa fa-fire"></i><a href="ui-modals.html">Modals</a></li>
							<li><i class="fa fa-book"></i><a href="ui-switches.html">Switches</a></li>
							<li><i class="fa fa-th"></i><a href="ui-grids.html">Grids</a></li>
							<li><i class="fa fa-file-word-o"></i><a
								href="ui-typgraphy.html">Typography</a></li>
						</ul></li>
					<li class="menu-item-has-children active dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i
							class="menu-icon fa fa-table"></i>Tables
					</a>
						<ul class="sub-menu children dropdown-menu">
							<li><i class="fa fa-table"></i><a href="tables-basic.html">Basic
									Table</a></li>
							<li><i class="fa fa-table"></i><a href="tables-data.html">Data
									Table</a></li>
						</ul></li>
					<li class="menu-item-has-children dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i
							class="menu-icon fa fa-th"></i>Forms
					</a>
						<ul class="sub-menu children dropdown-menu">
							<li><i class="menu-icon fa fa-th"></i><a
								href="forms-basic.html">Basic Form</a></li>
							<li><i class="menu-icon fa fa-th"></i><a
								href="forms-advanced.html">Advanced Form</a></li>
						</ul></li>

					<li class="menu-title">Icons</li>
					<!-- /.menu-title -->

					<li class="menu-item-has-children dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i
							class="menu-icon fa fa-tasks"></i>Icons
					</a>
						<ul class="sub-menu children dropdown-menu">
							<li><i class="menu-icon fa fa-fort-awesome"></i><a
								href="font-fontawesome.html">Font Awesome</a></li>
							<li><i class="menu-icon ti-themify-logo"></i><a
								href="font-themify.html">Themefy Icons</a></li>
						</ul></li>
					<li><a href="widgets.html"> <i class="menu-icon ti-email"></i>Widgets
					</a></li>
					<li class="menu-item-has-children dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i
							class="menu-icon fa fa-bar-chart"></i>Charts
					</a>
						<ul class="sub-menu children dropdown-menu">
							<li><i class="menu-icon fa fa-line-chart"></i><a
								href="charts-chartjs.html">Chart JS</a></li>
							<li><i class="menu-icon fa fa-area-chart"></i><a
								href="charts-flot.html">Flot Chart</a></li>
							<li><i class="menu-icon fa fa-pie-chart"></i><a
								href="charts-peity.html">Peity Chart</a></li>
						</ul></li>

					<li class="menu-item-has-children dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i
							class="menu-icon fa fa-area-chart"></i>Maps
					</a>
						<ul class="sub-menu children dropdown-menu">
							<li><i class="menu-icon fa fa-map-o"></i><a
								href="maps-gmap.html">Google Maps</a></li>
							<li><i class="menu-icon fa fa-street-view"></i><a
								href="maps-vector.html">Vector Maps</a></li>
						</ul></li>
					<li class="menu-title">Extras</li>
					<!-- /.menu-title -->
					<li class="menu-item-has-children dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i
							class="menu-icon fa fa-glass"></i>Pages
					</a>
						<ul class="sub-menu children dropdown-menu">
							<li><i class="menu-icon fa fa-sign-in"></i><a
								href="page-login.html">Login</a></li>
							<li><i class="menu-icon fa fa-sign-in"></i><a
								href="page-register.html">Register</a></li>
							<li><i class="menu-icon fa fa-paper-plane"></i><a
								href="pages-forget.html">Forget Pass</a></li>
						</ul></li>
				</ul>
			</div>
		</nav>
	</aside>

	<div id="right-panel" class="right-panel">

		<!-- Header-->
		<header id="header" class="header">
			<div class="top-left">
				<div class="navbar-header">
					<a class="navbar-brand" href="./"><img src="images/logo.png"
						alt="Logo"></a> <a class="navbar-brand hidden" href="./"><img
						src="images/logo2.png" alt="Logo"></a> <a id="menuToggle"
						class="menutoggle"><i class="fa fa-bars"></i></a>
				</div>
			</div>
			<div class="top-right">
				<div class="header-menu">
					<div class="header-left">
						<button class="search-trigger">
							<i class="fa fa-search"></i>
						</button>
						<div class="form-inline">
							<form class="search-form">
								<input class="form-control mr-sm-2" type="text"
									placeholder="검색 ..." aria-label="Search">
								<button class="search-close" type="submit">
									<i class="fa fa-close"></i>
								</button>
							</form>
						</div>

						<div class="dropdown for-notification">
							<button class="btn btn-secondary dropdown-toggle" type="button"
								id="notification" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<i class="fa fa-bell"></i> <span class="count bg-danger">3</span>
							</button>
							<div class="dropdown-menu" aria-labelledby="notification">
								<p class="red">You have 3 Notification</p>
								<a class="dropdown-item media" href="#"> <i
									class="fa fa-check"></i>
									<p>Server #1 overloaded.</p>
								</a> <a class="dropdown-item media" href="#"> <i
									class="fa fa-info"></i>
									<p>Server #2 overloaded.</p>
								</a> <a class="dropdown-item media" href="#"> <i
									class="fa fa-warning"></i>
									<p>Server #3 overloaded.</p>
								</a>
							</div>
						</div>

						<div class="dropdown for-message">
							<button class="btn btn-secondary dropdown-toggle" type="button"
								id="message" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<i class="fa fa-envelope"></i> <span class="count bg-primary">4</span>
							</button>
							<div class="dropdown-menu" aria-labelledby="message">
								<p class="red">You have 4 Mails</p>
								<a class="dropdown-item media" href="#"> <span
									class="photo media-left"><img alt="avatar"
										src="images/avatar/1.jpg"></span>
									<div class="message media-body">
										<span class="name float-left">Jonathan Smith</span> <span
											class="time float-right">Just now</span>
										<p>Hello, this is an example msg</p>
									</div>
								</a> <a class="dropdown-item media" href="#"> <span
									class="photo media-left"><img alt="avatar"
										src="images/avatar/2.jpg"></span>
									<div class="message media-body">
										<span class="name float-left">Jack Sanders</span> <span
											class="time float-right">5 minutes ago</span>
										<p>Lorem ipsum dolor sit amet, consectetur</p>
									</div>
								</a> <a class="dropdown-item media" href="#"> <span
									class="photo media-left"><img alt="avatar"
										src="images/avatar/3.jpg"></span>
									<div class="message media-body">
										<span class="name float-left">Cheryl Wheeler2</span> <span
											class="time float-right">10 minutes ago</span>
										<p>Hello, this is an example msg</p>
									</div>
								</a> <a class="dropdown-item media" href="#"> <span
									class="photo media-left"><img alt="avatar"
										src="images/avatar/4.jpg"></span>
									<div class="message media-body">
										<span class="name float-left">Rachel Santos</span> <span
											class="time float-right">15 minutes ago</span>
										<p>Lorem ipsum dolor sit amet, consectetur</p>
									</div>
								</a>
							</div>
						</div>
					</div>

					<div class="user-area dropdown float-right">
						<a href="#" class="dropdown-toggle active" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> <img
							class="user-avatar rounded-circle" src="images/admin.jpg"
							alt="User Avatar">
						</a>

						<div class="user-menu dropdown-menu">
							<a class="nav-link" href="#"><i class="fa fa-user"></i>My
								Profile</a> <a class="nav-link" href="#"><i class="fa fa-bell-o"></i>Notifications
								<span class="count">13</span></a> <a class="nav-link" href="#"><i
								class="fa fa-cog"></i>Settings</a> <a class="nav-link" href="#"><i
								class="fa fa-power-off"></i>Logout</a>
						</div>
					</div>
				</div>
			</div>
		</header>
		<!-- /header -->
		<!-- 						진향이 로그인폼끝 -->
		<!-- 								진향이 마이페이지 폼 -->
		<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel1" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-body1">
						<form>
							<div class="form-group m-0 p-0">
								<div class="card">
									<div class="card-header">
										<i class="fa fa-user"></i><strong class="card-title pl-2">
											My Page </strong>
									</div>
									<div class="card-body">
										<div class="mx-auto d-block">
											<img class="rounded-circle mx-auto d-block"
												src="images/admin.jpg" alt="profile image" width="80px">
											<h5 class="text-center mt-2 mb-1">Steven Lee</h5>
											<div class="location text-center">Lv. 일반회원</div>
										</div>
										<hr>
										<div class="card-text">
											<div>
												<b>이름 </b>
												<p>${user.name}</p>
											</div>
											<div>
												<b>생년월일</b>
												<p>${user.birth}</p>
											</div>
											<div>
												<b>이메일</b>
												<p>${user.email}</p>
											</div>
											<div>
												<b>핸드폰번호</b>
												<p>${user.phone}</p>
											</div>
											<div>
												<b>잔여포인트</b>
												<p>${user.point}</p>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button id="deleteMembtn" type="button"
									class="btn btn-outline-info" data-dismiss="modal">회원
									탈퇴</button>
								<button id="pointPagebtn" type="button"
									class="btn btn-outline-info" data-dismiss="modal">포인트
									충전</button>
								<button id="updatememberbtn" type="button"
									class="btn btn-outline-info" data-dismiss="modal">정보수정</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>


		<script>
							$("#updatememberbtn")
									.on(
											"click",
											function() {
												location.href = "page?url=WEB-INF/ModifyMembers.jsp";
											})
							$("#deleteMembtn")
									.on(
											"click",
											function() {
												location.href = "page?url=WEB-INF/deleteMem.jsp";
											})
							$("#pointPagebtn").on("click", function() {
								location.href = "page?url=WEB-INF/pay.jsp";
							})
						</script>


		<!-- 진향이 마이페이지 폼끝 -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">L O G I N</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="loginProc.member" id="form" method="post">
							<div class="form-group">
								<label for="exampleFormControlInput1">ID</label> <input
									type="text" class="form-control" id="joinemail"
									placeholder="ID를 입력하시오" required name="loginid">
							</div>
							<div class="form-group">
								<label for="exampleFormControlInput1">Password</label> <input
									type="password" class="form-control" id="joinpassword"
									placeholder="비밀번호 입력하시오" required name="loginpw">
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" type="button"
									id="reinputpw">비밀번호재설정</button>
								<button type="button" class="btn btn-primary" type="button"
									id="joinMem">회원가입</button>
								<button type="button" class="btn btn-primary" id="login">login</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<script>
									$("reinputpw").on("click",function(){
										location.href = "WEB-INF/modifypassword.jsp";
									})
									$("#joinMem").on("click",function() {
									location.href = "page?url=WEB-INF/joinMem.jsp";
									})
									document.getElementById("login").onclick = function() {
									document.getElementById("form").submit();
									}
									// 									로그인 버튼과 회원가입 버튼의 script
								</script>
		<div class="content">
			<div class="animated fadeIn">
				<div class="card">

					<form action="BoardWrite.board" id="formWrite" method="post">
						<div class="card-header">
							<strong class="card-title"> <header>
									<div class="row">
										<div class="col-lg-8 col-md-8 col-sm-8 col-8 titleWrapper"
											id="titlerow">
											제목 : <input type="text" id="title" readonly
												value="${dto.title}">
										</div>
										<div class="col-lg-4 col-md-4 col-sm-4 col-4 titleWrapper">
											<div class="row">
												<div class="col-lg-4 d-none d-lg-block" id="writerrow">글쓴이
													:</div>
												<div class="col-lg-8 col-md-12 col-sm-12 col-12">
													<input type="text" id="writer" readonly
														value="${dto.writer}">
												</div>
											</div>
											<div class="row">
												<div class="col-lg-4 d-none d-lg-block" id="daterow">작성일시
													:</div>
												<div class="col-lg-8 col-md-12 col-sm-12 col-12">
													<input type="text" id="writeDate" readonly
														value="${dto.writeDate}">
												</div>
											</div>
										</div>
									</div>
								</header></strong>
						</div>
						<div class="card-body">
							<div class="container" id="wrapper">
								<main id="main">
								<div class="row" id="text">
									<div id="contents" name="contents">${dto.contents}</div>
								</div>
								</main>
							</div>
						</div>
					</form>

				</div>
				<footer>
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12" id="footer">

							<c:if test="${user.id==writer }">
								<input type="button" id="modify" value="수정하기"
									class="btn btn-secondary">
								<input type="button" id="delete" value="글 삭제"
									class="btn btn-secondary">
							</c:if>
							<input type="button" id="showReplBox" value="댓글달기"
								class="btn btn-secondary"> <input type="button"
								id="toList" value="목록으로" class="btn btn-secondary">

						</div>
					</div>
				</footer>
				<form action="Reply.board" id="replForm">
					<div class="row" id="replBox">
						<input type="text" value="${no}" name="contents_no"
							id="contents_no">
						<textarea id="repl" name="repl_contents"></textarea>
						<input type="button" id="replButt" value="등록하기"
							class="btn btn-secondary">
					</div>
				</form>
				<div id="replHeader">
					<h4>댓글</h4>
				</div>
				<div id="replContentsBox">
					<c:forEach var="repldto" items="${replList}">
						<form action="ReplEdit.board">
							<div class="row" id="eachRepl">
								<div class="col-lg-2 col-md-2 col-sm-2 col-2" id="repl_writer">${repldto.repl_writer}</div>
								<div class="col-lg-8 col-md-8 col-sm-8 col-8">
									<input type="text" id="repl_text" name="repl_contents"
										value="${repldto.repl_contents}" readonly> <input
										type="text" class="hide" name="contents_no"
										value="${repldto.contents_no}"> <input type="text"
										class="hide" name="repl_seq" value="${repldto.repl_seq}">
								</div>

								<div class="col-lg-2 col-md-2 col-sm-2 col-2" id="repl_time">${repldto.repl_time}</div>
							</div>
							<c:if test="${user.id==repldto.repl_writer }">
								<div class="row">
									<div class="col-lg-12 col-md-12 col-sm-12 col-12"
										id="replButts">
										<input type="submit" class="replEditCompl btn btn-secondary"
											value="수정완료" style="margin-right: 4px;"><input
											type="button" value="수정" class="modiRepl btn btn-secondary">
										<input type="button" value="삭제"
											class="delRepl btn btn-secondary">
									</div>
								</div>
							</c:if>
						</form>
						<script>
				$(".replEditCompl").hide();
				$(".hide").hide();
				
				if(${user.id==repldto.repl_writer }){
					$(".modiRepl").on("click",function(){
						document.getElementById("repl_text").readOnly=false;
						$(this).parent().find("input:nth-child(1)").show();
						$(this).parent("div").parent("div").parent("form").find("div").find("div:nth-child(2)").find("input:nth-child(1)").focus();
					})
					$(".delRepl").on("click",function(){
						location.href = "ReplDelete.board?repl_seq="+${repldto.repl_seq}+"&contents_no="+${repldto.contents_no};
					})
				}
				</script>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>

		<footer class="site-footer">
			<div class="footer-inner bg-white">
				<div class="row">
					<div class="col-sm-6 text-left">Copyright &copy; Amanda</div>
					<div class="col-sm-6 text-right">Designed by Amanda</div>
				</div>
			</div>
		</footer>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="assets/js/main.js"></script>


	<script>
	$("#contents_no").hide();
	$("#replBox").hide();
	$("#showReplBox").on("click",function(){
		$("#replBox").slideDown(500,"");
	})
	$("#replButt").on("click",function(){
		if($("#repl").val()==""){
			alert("댓글을 입력해주세요.");
		}else{
			$("#replForm").submit();
		}
	})
	
		document.getElementById("toList").onclick = function() {
			location.href = "Board.board?currentPage=1";
		}	
		
		if(${id==writer }){
		document.getElementById("modify").onclick = function() {
			location.href = "ContentsEdit.board?no="+${no};
		}
		document.getElementById("delete").onclick = function() {
			var result = confirm("정말 삭제하시겠습니까?");
			if (result) {
				location.href = "BoardDel.board?no="+${no};
			}
		}
		}
	</script>

</body>
</html>
