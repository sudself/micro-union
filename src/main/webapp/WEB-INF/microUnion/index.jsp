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
<div class="col-xs-12" style="height:5%;"> </div> 
<table style="vertical-align：middle;width:100%;"><tr><td>
<div class="pageSizeFormat homeIndex">
<div class="container">

  <div class="row"> 
    <div class="col-xs-5 col-xs-offset-1 col-sm-5 col-sm-offset-1 col-md-3 col-md-offset-0"> 
        <a href="${basePath }/sampleInput/sampleType/index.action"> 
            <img src="${basePath }/images/micro/标本录入1.png" onmouseover="chooseImgClass(this,0);" onmouseout="chooseImgClass(this,1);"  class="img-responsive"  alt="标本录入" title="标本录入"> 
        </a> 
        <div class="caption img-responsive" style="color:#6f7b8a;text-align:center;max-width:250px;">标本录入</div>
    </div> 
    <div class="col-xs-5  col-sm-5  col-md-3"> 
        <a href="${basePath}/experiment/index.action"> 
            <img src="${basePath }/images/micro/标本处理1.png" onmouseover="chooseImgClass(this,0);" onmouseout="chooseImgClass(this,1);" class="img-responsive" alt="标本处理" title="标本处理"> 
        </a> 
        <div class="caption img-responsive" style="color:#6f7b8a;text-align:center;max-width:250px;">标本处理</div>
    </div> 
    <div class="col-xs-5 col-xs-offset-1 col-sm-5 col-sm-offset-1 col-md-3 col-md-offset-0"> 
        <a href="#"> 
            <img src="${basePath }/images/micro/结果判读1.png" onmouseover="chooseImgClass(this,0);" onmouseout="chooseImgClass(this,1);" class="img-responsive" alt="结果判读" title="结果判读"> 
        </a> 
        <div class="caption img-responsive" style="color:#6f7b8a;text-align:center;max-width:250px;">结果判读</div>
    </div> 
    <div class="col-xs-5  col-sm-5 col-md-3"> 
        <a href="${basePath}/analysisAction/index.action"> 
            <img src="${basePath }/images/micro/统计分析1.png"  onmouseover="chooseImgClass(this,0);" onmouseout="chooseImgClass(this,1);" class="img-responsive" alt="统计分析" title="统计分析"> 
        </a> 
        <div class="caption img-responsive" style="color:#6f7b8a;text-align:center;max-width:250px;">统计分析</div>
    </div> 
</div>
</div>
</div>
</td>
</tr>
</table>
</body>

</html>