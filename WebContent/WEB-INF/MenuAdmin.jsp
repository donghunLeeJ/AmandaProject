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
#cardHeader {
   text-align: center;
}

#todaysMenu {
   background-color: white;
   padding-left: 20px;
   padding-right: 20px;
   border-radius: 10px;
}

#menuAdd {
   text-align: center;
}

#caroWrapper {
   display: flex;
   justify-content: center;
   padding-top: 30px;
}

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

.cardTitle {
   float: left;
   width: 40%;
}

.cardButt {
   float: left;
   width: 60%;
   text-align: right;
}

.headerWrapper {
   overflow: hidden;
}

.myspan {
   text-align: center;
}
</style>
</head>

<body>
   <!-- 왼쪽 네비 시작 -->
   <aside id="left-panel" class="left-panel">
      <nav class="navbar navbar-expand-sm navbar-default">
         <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">
               <li class="menu-item-has-children dropdown"><a href="page?url=WEB-INF/adminmain.jsp"><i
                     class="menu-icon fa fa-laptop"></i>Home </a></li>
               <li class="menu-item-has-children dropdown"><a
                  href="page?url=WEB-INF/seat.jsp" onclick="send()"> <i
                     class="menu-icon fa fa-cogs"></i>잔여좌석
               </a></li>
               <li class="active"><a
                  href="select.admin"> <i class="menu-icon fa fa-table"></i>메뉴
               </a></li>
               <li class="menu-item-has-children dropdown"><a
                  href="Board.board?currentPage=1"> <i
                     class="menu-icon fa fa-th"></i>고객의소리
               </a></li>
               <li class="menu-item-has-children dropdown"><a
                  href="member.manage"> <i class="menu-icon fa fa-th"></i>고객관리
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
      <!-- 오늘의 메뉴 시작-->
      <div id="caroWrapper">
         <div id="caroInner" class="col-lg-6 col-md-8 col-sm-12">
            <div class="card">
               <div class="card-header" id="cardHeader">
                  <strong class="card-title mb-3"><h1>
                        <span id="todaysMenu">${top }</span> <input type="button"
                           value="수정" class="btn btn-info" data-toggle="modal"
                           data-target="#menuHeaderModal" id="menuHeader">
                     </h1></strong>

               </div>
               <div class="card-body">
                  <div class="mx-auto d-block">
                     <div id="myCarousel" class="carousel slide " data-ride="carousel"
                        data-interval="4000">
                        <ol class="carousel-indicators">
                           <li data-target="#carouselExampleIndicators" data-slide-to="0"
                              class="active"></li>
                           <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                           <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                           <div class="carousel-item active">
                              <img src="${food1 }" class="d-block w-200 myImg"
                                 alt="이미지를 찾을 수 없습니다.">
                              <div class="carousel-caption d-none d-md-block">
                                 <h5>${food1Desc }</h5>
                              </div>
                           </div>
                           <div class="carousel-item">
                              <img src="${food2 }" class="d-block w-200 myImg"
                                 alt="이미지를 찾을 수 없습니다.">
                              <div class="carousel-caption d-none d-md-block">
                                 <h5>${food2Desc }</h5>
                              </div>
                           </div>
                           <div class="carousel-item">
                              <img src="${food3 }" class="d-block w-200 myImg"
                                 alt="이미지를 찾을 수 없습니다.">
                              <div class="carousel-caption d-none d-md-block">
                                 <h5>${food3Desc }</h5>
                              </div>
                           </div>
                        </div>
                        <a class="carousel-control-prev" href="#myCarousel"
                           role="button" data-slide="prev"> <span
                           class="carousel-control-prev-icon" aria-hidden="true"></span> <span
                           class="sr-only">Previous</span>
                        </a> <a class="carousel-control-next" href="#myCarousel"
                           role="button" data-slide="next"> <span
                           class="carousel-control-next-icon" aria-hidden="true"></span> <span
                           class="sr-only">Next</span>
                        </a>
                     </div>
                  </div>

                  <h5 class="text-sm-center mt-2 mb-1">${bot1 }</h5>
                  <div class="location text-sm-center">${bot2 }</div>
               </div>
               <hr>
            </div>
         </div>
      </div>
      <div class="modal fade" id="menuHeaderModal" tabindex="-1"
         role="dialog" aria-labelledby="menuModalLabel" aria-hidden="true">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h4 class="modal-title" id="menuModalModalLabel"><b>메뉴 수정</b></h4>
                  <button type="button" class="close" data-dismiss="modal"
                     aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="modal-body">
                  <form action="MenuHeaderEdit.admin" id="headerForm" method="post">
                     <div class="form-group">
                        <label for="exampleFormControlInput1"><b>상단 제목 수정</b></label> <input
                           type="text" class="form-control" placeholder="수정할 문장을 입력해주세요."
                           required name="menuHeaderTop" value="${top}">
                     </div>
                     <div class="form-group">
                        <label for="exampleFormControlInput1"><b>첫 번째 메뉴</b></label> <select
                           name="firstHeaderMenu">
                           <c:forEach var="topDto" items="${list}">
                              <c:choose>
                                 <c:when test="${food1Name==topDto.menuName}">
                                    <option selected>${topDto.menuName}</option>
                                 </c:when>
                                 <c:otherwise>
                                    <option>${topDto.menuName}</option>
                                 </c:otherwise>
                              </c:choose>
                           </c:forEach>
                        </select> <input type="text" class="form-control" placeholder="메뉴 설명"
                           required name="menuDesc1" value="${food1Desc }">
                     </div>
                     <div class="form-group">
                        <label for="exampleFormControlInput1"><b>두 번째 메뉴</b></label> <select
                           name="secondHeaderMenu">
                           <c:forEach var="topDto" items="${list}">
                              <c:choose>
                                 <c:when test="${food2Name==topDto.menuName}">
                                    <option selected>${topDto.menuName}</option>
                                 </c:when>
                                 <c:otherwise>
                                    <option>${topDto.menuName}</option>
                                 </c:otherwise>
                              </c:choose>
                           </c:forEach>
                        </select> <input type="text" class="form-control" placeholder="메뉴 설명"
                           required name="menuDesc2" value="${food2Desc }">
                     </div>
                     <div class="form-group">
                        <label for="exampleFormControlInput1"><b>세 번째 메뉴</b></label> <select
                           name="thirdHeaderMenu">
                           <c:forEach var="topDto" items="${list}">
                              <c:choose>
                                 <c:when test="${food3Name==topDto.menuName}">
                                    <option selected>${topDto.menuName}</option>
                                 </c:when>
                                 <c:otherwise>
                                    <option>${topDto.menuName}</option>
                                 </c:otherwise>
                              </c:choose>
                           </c:forEach>
                        </select> <input type="text" class="form-control" placeholder="메뉴 설명"
                           required name="menuDesc3" value="${food3Desc }">
                     </div>
                     <div class="form-group">
                        <label for="exampleFormControlInput1"><b>하단 알림 문구 수정 1</b></label> <input
                           type="text" class="form-control" placeholder="수정할 문장을 입력해주세요."
                           required name="menuHeaderBot1" value="${bot1 }">
                     </div>
                     <div class="form-group">
                        <label for="exampleFormControlInput1"><b>하단 알림 문구 수정 2</b></label> <input
                           type="text" class="form-control" placeholder="수정할 문장을 입력해주세요."
                           required name="menuHeaderBot2" value="${bot2}">
                     </div>
                     <div class="modal-footer">
                        <button class="btn btn-info" id="menuHeaderComplete">수정
                           완료</button>
                        <button type="button" class="btn btn-secondary"
                           data-dismiss="modal">닫기</button>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
      <!-- Content 시작 -->
      <div class="content">
         <div class="animated fadeIn">
            <div class="row">

               <c:forEach var="dto" items="${list}">
                  <div class="col-md-4 col-sm-6">
                     <div class="card">
                        <div class="card-header headerWrapper">
                           <div class="cardTitle">
                              <strong class="card-title mb-3">${dto.menuName}</strong>
                           </div>
                           <div class="cardButt">
                              <input type="button" value="변경"
                                 class="btn btn-info mr-2 menuEditBtn" data-toggle="modal"
                                 data-target="#menuEditModal"><input type="button"
                                 value="삭제" class="btn btn-info menuDelBtn">
                           </div>
                        </div>
                        <div class="card-body">
                           <div class="mx-auto d-block myspan">
                              <div>
                                 <img src="${dto.imgPath}" alt="">
                              </div>
                              <h5 class="text-sm-center mt-2 mb-1">${dto.menuDesc}</h5>
                              <span>${dto.menuPrice}</span>원 <input type="hidden"
                                 value="${dto.menu_seq}">
                           </div>
                           <hr>
                        </div>
                     </div>
                  </div>
               </c:forEach>
            </div>
         </div>
         <script>
            function readURL(input) {
               var reader = new FileReader();
               reader.onload = function(e) {
                  $("#newImg").attr("src", e.target.result);
               }
               reader.readAsDataURL(input.files[0]);
            }

            $("#menuImgEdit").change(function() {
               readURL(this);
            });

            function PreviewImage() {
               var oFReader = new FileReader();
               oFReader.readAsDataURL(document
                     .getElementById("menuImgEdit").files[0]);

               oFReader.onload = function(oFREvent) {
                  document.getElementById("newImg").src = oFREvent.target.result;
               };
            };

            $(".menuEditBtn").on(
                  "click",
                  function() {
                     $("#menuTitleEdit").val(
                           $(this).parent().parent().find(
                                 "div:nth-child(1)").find(
                                 "strong:nth-child(1)").html());
                     $("#menuDescEdit").val(
                           $(this).parent().parent().parent().find(
                                 "div:nth-child(2)").find(
                                 "div:nth-child(1)").find(
                                 "h5:nth-child(2)").html());
                     $("#menuPriceEdit").val(
                           $(this).parent().parent().parent().find(
                                 "div:nth-child(2)").find(
                                 "div:nth-child(1)").find(
                                 "span:nth-child(3)").html());
                     $("#menuNoEdit").val(
                           $(this).parent().parent().parent().find(
                                 "div:nth-child(2)").find(
                                 "div:nth-child(1)").find(
                                 "input:nth-child(4)").val());
                     $("#originMenuImg").html(
                           $(this).parent().parent().parent().find(
                                 "div:nth-child(2)").find(
                                 "div:nth-child(1)").find(
                                 "div:nth-child(1)").html());

                  });

            $(".menuDelBtn").on(
                  "click",
                  function() {
                     var result = confirm("메뉴를 삭제하시겠습니까?");
                     if (result) {
                        location.href = "MenuDel.admin?menu_seq="
                              + $(this).parent().parent().parent()
                                    .find("div:nth-child(2)").find(
                                          "div:nth-child(1)")
                                    .find("input:nth-child(4)")
                                    .val();
                     }
                  });
         </script>
         <div class="modal fade" id="menuEditModal" tabindex="-1"
            role="dialog" aria-labelledby="menuEditModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
               <div class="modal-content">
                  <div class="modal-header">
                     <h5 class="modal-title" id="menuEditModalLabel">메뉴 수정</h5>
                     <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                     </button>
                  </div>
                  <div class="modal-body">
                     <form action="MenuUpdate.admin" id="updateForm" method="post"
                        enctype="multipart/form-data">
                        <div class="form-group">
                           <label for="exampleFormControlInput1">메뉴 이름</label> <input
                              type="text" class="form-control" required name="menuTitleEdit"
                              id="menuTitleEdit">
                        </div>
                        <div class="form-group">
                           <label for="exampleFormControlInput1">메뉴 설명</label> <input
                              type="text" class="form-control" required name="menuDescEdit"
                              id="menuDescEdit">
                        </div>
                        <div class="form-group">
                           <label for="exampleFormControlInput1">메뉴 가격</label> <input
                              type="number" class="form-control" required
                              name="menuPriceEdit" id="menuPriceEdit">
                        </div>
                        <div class="form-group">
                           <label for="exampleFormControlInput1">기존 이미지</label>
                           <div id="originMenuImg"></div>
                        </div>
                        <div class="form-group">
                           <label for="exampleFormControlInput1">변경 이미지</label> <input
                              type="file" name="menuImgEdit" id="menuImgEdit" class="mt-2">

                           <img id="newImg" src="#" alt="변경 이미지 미설정" /> <input
                              type="hidden" name="menuNoEdit" id="menuNoEdit">
                        </div>
                        <div class="modal-footer">
                           <button class="btn btn-info">수정완료</button>
                           <button type="button" class="btn btn-secondary"
                              data-dismiss="modal">닫기</button>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </div>

         <div id="menuAdd">
            <input type="button" value="메뉴 추가" class="btn btn-info mr-2"
               data-toggle="modal" data-target="#menuAddModal" id="loginbtn">
         </div>

         <div class="modal fade" id="menuAddModal" tabindex="-1" role="dialog"
            aria-labelledby="menuAddModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
               <div class="modal-content">
                  <div class="modal-header">
                     <h5 class="modal-title" id="menuAddModalLabel">신규 메뉴</h5>
                     <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                     </button>
                  </div>
                  <div class="modal-body">
                     <form action="MenuAdd.admin" id="addForm" method="post"
                        enctype="multipart/form-data">
                        <div class="form-group">
                           <label for="exampleFormControlInput1">메뉴 이름</label> <input
                              type="text" class="form-control" placeholder="메뉴명을 입력해주세요."
                              required name="menuTitleAdd">
                        </div>
                        <div class="form-group">
                           <label for="exampleFormControlInput1">메뉴 설명</label> <input
                              type="text" class="form-control" placeholder="메뉴 설명을 입력해주세요."
                              required name="menuDescAdd">
                        </div>
                        <div class="form-group">
                           <label for="exampleFormControlInput1">메뉴 가격</label> <input
                              type="number" class="form-control"
                              placeholder="메뉴 가격을 입력해주세요." required name="menuPriceAdd">
                        </div>
                        <div class="form-group">
                           <label for="exampleFormControlInput1">메뉴 이미지</label> <input
                              type="file" required name="menuImgAdd" class="mt-2">
                        </div>
                        <div class="modal-footer">
                           <button class="btn btn-info">추가하기</button>
                           <button type="button" class="btn btn-secondary"
                              data-dismiss="modal">닫기</button>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </div>

         <!-- .row -->
      </div>
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
      
      
      
      <!--메시지   -->
      
      <script>
 var webSocket = new WebSocket('ws://192.168.60.29/broadcasting');
									    webSocket.onerror = function(event) {
     									// onError(event)
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
       											
     								 if(who!="관리자"&&who2=="admin"){
    								window.open("reply.message?who="+who+"&&content="+contents, "",
									"width=500px,height=300px");
     										 }
    											}
  											
  										  }		 

</script>
</body>
</html>