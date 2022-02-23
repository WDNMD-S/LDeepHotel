<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>预定房间</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/home/css/index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/home/css/order.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/home/css/jquery-ui.min.css">
</head>
<body>
	<!--- 页头--->
	<div id="c_header"></div>
	<!----主体-->
	<div id="section">
		<!--客房信息-->
		<div class="hotel_inf_w">

			<div class="hotel_roominfobox">
				<a href="#"><img src="${roomType.photo }" alt="" /></a>
				<div class="info">
					<!-- 房间名称 -->
					<h2>${roomType.name }</h2>
					
				</div>
				<ul class="hotel_detail">
					<li><span>预定数:</span>${roomType.bookNum }</li>
					<li><span>房价:</span>${roomType.price }</li>
					<li><span>床位数:</span>${roomType.bedNum }</li>
					<li><span>可住:</span>${roomType.liveNum }人</li>
					<li><span>其他:</span>${roomType.remark }</li>
				</ul>
			</div>
			<div class="jump">

				<a href="../index">更多房型</a>
			</div>
		</div>
		<!--预定信息-->
		<div class="book_info">
			<form id="order_info">
				<ul>
					<li>
						<h3>预定信息</h3>

						<div class="info_group">
							<label>入住时间</label><input type="date" name="arriveDate"
								id="arriveDate" min=""/>
							<label>离店时间</label><input type="date" name="leaveDate" 
								id="leaveDate" />
						</div>

						<div class="info_group">
							<label>房费总计</label><span class="total">￥${roomType.price }</span>
							<input type="hidden" value="0" />
						</div>
					</li>
					<li>
						<h3>入住信息</h3>

						<div class="info_group">
							<label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</label><input
								type="text" name="name" id="name" value="${account.realName}" onkeyup="checkUsername();"/>
								<span id="nameMsg"></span><label>(默认为自己)</label>
						</div>
						<div class="info_group">
							<label>电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话</label><input
								type="text" maxlength="11" name="mobile" id="mobile"
								value="${account.mobile}" onkeyup="checkPhone();"/>
								<span id="phoneMsg"></span>
						</div>
						<div class="info_group">
							<label>身份证号</label><input type="text" name="idCard" id="idCard"
								value="${account.idCard}" onkeyup="checkId();"/>
								<span id="idMsg"></span>
						</div>
						<div class="info_group">
							<label for="massage">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</label>
							<textarea id="remark" name="remark" style="width: 200px;"></textarea>
						</div>

					</li>
					<li>
						
						<div id="btn_booking">确认预定</div>

					</li>
				</ul>
			</form>
		</div>

		<div class="malog">
			<div class="message">
				<p class="msgs"></p>
				<p>
					您可以在 我的订单查看详情
				</p>
				<p>
					系统会在<span class="num">5</span>秒后跳转会 <a href="./index">我的订单</a>
				</p>
			</div>
		</div>

	</div>
	<!----页底--->
	<div id="c_footer"></div>
	<script src="${pageContext.request.contextPath }/resources/home/js/jquery-1.11.3.js"></script>
	<script src="${pageContext.request.contextPath }/resources/home/js/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/home/js/form_order.js"></script>
</body>
<script>
	$(document).ready(function(){
		var now = new Date();
		var year = now.getFullYear();
		var month = now.getMonth()+1 < 10 ? "0"+(now.getMonth()+1) : (now.getMonth()+1);
		var day = now.getDate() < 10 ? "0"+(now.getDate()) : (now.getDate());
		$("#arriveDate").attr("min",year+"-"+month+"-"+day);
		$("#leaveDate").attr("min",year+"-"+month+"-"+day);
	});
	
	$(function() {
		$("#btn_booking").click(function() {
			var arriveDate = $("#arriveDate").val();
			var leaveDate = $("#leaveDate").val();
			
			if (arriveDate == '' || leaveDate == '') {
				alert('请选择时间!');
				return;
			}
			if(arriveDate > leaveDate){
				alert('请选择正确的时间');
				return;
			}
			
			if(!checkForm()){
				return;
			}
			
			$.ajax({
				url : 'book_order',
				type : 'post',
				dataType : 'json',
				data : {
					roomTypeId : '${roomType.id }',
					name : $("#name").val(),
					mobile : $("#mobile").val(),
					idCard : $("#idCard").val(),
					remark : $("#remark").val(),
					arriveDate : arriveDate,
					leaveDate : leaveDate
				},
				success : function(data) {
					if (data.type == 'success') {
						$(".malog").show();
						setTimeout(function() {
							window.location.href = 'index';
						}, 5000)
					} else {
						alert(data.msg);
					}
				}
			});
		})
	});
</script>
</html>