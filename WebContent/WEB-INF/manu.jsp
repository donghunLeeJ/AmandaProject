<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Ela Admin - HTML5 Admin Template</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">
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
<link rel="stylesheet" href="assets/css/style.css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>
<body>
	<!-- 왼쪽 네비 시작 -->
	<aside id="left-panel" class="left-panel">
		<nav class="navbar navbar-expand-sm navbar-default">
			<div id="main-menu" class="main-menu collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="page?url=WEB-INF/main.jsp"><i
							class="menu-icon fa fa-laptop"></i>Home </a></li>
					<li class="menu-item-has-children dropdown"><a
						href="page?url=WEB-INF/seat.jsp"> <i
							class="menu-icon fa fa-cogs"></i>잔여좌석
					</a></li>
					<li class="menu-item-has-children dropdown"><a
						href="page?url=WEB-INF/manu.jsp"> <i
							class="menu-icon fa fa-table"></i>메뉴
					</a></li>

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
							$("#charge").on("click",function(){
								alert("로그인 후 이용가능합니다.");	
							})
						</script>
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
		<!-- Header-->

		<div class="breadcrumbs">
			<div class="breadcrumbs-inner">
				<div class="row m-0">
					<div class="col-sm-12">
						<div class="page-header float-left">
							<div class="page-title">
								<h1>지금까지 이런 메뉴는 없었다!!</h1>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

		<div class="content">
			<div class="animated fadeIn">
				<div class="row">


					<div class="col-md-4 col-sm-6">
						<div class="card">
							<div class="card-header">
								<strong class="card-title mb-3">야채곱창</strong>
							</div>
							<div class="card-body">
								<div class="mx-auto d-block">
								<a href="#" class="active" data-toggle="modal"
									aria-haspopup="true" aria-expanded="false"
									data-target="#gobchang"> <img
									class="user-avatar " src="images/gobchang.png"
									alt="profile"></a>
									
									<h5 class="text-sm-center mt-2 mb-1">매콤달콤한 야채곱창</h5>
									<div class="location text-sm-center">5,000원</div>
								</div>
								<hr>

							</div>
						</div>
					</div>


					<div class="col-md-4 col-sm-6">
						<div class="card">
							<div class="card-header">
								<strong class="card-title mb-3">김치 볶음밥</strong>
							</div>
							<div class="card-body">
								<div class="mx-auto d-block">
								<a href="#" class="active" data-toggle="modal"
									aria-haspopup="true" aria-expanded="false"
									data-target="#kimchi"> <img
									class="user-avatar " src="images/kimchi.png"
									alt="profile"></a>
									
									<h5 class="text-sm-center mt-2 mb-1">반숙 계란이 2개나!!</h5>
									<div class="location text-sm-center">5,500원</div>
								</div>
								<hr>

							</div>
						</div>
					</div>



					<div class="col-md-4 col-sm-6">
						<div class="card">
							<div class="card-header">
								<strong class="card-title mb-3">바베큐 스테이크</strong>
							</div>
							<div class="card-body">
								<div class="mx-auto d-block">
								<a href="#" class="active" data-toggle="modal"
									aria-haspopup="true" aria-expanded="false"
									data-target="#barbecue"> <img
									class="user-avatar " src="images/barbecue.png"
									alt="profile"></a>
								
									<h5 class="text-sm-center mt-2 mb-1">주문즉시 옆에서 구워요!!</h5>
									<div class="location text-sm-center">11,000원</div>
								</div>
								<hr>

							</div>
						</div>
					</div>


					<div class="col-md-4 col-sm-6">
						<div class="card">
							<div class="card-header">
								<strong class="card-title mb-3">샐러드</strong>
							</div>
							<div class="card-body">
								<div class="mx-auto d-block">
								<a href="#" class="active" data-toggle="modal"
									aria-haspopup="true" aria-expanded="false"
									data-target="#selu"> <img
									class="user-avatar " src="images/selu.png"
									alt="profile"></a>
									
									<h5 class="text-sm-center mt-2 mb-1">게임&다이어트를 동시에!</h5>
									<div class="location text-sm-center">3,500원</div>
								</div>
								<hr>

							</div>
						</div>
					</div>

					<div class="col-md-4 col-sm-6">
						<div class="card">
							<div class="card-header">
								<strong class="card-title mb-3">소고기 볶음밥</strong>
							</div>
							<div class="card-body">
								<div class="mx-auto d-block">
								<a href="#" class="active" data-toggle="modal"
									aria-haspopup="true" aria-expanded="false"
									data-target="#beefbab"> <img
									class="user-avatar " src="images/beefbab.png"
									alt="profile"></a>
									
									<h5 class="text-sm-center mt-2 mb-1">밥보다 고기양이 많다!!</h5>
									<div class="location text-sm-center">5,000원</div>
								</div>
								<hr>

							</div>
						</div>
					</div>


					<div class="col-md-4 col-sm-6">
						<div class="card">
							<div class="card-header">
								<strong class="card-title mb-3">채끝살</strong>
							</div>
							<div class="card-body">
								<div class="mx-auto d-block">
								<a href="#" class="active" data-toggle="modal"
									aria-haspopup="true" aria-expanded="false"
									data-target="#beef"> <img
									class="user-avatar " src="images/beef.png"
									alt="profile"></a>
									
									<h5 class="text-sm-center mt-2 mb-1">마블링이 블링블링!!</h5>
									<div class="location text-sm-center">12,000원</div>
								</div>
								<hr>

							</div>
						</div>
					</div>



					<div class="col-md-4"></div>

					<div class="col-md-4"></div>

					<div class="col-md-4"></div>



					<div class="col-md-4 col-sm-6">
						<div class="card">
							<div class="card-header">
								<strong class="card-title mb-3">와플</strong>
							</div>
							<div class="card-body">
								<div class="mx-auto d-block">
								<a href="#" class="active" data-toggle="modal"
									aria-haspopup="true" aria-expanded="false"
									data-target="#waffle"> <img
									class="user-avatar " src="images/waffle.png"
									alt="profile"></a>
 								
									<h5 class="text-sm-center mt-2 mb-1">사진과 다르지 않습니다!!</h5>
									<div class="location text-sm-center">6,000원</div>
								</div>
								<hr>

							</div>
						</div>
					</div>


					<div class="col-md-4 col-sm-6">
						<div class="card">
							<div class="card-header">
								<strong class="card-title mb-3">계절메뉴</strong>
							</div>
							<div class="card-body">
								<div class="mx-auto d-block">
								<a href="#" class="active" data-toggle="modal"
									aria-haspopup="true" aria-expanded="false"
									data-target="#pi"> <img
									class="user-avatar " src="images/pi.png"
									alt="profile"></a>
								
									<h5 class="text-sm-center mt-2 mb-1">그릇부터가 과일이네!!</h5>
									<div class="location text-sm-center">6,000원</div>
								</div>
								<hr>

							</div>
						</div>
					</div>




					<div class="col-md-4 col-sm-6">
						<div class="card">
							<div class="card-header">
								<strong class="card-title mb-3">밀푀유 나베</strong>
							</div>
							<div class="card-body">
								<div class="mx-auto d-block">
								<a href="#" class="active" data-toggle="modal"
									aria-haspopup="true" aria-expanded="false"
									data-target="#nabe"> <img
									class="user-avatar " src="images/nabe.png"
									alt="profile"></a>
									
									<h5 class="text-sm-center mt-2 mb-1">한겹한겹 육즙이..!!</h5>
									<div class="location text-sm-center">7,000원</div>
								</div>
								<hr>

							</div>
						</div>
					</div>


					<div class="col-md-4 col-sm-6">
						<div class="card">
							<div class="card-header">
								<strong class="card-title mb-3">샤브샤브</strong>
							</div>
							<div class="card-body">
								<div class="mx-auto d-block">
								<a href="#" class="active" data-toggle="modal"
									aria-haspopup="true" aria-expanded="false"
									data-target="#saboo"> <img
									class="user-avatar " src="images/saboo.png"
									alt="profile"></a>
								
									<h5 class="text-sm-center mt-2 mb-1">외식하러 여기로 오자!!</h5>
									<div class="location text-sm-center">12,000원</div>
								</div>
								<hr>

							</div>
						</div>
					</div>


					<div class="col-md-4 col-sm-6">
						<div class="card">
							<div class="card-header">
								<strong class="card-title mb-3">어묵탕</strong>
							</div>
							<div class="card-body">
								<div class="mx-auto d-block">
								<a href="#" class="active" data-toggle="modal"
									aria-haspopup="true" aria-expanded="false"
									data-target="#Fish"> <img
									class="user-avatar " src="images/Fish.png"
									alt="profile"></a>
									
									<h5 class="text-sm-center mt-2 mb-1">음주하고 오신분을위한</h5>
									<div class="location text-sm-center">7,000원</div>
								</div>
								<hr>

							</div>
						</div>
					</div>

					<div class="col-md-4 col-sm-6">
						<div class="card">
							<div class="card-header">
								<strong class="card-title mb-3">전골</strong>
							</div>
							<div class="card-body">
								<div class="mx-auto d-block">
								<a href="#" class="active" data-toggle="modal"
									aria-haspopup="true" aria-expanded="false"
									data-target="#jeongol"> <img
									class="user-avatar " src="images/jeongol.png"
									alt="profile"></a>
						
									<h5 class="text-sm-center mt-2 mb-1">전골 먹으러 오게되네!!</h5>
									<div class="location text-sm-center">12,000원</div>
								</div>
								<hr>

							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<div class="card">
							<div class="card-header">
								<strong class="card-title mb-3">전주비빔밥</strong>
							</div>
							<div class="card-body">
								<div class="mx-auto d-block">
								<a href="#" class="active" data-toggle="modal"
									aria-haspopup="true" aria-expanded="false"
									data-target="#jun"> <img
									class="user-avatar " src="images/jun.png"
									alt="profile"></a>
							
									<h5 class="text-sm-center mt-2 mb-1">전주 안가도 되겠네</h5>
									<div class="location text-sm-center">7,000원</div>
								</div>
								<hr>

							</div>
						</div>
					</div>

					<div class="col-md-4 col-sm-6">
						<div class="card">
							<div class="card-header">
								<strong class="card-title mb-3">분식세트</strong>
							</div>
							<div class="card-body">
								<div class="mx-auto d-block">
								<a href="#" class="active" data-toggle="modal"
									aria-haspopup="true" aria-expanded="false"
									data-target="#boonsik"> <img
									class="user-avatar " src="images/boonsik.png"
									alt="profile"></a>
								
									<h5 class="text-sm-center mt-2 mb-1">학교에서 먹던 그 분식집!!</h5>
									<div class="location text-sm-center">5,000원</div>
								</div>
								<hr>

							</div>
						</div>
					</div>




					<div class="col-md-4 col-sm-6">
						<div class="card">
							<div class="card-header">
								<strong class="card-title mb-3">김치찌개</strong>
							</div>
							<div class="card-body">
								<div class="mx-auto d-block">
								<a href="#" class="active" data-toggle="modal"
									aria-haspopup="true" aria-expanded="false"
									data-target="#kimchitang"> <img
									class="user-avatar " src="images/kimchitang.png"
									alt="profile"></a>
						
									<h5 class="text-sm-center mt-2 mb-1">여기 공기밥 추가요!!</h5>
									<div class="location text-sm-center">6,000원</div>
								</div>
								<hr>

							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- .row -->
		</div>
		<!-- .animated -->
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
										<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
								</div>
								<div class="card-body">
									<div class="mx-auto d-block">
										<img class="rounded-circle mx-auto d-block"
											src="images/admin.jpg" alt="profile image" width="130px">
										<h5 class="text-center mt-2 mb-1"><b>${user.id} 님</b></h5>
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
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button id="deleteMembtn" type="button"
								class="btn btn-outline-info" data-dismiss="modal">회원 탈퇴</button>
							<button id="pointPagebtn" type="button"
								class="btn btn-outline-info" data-dismiss="modal">포인트
								충전</button>
							<button id="updatememberbtn" type="button"
								class="btn btn-outline-info" data-dismiss="modal">정보수정</button>
							<button type="button" class="btn btn-primary"  id="logoutbtn1">로그아웃</button>
									
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	<div class="modal fade" id="gobchang" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel1" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body1">
					<form>
						<div class="form-group m-0 p-0">
							<div class="card">
								<div class="card-header">
									<i class="fa fa-user"></i><strong class="card-title pl-2">
										지금까지 이런 메뉴는 없었다!! </strong>
										<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
								</div>
								<div class="card-body">
									<div class="mx-auto d-block">
										<img class="rounded-circle mx-auto d-block"
											src="images/gobchang.png" alt="profile image" width="130px">
										<h5 class="text-center mt-2 mb-1"><b>야채곱창</b></h5>
									</div>
									<hr>
									<div class="card-text">
										
										<div>
											<b>가격</b>
											<p>5,000원</p>
										</div>
										
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							
								<c:if test="${user.id != null}">	<button type="button" class="btn btn-primary"  id="gobchang1">결제하기</button> </c:if>
							<button id="" type="button"
								class="cancel" data-dismiss="modal">취소</button>	
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	<div class="modal fade" id="kimchi" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel1" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body1">
					<form>
						<div class="form-group m-0 p-0">
							<div class="card">
								<div class="card-header">
									<i class="fa fa-user"></i><strong class="card-title pl-2">
										지금까지 이런 메뉴는 없었다!! </strong>
										<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
								</div>
								<div class="card-body">
									<div class="mx-auto d-block">
										<img class="rounded-circle mx-auto d-block"
											src="images/kimchi.png" alt="profile image" width="130px">
										<h5 class="text-center mt-2 mb-1"><b>김치 볶음밥</b></h5>
									</div>
									<hr>
									<div class="card-text">
										
										<div>
											<b>가격</b>
											<p>5,500원</p>
										</div>
										
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							
								<c:if test="${user.id != null }">	<button type="button" class="btn btn-primary"  id="kimchi1">결제하기</button> </c:if>
							<button id="" type="button"
								class="cancel" data-dismiss="modal">취소</button>	
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	<div class="modal fade" id="barbecue" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel1" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body1">
					<form>
						<div class="form-group m-0 p-0">
							<div class="card">
								<div class="card-header">
									<i class="fa fa-user"></i><strong class="card-title pl-2">
										지금까지 이런 메뉴는 없었다!! </strong>
										<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
								</div>
								<div class="card-body">
									<div class="mx-auto d-block">
										<img class="rounded-circle mx-auto d-block"
											src="images/barbecue.png" alt="profile image" width="130px">
										<h5 class="text-center mt-2 mb-1"><b>바베큐 스테이크</b></h5>
									</div>
									<hr>
									<div class="card-text">
										
										<div>
											<b>가격</b>
											<p>11,000원</p>
										</div>
										
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							
								<c:if test="${user.id != null }"><button type="button" class="btn btn-primary"  id="barbecue1">결제하기</button></c:if>
							<button id="" type="button"
								class="btn btn-outline-info" data-dismiss="modal">취소</button>	
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	
	
	


<div class="modal fade" id="selu" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel1" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body1">
					<form>
						<div class="form-group m-0 p-0">
							<div class="card">
								<div class="card-header">
									<i class="fa fa-user"></i><strong class="card-title pl-2">
										지금까지 이런 메뉴는 없었다!! </strong>
										<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
								</div>
								<div class="card-body">
									<div class="mx-auto d-block">
										<img class="rounded-circle mx-auto d-block"
											src="images/selu.png" alt="profile image" width="130px">
										<h5 class="text-center mt-2 mb-1"><b>샐러드</b></h5>
									</div>
									<hr>
									<div class="card-text">
										
										<div>
											<b>가격</b>
											<p>3,500원</p>
										</div>
										
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							
								<c:if test="${user.id != null}"><button type="button" class="btn btn-primary"  id="selu1">결제하기</button></c:if>
							<button id="" type="button"
								class="btn btn-outline-info" data-dismiss="modal">취소</button>	
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>




<div class="modal fade" id="beefbab" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel1" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body1">
					<form>
						<div class="form-group m-0 p-0">
							<div class="card">
								<div class="card-header">
									<i class="fa fa-user"></i><strong class="card-title pl-2">
										지금까지 이런 메뉴는 없었다!! </strong>
										<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
								</div>
								<div class="card-body">
									<div class="mx-auto d-block">
										<img class="rounded-circle mx-auto d-block"
											src="images/beefbab.png" alt="profile image" width="130px">
										<h5 class="text-center mt-2 mb-1"><b>소고기 볶음밥</b></h5>
									</div>
									<hr>
									<div class="card-text">
										
										<div>
											<b>가격</b>
											<p>5,000원</p>
										</div>
										
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							
								<c:if test="${user.id !=null }"> <button type="button" class="btn btn-primary"  id="beefbab1">결제하기</button> </c:if>
							<button id="" type="button"
								class="btn btn-outline-info" data-dismiss="modal">취소</button>	
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>




<div class="modal fade" id="beef" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel1" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body1">
					<form>
						<div class="form-group m-0 p-0">
							<div class="card">
								<div class="card-header">
									<i class="fa fa-user"></i><strong class="card-title pl-2">
										지금까지 이런 메뉴는 없었다!! </strong>
										<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
								</div>
								<div class="card-body">
									<div class="mx-auto d-block">
										<img class="rounded-circle mx-auto d-block"
											src="images/beef.png" alt="profile image" width="130px">
										<h5 class="text-center mt-2 mb-1"><b>채끝살</b></h5>
									</div>
									<hr>
									<div class="card-text">
										
										<div>
											<b>가격</b>
											<p>12,000원</p>
										</div>
										
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							
								<c:if test="${user.id != null }"><button type="button" class="btn btn-primary"  id="beef1">결제하기</button></c:if>
							<button id="" type="button"
								class="btn btn-outline-info" data-dismiss="modal">취소</button>	
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>






<div class="modal fade" id="waffle" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel1" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body1">
					<form>
						<div class="form-group m-0 p-0">
							<div class="card">
								<div class="card-header">
									<i class="fa fa-user"></i><strong class="card-title pl-2">
										지금까지 이런 메뉴는 없었다!! </strong>
										<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
								</div>
								<div class="card-body">
									<div class="mx-auto d-block">
										<img class="rounded-circle mx-auto d-block"
											src="images/waffle.png" alt="profile image" width="130px">
										<h5 class="text-center mt-2 mb-1"><b>와플</b></h5>
									</div>
									<hr>
									<div class="card-text">
										
										<div>
											<b>가격</b>
											<p>6,000원</p>
										</div>
										
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							
								<c:if test="${user.id != null }"><button type="button" class="btn btn-primary"  id="waffle1">결제하기</button></c:if>
							<button id="" type="button"
								class="btn btn-outline-info" data-dismiss="modal">취소</button>	
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>



<div class="modal fade" id="pi" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel1" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body1">
					<form>
						<div class="form-group m-0 p-0">
							<div class="card">
								<div class="card-header">
									<i class="fa fa-user"></i><strong class="card-title pl-2">
										지금까지 이런 메뉴는 없었다!! </strong>
										<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
								</div>
								<div class="card-body">
									<div class="mx-auto d-block">
										<img class="rounded-circle mx-auto d-block"
											src="images/pi.png" alt="profile image" width="130px">
										<h5 class="text-center mt-2 mb-1"><b>계절메뉴</b></h5>
									</div>
									<hr>
									<div class="card-text">
										
										<div>
											<b>가격</b>
											<p>6,000원</p>
										</div>
										
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							
								<c:if test="${user.id != null }"><button type="button" class="btn btn-primary"  id="pi1">결제하기</button></c:if>
							<button id="" type="button"
								class="btn btn-outline-info" data-dismiss="modal">취소</button>	
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>


<div class="modal fade" id="nabe" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel1" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body1">
					<form>
						<div class="form-group m-0 p-0">
							<div class="card">
								<div class="card-header">
									<i class="fa fa-user"></i><strong class="card-title pl-2">
										지금까지 이런 메뉴는 없었다!! </strong>
										<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
								</div>
								<div class="card-body">
									<div class="mx-auto d-block">
										<img class="rounded-circle mx-auto d-block"
											src="images/nabe.png" alt="profile image" width="130px">
										<h5 class="text-center mt-2 mb-1"><b>밀푀유 나베</b></h5>
									</div>
									<hr>
									<div class="card-text">
										
										<div>
											<b>가격</b>
											<p>7,000원</p>
										</div>
										
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							
								<c:if test="${user.id != null }"><button type="button" class="btn btn-primary"  id="nabe1">결제하기</button></c:if>
							<button id="" type="button"
								class="btn btn-outline-info" data-dismiss="modal">취소</button>	
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>




<div class="modal fade" id="saboo" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel1" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body1">
					<form>
						<div class="form-group m-0 p-0">
							<div class="card">
								<div class="card-header">
									<i class="fa fa-user"></i><strong class="card-title pl-2">
										지금까지 이런 메뉴는 없었다!! </strong>
										<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
								</div>
								<div class="card-body">
									<div class="mx-auto d-block">
										<img class="rounded-circle mx-auto d-block"
											src="images/saboo.png" alt="profile image" width="130px">
										<h5 class="text-center mt-2 mb-1"><b>샤브샤브</b></h5>
									</div>
									<hr>
									<div class="card-text">
										
										<div>
											<b>가격</b>
											<p>12,000원</p>
										</div>
										
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							
								<c:if test="${user.id != null }"><button type="button" class="btn btn-primary"  id="saboo1">결제하기</button></c:if>
							<button id="" type="button"
								class="btn btn-outline-info" data-dismiss="modal">취소</button>	
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>




<div class="modal fade" id="Fish" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel1" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body1">
					<form>
						<div class="form-group m-0 p-0">
							<div class="card">
								<div class="card-header">
									<i class="fa fa-user"></i><strong class="card-title pl-2">
										지금까지 이런 메뉴는 없었다!! </strong>
										<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
								</div>
								<div class="card-body">
									<div class="mx-auto d-block">
										<img class="rounded-circle mx-auto d-block"
											src="images/Fish.png" alt="profile image" width="130px">
										<h5 class="text-center mt-2 mb-1"><b>어묵탕</b></h5>
									</div>
									<hr>
									<div class="card-text">
										
										<div>
											<b>가격</b>
											<p>7,000원</p>
										</div>
										
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							
								<c:if test="${user.id != null }"><button type="button" class="btn btn-primary"  id="Fish1">결제하기</button></c:if>
							<button id="" type="button"
								class="btn btn-outline-info" data-dismiss="modal">취소</button>	
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>



<div class="modal fade" id="boonsik" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel1" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body1">
					<form>
						<div class="form-group m-0 p-0">
							<div class="card">
								<div class="card-header">
									<i class="fa fa-user"></i><strong class="card-title pl-2">
										지금까지 이런 메뉴는 없었다!! </strong>
										<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
								</div>
								<div class="card-body">
									<div class="mx-auto d-block">
										<img class="rounded-circle mx-auto d-block"
											src="images/boonsik.png" alt="profile image" width="130px">
										<h5 class="text-center mt-2 mb-1"><b>분식세트</b></h5>
									</div>
									<hr>
									<div class="card-text">
										
										<div>
											<b>가격</b>
											<p>5,000원</p>
										</div>
										
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							
								<c:if test="${user.id }"><button type="button" class="btn btn-primary"  id="boonsik1">결제하기</button></c:if>
							<button id="" type="button"
								class="btn btn-outline-info" data-dismiss="modal">취소</button>	
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	
	
	<div class="modal fade" id="jun" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel1" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body1">
					<form>
						<div class="form-group m-0 p-0">
							<div class="card">
								<div class="card-header">
									<i class="fa fa-user"></i><strong class="card-title pl-2">
										지금까지 이런 메뉴는 없었다!! </strong>
										<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
								</div>
								<div class="card-body">
									<div class="mx-auto d-block">
										<img class="rounded-circle mx-auto d-block"
											src="images/jun.png" alt="profile image" width="130px">
										<h5 class="text-center mt-2 mb-1"><b>전주비빔밥</b></h5>
									</div>
									<hr>
									<div class="card-text">
										
										<div>
											<b>가격</b>
											<p>7,000원</p>
										</div>
										
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							
								<c:if test="${user.id != null }"><button type="button" class="btn btn-primary"  id="jun1">결제하기</button></c:if>
							<button id="" type="button"
								class="btn btn-outline-info" data-dismiss="modal">취소</button>	
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	<div class="modal fade" id="jeongol" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel1" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body1">
					<form>
						<div class="form-group m-0 p-0">
							<div class="card">
								<div class="card-header">
									<i class="fa fa-user"></i><strong class="card-title pl-2">
										지금까지 이런 메뉴는 없었다!! </strong>
										<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
								</div>
								<div class="card-body">
									<div class="mx-auto d-block">
										<img class="rounded-circle mx-auto d-block"
											src="images/jeongol.png" alt="profile image" width="130px">
										<h5 class="text-center mt-2 mb-1"><b>전골</b></h5>
									</div>
									<hr>
									<div class="card-text">
										
										<div>
											<b>가격</b>
											<p>12,000원</p>
										</div>
										
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							
								<c:if test="${user.id != null }"><button type="button" class="btn btn-primary"  id="jeongol1">결제하기</button></c:if>
							<button id="" type="button"
								class="btn btn-outline-info" data-dismiss="modal">취소</button>	
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>


<div class="modal fade" id="kimchitang" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel1" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body1">
					<form>
						<div class="form-group m-0 p-0">
							<div class="card">
								<div class="card-header">
									<i class="fa fa-user"></i><strong class="card-title pl-2">
										지금까지 이런 메뉴는 없었다!! </strong>
										<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
								</div>
								<div class="card-body">
									<div class="mx-auto d-block">
										<img class="rounded-circle mx-auto d-block"
											src="images/kimchitang.png" alt="profile image" width="130px">
										<h5 class="text-center mt-2 mb-1"><b>김치찌개</b></h5>
									</div>
									<hr>
									<div class="card-text">
										
										<div>
											<b>가격</b>
											<p>6,000원</p>
										</div>
										
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							
								<c:if test="${user.id != null }"><button type="button" class="btn btn-primary"  id="kimchitang1">결제하기</button></c:if>
							<button id="" type="button"
								class="btn btn-outline-info" data-dismiss="modal">취소</button>	
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>



	<script>
	
	$(".cancel").on("click",function(){
		alert("취소")
	})
	
	var paid_amount = 0;
	var name=null;
	var id="${user.id }";
	
	$("#gobchang1").on("click",function(){
		IMP.init('imp96545220'); 
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '야채곱창',
		    amount : 5000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        paid_amount = rsp.paid_amount;
		        name = rsp.name;
		        location.href = "menu.pay?id="+id+"&name="+name+"&amount="+paid_amount;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		    
		    	
		    	
	})
	})
	$("#kimchi1").on("click",function(){
		IMP.init('imp96545220'); 
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '김치 볶음밥',
		    amount : 5500,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        paid_amount = rsp.paid_amount;
		        name = rsp.name;
		        location.href = "menu.pay?id="+id+"&name="+name+"&amount="+paid_amount;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		  
	})
	})
	$("#barbecue1").on("click",function(){
		IMP.init('imp96545220'); 
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '바베큐 스테이크',
		    amount : 11000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        paid_amount = rsp.paid_amount;
		        name = rsp.name;
		        location.href = "menu.pay?id="+id+"&name="+name+"&amount="+paid_amount;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		   
	})
	})
	$("#selu1").on("click",function(){
		IMP.init('imp96545220'); 
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '샐러드',
		    amount : 3500,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        paid_amount = rsp.paid_amount;
		        name = rsp.name;
		        location.href = "menu.pay?id="+id+"&name="+name+"&amount="+paid_amount;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		    
	})
	})
	$("#beefbab1").on("click",function(){
		IMP.init('imp96545220'); 
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '소고기 볶음밥',
		    amount : 5000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        paid_amount = rsp.paid_amount;
		        name = rsp.name;
		        location.href = "menu.pay?id="+id+"&name="+name+"&amount="+paid_amount;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		 
	})
	})
	$("#beef1").on("click",function(){
		IMP.init('imp96545220'); 
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '채끝살',
		    amount : 12000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        paid_amount = rsp.paid_amount;
		        name = rsp.name;
		        location.href = "menu.pay?id="+id+"&name="+name+"&amount="+paid_amount;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		    
	})
	})
	$("#waffle1").on("click",function(){
		IMP.init('imp96545220'); 
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '와플',
		    amount : 6000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        paid_amount = rsp.paid_amount;
		        name = rsp.name;
		        location.href = "menu.pay?id="+id+"&name="+name+"&amount="+paid_amount;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		   
	})
	})
	$("#pi1").on("click",function(){
		IMP.init('imp96545220'); 
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '계절메뉴',
		    amount : 6000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        paid_amount = rsp.paid_amount;
		        name = rsp.name;
		        location.href = "menu.pay?id="+id+"&name="+name+"&amount="+paid_amount;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		   
	})
	})
	$("#nabe1").on("click",function(){
		IMP.init('imp96545220'); 
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '밀푀유 나베',
		    amount : 7000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        paid_amount = rsp.paid_amount;
		        name = rsp.name;
		        location.href = "menu.pay?id="+id+"&name="+name+"&amount="+paid_amount;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		   
	})
	})
	$("#saboo1").on("click",function(){
		IMP.init('imp96545220'); 
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '샤브샤브',
		    amount : 12000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        paid_amount = rsp.paid_amount;
		        name = rsp.name;
		        location.href = "menu.pay?id="+id+"&name="+name+"&amount="+paid_amount;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		  
	})
	})
	$("#Fish1").on("click",function(){
		IMP.init('imp96545220'); 
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '어묵탕',
		    amount : 7000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        paid_amount = rsp.paid_amount;
		        name = rsp.name;
		        location.href = "menu.pay?id="+id+"&name="+name+"&amount="+paid_amount;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		   
	})
	})
	$("#boonsik1").on("click",function(){
		IMP.init('imp96545220'); 
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '분식세트',
		    amount : 5000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        paid_amount = rsp.paid_amount;
		        name = rsp.name;
		        location.href = "menu.pay?id="+id+"&name="+name+"&amount="+paid_amount;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		    
	})
	})
	$("#jun1").on("click",function(){
		IMP.init('imp96545220'); 
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '전주비빔밥',
		    amount : 7000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        paid_amount = rsp.paid_amount;
		        name = rsp.name;
		        location.href = "menu.pay?id="+id+"&name="+name+"&amount="+paid_amount;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		   
	})
	})
	$("#jeongol1").on("click",function(){
		IMP.init('imp96545220'); 
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '전골',
		    amount : 12000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        paid_amount = rsp.paid_amount;
		        name = rsp.name;
		        location.href = "menu.pay?id="+id+"&name="+name+"&amount="+paid_amount;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		   
	})
	})
	$("#kimchitang1").on("click",function(){
		IMP.init('imp96545220'); 
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '김치찌개',
		    amount : 6000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        paid_amount = rsp.paid_amount;
		        name = rsp.name;
		        location.href = "menu.pay?id="+id+"&name="+name+"&amount="+paid_amount;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		    
	})
	})
	
	
	$("#logoutbtn1").on("click",function() {
				location.href = "logoutProc.member";
		})
	$("#updatememberbtn").on("click",function() {
				location.href = "page?url=WEB-INF/ModifyMembers.jsp";
		})
	$("#deleteMembtn")	.on(
											"click",
											function() {
												location.href = "page?url=WEB-INF/deleteMem.jsp";
											})
							$("#pointPagebtn").on("click", function() {
								location.href = "page?url=WEB-INF/pay.jsp";
							})
							//클릭시 주문 창
							$(".menu").on("click",function(){
								
							})
							
							
							
							
							
						</script>


	<!-- 진향이 마이페이지 폼끝 -->
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
									id="reinputid">아이디 찾기</button>
								<button type="button" class="btn btn-primary" type="button"
									id="reinputpw">비밀번호찾기</button>
									<button type="button" class="btn btn-primary" type="button"
										id="joinMem">회원가입</button>
									<button type="button" class="btn btn-primary" id="login">login</button>
									
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>

	
	<script>
	
	
	$("#reinputid").on("click",function(){
		location.href = "page?url=WEB-INF/modifyid.jsp";
		})
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
         
         
         $(".btn btn-outline-info").on("click",function(){
        	 alert("취소");
         })
   
   
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
    
   <!-- 컨텐츠 끝 -->

   <div class="clearfix"></div>
   <!-- Footer -->
   <footer class="site-footer">
      <div class="footer-inner bg-white">
         <div class="row">
            <div class="col-sm-6">Copyright &copy; 2019년 PC방임</div>
            <div class="col-sm-6 text-right">
               Designed by <a href="https://colorlib.com">1조</a>
            </div>
         </div>
      </div>
   </footer>

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
							
							
												
	  //5분(포인트 300)이 되면 경고창을 날림 / 포인트가 0이 되는 순간 강제 로그아웃되게 만드는 함수			
			function msg_time(){  
    		   
    		   $.ajax({  
    		    	 
    		         url: 'usertime.com',
    		         type: 'POST'
    		          
    		 }).done(function(point){
    			 		       	   	 			 	
    		      if (point == 300){      
    		    	  
    		         alert("선불시간이 5분 남았습니다.");
    		         
    		      }else if(point == 0){
    		    	  
    		    	  alert("포인트가 0이 되었으므로 자동 로그아웃됩니다.");
    		    	  location.href = "logoutProc.member";
    		    	  clearInterval(tid); 		    	  
    		      }   
    		 });	   	     
    	   }	   			
    	 
    	   setTimeout(msg_time());//아래의 setInterval코드만 실행할 경우 1초의 딜레이가 생기는데 즉시 남은 시간을 보여주기 위해 만듬
    	   function TimerStart(){ tid=setInterval('msg_time()',1000) };
    	   TimerStart();	
  												
	</script>
     
     
     
     
   

</body>
</html>
