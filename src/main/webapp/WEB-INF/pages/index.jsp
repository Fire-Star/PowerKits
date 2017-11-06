<%--
  Created by IntelliJ IDEA.
  User: MoonFollow
  Date: 2017/10/30
  Time: 0:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Power Kits 主页</title>
    <!-- 引入 BootStrap 全家桶 -->
    <script src="<c:url value="/"/>res/js/jquery-3.2.1.min.js"></script>
    <script src="<c:url value="/"/>res/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/"/>res/css/bootstrap.min.css"/>

    <!-- 引入Vue.js -->
    <script src="<c:url value="/"/>res/js/vue.min.js"></script>
    <style>
        html,body,.app{
            width: 100%;height: 100%;min-width: 1170px;padding: 0px;margin: 0px;background-color: #f1f1f1;font:12px/20px "宋体";
            moz-user-select: -moz-none;
            -moz-user-select: none;
            -o-user-select:none;
            -khtml-user-select:none;
            -webkit-user-select:none;
            -ms-user-select:none;
            user-select:none;
        }
        .app{
            text-align: center;
        }
        .app:before{
            content: "";display: inline-block;height: 80%;vertical-align: middle;
        }
        .middle{
            margin-top: 60px;width: 60%;box-shadow: 0 0 8px rgba(0,0,0,0.1);height: 642px;display: inline-block;background-color: #fff;border-radius: 3px;vertical-align: middle;
            padding: 24px;
        }
        .model-title{
            display: inline-block;margin: 0px;padding: 10px 0px 5px 0px;box-sizing: border-box;margin-bottom: 10px;
            border-bottom: 1px solid #dedee0;
        }
        .model-content{
            display: inline-block;width: 100%;height: 87.9%;position: relative;padding: 3px;text-align: left;font: 0px/0px "宋体";overflow: auto;
        }
        .model-function{
            display: inline-block;width: 32%;height: 127px;margin-left: 1%;margin-bottom: 5px;border-radius: 3px;position: relative;font:23px/20px "宋体";
        }
        .model-toutiao{
            background-color: #ed4040;color: white;
        }
        .model-toutiao:hover{
            cursor: pointer;background-color: #ff4949;
        }
        .function-description{
            line-height: 127px;
        }
        .model-none{
            background-color: #9e9ead;color: white;
        }
        .model-none:hover{
            cursor: pointer;background-color: #8787ad;
        }
    </style>
</head>
<body>
<div class="app">
    <div class="middle">
        <span class="h2 text-warning model-title">自媒体刷访问量助手</span>
        <div class="model-content">
            <div class="model-function model-toutiao text-center">
                <a href="<c:url value="/"/>media/toutiao/index" class="function-description text-center" style="display: inline-block;color:white;text-decoration: none;">今日头条刷访问量</a>
            </div>
            <div class="model-function model-none">
                <div class="function-description text-center">正在开发中...</div>
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