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

<script
	src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js"></script>

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

/* content 디자인 -진향 */
#header {
	border: 0px;
}
#seat{
 background-image:url(images/mainseat.jpg); 
 background-size: 98% ;
}


</style>
</head>

<body>

	<!-- 왼쪽 네비 시작 -->
	<aside id="left-panel" class="left-panel">
		<nav class="navbar navbar-expand-sm navbar-default">
			<div id="main-menu" class="main-menu collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="page?url=WEB-INF/main.jsp"><i
							class="menu-icon fa fa-home fa-lg"></i>Home </a></li>
					<li class="menu-item-has-children "><a
						href="page?url=WEB-INF/seat.jsp" onclick="send()"> <i
							class="menu-icon fa fa-desktop fa-lg"></i>잔여좌석
					</a></li>

					<li class="menu-item-has-children"><a
						href="ClientSelect.admin"> <i
							class="menu-icon fa fa-cutlery fa-lg"></i>메뉴
					</a></li>

					<li class="menu-item-has-children"><a
						href="Board.board?currentPage=1"> <i
							class="menu-icon fa fa-comments fa-lg"></i>고객의소리
					</a></li>

					<c:choose>
						<c:when test="${user == null }">
							<li id="charge" class="menu-item-has-children"><a href="#">
									<i class="menu-icon fa fa-usd fa-lg"></i>충전하기
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
		<!--       상단 네비 끝 -->
		<!-- Content 시작 -->
		<div class="content">
			<div class="animated fadeIn">
				<div class="row mb-4">
					<div class="col-xl-4 m-0 p-0  d-none d-xl-block  ">

						<img src="images/pcroom1.png" width=100% height=600px>
					</div>
					<div class="col-xl-4  col-lg-12  col-sm-12 m-0 p-0">

						<img src="images/pcroom2.png" width=100% height=600px>
					</div>
					<div class="col-xl-4  m-0 p-0 d-none d-xl-block ">

						<img src="images/pcroom3.png" width=100% height=600px>
					</div>
				</div>
								<c:choose>
								<c:when test="${user == null }">
							
									<script>
                              if(${login== 0}){
                            	  alert("아이디가 없습니다 ");
                            	  loaction.href=    "page?url=WEB-INF/main.jsp";
                              }else if(${login== -1}){
                            	  alert("비밀번호가 일치하지 않습니다.")
                              }else if(${login== 4}){
                            	  alert("로그인이 불가능한 상태입니다 관리자에게 문의해주세요.")
                              }else if(${login== 5}){
                            	  alert("이미 로그인 한 아이디 입니다 관리자에게 문의해주세요.")
                              }
                       		 </script>
									<!-- <h3 class="card-title">충전/로그인/개인정보</h3>
									<p class="card-text">내용</p>
									<button type="button"
										class="btn btn-outline-danger signbt mb-2" data-toggle="modal"
										data-target="#exampleModal" id="loginbtn">login</button> -->
								</c:when>
								<c:otherwise>
						<script>		
					window.open("page?url=WEB-INF/Hello.jsp","",
									"location=no, directories=no,width=400px,height=250px");
				
</script>
									<script>
										//msg보내는 소켓 및 버튼
										 var webSocket = new WebSocket('ws://192.168.60.20/broadcasting');
									    webSocket.onerror = function(event) {
     									 
   											 };
  										 webSocket.onmessage = function(event) {
   										   onMessage(event)
  										  };
  									 
  									 
  										if("${user.id}"!="admin"){
  										  function onMessage(event) {
    										  var msg = event.data.split(":");
       										  var who = msg[0]; //admin
       											var contents = msg[1];
       											 var who2=msg[2]; //clinet이름      											    							
     								 if("${user.id}"==who2&&who=="admin") 
     								{
    								window.open("replytoclient.message?who="+who2+"&&content="+contents,"",
									"location=no, directories=no,width=500px,height=300px");
     										 
     								 }
     								 else if("admin"==who&&who2=="all") 
     								 {
     									 console.log(who);
     									 console.log(who2);
     									window.open("all.message?content="+contents,"",
    									"location=no, directories=no,width=500px,height=300px");
     									  }
     							 }
     							
  								}	
  								//메시지 끝
  								
								$("#msg")
									.on(
											"click",
											function() {
												
												window.open("page?url=WEB-INF/newmessage.jsp","","width=500px,height=300px");
											
											})
	
	
  								
  								$("#logoutbtn")
									.on(
											"click",
											function() {
												location.href = "logoutProc.member";
											})
										
											                                                         
                           </script>
								</c:otherwise>
							</c:choose>



					
				
				
				
				
				
				<!--              ----------------------------------- 잔여좌석 -->

				
				<div class="row mb-4">
				

					<div class="col-xl-6 col-lg-12 area p-xl-0 pr-xl-2" >
					
<h4><b>| 잔여 좌석</b></h4><br>
							<div class="col-lg-12 area pr-xl-0pr-xl-2 "id="seat">

								<canvas id="doughutChart" height="100%"></canvas>

							</div>
						</div>
				
					<!-- pc방 내부 인테리어 -->
					
					<div class="col-xl-6  col-lg-12 area p-xl-0 "  >
						<h4><b>| Amada <font color='orange'> PC</font>  </b></h4><br>
						
							<div class="col-lg-12 area pr-xl-0pr-xl-2 " >
						<div id="carouselExampleIndicators_interior" class="carousel slide" data-ride="carousel" data-interval="false">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators_interior" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators_interior" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators_interior" data-slide-to="2"></li>
       <li data-target="#carouselExampleIndicators_interior" data-slide-to="3"></li>
          <li data-target="#carouselExampleIndicators_interior" data-slide-to="4"></li>
             <li data-target="#carouselExampleIndicators_interior" data-slide-to="5"></li>
             
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/interior1.png" class="d-block w-100" alt="해당이미지가 없습니다">
      
    </div>
    <div class="carousel-item">
      <img src="images/interior2.png" class="d-block w-100" alt="해당이미지가 없습니다">
    </div>
    <div class="carousel-item">
      <img src="images/interior3.png" class="d-block w-100" alt="해당이미지가 없습니다">
    </div>
    <div class="carousel-item">
      <img src="images/interior4.png" class="d-block w-100" alt="해당이미지가 없습니다">
    </div>
    <div class="carousel-item">
      <img src="images/interior5.png" class="d-block w-100" alt="해당이미지가 없습니다">
    </div>
     <div class="carousel-item">
      <img src="images/interior6.png" class="d-block w-100" alt="해당이미지가 없습니다">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators_interior" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators_interior" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	</div>					
						
					
				</div>

</div>

				<script>
               
               
               
               
                var ctx = document.getElementById( "doughutChart" );
   				 ctx.height = 150;
   				var myChart = new Chart( ctx, {
        		type: 'doughnut',
        		data: {
            		datasets: [ {
                	data: [ ${seatUsed }, 25-${seatUsed } ],
                	backgroundColor: [
                                    "rgba(0, 194, 146,0.9)",
                                     "rgba(0,0,0,0.07)"
              	                  ],
              			  hoverBackgroundColor: [
                                    "rgba(0, 194, 146,0.9)",
                                    "rgba(0,0,0,0.07)"
                                ]

                            }],
          			  labels: [
                            "사용중인 좌석",
                            "빈좌석",
                           
                        ]
                 },
           			options: {
             		     responsive: true
           		   }
         			 } );
      			 </script>
				<!--              ----------------------------------- 잔여좌석 차트 시작 끝-->


				
				
				<!--메뉴 및 이벤트   -->
				<div class="row mb-4" >
               <div class=" col-xl-6 col-lg-12 p-0 area pr-xl-2 pb-sm-4 pb-4">
                <h4><b>| 오늘의 <font color='red'>추천</font> 메뉴</b></h4> <br>
  			 <div id="carouselExampleControls" class="carousel slide  " data-ride="carousel" data-interval="false">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/beef.png" class="d-block w-100" alt="해당 이미지를 찾을 수 없습니다">
    </div>
    <div class="carousel-item">
      <img src="images/kimchi.png" class="d-block w-100" alt="해당 이미지를 찾을 수 없습니다">
    </div>
    <div class="carousel-item">
      <img src="images/nabe.png" class="d-block w-100" alt="해당 이미지를 찾을 수 없습니다">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
               
                 
               </div>


               <div class="  col-xl-6 col-lg-12  p-0 area " >
                  <h4><b>| 이벤트</b></h4> <br>
  			 <div id="carouselExampleControls1" class="carousel slide  " data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/event31.png" class="d-block w-100" alt="해당 이미지를 찾을 수 없습니다">
    </div>
    <div class="carousel-item">
      <img src="images/event32.png" class="d-block w-100" alt="해당 이미지를 찾을 수 없습니다">
    </div>
    <div class="carousel-item">
      <img src="images/event30.png" class="d-block w-100" alt="해당 이미지를 찾을 수 없습니다">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls1" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls1" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
         
               </div>
               </div>
               
               <!-- 찾아 오는 길 -->
				<div class="row mb-2" >
               <div class=" col-xl-12 ">
                <h4><b>| 찾아오시는 길</b></h4>
                                 </div>
               
                 </div>   
               
          <div id="map" style="width:96%;height:350px;color: black;margin-left:15px;margin-top:50px;border-radius: 20px;"></div>
                    <div style="margin-left: 15px;margin-top: 10px;"><font color='red'>주소 :</font> 서울특별시 중구 남대문로1가 남대문로 120</div>  
			
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=af582622a1adc92099e0690071c5bfd5"></script>
        <script>
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = { 
                    center: new daum.maps.LatLng(37.567937, 126.983023), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };

            var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

            // 마커를 표시할 위치입니다 
            var position =  new daum.maps.LatLng(37.567937, 126.983023);

            // 마커를 생성합니다
            var marker = new daum.maps.Marker({
                position: position,
                clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
            });

            // 아래 코드는 위의 마커를 생성하는 코드에서 clickable: true 와 같이
            // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
            // marker.setClickable(true);

            // 마커를 지도에 표시합니다.
            marker.setMap(map);

            // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
            var iwContent = '<div style="padding:5px;">KH정보교육원 종로지점--</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

            // 인포윈도우를 생성합니다
            var infowindow = new daum.maps.InfoWindow({
                content : iwContent,
                removable : iwRemoveable
            });

            // 마커에 클릭이벤트를 등록합니다
            daum.maps.event.addListener(marker, 'click', function() {
                // 마커 위에 인포윈도우를 표시합니다
                infowindow.open(map, marker);  
            });
        </script>
			
			
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
						<form action="loginProc.member" id="form" name="formname"
							method="post">
							<div class="form-group">
								<label for="exampleFormControlInput1">ID</label> <input
									type="text" class="form-control" id="joinemail"
									placeholder="ID를 입력하시오" required name="loginid"
									onkeypress="press(this.form)">
							</div>
							<div class="form-group">
								<label for="exampleFormControlInput1">Password</label> <input
									type="password" class="form-control" id="joinpassword"
									placeholder="비밀번호 입력하시오" required name="loginpw"
									onkeypress="press(this.form)">
							</div>
							<div class=row>
								<button type="button"
									class="btn btn-outline-info col-6 col-sm-2 mr-sm-2 ml-sm-5"
									type="button" id="findId">ID 찾기</button>
								<button type="button"
									class="btn btn-outline-info col-6 col-sm-2 mr-sm-2 "
									type="button" id="reinputpw">PW 찾기</button>
								<button type="button"
									class="btn btn-outline-info col-6 col-sm-3 mr-sm-2"
									type="button" id="joinMem">회원 가입</button>
								<button type="submit"
									class="btn btn-outline-info col-6 col-sm-2 mr-sm-2" id="login">login</button>
							</div>
							<div class="modal-footer"></div>
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

                           $("#joinMem").on("click",function() {
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
												<p>${user.address1 }</p>
												<p>${user.address2 }</p>
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
								<button type="button" class="btn btn-primary" id="logoutbtn1">로그아웃</button>

							</div>
						</form>

					</div>
				</div>
			</div>
		</div>



		<script>
         history.pushState(null, null, "#noback");
         $(window).bind("hashchange", function(){
           history.pushState(null, null, "#noback");
         });
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
		</div>

	<div class="clearfix"></div>
	<!-- Footer -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="assets/js/main.js"></script>





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






</body>
</html>