<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="loading" style="position:absolute;z-index:10;top:0px;left:0px;width:100%;height:100%;background:#F9F9F9;text-align :center;">
     <img src="../../resources/admin/easyui/images/1441607117423593.gif" width="40%">
     <h1><font color="#15428B">加载中....</font></h1>
</div>
</body>
<script>
    var pc; 
    //不要放在$(function(){});中
    $.parser.onComplete = function () {
        if (pc) clearTimeout(pc);
        pc = setTimeout(closes, 1000);
    } 

    function closes() {
        $('#loading').fadeOut('normal', function () {
            $(this).remove();
        });
    }
</script>