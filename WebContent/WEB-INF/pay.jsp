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
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<link
	href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/weathericons@2.1.0/css/weather-icons.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.css"
	rel="stylesheet" />
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.1.min.js"
	type="application/javascript"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
#weatherWidget .currentDesc {
	color: #ffffff !important;
}

.traffic-chart {
	min-height: 335px;
}

#flotPie1 {
	height: 150px;
}

#flotPie1 td {
	padding: 3px;
}

#flotPie1 table {
	top: 20px !important;
	right: -10px !important;
}

.chart-container {
	display: table;
	min-width: 270px;
	text-align: left;
	padding-top: 10px;
	padding-bottom: 10px;
}

#flotLine5 {
	height: 105px;
}

#flotBarChart {
	height: 150px;
}

#cellPaiChart {
	height: 160px;
}
</style>
</head>

<body>
	<!-- Left Panel -->
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

					<li class="menu-item-has-children dropdown"><a href="Board.board?currentPage=1"> 
					<i class="menu-icon fa fa-th"></i>고객의소리

					</a></li>
					<c:choose>
					<c:when test="${user == null }">
						<li id="charge" class="menu-item-has-children dropdown"><a
						href="#"> <i
							class="menu-icon fa fa-tasks"></i>충전하기
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
		<!-- /#header -->
		<!-- Content -->
		<div class="content ">
			<!-- Animated -->
			<div class="animated fadeIn">
				<!-- Widgets  -->
				<div class="row">
					<div class="col-lg-12 col-md-12">

						<div class="card mb-5">
							<div class="card-body border border-secondary ">
								<h4>포인트 충전</h4>
							</div>
						</div>
						<!-- /# card -->
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="card" style="height: 80%">

							<div class="card-body">

								<button type="button" class="btn btn-outline-primary btn-lg"
									style="width: 100%; height: 100%" type="button" id="pay1000">
									1000원 충전<br>(1시간)
								</button>

							</div>
						</div>
						<!-- /# card -->
					</div>

					<div class="col-lg-6 col-md-6">
						<div class="card" style="height: 80%">

							<div class="card-body">

								<button type="button" class="btn btn-outline-secondary btn-lg"
									style="width: 100%; height: 100%" type="button" id="pay2000">
									2000원 충전<br>(2시간)
								</button>

							</div>
						</div>
						<!-- /# card -->
					</div>

					<div class="col-lg-6 col-md-6">
						<div class="card" style="height: 80%">

							<div class="card-body">

								<button type="button" class="btn btn-outline-success btn-lg"
									style="width: 100%; height: 100%" type="button" id="pay3000">
									3000원 충전<br>(3시간)
								</button>

							</div>
						</div>
						<!-- /# card -->
					</div>

					<div class="col-lg-6 col-md-6">
						<div class="card" style="height: 80%">

							<div class="card-body">

								<button type="button" class="btn btn-outline-danger btn-lg"
									style="width: 100%; height: 100%" type="button" id="pay5000">
									5000원 충전<br>(5시간 30분)
								</button>

							</div>
						</div>
						<!-- /# card -->
					</div>

					<div class="col-lg-6 col-md-6">
						<div class="card" style="height: 80%">

							<div class="card-body">

								<button type="button" class="btn btn-outline-warning btn-lg"
									style="width: 100%; height: 100%" type="button" id="pay10000">
									10000원 충전<br>(11시간)
								</button>

							</div>
						</div>
						<!-- /# card -->
					</div>

					<div class="col-lg-6 col-md-6">
						<div class="card" style="height: 80%">

							<div class="card-body">

								<button type="button" class="btn btn-outline-info btn-lg"
									style="width: 100%; height: 100%" type="button" id="pay20000">
									20000원 충전<br>(23시간)
								</button>
							</div>
						</div>
						<!-- /# card -->
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- .animated -->
		</div>
		<!-- /.content -->
		<div class="clearfix"></div>
		<!-- Footer -->
		<footer class="site-footer mt-5">
			<div class="footer-inner bg-white">
				<div class="row">
					<div class="col-sm-6">Copyright &copy; 2018 Ela Admin</div>
					<div class="col-sm-6 text-right">
						Designed by <a href="https://colorlib.com">Colorlib</a>
					</div>
				</div>
			</div>
		</footer>
		<!-- /.site-footer -->
	</div>
	<!-- /#right-panel -->

	<!-- Scripts -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="assets/js/main.js"></script>

	<!--  Chart js -->
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.7.3/dist/Chart.bundle.min.js"></script>

	<!--Chartist Chart-->
	<script
		src="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chartist-plugin-legend@0.6.2/chartist-plugin-legend.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/flot-pie@1.0.0/src/jquery.flot.pie.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/flot-spline@0.0.1/js/jquery.flot.spline.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/simpleweather@3.1.0/jquery.simpleWeather.min.js"></script>
	<script src="assets/js/init/weather-init.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/moment@2.22.2/moment.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.js"></script>
	<script src="assets/js/init/fullcalendar-init.js"></script>

	<!--Local Stuff-->
	<script>
            $("#pay1000").on("click",function(){
                BootPay.request({
                    price: '1000',
                    application_id: "5cde4395b6d49c3e68bf277e",
                    name: 'kh피씨방 1000원 충전', 
                    pg: '',
                    method: '', 
                    show_agree_window: 0, 
                    items: [
                        {
                            item_name: '나는 아이템',
                            qty: 1,
                            unique: '123', 
                            price: 1000,
                        }
                    ],
                    user_info: {
                        username: '사용자 이름',
                        email: '사용자 이메일',
                        addr: '사용자 주소',
                        phone: '010-1234-4567'
                    },
                    order_id: '고유order_id_1234', 
                    params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
                     
                }).error(function (data) {
                    console.log(data);
                }).cancel(function (data) {
                    console.log(data);
                }).ready(function (data) {
                    console.log(data);
                }).confirm(function (data) {
                     console.log(data);
                    var enable = true; 
                    if (enable) {
                        this.transactionConfirm(data); 
                    } else {
                        this.removePaymentWindow(); 
                    }
                }).close(function (data) {
                }).done(function (data) {
          
                    console.log(data);
                })
            })
              $("#pay2000").on("click",function(){
                BootPay.request({
                    price: '2000',
                    application_id: "5cde4395b6d49c3e68bf277e",
                    name: 'kh피씨방 2000원 충전', 
                    pg: '',
                    method: '', 
                    show_agree_window: 0, 
                    items: [
                        {
                            item_name: '나는 아이템',
                            qty: 1,
                            unique: '123', 
                            price: 1000,
                        }
                    ],
                    user_info: {
                        username: '사용자 이름',
                        email: '사용자 이메일',
                        addr: '사용자 주소',
                        phone: '010-1234-4567'
                    },
                    order_id: '고유order_id_1234', 
                    params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
                     
                }).error(function (data) {
                    console.log(data);
                }).cancel(function (data) {
                    console.log(data);
                }).ready(function (data) {
                    console.log(data);
                }).confirm(function (data) {
                     console.log(data);
                    var enable = true; 
                    if (enable) {
                        this.transactionConfirm(data); 
                    } else {
                        this.removePaymentWindow(); 
                    }
                }).close(function (data) {
                }).done(function (data) {
          
                    console.log(data);
                })
            })
              $("#pay3000").on("click",function(){
                BootPay.request({
                    price: '3000',
                    application_id: "5cde4395b6d49c3e68bf277e",
                    name: 'kh피씨방 3000원 충전', 
                    pg: '',
                    method: '', 
                    show_agree_window: 0, 
                    items: [
                        {
                            item_name: '나는 아이템',
                            qty: 1,
                            unique: '123', 
                            price: 1000,
                        }
                    ],
                    user_info: {
                        username: '사용자 이름',
                        email: '사용자 이메일',
                        addr: '사용자 주소',
                        phone: '010-1234-4567'
                    },
                    order_id: '고유order_id_1234', 
                    params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
                     
                }).error(function (data) {
                    console.log(data);
                }).cancel(function (data) {
                    console.log(data);
                }).ready(function (data) {
                    console.log(data);
                }).confirm(function (data) {
                     console.log(data);
                    var enable = true; 
                    if (enable) {
                        this.transactionConfirm(data); 
                    } else {
                        this.removePaymentWindow(); 
                    }
                }).close(function (data) {
                }).done(function (data) {
          
                    console.log(data);
                })
            })
              $("#pay5000").on("click",function(){
                BootPay.request({
                    price: '5000',
                    application_id: "5cde4395b6d49c3e68bf277e",
                    name: 'kh피씨방 5000원 충전', 
                    pg: '',
                    method: '', 
                    show_agree_window: 0, 
                    items: [
                        {
                            item_name: '나는 아이템',
                            qty: 1,
                            unique: '123', 
                            price: 1000,
                        }
                    ],
                    user_info: {
                        username: '사용자 이름',
                        email: '사용자 이메일',
                        addr: '사용자 주소',
                        phone: '010-1234-4567'
                    },
                    order_id: '고유order_id_1234', 
                    params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
                     
                }).error(function (data) {
                    console.log(data);
                }).cancel(function (data) {
                    console.log(data);
                }).ready(function (data) {
                    console.log(data);
                }).confirm(function (data) {
                     console.log(data);
                    var enable = true; 
                    if (enable) {
                        this.transactionConfirm(data); 
                    } else {
                        this.removePaymentWindow(); 
                    }
                }).close(function (data) {
                }).done(function (data) {
          
                    console.log(data);
                })
            })
              $("#pay10000").on("click",function(){
                BootPay.request({
                    price: '10000',
                    application_id: "5cde4395b6d49c3e68bf277e",
                    name: 'kh피씨방 10000원 충전', 
                    pg: '',
                    method: '', 
                    show_agree_window: 0, 
                    items: [
                        {
                            item_name: '나는 아이템',
                            qty: 1,
                            unique: '123', 
                            price: 1000,
                        }
                    ],
                    user_info: {
                        username: '사용자 이름',
                        email: '사용자 이메일',
                        addr: '사용자 주소',
                        phone: '010-1234-4567'
                    },
                    order_id: '고유order_id_1234', 
                    params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
                     
                }).error(function (data) {
                    console.log(data);
                }).cancel(function (data) {
                    console.log(data);
                }).ready(function (data) {
                    console.log(data);
                }).confirm(function (data) {
                     console.log(data);
                    var enable = true; 
                    if (enable) {
                        this.transactionConfirm(data); 
                    } else {
                        this.removePaymentWindow(); 
                    }
                }).close(function (data) {
                }).done(function (data) {
          
                    console.log(data);
                })
            })
              $("#pay20000").on("click",function(){
                BootPay.request({
                    price: '20000',
                    application_id: "5cde4395b6d49c3e68bf277e",
                    name: 'kh피씨방 20000원 충전', 
                    pg: '',
                    method: '', 
                    show_agree_window: 0, 
                    items: [
                        {
                            item_name: '나는 아이템',
                            qty: 1,
                            unique: '123', 
                            price: 1000,
                        }
                    ],
                    user_info: {
                        username: '사용자 이름',
                        email: '사용자 이메일',
                        addr: '사용자 주소',
                        phone: '010-1234-4567'
                    },
                    order_id: '고유order_id_1234', 
                    params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
                     
                }).error(function (data) {
                    console.log(data);
                }).cancel(function (data) {
                    console.log(data);
                }).ready(function (data) {
                    console.log(data);
                }).confirm(function (data) {
                     console.log(data);
                    var enable = true; 
                    if (enable) {
                        this.transactionConfirm(data); 
                    } else {
                        this.removePaymentWindow(); 
                    }
                }).close(function (data) {
                }).done(function (data) {
          
                    console.log(data);
                })
            })







          
        </script>
</body>
</html>
