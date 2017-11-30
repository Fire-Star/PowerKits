<%--
  Created by IntelliJ IDEA.
  User: MoonFollow
  Date: 2017/11/7
  Time: 6:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>详细阅读日志列表</title>
    <!-- 引入 BootStrap 全家桶 -->
    <script src="<c:url value="/res/js/jquery-3.2.1.min.js"/>"></script>
    <script src="<c:url value="/res/js/Jquery.Query.js"/>"></script>
    <script src="<c:url value="/res/js/bootstrap.min.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/res/css/bootstrap.min.css"/>"/>

    <!-- 引入Vue.js -->
    <script src="<c:url value="/res/js/vue.min.js"/>"></script>
    <style>
        html,body,.app{
            width: 100%;height: auto;padding: 0px;margin: 0px;background-color: #f1f1f1;
        }
        .part{
            font: 18px "宋体";
        }
        .part-inline{
            font: 18px/24px "宋体";display: inline-block;
        }
        .clearSpace-part{
            font: 0px/0px "宋体";display: inline-block;;
        }
        .show-log{
            width: 60%;margin-top: 3em;margin-left: 20%;
        }
    </style>
</head>
<body>
<div class="app">
    <div class="show-log part">
        <table class="table table-bordered table-condensed table table-hover">
            <caption class="h3 text-muted text-center">信件阅读详情</caption>
            <tr>
                <th class="text-center">#</th>
                <th class="text-center">wishCode</th>
                <th class="text-center">远程IP</th>
                <th class="text-center">阅读时间</th>
            </tr>
            <tr class="text-center" v-for="(item,index) in status">
                <td>{{index+1}}</td>
                <td>{{item.wishCode}}</td>
                <td>{{item.ip}}</td>
                <td>{{item.voTime}}</td>
            </tr>
        </table>
        <div style="text-align: center;" v-if="status.length <= 0">
            <span class="part">没有数据。。。。</span>
        </div>
    </div>

    <!-- Button trigger modal -->
    <button type="button" id="btn-modal-tishi" class="btn btn-primary btn-lg" style="display: none;" data-toggle="modal" data-target="#tishi">
        弹出模态框
    </button>
    <div class="modal fade" id="tishi" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">提示</h4>
                </div>
                <div class="modal-body" style="padding: 64px;text-align: center">
                    <span class="text">{{modalMessage}}</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</div>
</body>
<script>
    var data = {
        status:[],
        wishCode:"",
        modalMessage:""
    };
    var vm = new Vue({
        el:'.app',
        data:data,
        methods:{
            receiveLog:function (wishCode,IP) {
                $.get("<c:url value="/"/>bestwish/envelope/showdetaillog?wishCode="+wishCode+"&IP="+IP,function (data, status) {
                    if(status){
                        var _data = eval(data);
                        if(!_data){
                            vm.modalMessage = '啊哦~~ 服务器被黑客给击飞了~~~';
                            $('#btn-modal-tishi').click();
                        }else if(_data.success){
                            vm.status = _data.success;
                        }else if(_data.errorType){
                            vm.modalMessage = _data.errorType;
                            $('#btn-modal-tishi').click();
                        }else{
                            vm.modalMessage = '啊哦~~ 服务器被黑客给击飞了~~~';
                            $('#btn-modal-tishi').click();
                        }
                    }
                })
            }
        }
    });
    function initPage() {
        var wishCode = $.query.get("wishCode");
        var IP = $.query.get("IP");
        if(!wishCode || !IP){
            vm.modalMessage = '你没有在链接地址处给出要查询的数据，我们无法帮你查询~';
            $('#btn-modal-tishi').click();
            return;
        }
        vm.receiveLog(wishCode,IP);
    }
    initPage();
</script>
</html>