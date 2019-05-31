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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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

        <div class="content">
            <h1 align="center">회원가입</h1>
        <div class="container">
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
                    </div>
                </div>
            </div>
       
            <hr/>
               <form class="form-horizontal" role="form" method="post" action="joinProc.member">
                <div class="form-group" id="divId">
                    <label for="inputId" class="col-lg-2 control-label">아이디</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyAlphabetAndNumber" name="joinmemberid" id="id" data-rule-required="true" placeholder="30자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="30">
                    </div>
                </div>
                <div class="form-group" id="divPassword">
                    <label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="password" name="joinmemberpw" data-rule-required="true" placeholder="영어 대,소문자 숫자로 8글자 이상" maxlength="30" pattern="[0-9a-zA-z]{8,}" required>
                    </div>
                </div>
                <div class="form-group" id="divPasswordCheck">
                    <label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드 확인</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="passwordCheck" name="joinmemberpw2" data-rule-required="true" placeholder="패스워드 확인" maxlength="30">
                    </div>
                </div>
                <div class="form-group" id="divName">
                    <label for="inputName" class="col-lg-2 control-label">이름</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyHangul" id="name" name="joinmembername" data-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15">
                    </div>
                </div>

                <div class="form-group" id="divBirth">
                    <label for="inputBirth" class="col-lg-2 control-label">생년월일</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control" id="birth" name="joinmemberbirth" data-rule-required="true" pattern="^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$" placeholder="ex)19000101" maxlength="15">
                    </div>
                </div>

                <div class="form-group" id="divEmail">
                    <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
                    <div class="col-lg-10">
                        <input type="email" class="form-control" id="email" name="joinmemberemail" data-rule-required="true" placeholder="이메일" maxlength="40">
                    </div>
                </div>
                <div class="form-group" id="divPhoneNumber">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
                    <div class="col-lg-10">
                        <input type="tel" class="form-control onlyNumber" id="phoneNumber" name="joinmemberphone" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
                    </div>
                </div>
                
                 <label for="inputPhoneNumber" class="col-lg-2 control-label">주소 입력</label>
                    <div class="col-lg-10">
                        <input required type="text" class="form-control" id="postcode" name="postcode" placeholder="우편번호" readonly >
                        <input required type="text" class="form-control" id="Address1" name="address1" placeholder="주소" readonly>
                        <input required type="text" class="form-control" id="Address2" name="address2" placeholder="상세주소"><br>
                        <input type="button" value="우편번호 찾기" id="search">
                    </div>
                    
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="submit" class="btn btn-outline-success signbt mb-2" id="joinmemberbtn">회원가입</button>
                    </div>
                </div>
            </form>
        </div>
        <!-- 						진향이 로그인폼끝 -->
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
									$("#joinMem").on("click",function() {
									location.href = "page?url=WEB-INF/joinMem.jsp";
									})
									document.getElementById("login").onclick = function() {
									document.getElementById("form").submit();
									}
									// 									로그인 버튼과 회원가입 버튼의 script
								</script>
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
    </div>
    <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
    <script src="assets/js/main.js"></script>
	<script>

                $(function(){
                    //모달을 전역변수로 선언
                    var modalContents = $(".modal-contents");
                    var modal = $("#defaultModal");

                    $('.onlyAlphabetAndNumber').keyup(function(event){
                        if (!(event.keyCode >=37 && event.keyCode<=40)) {
                            var inputVal = $(this).val();
                            $(this).val($(this).val().replace(/[^_a-z0-9]/gi,'')); //_(underscore), 영어, 숫자만 가능
                        }
                    });

                    $(".onlyHangul").keyup(function(event){
                        if (!(event.keyCode >=37 && event.keyCode<=40)) {
                            var inputVal = $(this).val();
                            $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
                        }
                    });

                    $(".onlyNumber").keyup(function(event){
                        if (!(event.keyCode >=37 && event.keyCode<=40)) {
                            var inputVal = $(this).val();
                            $(this).val(inputVal.replace(/[^0-9]/gi,''));
                        }
                    });

                    //------- 검사하여 상태를 class에 적용
                    $('#id').keyup(function(event){

                        var divId = $('#divId');

                        if($('#id').val()==""){
                            divId.removeClass("has-success");
                            divId.addClass("has-error");
                        }else{
                            divId.removeClass("has-error");
                            divId.addClass("has-success");
                        }
                    });

                    $('#password').keyup(function(event){

                        var divPassword = $('#divPassword');

                        if($('#password').val()==""){
                            divPassword.removeClass("has-success");
                            divPassword.addClass("has-error");
                        }else{
                            divPassword.removeClass("has-error");
                            divPassword.addClass("has-success");
                        }
                    });

                    $('#passwordCheck').keyup(function(event){

                        var passwordCheck = $('#passwordCheck').val();
                        var password = $('#password').val();
                        var divPasswordCheck = $('#divPasswordCheck');

                        if((passwordCheck=="") || (password!=passwordCheck)){
                            divPasswordCheck.removeClass("has-success");
                            divPasswordCheck.addClass("has-error");
                        }else{
                            divPasswordCheck.removeClass("has-error");
                            divPasswordCheck.addClass("has-success");
                        }
                    });

                    $('#name').keyup(function(event){

                        var divName = $('#divName');

                        if($.trim($('#name').val())==""){
                            divName.removeClass("has-success");
                            divName.addClass("has-error");
                        }else{
                            divName.removeClass("has-error");
                            divName.addClass("has-success");
                        }
                    });

                    $('#nickname').keyup(function(event){

                        var divNickname = $('#divNickname');

                        if($.trim($('#nickname').val())==""){
                            divNickname.removeClass("has-success");
                            divNickname.addClass("has-error");
                        }else{
                            divNickname.removeClass("has-error");
                            divNickname.addClass("has-success");
                        }
                    });

                    $('#email').keyup(function(event){

                        var divEmail = $('#divEmail');

                        if($.trim($('#email').val())==""){
                            divEmail.removeClass("has-success");
                            divEmail.addClass("has-error");
                        }else{
                            divEmail.removeClass("has-error");
                            divEmail.addClass("has-success");
                        }
                    });

                    $('#phoneNumber').keyup(function(event){

                        var divPhoneNumber = $('#divPhoneNumber');

                        if($.trim($('#phoneNumber').val())==""){
                            divPhoneNumber.removeClass("has-success");
                            divPhoneNumber.addClass("has-error");
                        }else{
                            divPhoneNumber.removeClass("has-error");
                            divPhoneNumber.addClass("has-success");
                        }
                    });


                    //------- validation 검사
                    $( "form" ).submit(function( event ) {

                        var provision = $('#provision');
                        var memberInfo = $('#memberInfo');
                        var divId = $('#divId');
                        var divPassword = $('#divPassword');
                        var divPasswordCheck = $('#divPasswordCheck');
                        var divName = $('#divName');
                        var divEmail = $('#divEmail');
                        var divPhoneNumber = $('#divPhoneNumber');


                        //아이디 검사
                        if($('#id').val()==""){
                            modalContents.text("아이디를 입력하여 주시기 바랍니다.");
                            modal.modal('show');

                            divId.removeClass("has-success");
                            divId.addClass("has-error");
                            $('#id').focus();
                            return false;
                        }else{
                            divId.removeClass("has-error");
                            divId.addClass("has-success");
                        }

                        //패스워드 검사
                        if($('#password').val()==""){
                            modalContents.text("패스워드를 입력하여 주시기 바랍니다.");
                            modal.modal('show');

                            divPassword.removeClass("has-success");
                            divPassword.addClass("has-error");
                            $('#password').focus();
                            return false;
                        }else{
                            divPassword.removeClass("has-error");
                            divPassword.addClass("has-success");
                        }

                        //패스워드 확인
                        if($('#passwordCheck').val()==""){
                            modalContents.text("패스워드 확인을 입력하여 주시기 바랍니다.");
                            modal.modal('show');

                            divPasswordCheck.removeClass("has-success");
                            divPasswordCheck.addClass("has-error");
                            $('#passwordCheck').focus();
                            return false;
                        }else{
                            divPasswordCheck.removeClass("has-error");
                            divPasswordCheck.addClass("has-success");
                        }

                        //패스워드 비교
                        if($('#password').val()!=$('#passwordCheck').val() || $('#passwordCheck').val()==""){
                            modalContents.text("패스워드가 일치하지 않습니다.");
                            modal.modal('show');

                            divPasswordCheck.removeClass("has-success");
                            divPasswordCheck.addClass("has-error");
                            $('#passwordCheck').focus();
                            return false;
                        }else{
                            divPasswordCheck.removeClass("has-error");
                            divPasswordCheck.addClass("has-success");
                        }

                        //이름
                        if($('#name').val()==""){
                            modalContents.text("이름을 입력하여 주시기 바랍니다.");
                            modal.modal('show');

                            divName.removeClass("has-success");
                            divName.addClass("has-error");
                            $('#name').focus();
                            return false;
                        }else{
                            divName.removeClass("has-error");
                            divName.addClass("has-success");
                        }

                        //이메일
                        if($('#email').val()==""){
                            modalContents.text("이메일을 입력하여 주시기 바랍니다.");
                            modal.modal('show');

                            divEmail.removeClass("has-success");
                            divEmail.addClass("has-error");
                            $('#email').focus();
                            return false;
                        }else{
                            divEmail.removeClass("has-error");
                            divEmail.addClass("has-success");
                        }

                        //휴대폰 번호
                        if($('#phoneNumber').val()==""){
                            modalContents.text("휴대폰 번호를 입력하여 주시기 바랍니다.");
                            modal.modal('show');

                            divPhoneNumber.removeClass("has-success");
                            divPhoneNumber.addClass("has-error");
                            $('#phoneNumber').focus();
                            return false;
                        }else{
                            divPhoneNumber.removeClass("has-error");
                            divPhoneNumber.addClass("has-success");
                        }
                        
                        if($("#postcode").val()==""){
                        	modalContents.text("주소를 입력해주세요");
                        	modal.modal("show");
                        	
                        	divEmail.removeClass("has-success");
                            divEmail.addClass("has-error");
                            return false;
                        }else{
                        	  divEmail.removeClass("has-error");
                              divEmail.addClass("has-success");
                        }


                    });

                });
                document.getElementById("search").onclick = searchAddress;
                
                function searchAddress() {
                    new daum.Postcode({
                        oncomplete: function(data) {
                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                            var roadAddr = data.roadAddress; // 도로명 주소 변수
                            var extraRoadAddr = ''; // 참고 항목 변수

                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                extraRoadAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if(data.buildingName !== '' && data.apartment === 'Y'){
                                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if(extraRoadAddr !== ''){
                                extraRoadAddr = ' (' + extraRoadAddr + ')';
                            }

                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            document.getElementById('postcode').value = data.zonecode;
                            document.getElementById("Address1").value = roadAddr;
                        }
                    }).open();
                }

            </script>

</body>
</html>
    