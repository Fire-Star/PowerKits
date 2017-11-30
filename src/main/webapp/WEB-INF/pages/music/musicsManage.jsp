<%--
  Created by IntelliJ IDEA.
  User: MoonFollow
  Date: 2017/11/30
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>模块选择页面</title>
    <!-- 引入 BootStrap 全家桶 -->
    <script src="<c:url value="/"/>res/js/jquery-3.2.1.min.js"></script>
    <script src="<c:url value="/"/>res/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/"/>res/css/bootstrap.min.css"/>

    <!-- 引入Vue.js -->
    <script src="<c:url value="/"/>res/js/vue.min.js"></script>
    <style>
        html,body,.app{
            width: 100%;height: auto;padding: 0px;margin: 0px;
        }
        .panel-custom{
            border: 1px solid #ff4949;width: 55%;margin: 80px auto;
        }
        .panel-custom > .panel-heading{
            background-color: #ff4949;border: 1px solid #ff4949;text-align: center;font: 20px/24px ConduitITCW01-ExtraBold_731262;
        }
        .collapse-custom > .well{
            margin: 0px;border: none;border-radius: 0px;background-color: #fff;
        }
        .collapse-custom > .well:hover{
            background-color: #f5f5f5;
        }
        .music-item{
            border-bottom: none;
        }
        .notShow{
            display: none;
        }
        .custom-fade{
            border: none;
        }
        .custom-fade > td{
            border: none !important;
        }
        .part{
            font: 18px "宋体";
        }
    </style>
</head>
<body>
<div class="app">
    <div class="panel panel-primary panel-custom">
        <div class="panel-heading">CSDN 外链曲库</div>
        <div class="panel-body">
            <table class="table table-bordered table-condensed table table-hover">
                <tr>
                    <th class="text-center">#</th>
                    <th class="text-center">音乐名称</th>
                    <th class="text-center">上传时间</th>
                    <th class="text-center">远程上传IP</th>
                    <th class="text-center">操作</th>

                </tr>
                <tr class="text-center music-item" v-for="(item,index) in musicNames" inserted="false">
                    <td @click="showIframeMessage($event,item.name)" style="vertical-align: middle;cursor: pointer;">{{index + 1}}</td>
                    <td @click="showIframeMessage($event,item.name)" style="vertical-align: middle;cursor: pointer;">{{item.name}}</td>
                    <td @click="showIframeMessage($event,item.name)" style="vertical-align: middle;cursor: pointer;">{{item.enTime}}</td>
                    <td @click="showIframeMessage($event,item.name)" style="vertical-align: middle;cursor: pointer;">{{item.uploadRemoteIP}}</td>
                    <td style="vertical-align: middle">
                        <button @click="deleteItem(item.name)" class="btn btn-primary btn-sm" style="padding: 5px 25px">删除</button>
                    </td>
                </tr>
            </table>
            <div class="text-center">
                <span v-if="musicNames.length == 0">还没有上传音乐。。。</span>
            </div>
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
                    <h4 class="modal-title">{{modalTipsTitle}}</h4>
                </div>
                <div class="modal-body" style="padding: 45px;text-align: center">
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
        musicNames:[],
        notShowIframe:false,
        notShowIsRun:false,
        targetShow:"",
        modalTipsTitle:"提示",
        modalMessage:"",
        currentMusicName:"",
        iframeCode:""
    };
    var vm = new Vue({
        el:'.app',
        data:data,
        methods:{
            showIframeMessage:function(event,name){
                vm.createIframePage(name);
                if(vm.notShowIsRun){
                    return;
                }
                var newInsert = false;
                var inserted = $(event.target.parentNode).attr('inserted');
                if(inserted == "false"){
                    $('<tr class="custom-fade notShow">\n' +
                        '                    <td colspan="5" style="padding: 0px;">\n' +
                        '                        <button style="display: none;" class="btn btn-primary btn-showIframe" type="button" data-toggle="collapse" data-target=".collapse" aria-expanded="false" aria-controls="collapseExample">\n' +
                        '                            Button with data-target\n' +
                        '                        </button>\n' +
                        '                        <div class="collapse collapse-custom">\n' +
                        '                            <div class="well well-custom">\n' +vm.iframeCode+
                        '                                \n' +
                        '                            </div>\n' +
                        '                        </div>\n' +
                        '                    </td>\n' +
                        '                </tr>').insertAfter(event.target.parentNode);
                    $(event.target.parentNode).attr({"inserted":"true"});
                    newInsert = true;
                }

                var targetNode = event.target.parentNode.nextSibling;//获取下一个 tr 节点
                if(vm.targetShow != "" && vm.targetShow != targetNode){
                    if(newInsert){
                        $(targetNode).find('.collapse-custom').addClass("collapse in");//这种情况新生成的需要调换状态
                    }
                    vm.notShowIsRun = true;
                    setTimeout(function () {
                        $(vm.targetShow).toggleClass("notShow");
                        $(targetNode).toggleClass("notShow");
                        setTimeout(function () {
                            $('.btn-showIframe').click();
                        },10);
                        vm.targetShow = targetNode;
                    },360);
                    setTimeout(function () {
                        $('.btn-showIframe').click();
                    },10);
                    setTimeout(function () {
                        vm.notShowIsRun = false;
                    },800);
                    return;
                }
                vm.notShowIsRun = true;

                vm.targetShow = targetNode;
                if(vm.notShowIframe){
                    setTimeout(function () {
                        $(targetNode).toggleClass("notShow");
                        vm.notShowIframe = !vm.notShowIframe;
                        vm.targetShow = "";
                    },300);
                }else{
                    $(targetNode).toggleClass("notShow");
                    vm.notShowIframe = !vm.notShowIframe;
                }
                setTimeout(function () {
                    $('.btn-showIframe').click();
                },10);
                setTimeout(function () {
                    vm.notShowIsRun = false;
                },400);
            },
            annalysData:function(_data) {
                if(!_data){
                    vm.modalMessage = "啊哦~~ 服务器被黑客给击飞了~~~，请稍后再来~";
                }else if(_data.success){
                    vm.musicNames = _data.success;
                    return;
                }else if(_data.errorType){
                    vm.modalMessage = _data.errorType;
                }else{
                    vm.modalMessage = "啊哦~~ 服务器被黑客给击飞了~~~，请稍后再来~";
                }
                $(modalAlertStr).click();
            },
            createIframePage:function(name){
                vm.currentMusicName = name;
                vm.iframeCode = '&lt;iframe frameborder="no" border="0" style="border:none;" marginwidth="0" marginheight="0" width=330 height=86 src="//domarvel.cn/music/outlink?name='+vm.currentMusicName+'"&gt;&lt;/iframe&gt;';
            },
            deleteItem:function(name) {
                $.get("<c:url value="/"/>music/delete?name="+name,function (data, status) {
                    if(status){
                        initPage();
                        var _data = eval(data);
                        console.log(_data);
                        vm.annalysData(_data);
                    }
                });
            }
        }
    });
    function initPage() {
        $.get("<c:url value="/"/>music/showallmusic",function (data, status) {
            if(status){
                var _data = eval(data);
                vm.annalysData(_data);
            }
        })
    }
    initPage();
</script>
</html>