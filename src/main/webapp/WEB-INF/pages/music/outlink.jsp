<%--
  Created by IntelliJ IDEA.
  User: MoonFollow
  Date: 2017/11/29
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>OutLink</title>
    <!-- 引入 BootStrap 全家桶 -->
    <script src="<c:url value="/res/js/jquery-3.2.1.min.js"/>"></script>
    <script src="<c:url value="/res/js/Jquery.Query.js"/>"></script>
    <script src="<c:url value="/res/js/bootstrap.min.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/res/css/bootstrap.min.css"/>"/>

    <!-- 引入Vue.js -->
    <script src="<c:url value="/res/js/vue.min.js"/>"></script>
    <style>
        html,body,.app{
            width: 100%;height: auto;padding: 0px;margin: 0px;
        }
        .part{
            font: 18px "宋体";
        }
    </style>
</head>
<body>
<div class="app">
    <div class="music">
        <audio controls id="music" loop>
            <source src="" type="audio/mpeg">
            您的浏览器不支持 audio 元素。
        </audio>
    </div>
</div>
</body>
<script>
    var data = {
        musicBathUrl:'<c:url value="/res/music/"/>',
        musicName:"",
        musicUrl:""
    };
    var vm = new Vue({
        el:'.app',
        data:data
    });
    function init() {
        var audio = $("#music")[0];
        vm.musicName = $.query.get("name");
        var split = vm.musicBathUrl.indexOf(';');
        var sessionid ="";
        if(split != -1){
            sessionid = vm.musicBathUrl.substring(split);
            vm.musicBathUrl = vm.musicBathUrl.substring(0,split);
            console.log(sessionid);
            console.log(vm.musicName);
            console.log(vm.musicBathUrl);
        }
        vm.musicUrl = vm.musicBathUrl + vm.musicName + sessionid;
        audio.src = vm.musicUrl;
        audio.play();
    }
    init();
</script>
</html>