<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>文章链接刷访问量</title>
    <!-- 引入 BootStrap 全家桶 -->
    <script src="<c:url value="/"/>res/js/jquery-3.2.1.min.js"></script>
    <script src="<c:url value="/"/>res/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/"/>res/css/bootstrap.min.css"/>

    <!-- 引入Vue.js -->
    <script src="<c:url value="/"/>res/js/vue.min.js"></script>
    <style>
        html,body,.app{
            width: 100%;height: 100%;min-width: 1170px;padding: 0px;margin: 0px;background-color: #f1f1f1;font:0 "宋体";
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
            margin-top: 60px;width: 26%;min-width: 430px;box-shadow: 0 0 8px rgba(0,0,0,0.1);height: 548px;display: inline-block;background-color: #fff;border-radius: 3px;vertical-align: middle;
            padding: 66px;
        }
        .text-item{
            margin-bottom: 10px;height: 44px;padding-left: 20px;font: 17px "宋体";
        }
        .btn-deal-function{
            width: 60%;height: 44px;margin-top: 12px;margin-bottom: 10px;
        }
        .media-content{
            display: inline-block;width: 100%;height: 56%;margin-top: 12px;font: 0 "宋体";
        }
        .media-tag{
            display: inline-block;width: 100%;height: 96px;background-color: #F69C5A;color: white;border-radius: 3px;margin-bottom: 12px;
        }
        .media-tag:hover{
            cursor: pointer;background-color: #ff8c38;
        }
        .text{
            font: 18px/96px "宋体";
        }
        .text-message{
            margin: 0 6px;font: 22px/83px "宋体";
        }
        .media-tag-hasCount{
            background-color: #ed4040;color: white;
        }
        .media-tag-hasCount:hover{
            cursor: pointer;background-color: #ff4949;
        }
        .media-foot pre{
            background-color: white;border-radius: 0;border: none;
        }
        .media-foot{
            display: inline-block;
        }
    </style>
</head>
<body>
<div class="app">
    <div class="middle">
        <div class="media-get">
            <div class="form-group">
                <input type="text" class="form-control text-item getCheckForm" tagName="今日头条文章链接" v-model="mediaUrl" placeholder="输入今日头条文章链接地址...">
            </div>
            <div class="form-group">
                <input type="text" class="form-control text-item getCheckForm" tagName="刷取值" v-model="mediaTargetCount" placeholder="输入刷取值...">
            </div>
            <button class="btn btn-primary btn-deal-function" @click="submitData()">开始</button>
        </div>
        <div class="media-content">
            <div class="media-tag">
                <span class="text">目标访问量:</span>
                <span class="text text-message">{{nextMediaTargetCount}}</span>
                <span class="text">次</span>
            </div>
            <div class="media-tag media-tag-hasCount">
                <span class="text">剩余:</span>
                <span class="text text-message">{{nextMediaHasCount}}</span>
                <span class="text">次</span>
            </div>
        </div>
        <div class="media-foot">
            <pre>Power By FireLang</pre>
        </div>
    </div>
    <!-- Button trigger modal -->
    <button type="button" id="btn-modal" class="btn btn-primary btn-lg" style="display: none;" data-toggle="modal" data-target=".modal">
        弹出模态框
    </button>
    <div class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                </div>
                <div class="modal-body">
                    <span class="text text-muted">{{modalMessage}}</span>
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
    var UUID = "";
    var data = {
        mediaUrl:"",
        mediaTargetCount:"",
        modalMessage:"",
        nextMediaTargetCount:"##",
        nextMediaHasCount:"##"
    };
    var interval;
    function refreshBrushCount() {
        $.get('<c:url value="/"/>media/toutiao/getsingleurlcount/'+UUID,function(data,status){
            console.log(data);
            if(status){
                var _data = eval(data);
                if(!_data){
                    vm.modalMessage = "啊哦~ 服务器坏了~";
                    $('#btn-modal').click();
                }else if(_data.count){
                    vm.nextMediaHasCount = _data.count;
                    if(_data.count<=0){
                        clearInterval(interval);
                        vm.modalMessage = "主人~~~，任务完成~~~";
                        $('#btn-modal').click();
                    }
                }else if(_data.errorType){
                    vm.modalMessage = _data.errorType;
                    $('#btn-modal').click();
                }else{
                    vm.modalMessage = "啊哦~ 服务器被坏人抱走了~";
                    $('#btn-modal').click();
                }
            }
        });
    }
    function sdf() {

    }
    var vm = new Vue({
        el:'.app',
        data:data,
        methods:{
            submitData:function(){
                var mediaUrl = vm.mediaUrl;
                var meidaTargetCount = vm.mediaTargetCount;
                isGoCheck = true;
                window.checkFormData();
                if(!isGoCheck){
                    return;
                }
                vm.nextMediaTargetCount = meidaTargetCount;
                vm.nextMediaHasCount = meidaTargetCount;
                $.post("<c:url value="/"/>media/toutiao/brushsingleurl",
                    {
                        "brushURL":mediaUrl,
                        "brushCount":meidaTargetCount
                    },
                    function(data,status){
                        if(status){
                            console.log(data);
                            var _data = eval(data);
                            if(!_data){
                                vm.modalMessage = "啊哦~ 服务器坏了~";
                                $('#btn-modal').click();
                            }else if(_data.errorType){
                                vm.modalMessage = _data.errorType;
                                $('#btn-modal').click();
                            }else if(_data.id){
                                UUID = _data.id;
                                interval = setInterval(refreshBrushCount,2500);
                            }else{
                                vm.modalMessage = "啊哦~ 服务器被坏人抱走了~";
                                $('#btn-modal').click();
                            }
                        }
                    });
            }
        }
    });

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
</script>
</html>