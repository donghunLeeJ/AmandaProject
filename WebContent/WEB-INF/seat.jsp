<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>좌석</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<!--title아이콘 변경하는 link  -->
<link rel="shortcut icon" href="images/title.png">
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

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>


<!-- 아이콘 link -->
<link rel="stylesheet" href="css/font-awesome.min.css">


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
   <!-- 왼쪽 네비 시작 -->
   <aside id="left-panel" class="left-panel">
      <nav class="navbar navbar-expand-sm navbar-default">
         <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">
               	<c:choose>
					<c:when test="${user.id != 'admin' }">
					<li class="menu-item-has-children dropdown"><a href="page?url=WEB-INF/main.jsp"><i
							class="menu-icon fa fa-home fa-lg"></i>Home </a></li>
					</c:when>
					<c:when test="${user.id == 'admin' }">
					<li class="menu-item-has-children dropdown"><a href="page?url=WEB-INF/adminmain.jsp"><i
							class="menu-icon fa fa-home fa-lg"></i>Home </a></li>
					</c:when>
				</c:choose>
               <li class="active"><a
                  href="page?url=WEB-INF/seat.jsp" onclick="send()"> <i
                     class="menu-icon fa fa-desktop fa-lg"></i>잔여좌석
               </a></li>
               	<c:choose>
					<c:when test="${user.id != 'admin' }">
					<li class="menu-item-has-children dropdown"><a
              	         href="ClientSelect.admin"> <i
                         class="menu-icon fa fa-cutlery fa-lg"></i>메뉴
            	    </a></li>
					</c:when>
					<c:when test="${user.id == 'admin' }">
					<li class="menu-item-has-children dropdown"><a
              	         href="select.admin"> <i
                         class="menu-icon fa fa-cutlery fa-lg "></i>메뉴
					</a></li>
					</c:when>
					</c:choose>
              <li class="menu-item-has-children dropdown"><a
                  href="Board.board?currentPage=1"> <i
                     class="menu-icon fa fa-comments fa-lg"></i>고객의소리
               </a></li>
               <c:choose>
                   <c:when test="${user.id == 'admin' }">
                     <li id="charge" class="menu-item-has-children dropdown"><a
                        href="member.manage"> <i class="menu-icon fa fa-address-book-o fa-lg"></i>고객관리
                     </a></li>
                   
                  </c:when>
                  <c:when test="${user == null }">
                     <li id="charge" class="menu-item-has-children dropdown"><a
                        href="#"> <i class="menu-icon fa fa-usd fa-lg"></i>충전하기
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
                           class="menu-icon fa fa-usd fa-lg"></i>충전하기
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
               
               <c:choose>
					<c:when test="${user.id != 'admin' }">
					  <a class="navbar-brand" href="page?url=WEB-INF/main.jsp"><img src="images/logo5.png"
                  alt="Logo"></a> <a class="navbar-brand hidden"
                  href="page?url=WEB-INF/main.jsp"><img src="images/logo2.png"
                  alt="Logo"></a> <a id="menuToggle" class="menutoggle"><i
                  class="fa fa-bars"></i></a>
					</c:when>
					<c:when test="${user.id == 'admin' }">
					<a class="navbar-brand" href="page?url=WEB-INF/adminmain.jsp"><img src="images/logo5.png"
                  alt="Logo"></a> <a class="navbar-brand hidden"
                  href="page?url=WEB-INF/main.jsp"><img src="images/logo2.png"
                  alt="Logo"></a> <a id="menuToggle" class="menutoggle"><i
                  class="fa fa-bars"></i></a>
					</c:when>
				</c:choose>
            </div>
         </div>
         <c:choose>
            <c:when test="${user != null && user.id != 'admin' }"> 
<!--             회원일때 -->
               <div class="top-right">
                  
						<div class="header-menu pt-3">
					
                     <h5><img src="https://img.icons8.com/color/30/000000/sales-performance.png">
									<span id="point" class="pr-3" ></span>
									</h5>
									<h5><img src="https://img.icons8.com/color/30/000000/alarm-clock.png">
									
										 <span id="timeout" ></span> 
									</h5>
 									<button type="button" class="btn pr-1 pt-0" id="msg"><img src="https://img.icons8.com/color/35/000000/filled-sent.png"></button>
 								<div class="user-area  float-right pr-1" >
                        				<a href="#" class="active" data-toggle="modal"
                           				aria-haspopup="true" aria-expanded="false"
                           				data-target="#exampleModal1"> <img
                          				 class="user-avatar rounded-circle" src="images/profile.jpg"
                          				 alt="profile" height="80%"></a>
                     				</div>
						
                     	</div>
                     <!--  mypage 사람 사진-->
                    
                  </div>
             
            </c:when>
            <c:when test="${user != null && user.id == 'admin' }"> 
             <div class="top-right">
                  <div class="header-menu">
            
            	<button type="button" class="btn" id="allmsg"><img src="https://img.icons8.com/color/35/000000/filled-sent.png"></button>
            	<div class="user-area  float-right">
                        				<a href="#" class="active" data-toggle="modal"
                           				aria-haspopup="true" aria-expanded="false"
                           				data-target="#exampleModal1"> <img
                          				 class="user-avatar rounded-circle" src="images/profile.jpg"
                          				 alt="profile"></a>
                     				</div>
                     				</div>
                     				</div>
                     				
            </c:when>
            <c:otherwise>
               <div class="top-right">
                  <div class="header-menu">
                     <div class="header-left">
                       
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
      <!--       상단 네비 끝 -->
      <!-- Content 시작 -->
      <div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<!-- Widgets  -->
				<div class="row">
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						<div id="seat1" class="card" style="height: 100%; background-color: white">
							<h4>
								1 <br> <br>
							</h4>
							 <div class="d-none d-md-block"></div>
						
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						<div id="seat2" class="card" style="height: 100%; background-color: white">
							<h4>
								2 <br> <br>
															</h4>
							<div class="d-none d-md-block"></div>							
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
					
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						<div id="seat3" class="card" style="height: 100%; background-color: white">
							<h4>
								3 <br> <br>
							</h4>
							<div class="d-none d-md-block"></div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						<div id="seat4" class="card" style="height: 100%; background-color: white">
							<h4>
								4 <br> <br>
							</h4>
							<div class="d-none d-md-block"></div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						<div id="seat5" class="card" style="height: 100%; background-color: white">
							<h4>
								5 <br> <br>
							</h4>
							<div class="d-none d-md-block"></div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						<div id="seat6" class="card" style="height: 100%; background-color: white">
							<h4>
								6 <br> <br>
							</h4>
							<div class="d-none d-md-block"></div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						<div id="seat7" class="card" style="height: 100%; background-color: white">
							<h4>
								7 <br> <br>
							</h4>
							<div class="d-none d-md-block"></div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						<div id="seat8" class="card" style="height: 100%; background-color: white">
							<h4>
								8 <br> <br>
							</h4>
							<div class="d-none d-md-block"></div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						<div id="seat9" class="card" style="height: 100%; background-color: white">
							<h4>
								9 <br> <br>
							</h4>
							<div class="d-none d-md-block"></div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						<div id="seat10" class="card" style="height: 100%; background-color: white">
							<h4>
								10 <br> <br>
							</h4>
							<div class="d-none d-md-block"></div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						<div id="seat11" class="card" style="height: 100%; background-color: white">
							<h4>
								11 <br> <br>
							</h4>
							<div class="d-none d-md-block"></div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						<div id="seat12" class="card" style="height: 100%; background-color: white">
							<h4>
								12 <br> <br>
							</h4>
							<div class="d-none d-md-block"></div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						<div id="seat13" class="card" style="height: 100%; background-color: white">
							<h4>
								13 <br> <br>
							</h4>
							<div class="d-none d-md-block"></div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						<div id="seat14" class="card" style="height: 100%; background-color: white">
							<h4>
								14 <br> <br>
							</h4>
							<div class="d-none d-md-block"></div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						<div id="seat15" class="card" style="height: 100%; background-color: white">
							<h4>
								15 <br> <br>
							</h4>
							<div class="d-none d-md-block"></div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						<div id="seat16" class="card" style="height: 100%; background-color: white">
							<h4>
								16 <br> <br>
							</h4>
							<div class="d-none d-md-block"></div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						<div id="seat17" class="card" style="height: 100%; background-color: white">
							<h4>
								17 <br> <br>
							</h4>
							<div class="d-none d-md-block"></div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
					
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						<div id="seat18" class="card" style="height: 100%; background-color: white">
							<h4>
								18 <br> <br>
							</h4>
							<div class="d-none d-md-block"></div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4"> 
						<div id="seat19" class="card" style="height: 100%; background-color: white">
							<h4>
								19 <br> <br>
							</h4>
							<div class="d-none d-md-block"></div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						<div id="seat20" class="card" style="height: 100%; background-color: white">
							<h4>
								20 <br> <br>
							</h4>
							<div class="d-none d-md-block"></div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						<div id="seat21" class="card" style="height: 100%; background-color: white">
							<h4>
								21 <br> <br>
							</h4>
							<div class="d-none d-md-block"></div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						<div id="seat22" class="card" style="height: 100%; background-color: white">
							<h4>
								22 <br> <br>
							</h4>
							<div class="d-none d-md-block"></div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						<div id="seat23" class="card" style="height: 100%; background-color: white">
							<h4>
								23 <br> <br>
							</h4>
							<div class="d-none d-md-block"></div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						<div id="seat24" class="card" style="height: 100%; background-color: white">
							<h4>
								24 <br> <br>
							</h4>
							<div class="d-none d-md-block"></div>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-2 my-4">
						<div id="seat25" class="card" style="height: 100%; background-color: white">
							<h4>
								25 <br> <br>
							</h4>
							<div class="d-none d-md-block"></div>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
      
    
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
	
	
	$(window).on("resize",function(){
		if($(window).width() >= 752){
			$("#left-panel").css("display","block");
		}				
	})
	
	
	//엔터 입력시 로그인
    function press(f){ if(f.keyCode == 13){  
   	 formname.submit();  
   	 } }
	
	
	$("#findId").on("click",function(){

 		location.href = "page?url=WEB-INF/modifyid.jsp";
 		})
 		
                       $("#reinputpw").on("click",function(){
                       location.href = "page?url=WEB-INF/modifypassword.jsp";
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
                     <form class="modal-body">
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
                                       <b>주소</b>
                                       <p>
                                       ${user.address1 }</p>
                                       <p>${user.address2 }</p>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="row">
                             <c:if test="${user.id != 'admin' }">
                           <button id="deleteMembtn" type="button"
                              class="btn btn-outline-info col-6 col-sm-2 mr-sm-2 ml-sm-4 p-0" data-dismiss="modal">회원
                              	탈퇴</button>
                           <button id="pointPagebtn" type="button"
                              class="btn btn-outline-info col-6 col-sm-3 mr-sm-2" data-dismiss="modal">포인트
                              	충전</button>
                           <button id="updatememberbtn" type="button"
                              class="btn btn-outline-info col-6 col-sm-3 mr-sm-2" data-dismiss="modal">정보수정</button>
                              </c:if>
                           <button type="button" class="btn btn-primary col-6 col-sm-2 mr-sm-2" id="logoutbtn1">로그아웃</button>

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
       </div>
   
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
						</script>
     <!-- 	---------------------------------소켓연결  script--------------------------------- -->
		<script>
                    var webSocket = new WebSocket('ws://192.168.60.20/websocketendpoint');
                    webSocket.onopen ;
                    webSocket.onerror ;
                    webSocket.onmessage = function(event) {
                      	 location.reload();
                    };
                  
          </script>
		<!-- 	---------------------------------소켓연결  script--------------------------------- -->
     
     
     
     
     
   		  <c:forEach var="i" items="${seat }">
				<script>
				if(${i.onOff }==1){
				$('#seat${i.seatNum}').css('background-color','dodgerblue');	
				$('#seat${i.seatNum}').css('color','white');	
				
				}										
				</script>
			</c:forEach>
     
     
        
 <!--hashmap 사용 예시 -->    
  <c:forEach var="i" items="${UserSeatNum}"> 
       
 <script>   
 
  //여기가 유저 각각의 id와 시간을 따로 보여주기 위한 로직
  //1.먼저 서버의 hashmap useridseat에 저장된 각 유저의 id(key값)와 자리(value)값을 알아야 하며
  //2.SeatTime함수의 갯수는 현재 로그인 중인 유저의 수만큼 있어야 하고 함수명이 서로 달라야 한다(여기선 자리번호로 구별했음)
  
  //만일 seat의 자리번호와 useridseat에서 뽑아온 자리번호가 서로 같다면?
		 console.log($("#seat${i.value}>h4").text() == ${i.value});
		
  
  if($("#seat${i.value}>h4").text() == ${i.value}){
		
 	 function SeatTime${i.value}(){//같은 이름의 함수가 생겨선 안되므로 자리번호를 함수명 뒤에 달아주었음  
 		   	 	 
 		 $.ajax({  
 		    	 
 		         url: 'UsersTime.com',
 		         type: 'POST',
 		         
 		       //pointmap에 담긴 로그인한 사용자 각각의 포인트에 접근하기 위해 id(useridseat의 key값)를 UsersTime.com컨트롤러로 보낸다.
 		         data:{userid:'${i.key}'}
 		          
 		 }).done(function(point){
 			     	   
 		      m = (Math.floor(point/60)) + " 분 "; 
 		      var msg = "<font color='pink'> " + m +"</font>";
 		         
 		 $("#seat${i.value}>div").html("${i.key}님의 <br>남은 시간 :" + msg );//i.key는 자리별로 로그인한 유저id임	
 		
		 	
 		 //만일 사용자의 포인트가 다 떨어졌을 경우 반복을 중지시키고 자리색깔을 본래의 색깔로 바꾼다.
 		  if(point == 0){
 			 		 
 		 $("#seat${i.value}").css('background-color','white'); 
 		 $("#seat${i.value}>h4").html("${i.value} <br> <br>");
 		 $("#seat${i.value}>div").html("");
 		 
 		  clearInterval(tid);
 	
 		//만일 어떤 사용자가 포인트도 다 사용하지 않았는데 갑자기 로그아웃할 경우 반복을 중지시키고 자리색깔을 본래의 색깔로 바꾼다.
 		 }else if(point == -1){
 			 
 			 $("#seat${i.value}").css('background-color','white'); 
 	 		 $("#seat${i.value}>h4").html("${i.value} <br> <br>");
 	 		 $("#seat${i.value}>div").html("");
 	 		  clearInterval(tid);			 
 		 } 
	 				 			 	
 		})
 		
 	  }	   			
 	 
 	   setTimeout(SeatTime${i.value}());//아래의 setInterval코드만 실행할 경우 1초의 딜레이가 생기는데 즉시 남은 시간을 보여주기 위해 만듬
 	   function TimerStart(){ tid=setInterval('SeatTime${i.value}()',1000) };
 	   TimerStart();	
 }
  if("${user.id}"=="admin"){
		 $("#seat${i.value}>h4").append("<button id='${i.key}'>msg</button>");
		}

	 $("#${i.key}")
	.on(
			"click",
			function() {
				
				window.open("idbyclient.message?who=${i.key}","","width=500px,height=300px");
			
			})
</script>							
</c:forEach>



 <!-- 5분(포인트 300)이 되면 경고창을 날림 / 포인트가 0이 되는 순간 강제 로그아웃되게 만드는 함수 --> 
 
	<c:choose>
		<c:when test="${user != null }">
			<script>
	
     function msg_time(){  
		   
    	  $.ajax({  	    	 
    		         url: 'usertime.com', //ComController에 있는 usertime으로 이동함
    		         type: 'POST'
    		          
    		 }).done(function(point){ //컨트롤러에서 1초마다 1씩 감소시키는 포인트값을 수시로 받아온다
    		         		
    			 $("#point").html(point);
    		       	   
    		      m = (Math.floor(point/60)) + "분 "; 
    		      var msg = "<font color='red'>" + m +"</font>";
    		      
    		     $("#timeout").html(msg);
    		                       
    		      if (point == 300){    
    		    	  
    		         alert("선불시간이 5분 남았습니다.");  
    		         
    		      }else if(point == 0){
    		    	  
    		    	  alert("포인트가 0이 되었으므로 자동 로그아웃됩니다.");
    		    	  location.href = "logoutProc.member";
    		    	  clearInterval(tid);   
    		    	  
    		      }else if(point == -1){
    		    	     		    	 
    		    	  $("#point").html(${user.point}); 		    	  
    		    	  $("#timeout").html( "<font color='red'>" + (Math.floor(${user.point}/60))+ "분 " +"</font>");      		    	  		    	 	  
    		    	  clearInterval(tid);     
    		    	  
    		      }   	     	                   		      		      
    		 });   	     
    	   }
    	   		
    	  								
    	   setTimeout(msg_time());//아래의 setInterval코드만 실행할 경우 1초의 딜레이가 생기는데 즉시 포인트와 남은 시간을 보여주기 위해 만듬
    	   
    	   function TimerStart(){tid=setInterval('msg_time()',1000) };
    	   TimerStart();                          
    	  
    	   var webSocket = new WebSocket('ws://192.168.60.20/websocketendpoint');
      		webSocket.onopen = function(){
      			webSocket.send("hi"); 
      		} ;
   		
   </script>
		</c:when>
	</c:choose>



 <!-- 메시지  -->  
  			<script>
										//msg보내는 소켓 및 버튼
										 var webSocket = new WebSocket('ws://192.168.60.20/broadcasting');
									    webSocket.onerror = function(event) {
     									 onError(event)
   											 };
  										 webSocket.onmessage = function(event) {
   										   onMessage(event)
  										  };
  										if("${user.id}"=="admin"){
  										  function onMessage(event) {
    										  var msg = event.data.split(":");
       										  var who = msg[0]; 
       											var contents = msg[1];
       											 var who2=msg[2];
       											
     								 if(who!="admin"&&who2=="admin"){
    								window.open("reply.message?who="+who+"&&content="+contents, "",
									"width=500px,height=300px");
     										 }
     								
    											}
  										 
  											
  										  }		 
  									 
  										else{
  										  function onMessage(event) {
    										  var msg = event.data.split(":");
       										  var who = msg[0]; //admin
       											var contents = msg[1];
       											 var who2=msg[2]; //clinet이름      											    							
     								 if("${user.id}"==who2&&who=="admin") 
     								{
    								window.open("replytoclient.message?who="+who2+"&&content="+contents, "",
									"width=500px,height=300px");
     										 
     								 }
     								 else if("admin"==who&&who2=="all")
     								 {
     									 console.log("kk");
     									window.open("page?url=WEB-INF/allclient.jsp","",
    									"location=no, directories=no,width=500px,height=300px");
     									  }
     								 
     							 }
     							
  								}	
  								//메시지 끝
  								
									$("#logoutbtn")
									.on(
											"click",
											function() {
												location.href = "logoutProc.member";
											})
											$("#msg")
									.on(
											"click",
											function() {
												
												window.open("page?url=WEB-INF/newmessage.jsp", "","width=500px,height=300px");
											
											})
$("#allmsg")
									.on(
											"click",
											function() {
												
												window.open("page?url=WEB-INF/allnewmessage.jsp", "","width=500px,height=300px");
											
											})
											                                                         
                           </script>



     
  
</body>
</html>