<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
	<html class="no-js" lang=""> 
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
        <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
        <link href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css" rel="stylesheet">
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
            <!-- /#header -->
            <!-- Breadcrumbs-->
            <div class="breadcrumbs">
                <div class="breadcrumbs-inner">
                    <div class="row m-0">
                        <div class="col-sm-12">
                            <div class="page-header float-left">
                                <div class="page-title">
                                    <h1>잔여좌석</h1>
                                </div>
                            </div>
                        </div>
                       
                    </div>
                </div>
            </div>
    
            <div class="content ">
                <!-- Animated -->
                <div class="animated fadeIn">
                    <!-- Widgets  -->
                    <div class="row">
                        <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                                <h4>1 <br><br></h4>
                            </div><!-- /# card -->
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                                <h4>2 <br><br></h4>
                            </div><!-- /# card -->
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                               <h4>3 <br><br></h4>
                            </div><!-- /# card -->
                        </div>

                        <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                                <h4>4<br><br></h4>
                            </div><!-- /# card -->
                        </div>

                        <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                             <h4>5 <br><br></h4>
                            </div><!-- /# card -->
                        </div>

                        <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                             <h4>6 <br><br></h4>
                            </div><!-- /# card -->
                        </div>

                        <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                               <h4>7 <br><br></h4>
                            </div><!-- /# card -->
                        </div>

                        <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                             <h4>8 <br><br></h4>
                            </div><!-- /# card -->
                        </div>

                        <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                               <h4>9 <br><br></h4>
                            </div><!-- /# card -->
                        </div>

                        <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                               <h4>10 <br><br></h4>
                            </div><!-- /# card -->
                        </div>

                        <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                             <h4>11 <br><br></h4>
                            </div><!-- /# card -->
                        </div>
                         <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                             <h4>12 <br><br></h4>
                            </div><!-- /# card -->
                        </div>
                         <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                          
                        </div>
                         <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                               <h4>13 <br><br></h4>
                            </div><!-- /# card -->
                        </div>
                         <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                             <h4>14 <br><br></h4>
                            </div><!-- /# card -->
                        </div>
                         <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                             <h4>15 <br><br></h4>
                            </div><!-- /# card -->
                        </div>
                         <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                              <h4>16 <br><br></h4>
                            </div><!-- /# card -->
                        </div>
                         <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                                  <h4>17 <br><br></h4>
                            </div><!-- /# card -->
                        </div>
                         <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                           
                        </div>
                         <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                                 <h4>18 <br><br></h4>
                            </div><!-- /# card -->
                        </div>
                         <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                                   <h4>19 <br><br></h4>
                            </div><!-- /# card -->
                        </div>
                         <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                                 <h4>20 <br><br></h4>
                            </div><!-- /# card -->
                        </div>
                         <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                                  <h4>21 <br><br></h4>
                            </div><!-- /# card -->
                        </div>
                         <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                                  <h4>22 <br><br></h4>
                            </div><!-- /# card -->
                        </div>
                         <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                           
                        </div>
                         <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                                 <h4>23 <br><br></h4>
                            </div><!-- /# card -->
                        </div>
                         <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                                  <h4>24 <br><br></h4>
                            </div><!-- /# card -->
                        </div>
                         <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                                   <h4>25 <br><br></h4>
                            </div><!-- /# card -->
                        </div>
                         <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                                  <h4>26 <br><br></h4>
                            </div><!-- /# card -->
                        </div>
                         <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                                  <h4>27 <br><br></h4>
                            </div><!-- /# card -->
                        </div>
                         <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                           
                        </div>
                         <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                               <h4>28 <br><br></h4>
                            </div><!-- /# card -->
                        </div>
                         <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                                  <h4>29 <br><br></h4>
                            </div><!-- /# card -->
                        </div>
                         <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                            <div class="card" style="height: 80%">
                                   <h4>30 <br><br></h4>
                            </div><!-- /# card -->
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <!-- /.content -->
            <div class="clearfix"></div>
            <!-- Footer -->
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
        </div>
        <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
        <script src="assets/js/main.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/flot-charts@0.8.3/excanvas.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/flot-charts@0.8.3/jquery.flot.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.pie.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.time.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.stack.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.resize.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.crosshair.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/flot.curvedlines@1.1.1/curvedLines.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery.flot.tooltip@0.9.0/js/jquery.flot.tooltip.min.js"></script>
        <script src="assets/js/init/flot-chart-init.js"></script>

    </body>
</html>
