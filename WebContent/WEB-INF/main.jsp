<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
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

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>


<style>
#remember {
	width: 35%;
	height: 100%;
	margin: 0px;
}

.modal-footer {
	box-sizing: border-box;
}

.modal-body1 {
	padding: 1px;
}

.card-header {
	color: gray;
	background-color: #bbe3e3;
}

.card-text {
	text-align: left;
}
</style>
</head>

<body>
	<!-- Left Panel -->
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
						href="page?url=WEB-INF/board.jsp"> <i
							class="menu-icon fa fa-th"></i>고객의소리
					</a></li>
					<li class="menu-item-has-children dropdown"><a
						href="page?url=WEB-INF/pay.jsp"> <i
							class="menu-icon fa fa-tasks"></i>충전하기
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
		</header>
		<!-- /#header -->
		<!-- Content -->
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<!-- Widgets  -->
				<div class="row">
					<div class="col-lg-12 area specifications">
						<div class="card my-card border-danger">
							<div class="card-body">
								<h3 class="card-title">PC방 관련 스팩/사양이 들어갈 곳</h3>
								<p class="card-text">내용</p>
							</div>
						</div>
					</div>
					<div class="col-lg-6 area">
						<div class="card my-card border-danger">
							<div class="card-body">
								<h3 class="card-title">빈 좌석의 갯수 등이 들어갈 영역</h3>
								<p class="card-text">
									반<br> 응<br> 형
								</p>
							</div>
						</div>
					</div>


					<div class="col-lg-6 area">
						<div class="card my-card border-danger">
							<div class="card-body">
								<h3 class="card-title">충전/로그인/개인정보</h3>
								<p class="card-text">내용</p>
								<!-- 로그인 btn -->
								<button type="button" class="btn btn-outline-danger signbt mb-2"
									data-toggle="modal" data-target="#exampleModal" id="loginbtn">
									login</button>
								<div class="modal fade" id="exampleModal" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">L O G I
													N</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form action="loginProc.member" id="form">
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
														<div id="remember">
															<input type="checkbox">자동로그인
														</div>
														<button type="button" class="btn btn-primary"
															type="button" id="joinMem">회원가입</button>
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
                                        $("#joinMem").on("click",function(){
                                        	location.href="page?url=WEB-INF/JoinMembers.jsp";	
                                        })
                                        	document.getElementById("login").onclick = function() {
			document.getElementById("form").submit();	}
                                        
                                        
                                        
                                        </script>
<<<<<<< HEAD
								<!-- mypage fade된 부분 contents에 있어야 fade가 보여서 여기에 코딩함 -->
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
																<i class="fa fa-user"></i><strong
																	class="card-title pl-2"> My Page </strong>
															</div>
															<div class="card-body">
																<div class="mx-auto d-block">
																	<img class="rounded-circle mx-auto d-block"
																		src="images/admin.jpg" alt="profile image"
																		width="80px">
																	<h5 class="text-center mt-2 mb-1">Steven Lee</h5>
																	<div class="location text-center">Lv. 일반회원</div>
																</div>
																<hr>
																<div class="card-text">
																	<div> <b>이름 </b> <p> </p>
																	</div>
																	<div> <b>생년월일</b>
																		<p> </p>
																	</div>
																	<div> <b>이메일</b>
																		<p></p> </div>
																	<div> <b>핸드폰번호</b>
																		<p> </p>
																	</div>
																	<div> <b>잔여포인트</b>
																		<p> </p>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-outline-info"
															data-dismiss="modal">포인트 충전</button>
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
=======
                               <!-- mypage fade된 부분 contents에 있어야 fade가 보여서 여기에 코딩함 -->
                                <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-body1">
                                                        <form>
                                                            <div class="form-group m-0 p-0">
                           <div class="card">
                            <div class="card-header">
                                <i class="fa fa-user"></i><strong class="card-title pl-2">
                                	My Page
                                </strong>
                            </div>
                            <div class="card-body">
                                <div class="mx-auto d-block" >
                                    <img class="rounded-circle mx-auto d-block" src="images/admin.jpg" alt="profile image" width="80px">
                                    <h5 class="text-center mt-2 mb-1">Steven Lee</h5>
                                    <div class="location text-center">Lv. 일반회원</div>
                                </div>
                                <hr>
                                <div class="card-text">
									<pre> <b>이름 </b> <p> </p></pre>                 
									<pre> <b>생년월일</b><p> </p></pre>         
									<pre> <b>이메일</b><p></p> </pre>  
									<pre> <b>핸드폰번호</b><p> </p></pre>             
                                    <pre> <b>잔여포인트</b><p> </p></pre> 
                                </div>
                            </div>
                        </div>            
                           </div>
                                                              <div class="modal-footer">
                                                               <button id="deletememberbtn"  type="button" class="btn btn-outline-info" data-dismiss="modal" >회원 탈퇴</button>
                                                              <button id="pointPagebtn" type="button" class="btn btn-outline-info" data-dismiss="modal" >포인트 충전</button>
                                                               <button id="updatememberbtn" type="button" class="btn btn-outline-info" data-dismiss="modal">정보수정</button>
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>                                                          
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <script>
>>>>>>> f7dd6f183ad3758b555c0449b7452bb793303330
                                        $("#updatememberbtn").on("click",function(){
                                        	location.href="page?url=WEB-INF/ModifyMembers.jsp";
                                        })
                                        $("#deletememberbtn").on("click",function(){
                                        	location.href="page?url=WEB-INF/deleteMem.jsp";
                                        })
                                        $("#pointPagebtn").on("click",function(){
                                        	location.href="page?url=WEB-INF/pay.jsp";
                                        })
                                        </script>

							</div>
						</div>
					</div>
					<div class="col-lg-6 area">
						<div class="card my-card border-danger">
							<div class="card-body">
								<h3 class="card-title">오늘의 메뉴가 들어갈 곳</h3>
								<p class="card-text">내용</p>
							</div>
						</div>
					</div>

					<div class="col-lg-6 area">
						<div class="card my-card border-danger">
							<div class="card-body">
								<h3 class="card-title">PC방 이벤트가 들어갈 곳</h3>
								<p class="card-text">내용</p>
							</div>
						</div>
					</div>
				</div>


				<!-- /#add-category -->
			</div>
		</div>
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

</body>
</html>