<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
</head>
<body>
									<%@ page import = "java.util.Calendar" %>
<%
Calendar cal = Calendar.getInstance();%>
 
(<%= cal.get(Calendar.YEAR) %>-<%= cal.get(Calendar.MONTH)+1 %>-<%= cal.get(Calendar.DATE) %>
<%= cal.get(Calendar.HOUR) %>:<%= cal.get(Calendar.MINUTE) %>:<%= cal.get(Calendar.SECOND) %>)
																			
		<div id="wrapper">
 <table class="table table-striped ">
  <thead class="thead ">
    <tr class="py-0">
      <th scope="col" class="py-2" colspan="2" >받는 사람 : admin</th>
      
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="col" colspan="2" class="py-2" >보낸 사람 : ${who} </th>

    </tr>
    <tr>
      <th scope="col" class="py-5" style="width: 70px">내용 :</th>
      <th>${text}	</th>
   
    </tr>
    <tr>
      <th scope="col" class="py-0" style="width: 75px;line-height:60px;"  >답장 :</th>
      <form action="page?url=WEB-INF/main.jsp" id="form">
      <th><input  class="form-control" type="text" placeholder="reply" id="reply" style="height:100%;width:100%;"></th>
    </tr>	
		  <tr>
		   <th scope="col" class="py-4" style="width: 75px" >보내기</th>
		   <th><input type="submit" class="btn btn-info" value="send" onclick="send()"></th>
		   </tr>	
    
   
     </form>	
		 
<script>
var webSocket = new WebSocket('ws://192.168.60.20/broadcasting');
function onError(event) {
alert(event.data);
}
function send() {
 webSocket.send("admin:"+reply.value+":${who}");
reply.value = "";
window.close();
}
</script>
																			
												 				
										
											
     
     
  
  </tbody>
</table>
</div>
		
		
		
										
</body>
</html>