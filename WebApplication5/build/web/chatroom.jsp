<%-- 
    Document   : chatroom
    Created on : May 3, 2023, 5:43:20 PM
    Author     : phu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<link rel="stylesheet" href="CssForChatroom.css"/>
<!DOCTYPE html>
<html>
    <%
    String username = (String) session.getAttribute("username");
    %>

    <head>
        <link rel="stylesheet" type="text/css" href="styles.css">
        <script type="text/javascript" src="check.js"></script>
        <title>The Chat Room</title>
    <link rel="shortcut icon" href="icon.jpeg" />
    </head>
    <script>
    setInterval(reloaddata, 2000);
function addText() {
    var username = document.getElementById('u').value;
    var msg = document.getElementById('h').value;
    olist = document.getElementById('list');
    op = document.createElement('p');
    op.innerHTML = username + "- <g>" + msg + "</g>";
    ocontent = document.getElementById('content');
    ocontent.appendChild(op);             
    olist.scrollTop = olist.scrollHeight;
    document.getElementById('h').value = '';
    var content = document.getElementById('content');
    content.scrollTop = content.scrollHeight;
  
    //taohttprequest
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        setTimeout(function() { 
                document.getElementById("result").innerHTML = '';
            }, 2000);
    };


    console.log(username, msg); 
    xmlhttp.open("POST", "chatstore", true);
    xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlhttp.send("uname=" + encodeURIComponent(username) + "&msg=" + encodeURIComponent(msg));

    document.getElementById('h').value = '';
    
}
function reloaddata()
{
   var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("POST", "reloaddata", true);
    
    xmlhttp.onreadystatechange = function()
    {
            document.getElementById("content").innerHTML = xmlhttp.responseText;
    };
    xmlhttp.send(null);
}
    </script>
    <body>
        <div class="outer_box">
            <div class="left_side_bar">
                <div class="box_chua_avt" >   
                </div>
                <div class="box_chua_nhom" >
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
            
            <div class="box_chua_boxchat" >
                <div class="Box_chua_buttons" >
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            <div class="box_chat" id="list">
            <div id="content">
            </div>
                <input style="display:none " type="text" id="u" value="<%= username %>">
                <div class="outer_box_chua_box_textarea" >
                    <div class="box_chua_textarea" >
                    <div class="oj1" ></div>
                    <div class="oj2" ></div>
                    <input type="text" id="h" onkeydown="if(event.keyCode===13) addText()" placeholder="Press enter to chat...">
                    </div>
                    
                </div>
            
            </div>
            </div>
            <div class="right_side_bar" >
                
            </div>
        </div>
    </body>


</html>

