<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>LDeep旅店管理系统注册页面</title>
<link
	href="${pageContext.request.contextPath }/resources/home/css/login.css"
	type="text/css" rel="Stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/home/css/regsiter.css"
	type="text/css" rel="Stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/home/css/index.css"
	type="text/css" rel="Stylesheet" />
<style>
#ad>ul {
	margin: 0;
}
</style>
</head>
<body>
	<!--头部-->

	<header>
		<div>
			<a href=""><img
				src="${pageContext.request.contextPath }/resources/home/images/logo-1.jpg"
				alt=""> </a> <span>注册</span>
		</div>

	</header>
	<!--中间部分-->
	<div id="reg">
		<!---温馨提示-->
		<div class="msg">
			<div class="panel">
				<form id="user_info">
					<div class="form-group">
						<label for="uname">用户名：</label> <input required minlength="3"
							maxlength="9" type="text" placeholder="请输入用户名" autofocus
							name="name" id="uname" onkeyup="checkUsername();"/> 
						<span id="unameMsg"></span><font color="#999999">用户名请设置3-9位字符</font>
					</div>
					<div class="form-group">
						<label for="upwd">密码：</label> <input type="password" minlength="6"
							maxlength="12" placeholder="请输入密码" name="password" id="upwd" onkeyup="checkPassword();"/>
						<span id="upwdMsg"></span><font color="#999999">密码请设置6-12位字符</font>
					</div>
					<div class="form-group">
						<label for="upwd2">确认密码：</label> <input type="password"
							placeholder="再次输入密码" id="upwd2" onkeyup="checkConfirm();"/> 
						<span id="upwd2Msg"></span>
					</div>
					<div class="form-group">
						<label for="uphone">手机：</label> <input required type="tel"
							placeholder="请输入手机号码" name="mobile" maxlength="11" id="uphone" onkeyup="checkPhone();"/>
						<span id="uphoneMsg"></span><font color="#999999">号码请设置11位数字</font>
					</div>
					<div>
						<div class="form-group">
							<label></label> <input type="button" value="提交注册信息" id="btn_reg"
								style="cursor: pointer;" />
						</div>
					</div>

				</form>
			</div>
			<div id="ad">
				<p>注册会员后，你可以:</p>
				<ul>
					<li><b>1</b>查询，计划您的订单</li>
					<li><b>2</b>预订美食，客房</li>
					<li><b>3</b>享受超低优惠折扣</li>
				</ul>
				-->
				<div class="login">
					已有账号，去 <a href="login">登陆</a>
				</div>
				<ul id="trigger">
					<li><img
						src="${pageContext.request.contextPath }/resources/home/images/new1.png"
						alt=""></li>
				</ul>

			</div>
		</div>
	</div>
	<%@include file="../common/footer.jsp"%>
	<script
		src="${pageContext.request.contextPath }/resources/home/js/jquery-1.11.3.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/home/js/form.js"></script>
	<script>
		$('#btn_reg').click(function() {
			if (!checkForm()) {
				return;
			}
			//表单序列化，获得所有的用户输入，根据name属性
			var data = $('#user_info').serialize();

			//异步提交请求数据
			$.ajax({
				type : 'POST',
				dataType : 'json',
				url : 'reg',
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
		})

		/*功能点2：轮播*/
		var pic = {
			intr : function() {
				var i = 1;
				var str1 = $("#trigger img").attr("src");
				var str = str1.toString();
				var timer = setInterval(function() {
					i++;
					if (i > 3) {
						i = 1;
					}
					str = str.replace(/[1-3]/, i);
					$("#trigger img").attr("src", str);
				}, 2000);
			}
		}
		pic.intr();
	</script>

</body>
</html>
