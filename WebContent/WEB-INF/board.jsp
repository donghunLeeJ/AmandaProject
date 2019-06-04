<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->
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

<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<style>
#wrapper {
	margin-top: 50px;
}

#nav{
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
.titleLink:hover{
	cursor:pointer;
}
#writer {
	word-wrap: break-word;
}

#searchDiv {
	height: 50px;
}

#select, #search{
	height: 30px;
	margin-left: 10px;
	margin-top: 10px;
}
#searchButt{
	margin-left: 7px;
	margin-right: 5px;
}
.myrow {
	margin-left: 0px;
	margin-right: 0px;
}

</style>
</head>
<body>
	<!-- Left Panel -->

	<aside id="left-panel" class="left-panel">
		<nav class="navbar navbar-expand-sm navbar-default">
			<div id="main-menu" class="main-menu collapse navbar-collapse">
				<ul class="nav navbar-nav">
		     	<c:choose>
					<c:when test="${user.id != 'admin' }">
					<li class="active"><a href="page?url=WEB-INF/main.jsp"><i
							class="menu-icon fa fa-laptop"></i>Home </a></li>
					</c:when>
					<c:when test="${user.id == 'admin' }">
					<li class="active"><a href="page?url=WEB-INF/adminmain.jsp"><i
							class="menu-icon fa fa-laptop"></i>Home </a></li>
					</c:when>
					</c:choose>
               <li class="menu-item-has-children dropdown"><a
                  href="page?url=WEB-INF/seat.jsp" onclick="send()"> <i
                     class="menu-icon fa fa-cogs"></i>잔여좌석
               </a></li>
               <c:choose>
              		<c:when test="${user.id == 'admin' }">
               		<li class="menu-item-has-children dropdown"><a
               	    href="select.admin"> <i
                     class="menu-icon fa fa-table"></i>메뉴
              		 </a></li>
              		 </c:when>
              		 <c:when test="${user.id != 'admin' }">
               		<li class="menu-item-has-children dropdown"><a
               	    href="ClientSelect.admin"> <i
                     class="menu-icon fa fa-table"></i>메뉴
              		 </a></li>
              		 </c:when>
           		</c:choose>
               <li class="menu-item-has-children dropdown"><a
                  href="Board.board?currentPage=1"> <i
                     class="menu-icon fa fa-th"></i>고객의소리
               </a></li>
               <c:choose>
                  <c:when test="${user == null }">
                     <li id="charge" class="menu-item-has-children dropdown"><a
                        href="#"> <i class="menu-icon fa fa-tasks"></i>충전하기
                     </a></li>
                     <script>
                        $("#charge").on("click", function() {
                           alert("로그인 후 이용가능합니다.");
                        })
                     </script>
                  </c:when>
                  <c:when test="${user.id == 'admin' }">
                     	<li class="menu-item-has-children dropdown"><a
						href="member.manage"> <i
							class="menu-icon fa fa-th"></i>고객관리
					</a></li>
                  </c:when>
                  <c:otherwise>
                     <li id="charge" class="menu-item-has-children dropdown"><a
                        href="page?url=WEB-INF/pay.jsp"> <i
                           class="menu-icon fa fa-tasks"></i>충전하기
                     </a></li>
                  </c:otherwise>
               </c:choose>

				</ul>
			</div>
		</nav>
	</aside>
	<!-- 왼쪽 네비 끝 -->
	<!-- 상단 검색바 마이페이지 등등 시작 -->
	<div id="right-panel" class="right-panel">
		<!-- Header-->
		<header id="header" class="header">
			<div class="top-left">
				<div class="navbar-header">
					<a class="navbar-brand" href="./"><img src="images/logo.png"
						alt="Logo"></a> <a class="navbar-brand hidden"
						href="page?url=WEB-INF/main.jsp"><img src="images/logo2.png"
						alt="Logo"></a> <a id="menuToggle" class="menutoggle"><i
						class="fa fa-bars"></i></a>
				</div>
			</div>
			<c:choose>
				<c:when test="${user != null }">
					<div class="top-right">
						<div class="header-menu">
							<div class="header-left">
								<button class="search-trigger">
									<i class="fa fa-search"></i>
								</button>
								<div class="form-inline">
									<form class="search-form">
										<input class="form-control mr-sm-2" type="text"
											placeholder="Search ..." aria-label="Search">
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
												<span class="name float-left">Cheryl Wheeler</span> <span
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
							<!--  mypage 사람 사진-->
							<div class="user-area  float-right">
								<a href="#" class="active" data-toggle="modal"
									aria-haspopup="true" aria-expanded="false"
									data-target="#exampleModal1"> <img
									class="user-avatar rounded-circle" src="images/admin.jpg"
									alt="profile"></a>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="top-right">
						<div class="header-menu">
							<div class="header-left">
								<button class="search-trigger">
									<i class="fa fa-search"></i>
								</button>
								<div class="form-inline">
									<form class="search-form">
										<input class="form-control mr-sm-2" type="text"
											placeholder="Search ..." aria-label="Search">
										<button class="search-close" type="submit">
											<i class="fa fa-close"></i>
										</button>
									</form>
								</div>
								<div class="dropdown for-notification">
									<button type="button"
										class="btn btn-outline-danger signbt mb-2" data-toggle="modal"
										data-target="#exampleModal" id="loginbtn">login</button>
								</div>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</header>
		<!-- /header -->
		<!-- Header-->

		<div class="breadcrumbs">
			<div class="breadcrumbs-inner">
				<div class="row m-0">
					<div class="col-sm-4">
						<div class="page-header float-left">
							<div class="page-title">
								<h1><b>자유 게시판</b></h1>
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
												<option>작성자</option></select> <input type="text" id="search"
												name="search"> <input type="text" id="hide"
												name="currentPage" value="1">
											<button id="searchButt" class="btn btn-secondary">검색</button>
											<input type="button" value="전체 글 보기" id="showAll" class="btn btn-secondary">
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
											</th>
											<th
												class="col-lg-5 col-md-5 col-sm-12 col-12 order-lg-2 order-md-2 order-sm-1 order-1">글
												제목
											</th>
											<th
												class="col-lg-2 col-md-2 col-sm-4 col-4 order-md-2 order-sm-2 order-2">작성자
											
											</th>
											<th
												class="col-lg-3 col-md-3 col-sm-4 col-4 order-md-2 order-sm-2 order-2">작성
												시간
											</th>
											<th
												class="col-lg-1 col-md-1 col-sm-2 col-2 order-md-2 order-sm-2 order-2">조회
												수
											</th>
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
					<div id="nav" class="col-lg-12 col-md-12 col-sm-12">
						<h5>${navi }</h5>
					</div>
				</div>
				<div>
					<div class="col-lg-12 col-md-12 col-sm-12" id="footer">
						<c:if test="${user != null }">
						<input type="button" id="write" value="글쓰기" class="btn btn-secondary">
						</c:if>
						 <input type="button"
							id="goMain" value="메인 페이지로" class="btn btn-secondary">
					</div>
				</div>
			</footer>
		</div>
		<script>
			
		
		</script>
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
					<!-- 					여기부터 진향이가 만든 로그인폼 -->
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
									$("#reinputpw").on("click",function(){
									location.href = "page?url=WEB-INF/modifypassword.jsp";
									})
									$("#joinMem").on("click",function() {
									location.href = "page?url=WEB-INF/joinMem.jsp";
									})
									document.getElementById("login").onclick = function() {
									document.getElementById("form").submit();
									}
									// 									로그인 버튼과 회원가입 버튼의 script
	</script>
								
	<!-- 						진향이 로그인폼끝 -->
	<!-- 								진향이 마이페이지 폼 -->
	<div class="modal fade" id="exampleModal1" tabindex="-1"
            role="dialog" aria-labelledby="exampleModalLabel1"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
               <div class="modal-content">
                  <div class="modal-body1">
                     <form>
                        <div class="form-group m-0 p-0">
                           <div class="card">
                              <div class="card-header">
                                 <i class="fa fa-user"></i><strong class="card-title pl-2">
                                    My Page </strong>
                                 <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                 </button>
                              </div>
                              <div class="card-body">
                                 <div class="mx-auto d-block">
                                    <img class="rounded-circle mx-auto d-block"
                                       src="images/admin.jpg" alt="profile image" width="130px">
                                    <h5 class="text-center mt-2 mb-1">
                                       <b>${user.id} 님</b>
                                    </h5>
                                    <!-- <div class="location text-center">Lv. 일반회원</div> -->
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
                                    <div>
                                       <b>주소</b>
                                       <p>
                                       ${user.address1 }</p>
                                       <p>${user.address2 }</p>
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
                           <button type="button" class="btn btn-primary" id="logoutbtn1">로그아웃</button>

                        </div>
                     </form>

                  </div>
               </div>
            </div>
         </div>



         <script>
   
   
   $("#logoutbtn1")
   .on(
         "click",
         function() {
            location.href = "logoutProc.member";
         })

   
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
		document.getElementById("goMain").onclick = function() {
			location.href = "page?url=WEB-INF/main.jsp"
		}
		document.getElementById("write").onclick = function() {
			location.href = "Write.board"
		}
				   
	</script>




</body>
</html>
