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
					<li class="menu-item-has-children dropdown"><a href="page?url=WEB-INF/main.jsp"><i
							class="menu-icon fa fa-laptop"></i>Home </a></li>
					<li class="menu-item-has-children dropdown"><a
						href="page?url=WEB-INF/seat.jsp" onclick="send()"> <i
							class="menu-icon fa fa-cogs" ></i>잔여좌석
					</a></li>
					  <li class="menu-item-has-children dropdown"><a
                	  href="ClientSelect.admin"> <i
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
								$("#loginbtn").trigger("click");
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
           <h1 align="center">정보수정</h1>
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


            <form class="form-horizontal" role="form" method="post" action="updateProc.member">
                <div class="form-group" id="divPassword">
                    <label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="newpw" name="newpw" data-rule-required="true" placeholder="패스워드" maxlength="30"  pattern="[0-9a-zA-z]{8,}"required>
                    </div>
                </div>
                <div class="form-group" id="divPasswordCheck">
                    <label for="inputPasswordCheck" class="col-lg-2 control-label"><div id="pwcheckbox"><div id="pwcheckbox1">패스워드 확인 </div><div id="result"></div></div></label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="newpw2" data-rule-required="true" placeholder="패스워드 확인" maxlength="30" name="newpw2" pattern="[0-9a-zA-z]{8,}" required>
                    </div>
                </div>

                <div class="form-group" id="divEmail">
                    <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
                    <div class="col-lg-10">
                        <input type="email" class="form-control" id="email" data-rule-required="true"maxlength="40" name="newemail" value="${user.email}">
                    </div>
                </div>
                <div class="form-group" id="divPhoneNumber">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
                    <div class="col-lg-10">
                        <input type="tel" class="form-control onlyNumber" id="phoneNumber" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11" name="phone" value="${user.phone}">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="submit" class="btn btn-default">정보수정</button>
                    </div>
                </div>
            </form>

        </div>
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



	<script>
	
	
	$("#logoutbtn1")
	.on(
			"click",
			function() {
	            if(${user.id == 'admin' }){
	            	location.href = "adminlogoutProc.member";	
	            }else{
	            	location.href = "logoutProc.member";	
	            }
	        	 
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
												<form action="loginProc.member" id="form" name="formname" method="post">
                        <div class="form-group">
                           <label for="exampleFormControlInput1">ID</label> <input
                              type="text" class="form-control" id="joinemail"
                              placeholder="ID를 입력하시오" required name="loginid" onkeypress="press(this.form)">
                        </div>
                        <div class="form-group">
                           <label for="exampleFormControlInput1">Password</label> <input
                              type="password" class="form-control" id="joinpassword"
                              placeholder="비밀번호 입력하시오" required name="loginpw" onkeypress="press(this.form)">
                        </div>
                        <div class=row><button type="button" class="btn btn-outline-info col-6 col-sm-2 mr-sm-2 ml-sm-5" type="button"
										id="findId">ID 찾기</button>
                           <button type="button" class="btn btn-outline-info col-6 col-sm-2 mr-sm-2 " type="button"
                              id="reinputpw">PW 찾기</button>
                           <button type="button" class="btn btn-outline-info col-6 col-sm-3 mr-sm-2" type="button"
                              id="joinMem">회원 가입</button>
                           <button type="submit" class="btn btn-outline-info col-6 col-sm-2 mr-sm-2" id="login">login</button></div>
                        <div class="modal-footer">
                        
                          
                        </div>
                     </form>
											</div>
										</div>
									</div>
								</div>

								<script>
								
								//엔터 입력시 로그인
						         function press(f){ if(f.keyCode == 13){  
						        	 formname.submit();  
						        	 } }
								
								
									$("#joinMem").on("click",function() {
									location.href = "page?url=WEB-INF/joinMem.jsp";
									})
									document.getElementById("login").onclick = function() {
									document.getElementById("form").submit();
									}
									// 									로그인 버튼과 회원가입 버튼의 script
								</script>
        </div><!-- .content -->
        
        <script>
		document.getElementById("newpw2").oninput = function() {
			var pw1 = document.getElementById("newpw").value;
			var pw2 = document.getElementById("newpw2").value;

			if (pw1 == pw2) {
				document.getElementById("result").innerHTML = "패스워드일치";
				result.style.color = "green";
			}

			else {
				document.getElementById("result").innerHTML = "불일치";
				result.style.color = "#e66178";

			}
		}
					
	</script>
        
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


 <!-- 5분(포인트 300)이 되면 경고창을 날림 / 포인트가 0이 되는 순간 강제 로그아웃되게 만드는 함수 --> 
  <c:choose> 
    <c:when test="${(user != null) && (user.id != 'admin')}">
      
       <script>
	
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
 		    	  
 		      }else if(point == -1){
 		    	  
 		    	 clearInterval(tid); 		
 		    	     	  
 		      }   
 		      		      
 		 });	   	     
 	   }	   			
 	 
 	   setTimeout(msg_time());//아래의 setInterval코드만 실행할 경우 1초의 딜레이가 생기는데 즉시 남은 시간을 보여주기 위해 만듬
 	   function TimerStart(){ tid=setInterval('msg_time()',1000) };
 	   TimerStart();   </script>    
  </c:when>  
</c:choose> 


</body>
</html>
    