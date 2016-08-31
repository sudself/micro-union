<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>微联·首页</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta content="" name="description">
<meta content="" name="author">

</head>
<body >
<div style="background-color:  rgba(76, 194, 196, 0.81);">
<div class="pageSizeFormat homeIndex">
<div class="container">

  <div class="row"> 
    <div class="col-xs-12 col-sm-6 col-md-6"> 
        <a href="${basePath }/sampleInput/sampleType/index.action" class="thumbnail"> 
            <img src="${basePath }/images/micro/IndexPage1.jpg"  class="img-responsive"
                 alt="标本录入" title="标本录入"> 
        </a> 
    </div> 
    <div class="col-xs-12 col-sm-6 col-md-6"> 
        <a href="${basePath}/experiment/index.action" class="thumbnail"> 
            <img src="${basePath }/images/micro/IndexPage2.jpg" class="img-responsive"
                 alt="标本处理" title="标本处理"> 
        </a> 
    </div> 
    <div class="col-xs-12 col-sm-6 col-md-6"> 
        <a href="#" class="thumbnail"> 
            <img src="${basePath }/images/micro/IndexPage1.jpg" class="img-responsive"
                 alt="结果判读" title="结果判读"> 
        </a> 
    </div> 
    <div class="col-xs-12 col-sm-6 col-md-6"> 
        <a href="#" class="thumbnail"> 
            <img src="${basePath }/images/micro/IndexPage1.jpg" class="img-responsive"
                 alt="统计分析" title="统计分析"> 
        </a> 
    </div> 
</div>
</div>
</div>
</div>
</body>

</html>