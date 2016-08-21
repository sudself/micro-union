<%@page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" /><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>赛云</title>
<link href="${basePath}/css/common.css" rel="stylesheet"  type="text/css"/>
<link href="${basePath}/css/main.css" rel="stylesheet"  type="text/css"/>
<script type="text/javascript" src="${basePath}/staticjs/jquery-1.8.2.min.js"></script>

<script type="text/javascript">
</script>
</head>

<body>
<!--顶部 Begin-->
<jsp:include page="head.jsp" />
<!--顶部 End-->
<div class="main">
	
    <div class="fre">
        <!--左边 Menu Begin-->
        <div class="left_box">
            <div class="left_box_head">电商详情</div>
            <ul class="left_menu_list">
                <li><a href="javascript:#;" class="on">小型电商</a></li>
                <li><a href="javascript:#;">中型电商</a></li>
                <li><a href="javascript:#;">大型电商</a></li>
            </ul>
        </div>
        <!--左边 Menu End-->
        <!--右边  Begin-->
        <div class="right_box">
            <div class="right_box_head" >
            <a href="${basePath}/index.action">首页</a><font>></font><a href="#">行业云</a><font>></font><a href="#">小型电商</a>
            </div>
            <!--内容可编辑区域 开始-->
            <div class="right_box_content">
            	<div class="ele_business_details_box">
                	<div class="ele_business_details_box_con">
                    	<p>•每日的PV值小于300万的，我们定义为小型电商。</p>
                       	<p>•小型电商一般单台服务器就能购承担。</p>
                    	<p class="text">•数据规划</p>
                    	<p>•随着负载的增大，存储会比较快出现瓶颈。</p>
                        <p>•若业务中需要加载的图片等静态资源较多，可以将此类静态资源存放到开放存储中，减轻云主机磁盘的压力。</p>
                        <p>•开放存储可以采用swift存储。</p>
                        <p>•RDS可以随着交易等事务型的负载的的增长而升级。</p>
                        <p class="text">•网络资源</p>
                        <p>•业务域与数据域可以部署在同一个私网内</p>
                        <p>•安全性及灾备</p>
                        <p>•云主机、RDS的灾备都可以用热备来实现，可以由云平台来完成。</p>
                        <a href="#" >立即购买</a><a href="#"  class="ele_btn">用户定制</a>
                    </div>
            		<div class="ele_business_details_box_pic"><img src="${basePath}/images/index/topology1.png" /></div>
                </div>
            </div>
            <!--内容可编辑区域 结束-->
        </div>
    </div>
    <!--右边  End-->
    
</div>
<div class="footer">云运营平台 版权所有 Copyright @ 2014 All Rights Reserved</div>
</body>
</html>
