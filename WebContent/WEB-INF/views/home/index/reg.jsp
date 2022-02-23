<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>LDeep旅店管理系统注册页面</title>
<link rel="stylesheet" href="../layui/css/layui.css">
		<style type="text/css">
			.container {
				width: 520px;
				height: 620px;
				min-height: 320px;
				max-height: 550px;
				position: absolute;
				top: 0;
				left: 0;
				bottom: 0;
				right: 0;
				margin: auto;
				padding: 20px;
				z-index: 130;
				border-radius: 8px;
				background-color: #fff;
				box-shadow: 0 3px 18px rgba(100, 0, 0, .5);
				font-size: 16px;
			}

			#close {
				width: 60px;
				font-size: 18px;
				margin-left: 460px;
				margin-top: -10px;
			}

			.layui-input {
				border-radius: 5px;
				width: 370px;
				height: 40px;
				font-size: 15px;
			}

			.layui-form-item {
				margin-left: -20px;
			}

			#logoid {
				margin-top: -40px;
				padding-left: 100px;
			}

			.layui-btn {
				margin-left: -50px;
				border-radius: 5px;
				width: 400px;
				height: 40px;
				font-size: 15px;
			}

			.font-set {
				font-size: 15px;
				text-decoration: none;
				color: red;
			}

			a:hover {
				text-decoration: underline;
			}
			.login {
				margin-left: 300px;
			}
		</style>
	</head>
	<body>
		
			<div class="container">
				<form id="user_info"  method="post">
					<button id="close" class="layui-btn layui-btn-danger" title="关闭">X</button>
					<div class="layui-form-mid layui-word-aux">
						<img id="logoid" src="${pageContext.request.contextPath }/resources/home/images/regLogo.png" height="150" width="300">
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">用户名</label>
						<div class="layui-input-block">
							<input id="uname" type="text" name="name" required lay-verify="required" placeholder="请输入用户名"
								autocomplete="off" class="layui-input" onkeyup="checkUsername();"><span id="unameMsg"></span><font color="#999999">用户名请设置3-9位字符</font>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">密 &nbsp;&nbsp;码</label>
						<div class="layui-input-block">
							<input id="upwd" type="password" name="password" required lay-verify="required" placeholder="请输入密码"
								autocomplete="off" class="layui-input" onkeyup="checkPassword();"><span id="upwdMsg"></span><font color="#999999">密码请设置6-12位字符</font>
						</div>
						<!-- <div class="layui-form-mid layui-word-aux">辅助文字</div> -->
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">确认密码</label>
						<div class="layui-input-block">
							<input id="upwd2" type="password" required lay-verify="required" placeholder="请输入确认密码"
								autocomplete="off" class="layui-input" onkeyup="checkConfirm();"><span id="upwd2Msg"></span><font color="#999999">请确保两次输入的密码相同</font>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">手机号</label>
						<div class="layui-input-block">
							<input id="uphone" type="text" name="mobile" required lay-verify="required" placeholder="请输入手机号"
								autocomplete="off" class="layui-input" onkeyup="checkPhone();"><span id="uphoneMsg"></span><font color="#999999">号码请设置11位数字</font>
						</div>
					</div>
				</form>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button id="btn_reg" class="layui-btn layui-bg-cyan">注册</button>
					</div>
				</div>
				<div class="login">已有账号?<a href="login" class="font-set">立即登录</a></div>
			</div>
		
		<script src="${pageContext.request.contextPath }/resources/home/js/jquery-1.11.3.js"></script>
		<script src="${pageContext.request.contextPath }/resources/home/js/form.js"></script>
		
		<script>
			$("#close").click(function() {
				window.location.href = 'index';
			});
			$('#btn_reg').click(function() {
				if (!checkForm()) {
					return;
				}
				//表单序列化，获得所有的用户输入，根据name属性
				var data = $('#user_info').serialize();
	
				//异步提交请求数据
				$.ajax({
					url : 'reg',
					type : 'post',
					dataType : 'json',
					data : data,
					success : function(result) {
						//console.log(result);
						if (result.type == 'success') {
							alert('注册成功！');
							//页面跳转
							location.href = 'login';
						} else {
							alert(result.msg)
						}
					}
				});
			});
		</script>
	</body>
</html>