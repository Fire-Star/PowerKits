<%--
  Created by IntelliJ IDEA.
  User: MoonFollow
  Date: 1/5/2018
  Time: 3:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>模块选择页面</title>
    <!-- 引入 BootStrap 全家桶 -->
    <script src="../../res/js/jquery-3.2.1.min.js"></script>
    <script src="../../res/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../../res/css/bootstrap.min.css"/>

    <!-- 引入Vue.js -->
    <script type="text/javascript" src="<c:url value="/res/js/vue.min.js"/>"></script>
    <!-- 引入SHA512 -->
    <script type="text/javascript" src="<c:url value="/res/js/SHA512.js"/>"></script>
    <!-- 引入RSA -->
    <script type="text/javascript" src="<c:url value="/res/js/jsencrypt.min.js"/>"></script>
    <!-- 引入Base64 -->
    <script type="text/javascript" src="<c:url value="/res/js/jquery.base64.js"/>"></script>
    <!-- 引入字符串工具类 -->
    <script type="text/javascript" src="<c:url value="/res/js/StringUtils.js"/>"></script>
    <style>
        html,body,.app{
            width: 100%;height: auto;padding: 0px;margin: 0px;background: #f3f2f2;
        }
        .part{
            font: 18px "宋体";
        }
        .login-frame{
            width: 378px;height: 495px;margin: 80px auto;background-color: white;box-shadow: 0 0 8px rgba(0,0,0,0.1);padding:80px 45px 0;text-align: center;
        }
        .input-part{
            margin-top: 10px;
        }
        .input-btn{
            width: 100%;
        }
        .register{
            position: relative;bottom: -200px;
        }
    </style>
</head>
<body>
<div class="app">
    <div class="login-frame">
        <div class="input-part">
            <input class="form-control" placeholder="用户名" v-model="username">
        </div>
        <div class="input-part">
            <input class="form-control" placeholder="密码" v-model="password">
        </div>
        <div class="input-part">
            <button class="btn btn-primary input-btn" @click="login()">登录</button>
        </div>
        <div class="input-part">
            <a href="<c:url value="/user/register/index"/>" class="register">没有账号，立即注册</a>
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
                <div class="modal-body" style="padding: 64px;text-align: center;">
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
    var modalAlertStr = "#btn-modal-tishi";
    var data = {
        modalMessage:"",
        salt:"",
        publicKey:"",
        username:"",
        password:""
    };
    var vm = new Vue({
        el:'.app',
        data:data,
        methods:{
            annalysData:function(_data) {
                if(!_data){
                    vm.modalMessage = "啊哦~~ 服务器被黑客给击飞了~~~，请稍后再来~";
                }else if(_data.success){
                    return;
                }else if(_data.salt){
                    vm.salt = _data.salt;
                    if(!vm.salt || !vm.publicKey){
                        return;
                    }
                    var encrypt = new JSEncrypt();
                    encrypt.setPublicKey(vm.publicKey);
                    var sha512EncodePassword = sha512(vm.password + vm.salt);
                    console.log("sha512EncodePassword：【"+sha512EncodePassword+"】");
                    var data = encrypt.encryptLong(sha512EncodePassword);//当前JS的RSA只能加密非中文字符。
                    $.post("<c:url value="/user/login"/>",
                        {
                            username:vm.username,
                            password:data
                        },
                        function (data, status) {
                            if (status) {
                                var _data = eval(data);
                                vm.annalysData(_data);
                                console.log(_data);
                                console.log(_data.refreshx);
                            }
                        }
                    );
                    return;
                }else if(_data.refreshx){
                    if(_data.refreshx == "true"){
                        init();
                        vm.modalMessage = '你和服务器失去了联系，请再次点击登录！';
                    }
                }else if(_data.errorType){
                    vm.modalMessage = _data.errorType;
                }else if(_data.loginState){
                    vm.modalMessage = _data.loginState;
                }
                else{
                    vm.modalMessage = "啊哦~~ 服务器被黑客给击飞了~~~，请稍后再来~";
                }
                $(modalAlertStr).click();
            }
        }
    });
    function init() {
        $.get("<c:url value="/rsa/publickey"/>",function (data, status) {
            if (status) {
                vm.publicKey = eval(data)['publicKey'];
            }
        });
    }
    init();
    function login() {
        $.get("<c:url value="/user/initsalt"/>"+"?username="+vm.username,function (data, status) {
            if (status) {
                var _data = eval(data);
                vm.annalysData(_data);
            }
        });
    }
</script>
</html>