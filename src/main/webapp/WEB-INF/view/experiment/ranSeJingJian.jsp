<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<c:set var="codeName" value='<%=request.getParameter("codeName")%>' />
<c:set var="sampleTypeId" value='<%=request.getParameter("sampleTypeId")%>' />
<c:set var="detectMothod" value='<%=request.getParameter("detectMothod")%>' />

<script type="text/javascript"> 
var basepath= "${basePath}";
var codeName= "${codeName}";
var sampleTypeId= "${sampleTypeId}";
var detectMothod= "${detectMothod}";

</script>

<style type="text/css">

.labelCss{
    padding: 17px;
    margin-right: auto;
    margin-left: auto;
}

.tuPianDiv{
  padding: 9px;
  border:1px solid #0000FF;
  text-align: center;  
  border-radius: 10px;
  margin-top:15px;
}

.toggleClassBackG{
    background-color:#0000CC;
}

.handlerButton{
  background:#66ccff; 
  padding: 9px;
  border:1px solid #0000FF;
  text-align: center; 
  border-radius: 15px;
  margin-top:10px;
}


@media screen and (max-width:400px){
	
    .showType .col-xs-6{
       clear: both;
       width:80%;
       margin-left:10%;
    }
    .showType .col-xs-8{
       min-width:200px;
       clear: both;
       width:80%;
       margin-left:10%;
    }
    .showType .col-xs-offset-2{
       margin-left:0px;
    }
}

@media screen and (mix-width:401px){
	.container {
    	padding-left: 15x; 
    	padding-right: 15px;
    }
}
</style>


<div class="container">

<div class="row showType"> 

    <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-8 col-xs-offset-2 " >
         <button type="button" class="btn btn-default btn-lg btn-block" >医院条码：${codeName}</button>
    </div>

</div>

<div class="row showType"> 
    <div class="col-md-4 col-sm-6 col-xs-8 ">
       <h3>涂片类型选择：</h3>
    </div>
</div>


<div id="rowContainer" class="row showType " >
</div>
<div class="col-xs-12" style="height:3%;"> </div> 
<div class="row showType "  >

    <div class="col-md-3 col-sm-4 col-xs-6">
        <div class="handlerButton" onclick="printCode()" style="cursor:pointer;">确认并打印条码</div>
    </div>
    
    <div class="col-md-3 col-sm-4 col-xs-6" >
       <div class="handlerButton"  onclick="ranSeJingJian()" style="cursor:pointer;">镜检</div>
    </div>
    
    <div class="col-md-3 col-sm-4 col-xs-6">
        <div class="handlerButton" onclick="dealOtherSample()" style="cursor:pointer;">继续处理其他标本</div>
    </div>
    
     <div class="col-md-3 col-sm-4 col-xs-6">
       <div class="handlerButton" onclick="peiYangMin()" style="cursor:pointer;">同时接种培养皿</div>
    </div>

</div>


</div>

<%-- <script src="${basePath}/staticjs/experiment/ranSeJingJian.js?t=<%=Math.random() %>"></script> --%>
<script src="${basePath}/staticjs/experiment/ranSeJingJian.js"></script>

