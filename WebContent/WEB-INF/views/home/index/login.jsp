<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>LDeep旅店管理系统登录页面</title>
		<link rel="stylesheet" href="../layui/css/layui.css">
		<style type="text/css">
			.container {
				width: 520px;
				height: 520px;
				min-height: 320px;
				max-height: 420px;
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

			.verity {
				width: 150px;
			}

			.font-set {
				font-size: 15px;
				text-decoration: none;
				color: red;
			}

			a:hover {
				text-decoration: underline;
			}
			.reg {
				margin-left: 300px;
			}
		</style>
	</head>
	<body>
		
			<div class="container">
				<button id="close" class="layui-btn layui-btn-danger" title="关闭">X</button>
				<div class="layui-form-mid layui-word-aux">
					<img id="logoid" src="${pageContext.request.contextPath }/resources/home/images/loginLogo.png" height="150" width="300">
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-block">
						<input id="name" type="text" name="name" required lay-verify="required" placeholder="请输入用户名"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">密 &nbsp;&nbsp;码</label>
					<div class="layui-input-inline">
						<input id="password" type="password" name="password" required lay-verify="required" placeholder="请输入密码"
							autocomplete="off" class="layui-input">
					</div>
					<!-- <div class="layui-form-mid layui-word-aux">辅助文字</div> -->
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">验证码</label>
					<div class="layui-input-inline">
						<div><input type="text" id="vcode" required lay-verify="required" placeholder="请输入验证码"
							autocomplete="off" class="layui-input verity"></div>
					</div>
					 <div class="layui-form-mid layui-word-aux"><img id="cpacha-img"
						src="${pageContext.request.contextPath }/system/get_cpacha?vl=4&w=173&h=33&type=accountLoginCpacha"
						onclick="changeVcode();" class="code" style="cursor: pointer;" /></div> 

				</div>
				<!-- 			  <div class="layui-form-item">
						    <label class="layui-form-label">记住密码</label>
						    <div class="layui-input-block">
						      <input type="checkbox" name="close" lay-skin="switch" lay-text="ON|OFF">
						    </div>
					  </div> -->

				<div class="layui-form-item">
					<div class="layui-input-block">
						<button id="bt_login" class="layui-btn layui-bg-cyan">登陆</button>
					</div>
				</div>
				<div class="reg">没有账号?<a href="reg" class="font-set">立即注册</a></div>
			</div>
		
		<script src="${pageContext.request.contextPath }/resources/home/js/jquery-1.11.3.js"></script>
		<script type="text/javascript" src="../layui/layui.js"></script>
		<script>
			//更换验证码
			function changeVcode() {
				$("#cpacha-img").attr(
						"src",
						'${pageContext.request.contextPath }/system/get_cpacha?vl=4&w=173&h=33&type=accountLoginCpacha&t='
								+ new Date().getTime());
			}
			layui.use(['layer', 'form', 'laydate'], function() {
				var form = layui.form,
					layer = layui.layer,
					laydate = layui.laydate;
				
				
				
				//提交数据
				$(document).ready(function() {
					$("#bt_login").click(function() {
						//获得所有的用户输入，根据id属性
						var name = $("#name").val();
						var password = $("#password").val();
						var vcode = $("#vcode").val();
						if (name == '' || password == '' || vcode == '') {
							//alert('请填写完成信息再提交!');
							layer.msg('请填写完成信息再提交!');
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
									alert(data.msg);
									changeVcode();
								}
							}
						});
					});
					$("#close").click(function() {
						window.location.href = 'index';
					});
				});
			});
			</script>
	</body>
</html>
