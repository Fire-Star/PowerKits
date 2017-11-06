<%--
  Created by IntelliJ IDEA.
  User: MoonFollow
  Date: 2017/11/6
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Envelope功能选择</title>
    <!-- 引入 BootStrap 全家桶 -->
    <script src="<c:url value="/"/>res/js/jquery-3.2.1.min.js"></script>
    <script src="<c:url value="/"/>res/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/"/>res/css/bootstrap.min.css"/>

    <!-- 引入Vue.js -->
    <script src="<c:url value="/"/>res/js/vue.min.js"></script>
    <style>
        html,body,.app{
            width: 100%;height: 100%;padding: 0px;margin: 0px;
            moz-user-select: -moz-none;
            -moz-user-select: none;
            -o-user-select:none;
            -khtml-user-select:none;
            -webkit-user-select:none;
            -ms-user-select:none;
            user-select:none;
        }
        .part{
            font: 18px "宋体";
        }
        .part-inline{
            font: 18px/24px "宋体";display: inline-block;
        }
        .app:before{
            content: "";display: inline-block;height: 80%;vertical-align: middle;
        }
        .clearSpace-part{
            font: 0px/0px "宋体";display: inline-block;width: 100%;
        }
        .context{
            width: 90%;margin-top: 60px;display: inline-block;vertical-align: middle;margin-left: 5%;text-align: center;padding: 10px 0px;
        }
        .tag{
            display: inline-block;width: 12em;height: 127px;margin: 5px;border-radius: 3px;position: relative;font:23px/20px "宋体";background-color: #9e9ead;
            transition: all 0.3s linear;
            -webkit-transition: all 0.3s linear;
            -moz-transition: all 0.3s linear;
            -o-transition: all 0.3s linear;
            -ms-transition: all 0.3s linear;
        }
        .tag:hover{
            background-color: #5e5e5e;cursor: pointer;text-decoration: none;
            transform: translateY(-4px);-webkit-transform: translateY(-5px);
            -moz-transform: translateY(-4px);-ms-transform: translateY(-4px);
            -o-transform: translateY(-4px);
        }
        .write{
            background-color: #ed4040;color: white;
        }
        .write:hover{
            cursor: pointer;background-color: #ff4949;color: white;
        }
        .read{
            background-color: #F69C5A;color: white;
        }
        .read:hover{
            background-color: #ff8c38;color: white;
        }
    </style>
</head>
<body>
<div class="app">
    <div class="context">
        <div class="clearSpace-part">
            <div class="part-inline">
                <a class="tag write" href="<c:url value="/"/>bestwish/envelope/edit/index">
                    <span style="line-height: 127px">写信</span>
                </a>
            </div>
            <div class="part-inline">
                <a class="tag read" href="<c:url value="/"/>bestwish/envelope/read/index">
                    <span style="line-height: 127px">收信</span>
                </a>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    var data = {
    };
    var vm = new Vue({
        el:'.app',
        data:data
    });
</script>
</html>