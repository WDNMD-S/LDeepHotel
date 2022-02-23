<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>LDeep旅店管理系统用户中心</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/home/css/index.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/home/css/myOrder.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css"/>
</head>
<body>
    <!--头部-->
    <div id="c_header"></div>
    <!--主体-->
    <div id="contain">
        <!--tab选项卡-->
      <ul class="tabs">
       
       	<li><a href="#index">个人主页</a></li>
        <li><a href="#order">我的订单</a></li>
        <li><a href="#info">修改资料</a></li>
        <li><a href="#pwd">修改密码</a></li>
        <li><a href="../index">返回首页</a></li>

      </ul>

      <div class="content">
      
        <div class="index">
        	<h3>欢迎您！客户<font color="red">${account.name }</font>,您的信息如下：</h3>
        	<form>
        		<table style="width: 50%;border-collapse:separate; border-spacing:20px;">
        			<tr>
        				<td>真实姓名：</td>
        				<td>${account.realName}</td>
        			</tr>
        			<tr>
        				<td>手机号码：</td>
        				<td>${account.mobile}</td>
        			</tr>
        			<tr>
        				<td>联系地址：</td>
        				<td>${account.address}</td>
        			</tr>
        			<tr>
        				<td>总订单数：</td>
        				<td>${fn:length(bookOrderList) }</td>
        			</tr>
        		</table>
        	</form>
        </div>
        
        <div class="order" style="display: block;">
          <table>
            <thead>
            <tr>
              <!--<th colspan="4">订单编号：</th>-->
              <!--<th colspan="2" >订单时间:</th>-->
              <th>房型图片</th>
              <th>房型</th>
              <th>价格</th>
              <th>入住人</th>
              <th>手机号</th>
              <th>身份证号</th>
              <th>状态</th>
              <th>下单时间</th>
              <th>备注</th>
            </tr>
            </thead>
            <tbody>
               <c:forEach items="${bookOrderList }" var="bookOrder">
               <tr>
					<c:forEach items="${roomTypeList }" var="roomType">
						<c:if test="${roomType.id == bookOrder.roomTypeId }">
							<td><img src="${roomType.photo }" width="100px"></td>
							<td>${roomType.name }</td>
							<td>${roomType.price }</td>
						</c:if>
					</c:forEach>
					<td>${bookOrder.name }</td>
					<td>${bookOrder.mobile }</td>
					<td>${bookOrder.idCard }</td>
					<td>
						<c:if test="${bookOrder.status == 0 }">
			          		<font color=#009688>预定中</font><br/><a style="margin-top: 10px;" href="book_cancel?id=${bookOrder.id }" class="layui-btn layui-btn-sm layui-bg-cyan" onclick="return cancel();">退订</a>
			          	</c:if>
			          	<c:if test="${bookOrder.status == 1 }">
			          		<font color=#01AAED>已入住</font>
			          	</c:if>
			          	<c:if test="${bookOrder.status == 2 }">
			          		已结算离店
			          	</c:if>
			          	<c:if test="${bookOrder.status == 3 }">
			          		<font color=#FF5722>已退订</font>
			          	</c:if>
					</td>
					<td><fmt:formatDate value="${bookOrder.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>${bookOrder.remark }</td>
               </tr>
               </c:forEach>
            </tbody>
          </table>
          
        </div>
        <div class="info" >
          <form id="update-info-form">
          <table style="border:0px;cellspacing:0px;">
            <tbody>
               <tr>
					<td style="border:0px;">用户名：</td><td style="float:left;width:400px;max-width: 420px;border:0px;"><input class="form-control" type="text" value="${account.name}" name="name" /></td>
               </tr>
			   <tr style="border:0px;">
					<td style="border:0px;">真实姓名：</td><td style="float:left;width:400px;max-width: 820px;border:0px;"><input class="form-control" type="text" value="${account.realName}" name="realName" /></td>
               </tr>
			   <tr>
					<td style="border:0px;">身份证号：</td><td style="float:left;width:400px;max-width: 820px;border:0px;"><input class="form-control" type="text" value="${account.idCard}" name="idCard" /></td>
               </tr>
			   <tr>
					<td style="border:0px;">手机号码：</td><td style="float:left;width:400px;max-width: 820px;border:0px;"><input class="form-control" type="text" value="${account.mobile}" name="mobile" /></td>
               </tr>
			   <tr>
					<td style="border:0px;">联系地址：</td><td style="float:left;width:400px;max-width: 820px;border:0px;"><input class="form-control" type="text" value="${account.address}" name="address" /></td>
               </tr>
			   <tr>
					<td style="border:0px;"></td><td style="float:left;margin-top:15px;width:400px;max-width: 820px;border:0px;"><button type="button" id="update-info-btn" class="btn btn-success" style="width:100px;">提交</button></td>
               </tr>
            </tbody>
          </table>
          </form>
        </div>
		<div class="pwd" >
          <table style="border:0px;cellspacing:0px;">
            <tbody>
               <tr>
					<td style="border:0px;">原密码：</td><td style="float:left;width:400px;max-width: 420px;border:0px;"><input class="form-control" type="password" id="old-password" /></td>
               </tr>
			   <tr style="border:0px;">
					<td style="border:0px;">新密码：</td><td style="float:left;width:400px;max-width: 820px;border:0px;"><input class="form-control" type="password" id="new-password" /></td>
               </tr>
			   <tr>
					<td style="border:0px;">重复密码：</td><td style="float:left;width:400px;max-width: 820px;border:0px;"><input class="form-control" type="password" id="renew-password" /></td>
               </tr>
			   
			   <tr>
					<td style="border:0px;"></td><td style="float:left;margin-top:15px;width:400px;max-width: 820px;border:0px;"><button type="button" class="btn btn-success" id="update-password-btn" style="width:100px;">提交</button></td>
               </tr>
            </tbody>
          </table>
          
        </div>
      </div>

    </div>
    <!--底部-->
    <div id="c_footer"></div>
	<script src="${pageContext.request.contextPath }/resources/home/js/jquery-1.11.3.js"></script>
 <script>
	$(".tabs").on("click","li a",function(){
    $(this).addClass("active").parents().siblings().children(".active").removeClass("active");
    var href=$(this).attr("href");
    href=href.slice(1);
    var $div=$("div.content>div."+href);
     $div.show().siblings().hide();
    //修改个人信息
     $("#update-info-btn").click(function(){
    	$.ajax({
    		url:'update_info',
    		type:'post',
    		dataType:'json',
    		data:$("#update-info-form").serialize(),
    		success:function(result){
    			if (result.type == 'success') {
					alert(result.msg);
					//页面跳转
					window.location.href = 'index';
				} else {
					alert(result.msg);
				}
    		}
    	});
    });
    //修改密码
    $("#update-password-btn").click(function(){
    	var oldPassword = $("#old-password").val();
    	var newPassword = $("#new-password").val();
    	var renewPassword = $("#renew-password").val();
    	if(oldPassword == ''){
    		alert('请填写原密码！');
    		return;
    	}
    	if(newPassword == ''){
    		alert('请填写新密码！');
    		return;
    	}
    	if(newPassword != renewPassword){
    		alert('两次密码不一致！');
    		return;
    	}
    	$.ajax({
    		url:'update_pwd',
    		type:'post',
    		dataType:'json',
    		data:{oldPassword:oldPassword,newPassword:newPassword},
    		success:function(result){
    			if (result.type == 'success') {
					alert(result.msg);
					//页面跳转
					window.location.href = 'index';
				} else {
					alert(result.msg);
				}
    		}
    	});
    });
    
});
	
	//退订
	function cancel(){
		var flag = confirm("是否确认退订");
		if(flag){
			return true;
		}
		return false;
	} 
	
</script>
    
</body>
</html>