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
<title>CSDN外链音乐</title>
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
    .edit{
        background-color: #4494D8;color: white;
    }
    .edit:hover{
        background-color: #2F76B3;color: white;
    }
    .file-up-in:hover{
        cursor: pointer;
    }
    .modal-body{
        -moz-user-select: auto;
        -o-user-select:auto;
        -khtml-user-select:auto;
        -webkit-user-select:auto;
        -ms-user-select:auto;
        user-select:auto;
    }
</style>
</head>
    <body>
        <div class="app">
            <div class="context">
                <div class="clearSpace-part">
                    <div class="part-inline">
                        <a class="tag write" id="btn-modal-upload" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#upload">
                            <span style="line-height: 127px">上传</span>
                        </a>
                    </div>
                    <div class="part-inline">
                        <a class="tag read" href="<c:url value="/"/>music/musicwarehouse">
                            <span style="line-height: 127px">外链曲库</span>
                        </a>
                    </div>
                </div>
            </div>
            <!-- Button trigger modal -->

            <div class="modal fade" id="upload" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">音乐上传</h4>
                        </div>
                        <div class="modal-body" style="padding: 45px;text-align: center">
                            <form name="fileUpload">
                                <input type="file" id="fileSource" hidden style="display: none">
                            </form>
                            <span v-if="modalUploadErrorMessage!=''" style="color: #b92c28;margin-bottom: 21px;display: inline-block;">{{modalUploadErrorMessage}}</span>
                            <div class="input-group">
                                <input type="text" class="form-control file-up-in" id="fileSource-show" readonly placeholder="请选择文件..." @click="choseFile()">
                                <span class="input-group-btn">
                                    <button class="btn btn-primary" type="button" @click="uploadFileAction()">上传并生成外链</button>
                                </span>
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
    var modalUploadStr = "#btn-modal-upload";
    var data = {
        modalMessage:"",
        modalUploadErrorMessage:"",
        modalTipsTitle:"提示"
    };
    var vm = new Vue({
        el:'.app',
        data:data,
        methods:{
            choseFile:function() {
                $("#fileSource").click();
            },
            uploadFileAction:function() {
                if($('#fileSource-show')[0].value==""){
                    vm.modalTipsTitle = "提示";
                    vm.modalUploadErrorMessage = '请选择需要上传的音频文件！';
                    $('#modalButton').click();
                    return;
                }
                // 创建
                var form_data = new FormData();
                // 获取文件
                var file_data = $("#fileSource").prop("files")[0];
                // 把所以表单信息
                form_data.append("musicFile", file_data);
                $.ajax({
                    type: "POST",
                    url: "upload",
                    processData: false,  // 注意：让jQuery不要处理数据
                    contentType: false,  // 注意：让jQuery不要设置contentType
                    data: form_data,
                    success: function(data){//成功方法
                        var _data = eval(data);
                        vm.modalTipsTitle = "生成外链成功";
                        annalysData(_data);
                        $('#fileSource-show')[0].value = "";
                    },
                    error:function(){//请求失败方法
                        alert("系统繁忙,请稍后再试！");
                    }
                });
            }
        }
    });

    //当上传文件改变时，修改上传文件名称
    $("input[type=file]").change(function(e){
        vm.modalTipsTitle = "提示";
        $('#fileSource-show')[0].value = "";
        var path = e.target.value;
        var lastIndex = path.lastIndexOf('\\')+1;
        var value = path.substring(lastIndex);
        var fileType = getFileType(value);
        if(!(fileType && fileType == "mp3")){
            vm.modalUploadErrorMessage = "上传的音频文件类型必须为 mp3！！！";
            return;
        }
        vm.modalUploadErrorMessage = "";
        $('#fileSource-show')[0].value = value;
    });
    function getFileType(fileName) {
        var lastIndex = fileName.lastIndexOf('.')+1;
        return fileName.substring(lastIndex);
    }

    function annalysData(_data) {
        if(!_data){
            vm.modalMessage = "啊哦~~ 服务器被黑客给击飞了~~~，请稍后再来~";
        }else if(_data.success){
            vm.modalMessage = _data.success;
        }else if(_data.errorType){
            vm.modalMessage = _data.errorType;
        }else{
            vm.modalMessage = "啊哦~~ 服务器被黑客给击飞了~~~，请稍后再来~";
        }
        $(modalAlertStr).click();
        $(modalUploadStr).click();
    }
</script>
</html>