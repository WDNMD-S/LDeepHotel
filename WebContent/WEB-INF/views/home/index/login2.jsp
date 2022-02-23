<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>酒店管理系统登录页面</title>
<link href="${pageContext.request.contextPath }/resources/home/css/index.css" type="text/css" rel="Stylesheet" />
<link href="${pageContext.request.contextPath }/resources/home/css/login.css" type="text/css" rel="Stylesheet" />
</head>
<body>

	<header>
		<div>
			<a href="index.html"><img
				src="${pageContext.request.contextPath }/resources/home/images/logo-1.jpg" alt=""></a> <span>会员登录</span>
		</div>
	</header>
	
	<section>
		<div class="left">
			<img src="${pageContext.request.contextPath }/resources/home/images/index.jpg" alt="旅店宣传图片">
		</div>
		
		<div class="login">
			<div id="normal">
				<ul id="nor_log">
					<li class="name" style="margin-top: 25px;"><input id="name"
						name="uname" type="text" placeholder="请输入用户名"> <span
						class="icon"></span></li>
					<li class="pwd" style="margin-top: 25px;"><input id="password"
						name="upwd" type="password" placeholder="请输入密码"> <span
						class="icon"></span></li>
				</ul>
				
				<div class="codes" style="margin-top: 25px;">
					<input id="vcode" maxlength="4" type="text" class="blur"
						placeholder="请输入验证码" /> <img id="cpacha-img"
						src="${pageContext.request.contextPath }/system/get_cpacha?vl=4&w=173&h=33&type=accountLoginCpacha"
						onclick="changeVcode()" class="code" style="cursor: pointer;" />
				</div>
			</div>

			<div class="log" id="bt_login"
				style="margin-top: 25px; cursor: pointer;">登 录</div>

		</div>
		<div class="reg" >
			<a href="reg">立即注册 &gt;&gt;</a>
		</div>
	</section>
	<%@include file="../common/footer.jsp"%>
	<script src="${pageContext.request.contextPath }/resources/home/js/jquery-1.11.3.js"></script>
	<script>
		//更换验证码
		function changeVcode() {
			$("#cpacha-img").attr(
					"src",
					'${pageContext.request.contextPath }/system/get_cpacha?vl=4&w=173&h=33&type=accountLoginCpacha&t='
							+ new Date().getTime());
		}
		
		//提交数据
		$(document).ready(function() {
			$("#bt_login").click(function() {
				//获得所有的用户输入，根据id属性
				var name = $("#name").val();
				var password = $("#password").val();
				var vcode = $("#vcode").val();
				if (name == '' || password == '' || vcode == '') {
					alert('请填写完成信息再提交!');
					return;
				}
				$.ajax({
					url : 'login',
					type : 'post',
					dataType : 'json',
					data : {
						name : name,
						password : password,
						vcode : vcode
					},
					success : function(data) {
						if (data.type == 'success') {
							window.location.href = 'index';
						} else {
							alert(data.msg)
							changeVcode();
						}
					}
				});
			})
		});
	</script>
</body>
</html>
