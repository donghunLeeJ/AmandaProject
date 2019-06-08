<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>

<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>게시판</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
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
<link rel="stylesheet"
	href="assets/css/lib/datatable/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="assets/css/style.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
	
	<!-- 아이콘 link -->
<link rel="stylesheet" href="css/font-awesome.min.css">
	

<style>
#footer {
	text-align: right;
	padding: 0px;
}
#writeBtns{
	margin-top:80px;
}
.myrow {
	margin-left: 0px;
	margin-right: 0px;
}

#wrapper {
	margin-top: 20px;
	padding: 0px;
}


#upload, #toList {
	margin: 0px;
}

#footer {
	text-align: right;
	padding: 0px;
}

footer {
	margin-top: 20px;
	padding-left: 15px;
	padding-right: 15px;
	padding-left: 15px;
}

header {
	padding-left: 15px;
	padding-right: 15px;
}

#text {
	height: 600px;
	margin: 0px;
}

#contents {
	margin: 0px;
	padding: 0px;
	width: 100%;
	height: 100%;
}

#title {
	margin-left: 10px;
	width: 70%;
}

#titleWrapper {
	margin-left: 10px;
	margin-top: 10px;
	margin-bottom: 10px;
	width: 100%;
}

#wrapper {
	margin-top: 50px;
	padding: 0px;
}

footer {
	padding-left: 15px;
	padding-right: 15px;
}

header {
	padding-left: 15px;
	padding-right: 15px;
}


#upload, #toList {
	margin: 0px;
}

#footer {
	text-align: right;
	padding: 0px;
}

#text {
	height: 600px;
}

#contents {
	margin: 0px;
	padding: 20px;
	width: 100%;
	height: 100%;
}

#title {
	margin-left: 10px;
	width: 80%;
}

#writer, #writeDate {
	margin-left: 10px;
	margin-top: 5px;
	margin-bottom: 5px;
	width: 80%;
}

.titleWrapper {
	margin-top: 10px;
	margin-bottom: 10px;
}

#titlerow {
	margin-top: 30px;
}

#writerrow, #daterow {
	margin-top: 8px;
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
               <li class="menu-item-has-children dropdown"><a
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
                         class="menu-icon fa fa-cutlery fa-lg"></i>메뉴
					</a></li>
					</c:when>
					</c:choose>
              <li class="active"><a
                  href="Board.board?currentPage=1"> <i
                     class="menu-icon fa fa-comments fa-lg"></i>고객의소리
               </a></li>
               <c:choose>
                   <c:when test="${user.id == 'admin' }">
                     <li id="charge" class="menu-item-has-children dropdown"><a
                        href="member.manage"> <i class="menu-icon fa fa-tasks"></i>고객관리
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
                  <div class="header-menu">
                     <h5><img src="https://img.icons8.com/color/30/000000/sales-performance.png">
									 <span id="point" ></span>
									</h5>
									<h5><img src="https://img.icons8.com/color/30/000000/alarm-clock.png">
									
										 <span id="timeout" ></span> 
									</h5>
 									<button type="button" class="btn pr-1 pt-0" id="msg"><img src="https://img.icons8.com/color/35/000000/filled-sent.png"></button>
 									<div class="user-area  float-right">
                        				<a href="#" class="active" data-toggle="modal"
                           				aria-haspopup="true" aria-expanded="false"
                           				data-target="#exampleModal1"> <img
                          				 class="user-avatar rounded-circle" src="images/profile.jpg"
                          				 alt="profile"></a>
                     				</div>
						
                     	</div>
                     <!--  mypage 사람 사진-->
                    
                  </div>
             
            </c:when>
            <c:when test="${user != null && user.id == 'admin' }"> 
             <div class="top-right">
                  <div class="header-menu">
            
            	
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
		<!-- /header -->
		<!-- /header -->

		<div class="content">
			<div class="animated fadeIn">
				<div class="card">

					<form action="BoardEdit.board" id="formEdit" method="post">
						<div class="card-header">
							<strong class="card-title"><header>
									<div class="row">
										<div class="col-lg-8 col-md-8 col-sm-8 col-8 titleWrapper"
											id="titlerow">
											제목 : <input type="text" id="title" value="${dto.title}"
												name="title" required>
										</div>
										<div class="col-lg-4 col-md-4 col-sm-4 col-4 titleWrapper">
											<div class="row">
												<div class="col-lg-4 d-none d-lg-block" id="writerrow">글쓴이
													:</div>
												<div class="col-lg-8 col-md-12 col-sm-12 col-12">
													<input type="text" id="writer" readonly
														value="${dto.writer}" name="writer">
												</div>
											</div>
											<div class="row">
												<div class="col-lg-4 d-none d-lg-block" id="daterow">작성일시
													:</div>
												<div class="col-lg-8 col-md-12 col-sm-12 col-12">
													<input type="text" id="writeDate" readonly
														value="${dto.writeDate}"> <input type="text"
														name="no" id="no" readonly value="${no}">
												</div>
											</div>
										</div>
									</div>
								</header></strong>
						</div>
						<div class="card-body">
							<div class="container" id="wrapper">
								<main id="main">
								<div id="text">
									<textarea id="contents" name="contents" required>${dto.contents}</textarea>
									<input type="text" id="path" name="path">
								</div>
								</main>

								<footer id="writeBtns">
									<div class="row">
										<div class=" logo col-lg-12 col-md-12 col-sm-12" id="footer">

											<input type="button" id="complete" value="수정완료"
												class="btn btn-secondary"> <input type="button"
												id="toList" value="목록으로" class="btn btn-secondary">
										</div>
									</div>
								</footer>
							</div>
						</div>
					</form>
				</div>
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
                           <button type="button" class="btn btn-primary" id="logoutbtn1">로그아웃</button>

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
			
			
			
			
			
			
			
			
		</div>
		<div class="clearfix"></div>

		<footer class="site-footer">
			<div class="footer-inner bg-white">
				<div class="row">
					<div class="col-sm-6 text-left">Copyright &copy; Amanda</div>
					<div class="col-sm-6 text-right">Designed by Amanda</div>
				</div>
			</div>
		</footer>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="assets/js/main.js"></script>


	<script>
		document.getElementById("toList").onclick = function() {
			var result = confirm("작성중이던 내용을 잃을 수 있습니다. 정말 나가시겠습니까?");
			if (result) {
				location.href = "Board.board?currentPage=1";
			}
		}
		
		window.addEventListener("beforeunload", function(event) {
			event.preventDefault();
			$.ajax({
				url : "ImageDel.board",
				type : "POST"
			});
		});
		
		$(function() {
			$("#no").hide();
			$("#path").hide();
			$("#contents").summernote({
				placeholder : '글을 입력해주세요.',
				tabsize : 2,
				height : 100, // 기본 높이값
				minHeight : 545, // 최소 높이값(null은 제한 없음)
				maxHeight : 545, // 최대 높이값(null은 제한 없음)
				focus : true, // 페이지가 열릴때 포커스를 지정함
				lang : 'ko-KR',
				//onlmageUpload callback함수 -> 미설정시 data형태로 에디터 그대로 삽입
				callbacks : {
					onImageUpload : function(files, editor, welEditable) {
						for (var i = 0; i < files.length; i++) {
							sendFile(files[i], this);
						}
					}
				}
			});
			$("#path").hide();
			function sendFile(file, editor) {
				var data = new FormData();
				data.append('file', file);
				$.ajax({
					url : "ImageUpload.board",
					type : "POST",
					data : data,
					dataType : "json",
					cache : false,
					contentType : false,
					enctype : "multipart/form-data",
					processData : false,
					success : function(resp) {
						$(".note-editable").append("<img src='"+resp.url+"'>");
						$("#path").val(resp.path);
					},
					fail : function(resp) {
						console.log(resp.url);
					}
				});

			}

			$("#complete").on(
					"click",
					function() {
						$("#contents").val($(".note-editable").html());
						if ($("#contents").val() == "<p><br></p>") {
							alert("게시글을 작성해주세요.");
						} else if ($("#title").val() == "") {
							alert("제목을 작성해주세요.");
						} else if ($("#contents").val() != "<p><br></p>"
								&& $("#title").val() != "") {
							$.ajax({
								url : "Upload.board",
								type : "POST"
							});
							$("#formEdit").submit();
						}
					})

		});
	</script>
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
  								
								
											$("#msg")
									.on(
											"click",
											function() {
												
												window.open("page?url=WEB-INF/newmessage.jsp", "","width=500px,height=300px");
											
											})

											                                                         
                           </script>
	

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
