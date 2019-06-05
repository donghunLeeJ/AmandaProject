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
</head>
<body>
       <fieldset> 
        <textarea id="inputMessage" ></textarea>
        <input type="submit" value="send" onclick="send()">
  </fieldset>
</body>
  <script type="text/javascript">
        var textarea = document.getElementById("messageWindow");
        var webSocket = new WebSocket('ws://192.168.60.29/broadcasting');
        var inputMessage = document.getElementById('inputMessage');
   
   
     function onError(event) {
      alert(event.data);
    }
    function send() {
        webSocket.send("admin:"+inputMessage.value+":${who}");
        inputMessage.value = "";
        window.close();
    }
 
  </script>
</html>