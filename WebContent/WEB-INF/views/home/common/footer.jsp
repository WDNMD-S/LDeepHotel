<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--底部-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script type="text/javascript" >
	layui.use(['layer', 'util'], function() {
		var layer = layui.layer,
		util = layui.util;
		util.fixbar({
			bar1: '&#xe716'
			,css: {right: 50, bottom: 100}
			,click: function(type) {
				console.log(type);
				if (type === 'bar1') {
					window.location.href = "${pageContext.request.contextPath }/system/login"
				}
			}
		});
	});
</script>
<div id="c_footer" class="clear">
	<p style="text-align: center;">
			  <a href="${pageContext.request.contextPath }/home/index">首页</a>|
		      <a href="#">关于我们</a>|
			  <a href="#">隐私协议</a>
	</p>
</div>