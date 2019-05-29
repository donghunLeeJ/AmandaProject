<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <title>chat</title>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>

       <fieldset> 
        <textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>
        <input id="inputMessage" type="text" >
        <input type="submit" value="send" onclick="send()" >
    </fieldset>

</body>
    <script type="text/javascript">
        var textarea = document.getElementById("messageWindow");
        var webSocket = new WebSocket('ws://192.168.60.29:8080/Fork/broadcasting');
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
       if(who=="admin"){
       textarea.value += "관리자:" + contents  + "\n";
       }
    }
    function onOpen(event) {
        $("#messageWindow").text("채팅에 참여하였습니다.");
    }
    function onError(event) {
      alert(event.data);
    }
    function send() {
        textarea.value += "${user.name}:" + inputMessage.value + "\n";
        webSocket.send("${user.name}:"+inputMessage.value);
        inputMessage.value = "";
    }
    function enterkey() {
        if (window.event.keyCode == 13) {
            send();
        }
    }
  </script>
</html>