<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <title>chat</title>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <style>
    #inputMessage{
    width:400px;
    height:200px;
      }
    </style>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
</head>

<body>
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
      <th scope="col" colspan="2" class="py-2" >보낸 사람 : ${user.id} </th>

    </tr>
   
    <tr>
      <th scope="col" class="py-0" style="width: 78px;line-height:60px;"  >메세지 </th>
      <form action="page?url=WEB-INF/main.jsp" id="form">
      <th><input  class="form-control" type="text" placeholder="reply" id="inputMessage" style="height:100%;width:100%;"></th>
    </tr>	
		  <tr>
		   <th scope="col" class="py-4" style="width: 78px" >보내기</th>
		   <th><input type="submit" class="btn btn-info" value="send" onclick="send()"></th>
		   </tr>	
    
   
     </form>	
  </tbody>
</table>
</div>

</body>
  <script type="text/javascript">
        var textarea = document.getElementById("messageWindow");
        var webSocket = new WebSocket('ws://192.168.60.20/broadcasting');
        var inputMessage = document.getElementById('inputMessage');
   
   
     function onError(event) {
      alert(event.data);
    }
    function send() {
        webSocket.send("${user.id}:"+inputMessage.value+":admin");
        inputMessage.value = "";
        window.close();
    }
 
  </script>
</html>