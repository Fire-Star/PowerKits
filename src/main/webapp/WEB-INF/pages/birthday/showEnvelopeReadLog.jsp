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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>显示状态页面</title>
    <!-- 引入 BootStrap 全家桶 -->
    <script src="<c:url value="/"/>res/js/jquery-3.2.1.min.js"></script>
    <script src="<c:url value="/"/>res/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/"/>res/css/bootstrap.min.css"/>

    <!-- 引入Vue.js -->
    <script src="<c:url value="/"/>res/js/vue.min.js"></script>
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
        .modal-content-part{
            margin: 20px;
        }
        .verify-input{
            margin-bottom: 15px;height: 43px;padding-left: 20px;font: 19px "宋体";
        }
        .verify-btn{
            height: 43px;font: 19px "宋体";
        }
    </style>
</head>
<body>
<div class="app">
    <div class="show-log part">
        <button class="btn btn-primary" @click="showLogWindow()" style="display: inline-block;margin: 8px 0">查找信件日志</button>
        <table class="table table-bordered table-condensed table table-hover">
            <tr>
                <th>#</th>
                <th>wishCode</th>
                <th>远程IP</th>
                <th>阅读次数</th>
            </tr>
            <tr v-for="(item,index) in status">
                <td>{{index+1}}</td>
                <td>{{item.wishCode}}</td>
                <td>{{item.ip}}</td>
                <td>{{item.readCount}}</td>
            </tr>
        </table>
    </div>
    <!-- Button trigger modal -->
    <button type="button" id="btn-modal" class="btn btn-primary btn-lg" style="display: none;" data-toggle="modal" data-target="#modal-read">
        弹出模态框
    </button>
    <div class="modal fade" id="modal-read" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">查看信件阅读日志</h4>
                </div>
                <div class="modal-body">
                    <div class="modal-content-part">
                        <input class="form-control verify-input getCheckForm" tagName="祝福码" @keydown.enter="receiveLog()" v-model="wishCode" placeholder="输入你的祝福码">
                    </div>
                    <div class="" style="margin: 0 20px">
                        <button class="form-control btn btn-primary verify-btn" @click="receiveLog()">确定</button>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

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
            showLogWindow:function () {
                $('#btn-modal').click();
            },
            receiveLog:function () {
                isGoCheck = true;
                window.checkFormData();
                if(!isGoCheck){
                    return;
                }

                $.get("<c:url value="/"/>bestwish/envelope/showlog?wishCode="+vm.wishCode,function (data, status) {
                    if(status){
                        var _data = eval(data);
                        if(!_data){
                            vm.modalMessage = '啊哦~~ 服务器被黑客给击飞了~~~';
                            $('#btn-modal-tishi').click();
                        }else if(_data.success){
                            vm.status = _data.success;
                            $('#btn-modal').click();
                            vm.modalMessage = '祝福码:【'+vm.wishCode+"】查询 log 成功！";
                            $('#btn-modal-tishi').click();
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

    /**
     * 检查表单数据，目标表单必须有 getCheckForm 表单
     */
    var isGoCheck = true;
    function checkFormData(){
        $('.getCheckForm').each(function () {
            if(isGoCheck){
                var itemData = $.trim($(this).val());
                var attrName = $(this).attr("tagName");
                if(!itemData){
                    vm.modalMessage = attrName+" 不能为空！！！";
                    $(this).parent().addClass("has-error");
                    $('#btn-modal').click();
                    isGoCheck = false;
                }else{
                    $(this).parent().removeClass("has-error");
                }
            }
        });
    };

    $('#btn-modal').click();
</script>
</html>