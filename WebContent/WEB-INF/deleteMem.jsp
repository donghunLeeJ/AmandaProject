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
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
    
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    
</head>
<body>
   <!-- 왼쪽 네비 시작 -->
	<aside id="left-panel" class="left-panel">
		<nav class="navbar navbar-expand-sm navbar-default">
			<div id="main-menu" class="main-menu collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="page?url=WEB-INF/main.jsp"><i
							class="menu-icon fas fa-home"></i>Home </a></li>
					<li class="menu-item-has-children "><a
						href="page?url=WEB-INF/seat.jsp" onclick="send()"> <i
							class="menu-icon fas fa-desktop"></i>잔여좌석
					</a></li>

					<li class="menu-item-has-children"><a
						href="ClientSelect.admin"> <i
							class="menu-icon fas fa-concierge-bell"></i>메뉴
					</a></li>

					<li class="menu-item-has-children"><a
						href="Board.board?currentPage=1"> <i
							class="menu-icon fas fa-headset"></i>고객의소리
					</a></li>

					<c:choose>
						<c:when test="${user == null }">
							<li id="charge" class="menu-item-has-children"><a href="#">
									<i class="menu-icon fas fa-coins"></i>충전하기
							</a></li>
							<script>
                     
                     
                     $(window).on("resize",function(){
            				if($(window).width() >= 752){
            					$("#left-panel").css("display","block");
            				}				
            			})

                     $("#charge").on("click",function(){
                         alert("로그인 후 이용가능합니다.");
                         $("#loginbtn").trigger("click");

                         
                        
                     })
                  </script>

						</c:when>
						<c:otherwise>
							<li id="charge" class="menu-item-has-children"><a
								href="page?url=WEB-INF/pay.jsp"> <i
									class="menu-icon fas fa-coins"></i>충전하기
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
		<header id="header" class="header pt-1">
			<div class="top-left">
				<div class="navbar-header">
					<a class="navbar-brand p-0" href="page?url=WEB-INF/main.jsp"><img  src="images/logo5.png"
						alt="Logo"></a> <a class="navbar-brand hidden"
						href="page?url=WEB-INF/main.jsp"><img src="images/logo2.png"
						alt="Logo"></a> <a id="menuToggle" class="menutoggle"><i
						class="fa fa-bars"></i></a>
				</div>
			</div>
			<c:choose>
				<c:when test="${user != null }">
					<div class="top-right">
						<div class="header-menu ">
					
								
								<h5><img src="https://img.icons8.com/color/30/000000/sales-performance.png">
									 <span id="point" ></span>
									</h5>
									<h5><img src="https://img.icons8.com/color/30/000000/alarm-clock.png">
									
										 <span id="timeout" ></span> 
									</h5>
									<c:choose>
									<c:when test="${user.id ne 'admin'}">
										<button type="button" class="btn pr-1 pt-0" id="msg"><img src="https://img.icons8.com/color/35/000000/filled-sent.png"></button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-secondary " id="allmsg">전체msg</button>
									</c:otherwise>
								</c:choose>
								<!-- 	<button type="button" class="btn btn-primary" id="logoutbtn">logout</button>
							 -->
								





							<!-- </div> -->
							<!--  mypage 사람 사진-->
							<div class="user-area  float-right pr-1" >
								<a href="#" class="active" data-toggle="modal"
									aria-haspopup="true" aria-expanded="false"
									data-target="#exampleModal1"> <img
									class="user-avatar rounded-circle " src="images/profile.jpg"
									alt="profile"></a>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="top-right">
						<div class="header-menu">
							<div class="header-left">
								<!-- <button class="search-trigger">
									<i class="fa fa-search"></i>
								</button> -->
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
            <h1 align="center">회원탈퇴 페이지 입니다</h1>
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
               <form class="form-horizontal" role="form" id="deleteForm" action="deleteProc.member">
                <div class="form-group" id="divId">
                    <label for="inputId" class="col-lg-2 control-label">아이디 </label>
                    <div class="col-lg-10">
                        <input type="text" name="id" class="form-control onlyAlphabetAndNumber" id="id" data-rule-required="true" value="${user.id }" maxlength="30" readonly>
                    </div>
                </div>
                <div class="form-group" id="divPassword">
                    <label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" name="pw"  id="pw" data-rule-required="true" placeholder="패스워드" maxlength="30">
                    </div>
                </div>
                <div class="form-group" id="divPasswordCheck">
                    <label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드 확인</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="pwCheck" data-rule-required="true" placeholder="패스워드 확인" maxlength="30">
                    </div>
                </div>
                             
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="button" class="btn btn-default" id=deletebtn>회원탈퇴</button>
                       
                    </div>
                </div>
            </form>
        </div>
        
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
	
	$("#deletebtn").on("click",function(){
		var pw1 = $("#pw").val();
		var pw2 = $("#pwCheck").val();
		
		console.log(pw1);
		
		if(pw1==pw2){
			$("#deleteForm").submit();
			
		}else{
			alert("패스워드가 다릅니다");
		}
	})
	
	$(window).on("resize",function(){
				if($(window).width() >= 752){
					$("#left-panel").css("display","block");
				}				
			})
	
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
											src="images/profile.jpg" alt="profile image" width="130px">
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
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							   <c:if test="${user.id != 'admin' }">
                           <button id="deleteMembtn" type="button"
                              class="btn btn-outline-info" data-dismiss="modal">회원
                            	  탈퇴</button>
                           <button id="pointPagebtn" type="button"
                              class="btn btn-outline-info" data-dismiss="modal">포인트
                            	  충전</button>
                           <button id="updatememberbtn" type="button"
                              class="btn btn-outline-info" data-dismiss="modal">정보수정</button>
                              </c:if>
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



</body>
</html>