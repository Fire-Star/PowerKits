<%--
  Created by IntelliJ IDEA.
  User: MoonFollow
  Date: 2017/10/30
  Time: 0:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Power Kits 主页</title>
    <!-- 引入 BootStrap 全家桶 -->
    <script src="<c:url value="/"/>res/js/jquery-3.2.1.min.js"></script>
    <script src="<c:url value="/"/>res/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/"/>res/css/bootstrap.min.css"/>

    <!-- 引入Vue.js -->
    <script src="<c:url value="/"/>res/js/vue.min.js"></script>
    <style>
        html,body,.app{
            width: 100%;height: auto;padding: 0px;margin: 0px;font: 0px "宋体";-webkit-font-smoothing: antialiased;-moz-osx-font-smoothing: grayscale;background-color: #f1f1f1;
        }
        .part{
            font: 18px/24px "宋体";
        }
        .clearSpace-part{
            font: 0px/0px "宋体";display: inline-block;width: 100%;
        }
        .part-inline{
            font: 18px/24px "宋体";display: inline-block;
        }
        /* 设置滚动条的样式 */
        ::-webkit-scrollbar {
            width: 4px;
            height: 4px;
        }

        /* 滚动槽 */
        ::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            border-radius: 10px;
        }

        /* 滚动条滑块 */
        ::-webkit-scrollbar-thumb {
            border-radius: 10px;
            background: rgba(0,0,0,0.1);
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5);
        }
        ::-webkit-scrollbar-thumb:window-inactive {
            background: #5e5e5e;
        }
        .context{
            display: inline-block;width: 100%;height: auto;
        }
        .text-title{
            font: 7em/1.2em ConduitITCW01-ExtraBold_731262;letter-spacing: .03em;text-transform: uppercase;font-weight: 900;text-align: center;margin-top: 2em;
        }
        .content{
            width: 50%;display: inline-block;margin-top: 8em;position: relative;left: 25%;min-height: 34em;
        }
        .foot{
            width: 100%;display: inline-block;height: 9em;background-color: #3c3c3c;position: relative;bottom: 0;
        }
        .function-tag{
            width: 13em;display: inline-block;height: 16em;margin: 0px 22px 10px 0px;position: relative;background-color: white;color: #5e5e5e;
            transition: all 0.3s linear;
            -webkit-transition: all 0.3s linear;
            -moz-transition: all 0.3s linear;
            -o-transition: all 0.3s linear;
            -ms-transition: all 0.3s linear;
        }
        .function-tag:hover{
            cursor: pointer;color: #101010;box-shadow: 0 0 15px rgba(45,50,55,.3);
            transform: translateY(-4px);-webkit-transform: translateY(-5px);
            -moz-transform: translateY(-4px);-ms-transform: translateY(-4px);
            -o-transform: translateY(-4px);
        }
        .recordcode{
            margin-top: 40px;text-align: center;
        }
        .recordcode a{
            color: #f1f1f1;text-decoration: none;
        }
        .recordcode a:hover{
            color: white;
        }
        .beianIcon{
            display: inline-block;width: 14px;height: 16px;margin-right: 6px;background: url(<c:url value="/"/>res/img/icon-police.png) 0 0 no-repeat;vertical-align: middle;margin-top: -4px;
        }
        .powerby{
            color: white;text-align: center;margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="app">
    <div class="context">
        <div class="part">
            <div class="text-title"><span style="padding-bottom: 10px;border-bottom: 1px dashed #5e5e5e;min-width: 38em;">Power Kits</span></div>
        </div>
        <div class="part">
            <div class="content">
                <div class="clearSpace-part" style="text-align: center">
                    <a class="function-tag part" href="<c:url value="/"/>index">
                        <img style="width: 100%;height: 65%;border: none" src="<c:url value="/"/>res/img/envelope/function1.png">
                        <span style="line-height: 2em;font-size: 1.4em;display: inline-block;">自媒体访问量</span>
                    </a>
                    <a class="function-tag part" href="<c:url value="/"/>bestwish/envelope/index">
                        <img style="width: 100%;height: 65%;border: none" src="<c:url value="/"/>res/img/envelope/function2.png">
                        <span style="line-height: 2em;font-size: 1.4em;display: inline-block;">Best Wish To You</span>
                    </a>
                    <a class="function-tag part" href="<c:url value="/"/>music/index">
                        <img style="width: 100%;height: 65%;border: none" src="<c:url value="/"/>res/img/music/solong.png">
                        <span style="line-height: 2em;font-size: 1.4em;display: inline-block;">CSDN 音乐外链</span>
                    </a>
                </div>
            </div>
        </div>
        <div class="part">
            <footer class="foot">
                <div class="recordcode">
                    <a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11000002000001" target="_blank"><i class="beianIcon"></i>蜀ICP备16034764号-1</a>
                </div>
                <div class="part powerby">
                    <span>Power By MoonFollow</span>
                </div>
            </footer>
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
