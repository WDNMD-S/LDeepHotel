<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link href="${pageContext.request.contextPath }/resources/home/css/reservation.css" type="text/css" rel="Stylesheet"/>
  <link href="${pageContext.request.contextPath }/resources/home/css/index.css" type="text/css" rel="Stylesheet"/>
<title>LDeep旅店管理系统首页</title>
</head>
<body>
<!--头部-->
<div id="c_header"></div>
<!--主体内容-->
<section>
  <div id="subject">
<p style="float:right;margin-top: 10px;">
	<c:if test="${account == null }">
		<a href="../home/login">登录</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		<a href="../home/reg">注册</a>&nbsp;
	</c:if>
	<c:if test="${account != null }">
		<font color="red">欢迎您：${account.name }&nbsp;&nbsp;|&nbsp;&nbsp;</font>
		<a href="../home/account/index">用户中心</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		<a href="../home/logout">注销登录</a>&nbsp;
	</c:if>
</p>
    <img src="${pageContext.request.contextPath }/resources/home/images/index.jpg" alt="" height="500px" width="1200px">
    <!--遮罩-->
    <ul class="shade_mag">
      <li><img style="width: 66px;height: 33px;" src="${pageContext.request.contextPath }/resources/home/images/p1.png" alt=""></li>
      <li><img style="width: 66px;height: 33px;" src="${pageContext.request.contextPath }/resources/home/images/p2.png" alt=""></li>
      <li><img style="width: 66px;height: 33px;" src="${pageContext.request.contextPath }/resources/home/images/p3.png" alt=""></li>
    </ul>
    
  </div>


  <!---->
  <!---预订菜单--->
  <div id="due_menu">
    <!--关于-->
    
    <!--客房-->
    <div id="guest_rooms">
      <p class="booking_tab"><span></span>客房列表</p>
      <div class="chioce">
        <input type="text" placeholder="关键字"  value="${kw }" id="kw"/>
        <input type="button" value="搜索" id="search-btn"/>
      </div>
      <form style="display:none;" action="index" method="get" id="search-form"><input type="hidden" name="name" id="search-name"></form>
      <!--列表-->
      <table id="pro_list" >
        <thead>
          <tr>
            <th width="200px">客房</th>
            <th>房型</th>
            <th>可住人数</th>
            <th>床位数</th>
            <th>房价</th>
            <th>房态</th>
            <th>预订</th>
          </tr>
        </thead>
        <tbody >
        <!-- 遍历房间信息 -->
        <c:forEach items="${roomTypeList }" var="roomType">
        <tr>
          <td><a href="#"><img src="${roomType.photo }" alt=""></a></td>
          <td align="center">
            <p>${roomType.name }</p>
            <p class="sub_txt">${roomType.remark }</p>
          </td>
          <td>${roomType.liveNum }</td>
          <td>${roomType.bedNum }</td>
          <td>${roomType.price }</td>
          <td>
          	<c:if test="${roomType.status == 0 }">
          		已满房
          	</c:if>
          	<c:if test="${roomType.status == 1 }">
          		可预订
          	</c:if>
          </td>
          <td>
          	<c:if test="${roomType.status == 0 }">
          		<input type="button" class="disable" value="满房" >
          	</c:if>
          	<c:if test="${roomType.status == 1 }">
          								<!-- http://localhost:8080/HotelSSM/home/account/book_order -->
          		<input type="button" value="预订" onclick="window.location.href='account/book_order?roomTypeId=${roomType.id }'" >
          	</c:if>
          </td>
        </tr>
		</c:forEach>
        </tbody>
      </table>
      
      <div id="pages"></div>
      <!--  -列表菜单 -->
      <div></div>
    </div>
  </div>

</section>
<%@include file="../common/footer.jsp"%>
<script src="${pageContext.request.contextPath }/resources/home/js/jquery-1.11.3.js"></script>
<script>
$(document).ready(function(){
	$("#search-btn").click(function(){
		$("#search-name").val($("#kw").val());
		$("#search-form").submit();
	})
});
</script>
</body>