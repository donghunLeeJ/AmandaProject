<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Main</title>
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

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>




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

.rows {
	overflow: hidden;
}

.myrow {
	margin-left: 0px;
	margin-right: 0px;
}

#numtext {
	margin: 0px;
	width: 40px;
}

table {
	text-align: center;
	table-layout: fixed;
}

table td, table th {
	text-overflow: ellipsis;
	overflow: hidden;
}

#reasonsector {
	overflow: hidden;
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
							class="menu-icon fa fa-laptop"></i>Home </a></li>
					</c:when>
					<c:when test="${user.id == 'admin' }">
					<li class="menu-item-has-children dropdown"><a href="page?url=WEB-INF/adminmain.jsp"><i
							class="menu-icon fa fa-laptop"></i>Home </a></li>
					</c:when>
					</c:choose>
					

					<li class="menu-item-has-children dropdown"><a
						href="page?url=WEB-INF/seat.jsp" onclick="send()"> <i
							class="menu-icon fa fa-cogs"></i>잔여좌석
					</a></li>

					
					<c:choose>
              		<c:when test="${user.id == 'admin' }">
               		<li class="menu-item-has-children dropdown"><a
               	    href="select.admin"> <i
                     class="menu-icon fa fa-table"></i>메뉴
              		 </a></li>
              		 </c:when>
        
               		</c:choose>

					<li class="menu-item-has-children dropdown"><a
						href="Board.board?currentPage=1"> <i
							class="menu-icon fa fa-th"></i>고객의소리
					</a></li>
					
					<li class="active"><a
						href="member.manage"> <i
							class="menu-icon fa fa-th"></i>고객관리
					</a></li>
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
      <!--       상단 네비 끝 -->
      <!-- Content 시작 -->
   
<div class="breadcrumbs">
         <div class="breadcrumbs-inner">
            <div class="row m-0">
               <div class="col-sm-4">
                  <div class="page-header float-left">
                     <div class="page-title">
                        <h1>
                           <b>회원정보</b>
                        </h1>
                     </div>
                  </div>
               </div>
               <div class="col-sm-8"></div>
            </div>
         </div>
      </div>
      <div class="content row">
         <!-- Animated -->
         <div class="animated fadeIn">
            <!-- Widgets  -->
               <div class="row">

                  <div class="col-lg-6">
                     <table class="table" id="membertable">
                        <thead>
                           <tr>
                              <th>번호</th>
                              <th>이름</th>
                              <th>아이디</th>
                              <th>사용시간</th>
                              <th>선택</th>
                           </tr>
                        </thead>
                        <tbody>
                           <c:forEach var="dto" items="${result }">
                              <form action="toblack.manage">
                                 <tr>
                                    <td id="memnum">${dto.mem_seq }</td>
                                    <td id="memname">${dto.name }</td>
                                    <td id="memid">${dto.id }</td>
                                    <td>${dto.usehour }</td>
                                    <td>
                                       <button type="button"
                                          class="btn btn-info btn-sm infobtn showInfo"
                                          data-toggle="modal" data-target="#memberInfoModal">Info</button>
                                       <button type="button" class="btn btn-dark btn-sm movebtn"
                                          data-toggle="modal" data-target="#resonModal">블랙</button>
                                    </td>
                                 </tr>
                              </form>
                           </c:forEach>
                        </tbody>
                     </table>
                  </div>
                  <div class="col-lg-6">
                     <table class="table" id="blacktable">
                        <thead>
                           <tr>
                              <th>번호</th>
                              <th>이름</th>
                              <th>아이디</th>
                              <th>사유</th>
                              <th>선택</th>
                           </tr>
                        </thead>
                        <tbody>
                           <c:forEach var="bl" items="${blresult }">
                              <form action="cancelblack.manage">
                                 <tr>
                                    <td><input type="text" value="${bl.mem_seq}"
                                       name="blacknumber" id="numtext"
                                       style="background-color: #00000000; border: none;" readonly></td>
                                    <td>${bl.name }</td>
                                    <td>${bl.id }</td>
                                    <td>${bl.blackreason }</td>
                                    <td><button class="btn btn-primary">블랙취소</button>
                                 </tr>
                              </form>
                           </c:forEach>
                        </tbody>
                     </table>
                  </div>
               </div>
               <div class="clearfix"></div>
            </div>
            <!--          블랙리스트 사유작성모달 -->
            <div class="modal fade" id="resonModal" tabindex="-1" role="dialog"
               aria-labelledby="exampleModalLabel" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">사유작성</h5>
                        <button type="button" class="close" data-dismiss="modal"
                           aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                        </button>
                     </div>

                     <div class="modal-body">
                        <form action="toblack.manage" class="reasonform" method="post">
                           <div class="form-group">
                              <label for="exampleFormControlInput1">사유</label> <input
                                 type="text" class="form-control" id="blreason"
                                 name="blackreson" placeholder="사유를 입력하세요(15자 이내)"
                                 maxlength="15" required> <input type="text"
                                 class="form-control" id="blnum" name="blacknum" readonly>
                           </div>
                           <div class="modal-footer">
                              <button class="btn btn-primary reasonsubmit">확인</button>
                              <button type="button" class="btn btn-secondary"
                                 data-dismiss="modal">취소</button>
                           </div>
                        </form>

                     </div>
                  </div>
               </div>
            </div>

            <!--          회원 정보보기 모달 -->
            <div class="modal fade" id="memberInfoModal" tabindex="-1"
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
                                       회원정보 </strong>
                                    <button type="button" class="close" data-dismiss="modal"
                                       aria-label="Close">
                                       <span aria-hidden="true">&times;</span>
                                    </button>
                                 </div>
                                 <div class="card-body">
                                    <div class="mx-auto d-block">
                                       <h5 class="text-center mt-2 mb-1">
                                          <b id="member_id"> </b>
                                       </h5>
                                       <!-- <div class="location text-center">Lv. 일반회원</div> -->
                                    </div>
                                    <hr>
                                    <div class="card-text">
                                       <div>
                                          <b>회원번호 </b>
                                          <p id="member_seq"></p>
                                       </div>
                                       <div>
                                          <b>이름 </b>
                                          <p id="member_name"></p>
                                       </div>
                                       <div>
                                          <b>생년월일</b>
                                          <p id="member_birth"></p>
                                       </div>
                                       <div>
                                          <b>이메일</b>
                                          <p id="member_email"></p>
                                       </div>
                                       <div>
                                          <b>핸드폰번호</b>
                                          <p id="member_phone"></p>
                                       </div>
                                       <div>
                                          <b>잔여포인트</b>
                                          <p id="member_point"></p>
                                       </div>
                                       <div>
                                          <b>주소</b>
                                          <p id="member_addr1"></p>
                                          <p id="member_addr2"></p>
                                       </div>
                                       <div>
                                          <b>사용시간 </b>
                                          <p id="member_time"></p>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="modal-footer">
                              <button type="button" class="btn btn-secondary"
                                 data-dismiss="modal">닫기</button>
                           </div>
                        </form>

                     </div>
                  </div>
               </div>
            </div>

            <script>
               $(".showInfo").on(
                     "click",
                     function() {
                        $.ajax({
                           url : "showinfo.manage",
                           type : "POST",
                           data : {
                              member_seq : $(this).parent().parent()
                                    .find("td:nth-child(1)").html()
                           },
                           dataType : "json",
                           success : function(resp) {
                              console.log(resp);
                              $("#member_id").html(resp.id + " 님");
                              $("#member_seq").html(resp.seq);
                              $("#member_name").html(resp.name);
                              $("#member_birth").html(resp.birth);
                              $("#member_email").html(resp.email);
                              $("#member_phone").html(resp.phone);
                              $("#member_point").html(resp.point);
                              $("#member_addr1").html(resp.addr1);
                              $("#member_addr2").html(resp.addr2);
                              $("#member_time").html(resp.time);
                           },
                           fail : function(resp) {
                              console.log("fail");
                           }
                        });
                     })

               $(".movebtn").on(
                     "click",
                     function() {
                        $("#blnum").val(
                              $(this).parent().parent().find(
                                    "td:nth-child(1)").html());

                     })
            </script>




         <!--                여기부터 진향이가 만든 로그인폼 -->
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
            $("#reinputpw").on("click", function() {
               location.href = "page?url=WEB-INF/modifypassword.jsp";
            })
            $("#joinMem").on("click", function() {
               location.href = "page?url=WEB-INF/joinMem.jsp";
            })
            document.getElementById("login").onclick = function() {
               document.getElementById("form").submit();
            }
            //                            로그인 버튼과 회원가입 버튼의 script
         </script>

         <!--                   진향이 로그인폼끝 -->
         <!--                         진향이 마이페이지 폼 -->
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
                                       <b>잔여포인트</b>
                                       <p>${user.point}</p>
                                    </div>
                                    <div>
                                       <b>주소</b>
                                       <p>${user.address1 }</p>
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
         
         $("#logoutbtn1").on("click",
               function() {
                  if(${user.id == 'admin' }){
                  	location.href = "adminlogoutProc.member";	
                  }else{
                  	location.href = "logoutProc.member";	
                  }
              	 
               })

            $("#updatememberbtn").on("click", function() {
               location.href = "page?url=WEB-INF/ModifyMembers.jsp";
            })
            $("#deleteMembtn").on("click", function() {
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
<!--  메시지-->
      <script>
 var webSocket = new WebSocket('ws://192.168.60.29/broadcasting');
									    webSocket.onerror = function(event) {
     									// onError(event)
   											 };
  										 webSocket.onmessage = function(event) {
   										   onMessage(event)
  										  };
  										if("${user.name}"=="관리자"){
  										  function onMessage(event) {
    										  var msg = event.data.split(":");
       										  var who = msg[0]; 
       											var contents = msg[1];
       											 var who2=msg[2];
       											
     								 if(who!="관리자"&&who2=="admin"){
    								window.open("reply.message?who="+who+"&&content="+contents, "",
									"width=500px,height=300px");
     										 }
    											}
  											
  										  }		 

</script>

</body>
</html>