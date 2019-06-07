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
									
																			
		<div id="wrapper">
 <table class="table table-striped ">
  <thead class="thead ">
    <tr class="py-0">
      <th scope="col" class="py-2" colspan="2" >공 지 사 항 입 니 다 </th>
      
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="col" colspan="2" class="py-2" >보낸 사람    admin <%@ page import = "java.util.Calendar" %>
<%
Calendar cal = Calendar.getInstance();%>
 
(<%= cal.get(Calendar.YEAR) %>-<%= cal.get(Calendar.MONTH)+1 %>-<%= cal.get(Calendar.DATE) %>
<%= cal.get(Calendar.HOUR) %>:<%= cal.get(Calendar.MINUTE) %>:<%= cal.get(Calendar.SECOND) %>) </th>

    </tr>
    <tr>
      <th scope="col" class="py-5" style="width: 70px">내용 </th>
      <th>${text}	</th>
   
    </tr>
     <tr>
      <th scope="col" colspan = "2"></th>
     
   
    </tr>
    
   


	
  </tbody>
</table>
</div>
		
											<script>
											
										        var webSocket = new WebSocket('ws://192.168.60.20/broadcasting');
											function onError(event) {
										      alert(event.data);
										    }
										  
											</script>
														
</body>

										
</html>