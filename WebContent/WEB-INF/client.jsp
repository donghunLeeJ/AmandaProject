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
        <input type="submit" value="send" onclick="send()" >
    </fieldset>

</body>
    <script type="text/javascript">
        var textarea = document.getElementById("messageWindow");
        var webSocket = new WebSocket('ws://192.168.60.29:8080/AmandaProject/broadcasting');
        var inputMessage = document.getElementById('inputMessage');
    webSocket.onerror = function(event) {
      onError(event)
    };
    webSocket.onopen = function(event) {
      onOpen(event)
    };
    webSocket.onmessage = function(event) {
      onMessage(event)
    };
    function onMessage(event) {
       var msg = event.data.split(":");
       var who = msg[0];
       var contents = msg[1];
       console.log(who);
       if(who== "admin" ){
       textarea.value += "관리자:" + contents  + "\n";
       }
    }
    function onOpen(event) {
        $("#messageWindow").html("채팅에 참여하였습니다.\n");
    }
    function onError(event) {
      alert(event.data);
    }
    function send() {
        webSocket.send("${user.name}:"+inputMessage.value);
        inputMessage.value = "";
        window.close();
    }
    function enterkey() {
        if (window.event.keyCode == 13) {
            send();
        }
    }
  </script>
</html>