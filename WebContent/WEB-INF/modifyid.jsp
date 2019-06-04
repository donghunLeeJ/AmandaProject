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

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
    <script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
    
<!--     캘린더에 대한 cdn -->
   <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  

<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  

    
    
    
    
    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<style>
	#pwcheckbox{
	width:500px;
		height: 25px;

	box-sizing: border-box;
	}
	#pwcheckbox1{
		width: 25%;
		float: left;
	
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

        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>Dashboard</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">Dashboard</a></li>
                                    <li><a href="#">Icons</a></li>
                                    <li class="active">FontAwesome</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="content">
           <h1 align="center">아이디 찾기</h1>
        <div class="container"><!-- 좌우측의 공간 확보 -->

            <!-- 모달창 -->
            <div class="modal fade" id="defaultModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">알림</h4>
                        </div>
                        <div class="modal-body">
                            <p class="modal-contents"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <!--// 모달창 -->
            <hr/>
            <!-- 본문 들어가는 부분 -->


            <form class="form-horizontal" role="form" method="post" action="findidProc.member">
                <div class="form-group" id="divid">
                    <label for="inputid" class="col-lg-2 control-label">이름</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control" id="checkName" name="checkName" data-rule-required="true" placeholder="이름" maxlength="30" required>
                    </div>
                </div>
                
                
                <div class="form-group" id="divEmail">
                    <label for="inputEmail" class="col-lg-2 control-label">생년월일</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control" id="checkbirth" name="checkbirth" data-rule-required="true" maxlength="40" placeholder="ex)19000101" readonly>
                    </div>
                </div>
                
                
                
                
                <div class="form-group" id="divEmail">
                    <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
                    <div class="col-lg-10">
                        <input type="email" class="form-control" id="checkemail" name="checkemail" data-rule-required="true" maxlength="40" placeholder="이메일">
                    </div>
                </div>
           
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="submit" class="btn btn-default">확인</button>
                    </div>
                </div>
            </form>

        </div>
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
						
						 $("#checkbirth").datepicker({
							  showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
							  buttonImage: "/application/db/jquery/images/calendar.gif", // 버튼 이미지
							  buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다.
							  changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
							  changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
							  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
							  nextText: '다음 달', // next 아이콘의 툴팁.
							  prevText: '이전 달', // prev 아이콘의 툴팁.
							  numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
							  //stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
							  yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
							  showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
							  currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
							  closeText: '닫기',  // 닫기 버튼 패널
							  dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
							  showAnim: "slide", //애니메이션을 적용한다.
							  showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
							  dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
							  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.
							                    
							 });
						
						
						
						
						 $("img.ui-datepicker-trigger").remove();//ddatepicker 이미지 지우기
						
						
						
						
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
    
