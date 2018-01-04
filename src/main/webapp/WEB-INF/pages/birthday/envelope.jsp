<%--
  Created by IntelliJ IDEA.
  User: MoonFollow
  Date: 2017/11/6
  Time: 3:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>信件阅读</title>
    <!-- 引入 BootStrap 全家桶 -->
    <script src="<c:url value="/res/js/jquery-3.2.1.min.js"/>"></script>
    <script src="<c:url value="/res/js/Jquery.Query.js"/>"></script>
    <script src="<c:url value="/res/js/jquery.cookie.js"/>"></script>
    <script src="<c:url value="/res/js/bootstrap.min.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/res/css/bootstrap.min.css"/>"/>

    <!-- 引入Vue.js -->
    <script src="<c:url value="/res/js/vue.min.js"/>"></script>
    <style>
        html,body,.app{
            width: 100%;height: 100%;padding: 0px;margin: 0px;background-color: #eae4e2;text-align: center;font: 0 "宋体";letter-spacing: 0px;
            moz-user-select: -moz-none;
            -moz-user-select: none;
            -o-user-select:none;
            -khtml-user-select:none;
            -webkit-user-select:none;
            -ms-user-select:none;
            user-select:none;
            overflow: auto;
        }
        .app:after{
            content: "";display: inline-block;height: 80%;vertical-align: middle;
        }
        .envelope-plug{
            display: inline-block;vertical-align: middle;bottom: -20px;width: 888px;height: 416px;position: relative;text-align: left;

            transition: margin-top 0.6s ease 0s, transform 0.6s ease 0s;
            -webkit-transition: transform 0.6s ease 0s,margin-top 0.6s ease 0s,bottom 0.6s ease 0s;
            -moz-transition: margin-top 0.6s ease 0s, transform 0.6s ease 0s,bottom 0.6s ease 0s;
            -ms-transition: margin-top 0.6s ease 0s, transform 0.6s ease 0s,bottom 0.6s ease 0s;
            -o-transition: margin-top 0.6s ease 0s, transform 0.6s ease 0s,bottom 0.6s ease 0s;
        }
        .envelope-plug-open{
            bottom: -250px;
        }
        .envelope-front , .envelope-back{
            display: inline-block;width: 100%;height: 100%;position: absolute;text-align: center;
        }
        .envelope-back{
            z-index: 10;
        }
        .envelope-back-addTopBorder{
            border-top: 1px solid #e4c3a2;
        }
        .envelope-front{
            z-index: 5;
        }
        .envelope{
            width: 100%;height: 100%;display: inline-block;box-shadow:inset 0 0 8px 8px rgba(255,255,240,0.2);background-image: url(<c:url value="/"/>res/img/envelope-bg.png);
            box-shadow: 0 4px 8px rgba(0,0,0,.3);position: relative;
        }
        .envelope-back-x{
            height: 60%;bottom: -40%;z-index: 20;
        }
        .envelope-pack{
            position: absolute;display: inline-block;width: 100%;height: 52%;background-image: url(<c:url value="/"/>res/img/envelope-bg.png);z-index: 100;box-shadow: 0 3px 8px rgba(0,0,0,.2);
            border-bottom-left-radius: 82px;border-bottom-right-radius: 82px;
        }
        .envelope-pack-getAnimation{
            transform-origin:0% 0;
            -ms-transform-origin: 0% 0;
            -o-transform-origin: 0% 0;
            -moz-transform-origin: 0% 0;
            -webkit-transform-origin: 0% 0;

            transform: perspective(2000px) rotateX(0deg);
            -webkit-transform:perspective(2000px)  rotateX(0deg);	/* Safari 和 Chrome */
            -moz-transform:perspective(2000px)  rotateX(0deg);	/* Firefox */
            -o-transform: perspective(2000px)  rotateX(0deg);
            -ms-transform: perspective(2000px)  rotateX(0deg);

            transition: margin-top 0.6s ease 0s, transform 0.6s ease 0s;
            -webkit-transition: margin-top 0.6s ease 0s, transform 0.6s ease 0s;
            -moz-transition: margin-top 0.6s ease 0s, transform 0.6s ease 0s;
            -ms-transition: margin-top 0.6s ease 0s, transform 0.6s ease 0s;
            -o-transition: margin-top 0.6s ease 0s, transform 0.6s ease 0s;
        }
        .love-heart{
            display: inline-block;position: relative;margin: 0 auto;width: 100px;height: 100px;z-index: 200;bottom: -88%;
        }
        .love-heart:hover{
            cursor: pointer;
        }
        .love-heart span{
            display: inline-block;background-color: #e4528f;
        }
        .heart{
            border-radius: 100%;width: 100%;height: 100%;position: absolute;
        }
        .left-heart{
            right: 50%;
        }
        .right-heart{
            bottom: 50%;
        }
        .foot-heart{
            position: relative;width: 80%;height: 80%;text-align: left;
            transform:rotate(45deg);
            -ms-transform:rotate(45deg); 	/* IE 9 */
            -moz-transform:rotate(45deg); 	/* Firefox */
            -webkit-transform:rotate(45deg); /* Safari 和 Chrome */
            -o-transform:rotate(45deg); 	/* Opera */
        }
        .text{
            font: 18px "宋体";
        }
        .show-toggle-text{
            font: 20px "宋体";position: absolute;display: inline-block;bottom: 33px;right: 68px;color: #DEA75E;
        }
        .show-toggle-text:hover{
            cursor: pointer;color: #daa35a;
        }
        .envelope-show-rotateX-before-show{
            transform: perspective(2000px) rotateY(360deg) !important;
            -webkit-transform:perspective(2000px) rotateY(360deg) !important;	/* Safari 和 Chrome */
            -moz-transform:perspective(2000px) rotateY(360deg) !important;	/* Firefox */
            transition: transform 0.6s ease 0s;
            -webkit-transition: transform 0.6s ease 0s;
            -moz-transition: transform 0.6s ease 0s;
            -ms-transition: transform 0.6s ease 0s;
            -o-transition: transform 0.6s ease 0s;
        }
        .envelope-show-rotateX-before{
            transform: perspective(2000px) rotateY(0deg);
            -webkit-transform:perspective(2000px) rotateY(0deg);	/* Safari 和 Chrome */
            -moz-transform:perspective(2000px) rotateY(0deg);	/* Firefox */
            -webkit-transition: transform 0.6s ease 0s;
            -moz-transition: transform 0.6s ease 0s;
            -ms-transition: transform 0.6s ease 0s;
            -o-transition: transform 0.6s ease 0s;
            transition: transform 0.6s ease 0s;
            backface-visibility: hidden;
            -moz-backface-visibility: hidden;
            -webkit-backface-visibility: hidden;
        }
        .envelope-show-rotateX-after{
            transform: perspective(2000px) rotateY(180deg);
            -webkit-transform:perspective(2000px)  rotateY(180deg);	/* Safari 和 Chrome */
            -moz-transform:perspective(2000px)  rotateY(180deg);	/* Firefox */
            transition: transform 0.6s ease 0s;
            -webkit-transition: transform 0.6s ease 0s;
            -moz-transition: transform 0.6s ease 0s;
            -ms-transition: transform 0.6s ease 0s;
            -o-transition: transform 0.6s ease 0s;
        }
        .envelop-front-stamp{
            display: inline-block;width: 23%;height: 32%;position: absolute;right: 30px;top: 30px;
        }
        .stamp-img:hover{
            cursor: pointer;
        }
        .envelope-title{
            display: inline-block;position: absolute;left: 56px;top: 46px;color: #ff58b2;
        }
        .envelope-footer{
            display: inline-block;position: absolute;color: #ff58b2;right: 82px;bottom: 70px;
        }
        .title-highlight{
            font: 42px "宋体";
        }
        .title-name{
            color: #6f6861;margin-left: 10px;font: 25px "宋体";
        }
        .envelope-front-message{
            display: inline-block;position: absolute;width: 100%;height: 33%;left: 0;top: 40%;
        }
        .text-front-message{
            font: 85px "宋体";color: #ff58b2;
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
        .envelope-pack-up{
            border-top: 1px solid #f3eeea;
            transform-origin:0% 0;
            -ms-transform-origin: 0% 0;
            -o-transform-origin: 0% 0;
            -moz-transform-origin: 0% 0;
            -webkit-transform-origin: 0% 0;

            transform: perspective(2000px) rotateX(180deg);
            -webkit-transform:perspective(2000px)  rotateX(180deg);	/* Safari 和 Chrome */
            -moz-transform:perspective(2000px)  rotateX(180deg);	/* Firefox */
            transition: transform 0.6s ease 0s;
            -webkit-transition: transform 0.6s ease 0s;
            -moz-transition: transform 0.6s ease 0s;
            -ms-transition: transform 0.6s ease 0s;
            -o-transition: transform 0.6s ease 0s;
        }
        ::selection {
            background: #f1f1f1;
            color:#dfae67;
        }
        ::-moz-selection{
            background:#f1f1f1;
            color:#dfae67;
        }
        .envelope-message{
            display: inline-block;width: 96%;height: 39%;position: absolute;left: 2%;bottom: 60%;background: url("<c:url value="/"/>res/img/ms-bg.png");padding: 62px;z-index: 19;overflow: hidden;
            text-align: left;font: 18px/24px "宋体";
            transition: height 0.8s ease 0s;
            -webkit-transition: height 0.8s ease 0s;
            -moz-transition: height 0.8s ease 0s;
            -ms-transition: height 0.8s ease 0s;
            -o-transition: height 0.8s ease 0s;

            moz-user-select: -moz-text;
            -moz-user-select: text;
            -o-user-select:text;
            -khtml-user-select:text;
            -webkit-user-select:text;
            -ms-user-select:text;
            user-select:text;
        }
        .envelope-message-open{
            z-index: 200;
        }
        .envelope-back-bottom-open{
            z-index: 300;
        }
        .envelope-heart-open{
            z-index: 50;
        }
        .zhezhao{
            width: 80%;height: 90%;display: inline-block;position: absolute;left: 10%;bottom: 0px;z-index: 300;background-image: url(<c:url value="/"/>res/img/envelope-bg.png);display: none;
        }
        .zhezhao-open{
            display: inline-block;
        }
        .envelope-message-show:hover{
            height: 520px;top: auto;z-index: 220;overflow: auto;
        }
        .show-hello{
            display: inline-block;position: relative;width: 352px;height: 46px;margin-bottom: 20px;
        }
        .text-big{
            font: 32px "宋体";
        }
        .envelope-message-content{
            display: inline-block;position: relative;width: 100%;
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
        .envelope-message-pre{
            white-space: pre-wrap;word-wrap: break-word;padding: 0px;margin: 0px;border: none;text-align: justify;font: 18px/24px '宋体';background: url(<c:url value="/"/>res/img/ms-bg.png);
        }
    </style>
</head>
<body>
<div class="app">
    <audio controls hidden id="music">
        <source src="<c:url value="/"/>res/music/逃跑计划 - 夜空中最亮的星.mp3" type="audio/mpeg">
        您的浏览器不支持 audio 元素。
    </audio>
    <!-- 信封 -->
    <div class="envelope-plug">
        <div class="envelope-back envelope-show-rotateX-before">
            <div class="envelope-pack envelope-pack-getAnimation">
                <div class="zhezhao"></div>
                <!-- 爱心 -->
                <div class="love-heart" @click="verifyPerson">
                        <span class="foot-heart">
                            <span class="heart circle-heart left-heart"></span>
                            <span class="heart circle-heart right-heart"></span>
                        </span>
                </div>
            </div>
            <div class="envelope-message envelope-message-show">
                <div class="show-hello" style="font: 0px '宋体';">
                    <span class="text text-big">致:</span>
                    <span class="text" style="margin-left: 5px">{{dearMan}}</span>
                </div>
                <div class="envelope-message-content">
                        <pre class="envelope-message-pre">{{message}}</pre>
                </div>
            </div>
            <div class="envelope envelope-back-x">
                <span class="text show-toggle-text" @click="addTransform">查看信封正面</span>
            </div>
        </div>
        <div class="envelope-front envelope-show-rotateX-after">
            <div class="envelope">
                <div class="envelope-title">
                    <span class="text title-highlight">T</span>
                    <span class="text" style="font: 25px '宋体';">O:</span>
                    <span class="text title-name">{{receiveMan}}</span>
                </div>
                <div class="envelop-front-stamp">
                    <img class="stamp-img" style="width: 100%;" title="love" draggable="false" src="<c:url value="/"/>res/img/stamp03.gif">
                </div>
                <div class="envelope-front-message text-front-message">{{envelopeAim}}</div>
                <div class="envelope-footer">
                    <span class="text title-highlight">F</span>
                    <span class="text" style="font: 25px '宋体';">rom:</span>
                    <span class="text title-name">{{sendMan}}</span>
                </div>
                <span class="text show-toggle-text" @click="addTransform">查看信封背面</span>
            </div>
        </div>
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
                    <h4 class="modal-title" id="gridSystemModalLabel">收信提示</h4>
                </div>
                <div class="modal-body">
                    <div class="modal-content-part">
                        <input class="form-control verify-input getCheckForm" tagName="祝福码" @keydown.enter="receiveMessage()" v-model="wishCode" placeholder="输入你的祝福码">
                    </div>
                    <div class="" style="margin: 0 20px">
                        <button class="form-control btn btn-primary verify-btn" @click="receiveMessage()">收信</button>
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
                <div class="modal-body" style="padding: 64px;text-align:center;">
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
        modalMessage:"",
        verifySuccess:false,
        addTransformIsExecute:false,
        verifyPersonIsExecute:false,
        wishCode:"", //祝福码
        receiveMan:"", //收件人
        envelopeAim:"", //信 的目的
        sendMan:"", //寄信人
        dearMan:"", //致 谁谁谁
        message:"", //信 的内容
        stamp:"" //邮票
    };
    var vm = new Vue({
        el:'.app',
        data:data,
        methods:{
            notRepeatClick: function (DEBOUNCE_TIME,func) {
                window.clearTimeout(this.tId);
                this.tId = window.setTimeout(function () {
                    // 真正的逻辑
                    func();
                }, DEBOUNCE_TIME)
            },
            addTransfromFunction:function () {
                if($(".envelope-pack").hasClass("envelope-pack-getAnimation")){
                    $(".envelope-pack").removeClass("envelope-pack-getAnimation");
                }else{
                    setTimeout(function () {
                        $(".envelope-pack").addClass("envelope-pack-getAnimation");
                    },600);
                }
                $(".envelope-back").toggleClass("envelope-show-rotateX-after");
                $(".envelope-front").toggleClass("envelope-show-rotateX-before-show");
            },
            addTransform:function () {
                if(!vm.verifyPersonIsExecute&&!vm.addTransformIsExecute){
                    vm.addTransformIsExecute = true;
                }else{
                    if(vm.verifyPersonIsExecute){
                        console.log("点 addTransformIsExecute 的时候，verifyPersonIsExecute 还在运行！");
                    }else{
                        console.log("多点了 addTransform");
                    }
                    return;
                }
                if(!(vm.isContinueShow())){
                    vm.addTransformIsExecute = false;
                    return;
                }
                var isExecuteEnvelopePack = false;
                if($(".envelope-pack").hasClass("envelope-pack-up")){
                    isExecuteEnvelopePack = true;
                    vm.verifyPerson();
                    setTimeout(vm.addTransfromFunction,600);
                }
                if(!isExecuteEnvelopePack){
                    vm.addTransfromFunction();
                }
                setTimeout(function () {
                    vm.addTransformIsExecute = false;
                },610);
            },
            verifyPerson: function(){
                if(!vm.verifyPersonIsExecute){
                    vm.verifyPersonIsExecute = true;
                }else{
                    console.log("多点了 verifyPerson");
                    return;
                }
                if(!(vm.isContinueShow())){
                    vm.verifyPersonIsExecute = false;
                    return;
                }
                $(".envelope-plug").toggleClass("envelope-plug-open");
                $(".envelope-pack").toggleClass("envelope-pack-up");
                if($(".envelope-back").hasClass("envelope-back-addTopBorder")){
                    $(".envelope-back").removeClass("envelope-back-addTopBorder");
                }else{
                    setTimeout(function () {
                        $(".envelope-back").addClass("envelope-back-addTopBorder");
                    },200);
                }
                if($(".envelope-message").hasClass("envelope-message-open")){
                    $(".envelope-message").removeClass("envelope-message-open");
                }else{
                    setTimeout(function () {
                        $(".envelope-message").addClass("envelope-message-open");
                    },600);
                }

                if($(".envelope-back-x").hasClass("envelope-back-bottom-open")){
                    $(".envelope-back-x").removeClass("envelope-back-bottom-open");
                }else{
                    setTimeout(function () {
                        $(".envelope-back-x").addClass("envelope-back-bottom-open");
                    },600);
                }
                if($(".love-heart").hasClass("envelope-heart-open")){
                    $(".love-heart").removeClass("envelope-heart-open");
                }else{
                    $(".love-heart").addClass("envelope-heart-open");
                }
                if($(".zhezhao").hasClass("zhezhao-open")){
                    setTimeout(function () {
                        $(".zhezhao").removeClass("zhezhao-open");
                    },150)
                }else{
                    setTimeout(function () {
                        $(".zhezhao").addClass("zhezhao-open");
                    },100);
                }
                setTimeout(function () {
                    vm.verifyPersonIsExecute = false;
                },1000);
            },
            isContinueShow:function () {
                if(!vm.verifySuccess){
                    $("#btn-modal").click();
                    return false;
                }
                return true;
            },
            receiveMessage:function () {
                isGoCheck = true;
                window.checkFormData();
                if(!isGoCheck){
                    return;
                }
                $.get("<c:url value="/"/>bestwish/envelope/read?wishCode="+vm.wishCode,function (data, status) {
                    if (status) {
                        var _data = eval(data);
                        if(!_data){
                            vm.modalMessage = "啊哦~ 服务器没有找到你的信件，请稍后再来~";
                        }else if(_data.success){
                            $("#btn-modal").click();
                            var receiveData = _data.success;
                            vm.receiveMan = receiveData.receiveMan;
                            vm.envelopeAim = receiveData.envelopeAim;
                            vm.sendMan = receiveData.sendMan;
                            vm.dearMan = receiveData.dearMan;
                            vm.message = receiveData.message;
                            vm.modalMessage = "收件成功~ 祝你 Happy Every Day~";
                            vm.verifySuccess = true;
                            $("#music")[0].play();
                        }else if(_data.errorType){
                            vm.modalMessage = _data.errorType;
                        }else{
                            vm.modalMessage = "啊哦~ 服务器没有找到你的信件，请稍后再来~";
                        }
                        $('#btn-modal-tishi').click();
                    }
                });
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
                    $('#btn-modal-tishi').click();
                    isGoCheck = false;
                }else{
                    $(this).parent().removeClass("has-error");
                }
            }
        });
    };
</script>
</html>