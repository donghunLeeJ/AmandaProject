<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Ela Admin - HTML5 Admin Template</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
    <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

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
					<li class="menu-item-has-children dropdown"><a href="Board.board?currentPage=1"> 
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

					<div class="user-area dropdown float-right">
						<a href="#" class="dropdown-toggle active" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> <img
							class="user-avatar rounded-circle" src="images/admin.jpg"
							alt="User Avatar">
						</a>

						<div class="user-menu dropdown-menu">
							<a class="nav-link" href="#"><i class="fa fa- user"></i>My
								Profile</a> <a class="nav-link" href="#"><i class="fa fa- user"></i>Notifications
								<span class="count">13</span></a> <a class="nav-link" href="#"><i
								class="fa fa -cog"></i>Settings</a> <a class="nav-link" href="#"><i
								class="fa fa-power -off"></i>Logout</a>
						</div>
					</div>

				</div>
			</div>
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
                                    <img src="images/gobchang.png" alt="">
                                    <h5 class="text-sm-center mt-2 mb-1">매콤달콤한 야채곱창</h5>
                                    <div class="location text-sm-center">5000원</div>
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
                                    <img  src="images/kimchi.png" alt="">
                                    <h5 class="text-sm-center mt-2 mb-1">반숙 계란이 2개나!!</h5>
                                    <div class="location text-sm-center">5500원</div>
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
                                    <img src="images/barbecue.png" alt="">
                                    <h5 class="text-sm-center mt-2 mb-1">주문즉시 옆에서 구워요!!</h5>
                                    <div class="location text-sm-center">11000원</div>
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
                                    <img src="images/selu.png" alt="">
                                    <h5 class="text-sm-center mt-2 mb-1">게임&다이어트를 동시에!</h5>
                                    <div class="location text-sm-center">3500원</div>
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
                                    <img src="images/beefbab.png" alt="">
                                    <h5 class="text-sm-center mt-2 mb-1">밥보다 고기양이 많다!!</h5>
                                    <div class="location text-sm-center">5000원</div>
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
                                    <img src="images/beef.png" alt="">
                                    <h5 class="text-sm-center mt-2 mb-1">마블링이 블링블링!!</h5>
                                    <div class="location text-sm-center">12000원</div>
                                </div>
                                <hr>
                                
                            </div>
                        </div>
                    </div>



                    <div class="col-md-4">
                        
                    </div>

                    <div class="col-md-4">
                        
                    </div>

                    <div class="col-md-4">
                       
                    </div>



                    <div class="col-md-4 col-sm-6">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title mb-3">와플</strong>
                            </div>
                            <div class="card-body">
                                <div class="mx-auto d-block">
                                    <img src="images/waffle.png" alt="">
                                    <h5 class="text-sm-center mt-2 mb-1">사진과 다르지 않습니다!!</h5>
                                    <div class="location text-sm-center">6000원</div>
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
                                    <img src="images/pi.png" alt="">
                                    <h5 class="text-sm-center mt-2 mb-1">그릇부터가 과일이네!!</h5>
                                    <div class="location text-sm-center">6000원</div>
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
                                    <img src="images/nabe.png" alt="">
                                    <h5 class="text-sm-center mt-2 mb-1">한겹한겹 육즙이..!!</h5>
                                    <div class="location text-sm-center">7000원</div>
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
                                    <img src="images/saboo.png" alt="">
                                    <h5 class="text-sm-center mt-2 mb-1">외식하러 여기로 오자!!</h5>
                                    <div class="location text-sm-center">12000원</div>
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
                                    <img src="images/Fish.png" alt="">
                                    <h5 class="text-sm-center mt-2 mb-1">음주하고 오신분을위한</h5>
                                    <div class="location text-sm-center">7000원</div>
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
                                    <img src="images/jeongol.png" alt="">
                                    <h5 class="text-sm-center mt-2 mb-1">전골 먹으러 오게되네!!</h5>
                                    <div class="location text-sm-center">12000원</div>
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
                                    <img src="images/jun.png" alt="">
                                    <h5 class="text-sm-center mt-2 mb-1">전주 안가도 되겠네</h5>
                                    <div class="location text-sm-center">7000원</div>
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
                                    <img src="images/boonsik.png" alt="">
                                    <h5 class="text-sm-center mt-2 mb-1">학교에서 먹던 그 분식집!!</h5>
                                    <div class="location text-sm-center">5000원</div>
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
                                    <img src="images/kimchitang.png" alt="">
                                    <h5 class="text-sm-center mt-2 mb-1">여기 공기밥 추가요!!</h5>
                                    <div class="location text-sm-center">6000원</div>
                                </div>
                                <hr>
                                
                            </div>
                        </div>
                    </div>


                </div><!-- .row -->
            </div><!-- .animated -->
        </div><!-- .content -->

    <div class="clearfix"></div>

    <footer class="site-footer">
        <div class="footer-inner bg-white">
            <div class="row">
                <div class="col-sm-6">
                    Copyright &copy; 2018 Ela Admin
                </div>
                <div class="col-sm-6 text-right">
                    Designed by <a href="https://colorlib.com">Colorlib</a>
                </div>
            </div>
        </div>
    </footer>


    </div><!-- /#right-panel -->

    <!-- Right Panel -->

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
    <script src="assets/js/main.js"></script>


</body>
</html>
