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

<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
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

#write {
	margin: 0px;
}

#footer {
	text-align: right;
	padding: 0px;
}

#text {
	height: 600px;
	line-height: 600px;
}

.titleLink {
	border: none;
	background-color: #00000000;
}

#noInput {
	border: none;
	background-color: #00000000;
	width: 90%;
}

#writer {
	word-wrap: break-word;
}

#searchDiv {
	height: 50px;
}

#select, #search, #searchButt {
	height: 30px;
	margin-left: 10px;
	margin-top: 10px;
}

.myrow {
	margin-left: 0px;
	margin-right: 0px;
}
</style>
</head>
<body>
	<aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
               <ul class="nav navbar-nav">
					<li class="active"><a href="page?url=WEB-INF/main.jsp"><i
							class="menu-icon fa fa-laptop"></i>Home </a></li>
					<li class="menu-item-has-children dropdown"><a href="page?url=WEB-INF/seat.jsp"> 
					<i class="menu-icon fa fa-cogs"></i>잔여좌석
					</a></li>
					<li class="menu-item-has-children dropdown"><a href="page?url=WEB-INF/manu.jsp"> 
					<i class="menu-icon fa fa-table"></i>메뉴
					</a></li>
					<li class="menu-item-has-children dropdown"><a href="page?url=WEB-INF/board.jsp"> 
					<i class="menu-icon fa fa-th"></i>고객의소리
					</a></li>
					<li class="menu-item-has-children dropdown"><a href="page?url=WEB-INF/pay.jsp">
					 <i class="menu-icon fa fa-tasks"></i>충전하기
					</a></li>
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
		<!-- Header-->

		<div class="breadcrumbs">
			<div class="breadcrumbs-inner">
				<div class="row m-0">
					<div class="col-sm-4">
						<div class="page-header float-left">
							<div class="page-title">
								<h1>자유 게시판</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8"></div>
				</div>
			</div>
		</div>

		<div class="content">
			<div class="animated fadeIn">
				<div class="row">

					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">
									<div class="row" id="searchDiv">
										<form action="BoardSearch.board">
											<select id="select" name="select"><option>제목</option>
												<option>글번호</option></select> <input type="text" id="search"
												name="search"> <input type="text" id="hide"
												name="currentPage" value="1">
											<button id="searchButt">검색</button>
											<input type="button" value="전체 글 보기" id="showAll">
										</form>
									</div>
								</strong>
							</div>
							<div class="card-body">
								<table id="bootstrap-data-table"
									class="table table-striped table-bordered">
									<thead>
										<tr class="row myrow">
											<th
												class="col-lg-1 col-md-1 col-sm-2 col-2 order-lg-1 order-md-1 order-sm-2 order-2">글
												번호
											</td>
											<th
												class="col-lg-5 col-md-5 col-sm-12 col-12 order-lg-2 order-md-2 order-sm-1 order-1">글
												제목
											</td>
											<th
												class="col-lg-2 col-md-2 col-sm-4 col-4 order-md-2 order-sm-2 order-2">작성자
											
											</td>
											<th
												class="col-lg-3 col-md-3 col-sm-4 col-4 order-md-2 order-sm-2 order-2">작성
												시간
											</td>
											<th
												class="col-lg-1 col-md-1 col-sm-2 col-2 order-md-2 order-sm-2 order-2">조회
												수
											</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="dto" items="${list}">
											<form action="ShowContents.board" id="formContents">
												<tr class="row myrow">
													<td
														class="col-lg-1 col-md-1 col-sm-2 col-2 order-lg-1 order-md-1 order-sm-2 order-2"><input
														type="text" id="noInput" name="no"
														value="${dto.board_seq}" readonly></td>
													<td
														class="col-lg-5 col-md-5 col-sm-12 col-12 order-lg-2 order-md-2 order-sm-1 order-1"><button
															class="titleLink">${dto.title}</button></td>
													<td
														class="col-lg-2 col-md-2 col-sm-4 col-4 order-md-2 order-sm-2 order-2">${dto.writer}</td>
													<td
														class="col-lg-3 col-md-3 col-sm-4 col-4 order-md-2 order-sm-2 order-2">${dto.writeDate}</td>
													<td
														class="col-lg-1 col-md-1 col-sm-2 col-2 order-md-2 order-sm-2 order-2">${dto.viewCount}</td>
												</tr>
											</form>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>


				</div>
			</div>
			<!-- .animated -->
			<footer>
				<div>
					<div class="col-lg-12 col-md-12 col-sm-12">
						<h5>${navi }</h5>
					</div>
				</div>
				<div>
					<div class="col-lg-12 col-md-12 col-sm-12" id="footer">
						<input type="button" id="write" value="글쓰기"
							class="btn btn-secondary"> <input type="button"
							id="goMain" value="메인 페이지로" class="btn btn-secondary">
					</div>
				</div>
			</footer>
		</div>
		<!-- .content -->


		<div class="clearfix"></div>

		<footer class="site-footer">
			<div class="footer-inner bg-white">
				<div class="row">
					<div class="col-sm-6">Copyright &copy; Amanda</div>
					<div class="col-sm-6 text-right">
						Designed by <a href="https://colorlib.com">Amanda</a>
					</div>
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
		$("#hide").hide();
		$("#showAll").hide();
		if ("${showAll}" == "showAll") {
			$("#showAll").show();
			$("#showAll").on("click", function() {
				location.href = "Board.board?currentPage=1";
			})
		}
		document.getElementById("write").onclick = function() {
			location.href = "Write.board"
		}
		document.getElementById("goMain").onclick = function() {
			location.href = "Index.log"
		}
	</script>

</body>
</html>
