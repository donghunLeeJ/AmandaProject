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
    <script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
               <form class="form-horizontal" role="form" method="get" action="joinProc.member">
                <div class="form-group" id="divId">
                    <label for="inputId" class="col-lg-2 control-label">아이디</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyAlphabetAndNumber" name="joinmemberid" id="id" data-rule-required="true" placeholder="30자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="30">
                    </div>
                </div>
                <div class="form-group" id="divPassword">
                    <label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="password" name="joinmemberpw" data-rule-required="true" placeholder="패스워드" maxlength="30">
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
                        <input type="text" class="form-control" id="birth" name="joinmemberbirth" data-rule-required="true" placeholder="ex)19000101" maxlength="15">
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
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="submit" class="btn btn-default">회원가입</button>
                    </div>
                </div>
            </form>
        </div>
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


                    });

                });

            </script>

</body>
</html>
    