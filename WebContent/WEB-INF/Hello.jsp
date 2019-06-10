<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>
.pointcard-body{
background-color: #bbe3e3;

}

</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<div class="card my-card border-danger">
						<div class="pointcard-body">
						<c:choose>
						<c:when test="${user.point ne 0}">
									<h5 class="card-title"><img src="https://img.icons8.com/color/48/000000/human-head.png">
									${user.name}님반갑습니다</h5>
									</c:when>
								
								
								
								
								
								<c:otherwise>
								<h5 class="card-title"><img src="https://img.icons8.com/color/48/000000/human-head.png">
									${user.name}님충전이 필요합니다</h5>
								</c:otherwise>	
							</c:choose>	
							
							
							<p class="card-text"></p>
									<h5><img src="https://img.icons8.com/color/30/000000/sales-performance.png">
									${user.name }님의 현재 잔여포인트는 <span id="point">	</span> 입니다.
									</h5>
									<h5><img src="https://img.icons8.com/color/30/000000/alarm-clock.png">
									
									${user.name }님의
										현재 남은 시간은 <span id="timeout"></span> 입니다.
									</h5><br>
								
									</div>
					</div>
					
					
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
    		    	  $("#timeout").html("<font color='red'>" +  ((Math.floor(${user.point}/60)) + "분 ") +"</font>");
    		    	  clearInterval(tid);   
    		    	  	    	 
    		      }   	     	                   		      		      
    		 });   	     
    	   }
    	   		
    	  								
    	   setTimeout(msg_time());//아래의 setInterval코드만 실행할 경우 1초의 딜레이가 생기는데 즉시 포인트와 남은 시간을 보여주기 위해 만듬
        	   function TimerStart(){tid=setInterval('msg_time()',1000) };
    	   TimerStart();                          
    	  
    
      		
      		 </script>
      		
      		</c:when>
      		</c:choose>

					
</body>
</html>