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
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js"></script>



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
					<li class="active"><a href="page?url=WEB-INF/main.jsp"><i
							class="menu-icon fa fa-laptop"></i>Home </a></li>
					<li class="menu-item-has-children dropdown"><a
						href="page?url=WEB-INF/seat.jsp" onclick="send()"> <i
							class="menu-icon fa fa-cogs"></i>잔여좌석
					</a></li>
					<li class="menu-item-has-children dropdown"><a
						href="page?url=WEB-INF/manu.jsp"> <i
							class="menu-icon fa fa-table"></i>메뉴
					</a></li>
					<li class="menu-item-has-children dropdown"><a
						href="Board.board?currentPage=1"> <i
							class="menu-icon fa fa-th"></i>고객의소리
					</a></li>
					<li class="menu-item-has-children dropdown"><a
						href="Board.board?currentPage=1"> <i
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
			
		</header>
		<!--       상단 네비 끝 -->
		<!-- Content 시작 -->
		<div class="content">
			<div class = "row">
			<div class="col-lg-6">
				<div class="card">
					<div class="card-body">
						<h4 class="mb-3">오늘의 누적 방문자수</h4>
						<canvas id="myChart"></canvas>
					</div>
				</div>
			</div>
			<div class="col-lg-6 ">
				<div class="card">
					<div class="card-body">
						<h4 class="mb-3">3시간전 방문자수</h4>
						<canvas id="myChart2"></canvas>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="card">
					<div class="card-body">
						<h4 class="mb-3">Bar chart</h4>
						<canvas id="barChart"></canvas>
						<h4 class="mb-3">매출 조회</h4>
						<select class="selectpicker" id="selected">
							<optgroup label="매출액">
								<option>월 별 매출액</option>
								<option>주간 매출액</option>
							</optgroup>
							<optgroup label="종류별">
								<option>메뉴별 매출액 </option>
								<option>회원별 매출액</option>
							</optgroup>
						</select>
						<button class="btn btn-primary" id="searchAjax"> 조회 </button>
					
					
					</div>
				</div>
			</div>
			
			</div>
			<!-- /# column -->



			<script>
		
			$("#searchAjax").on("click",function(){
				$.ajax({
					type:"get",
					url:"search.chart",
					data : {
						what : $("#selected").val(),
						how : "how"
						
					}
				}).done(function(rsp){
					var arr = JSON.parse(rsp);
					var ctx = document.getElementById( "barChart" );
				    //    ctx.height = 200;
				    var myChart = new Chart( ctx, {
				        type: 'bar',
				        data: {
				            labels: [arr.date.day6,arr.date.day5,arr.date.day4,arr.date.day3,arr.date.day2,arr.date.day1,arr.date.day0],
				            datasets: [
				                {
				                    label: "매출액",
				                    data: [ arr.amount.amount6,arr.amount.amount5 ,arr.amount.amount4 ,arr.amount.amount3 ,arr.amount.amount2 , arr.amount.amount1, arr.amount.amount0 ],
				                    borderColor: "rgba(0, 194, 146, 0.9)",
				                    borderWidth: "0",
				                    backgroundColor: "rgba(0, 194, 146, 0.5)"
				                            },
				                    ]
				        },
				        options: {
				            scales: {
				                yAxes: [{
				                    ticks: {
				                       min:0,
				                        max:500000,
				                        stepSize: 50000
				                    }
				                   }]
				            }
				        }
				    } );
				
				}) 
				
			})
				
			var ctx = document.getElementById( "barChart" );
			    //    ctx.height = 200;
			    var myChart = new Chart( ctx, {
			        type: 'bar',
			        data: {
			            labels: [ , , , , , ,  ],
			            datasets: [
			                {
			                    label: "매출액",
			                    data: [ , , , , , ,  ],
			                    borderColor: "rgba(0, 194, 146, 0.9)",
			                    borderWidth: "0",
			                    backgroundColor: "rgba(0, 194, 146, 0.5)"
			                            },
			                    ]
			        },
			        options: {
			            scales: {
			                yAxes: [{
			                    ticks: {
			                       min:0,
			                        max:1000,
			                        stepSize: 100
			                    }
			                   }]
			            }
			        }
			    } );
			
			</script>
	
	
	
	
	
	
	
	<script>
			
var ctx = document.getElementById('myChart').getContext('2d');
var chart = new Chart(ctx, {  
  
    type:'line',
 
    data: {
    			
    			  labels: [
    				  <c:forEach var="dto" items="${list}">
    				 '${dto.date}',
    				 </c:forEach>
    			  ],
    		  datasets: [{
    	            label: 'Date',
    	            backgroundColor: 'rgb(255, 99, 132)',
    	            borderColor: 'rgb(255, 99, 132)',
    	            data: [ <c:forEach var="dto" items="${list}">
   				 '${dto.vcount}',
				 </c:forEach>]
    	        }]
    			 
        
       
    },
    options:{},
	 title: {
		 text: '최근 5일 하루 총 방문자 수 ' 
	 }

});

</script>



	<script>
			
var ctx = document.getElementById('myChart2').getContext('2d');
var chart = new Chart(ctx, {  
  
    type:'line',
 
    data: {
    			
    			  labels: ['9시간전','6시간전','3시간전'
    				 
    			  ],
    		  datasets: [{
    	            label: 'Date',
    	            backgroundColor: 'rgb(255, 99, 132)',
    	            borderColor: 'rgb(255, 99, 132)',
    	            data: [ <c:forEach var="dto" items="${list1}">
      				 '${dto.vcount}',
    				 </c:forEach>
				]
    	        }]
    			 
        
       
    },
    options:{},
	 title: {
		 text: '오늘 하루 최근 방문자 수  ' 
	 }

});
</script>
<script> /*메시지  */
 var webSocket = new WebSocket('ws://192.168.60.29:8080/AmandaProject/broadcasting');
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
										id="reinputpw">비밀번호찾기</button>
									<button type="button" class="btn btn-primary" type="button"
										id="joinMem">회원가입</button>
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


		</div>


		<!-- 컨텐츠 끝 -->

		<div class="clearfix"></div>
		<!-- Footer -->
		<footer class="site-footer">
			<div class="footer-inner bg-white">
				<div class="row">
					<div class="col-sm-6">Copyright &copy; 2019년 PC방임 ${count }</div>
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



		<!-- 진향이 마이페이지 폼끝 -->



		<!-- 컨텐츠 끝 -->

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





<!-- 		<!--    ---------------------------------소켓연결  script--------------------------------- --> -->
<!-- 		<script> -->
                    
//           if(${user.id != null } ){
//               var webSocket = new WebSocket('ws://192.168.60.20/WebSocket/websocketendpoint');
//                 webSocket.onopen = function(event){
//                       webSocket.send("hi");
//                 };
//                 webSocket.onerror ;
                    
                 
//           }
<!--     </script> -->
		<!--    ---------------------------------소켓연결  script--------------------------------- -->
</body>
</html>