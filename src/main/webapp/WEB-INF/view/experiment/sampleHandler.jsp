<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ page language="java" import="com.certus.dao.Detects" %>  --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<c:set var="codeName" value='<%=request.getParameter("codeName")%>' />
<c:set var="childCode" value='<%=request.getParameter("childCode")%>' />
<c:set var="sampleType" value='<%=request.getParameter("sampleType")%>' />

<script type="text/javascript"> 
    var basepath= "${basePath}";
    var childCode = "${childCode}";
    var detectsInfo = <%=request.getSession().getAttribute("detectsInfo")%>;
    
</script>

<style type="text/css">

.labelCss{
    padding: 17px;
    margin-right: auto;
    margin-left: auto;
}

</style>
<div class="container">
<div class="row showType"> 

    <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-8 col-xs-offset-2 " >
         <button type="button" class="btn btn-default btn-lg btn-block" >医院条码：${codeName}</button>
    </div>

</div>
		<div class="form-group"> 
        <label for="hospitalCode" class="col-xs-12 control-label"><h3>标本类型</h3></label> 
        </div>
        <div class="col-xs-12" style="height:2%;"> </div> 
        <div class="form-group"> 
        	<div class="col-xs-6 col-sm-offset-0 col-sm-4  col-md-3">
        	   <a href="${basePath}/experiment/pingban.action?codeName=${codeName}&sampleTypeId=${sampleType}&detectMothod=2" > 
               <img src="${basePath }/images/micro/转种平板1.png" onmouseover="chooseImgClass(this,0);" onmouseout="chooseImgClass(this,1);" class="img-responsive" alt="接种平板" title="接种平板"> 
       		   </a> 
       		    <div class="caption img-responsive" style="color:#6f7b8a;text-align:center;max-width:250px;">接种平板</div>
			</div>
        	<div class="col-xs-offset-0 col-xs-6  col-sm-4 col-md-3">
        	   <a href="${basePath}/experiment/jingjian.action?codeName=${codeName}&sampleTypeId=${sampleType}&detectMothod=1" > 
            	<img src="${basePath }/images/micro/染色镜检1.png" onmouseover="chooseImgClass(this,0);" onmouseout="chooseImgClass(this,1);" class="img-responsive" alt="染色镜检" title="染色镜检"> 
               </a> 
                <div class="caption img-responsive" style="color:#6f7b8a;text-align:center;max-width:250px;">染色镜检</div>
			</div>
			
			<!-- <div class="col-xs-6 col-sm-4 col-md-3">
        	   <a href="${basePath}/experiment/jianding.action?codeName=${codeName}&sampleTypeId=1&detectMothod=3" class="thumbnail"> 
			<div class="col-xs-6 col-sm-offset-0 col-sm-4  col-md-3">
        	   <a href="${basePath}/experiment/pingban.action?codeName=${codeName}&sampleTypeId=${sampleType}&detectMothod=2" class="thumbnail"> 
               <img src="${basePath }/images/micro/转种平板1.png" class="img-responsive" alt="转种平板" title="转种平板"> 
       		   </a> 
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
        	   <a href="${basePath}/experiment/jianding.action?codeName=${codeName}&sampleTypeId=${sampleType}&detectMothod=3" class="thumbnail"> 
            	<img src="${basePath }/images/micro/直接鉴定1.png" class="img-responsive" alt="直接鉴定" title="直接鉴定"> 
       		   </a> 
			</div> -->
   		</div>
 
</div>
<!-- <div class="container">

<div class="row"> 

	<div class="col-md-4 col-sm-3 col-xs-2">
	</div>
	<div class="col-md-4 col-sm-6 col-xs-8">
	     <button type="button" style="width:100%;font-weight:bold;font-size:25px;padding: 8px;">医院条码：${codeName} </button>
	</div>

</div>

<div class="row"> 
    <div class="col-md-4 col-sm-6 col-xs-8">
       <h3>标本处理</h3>
    </div>
</div>

<div class="row">

    <div class="col-md-3 col-sm-6 col-xs-6">
    </div>
    
    <div class="col-md-3 col-sm-6 col-xs-6">
       
       <a href="${basePath}/experiment/jingjian.action?codeName=${codeName}&sampleTypeId=1&detectMothod=1" class="thumbnail"> 
            <img src="${basePath }/images/micro/染色镜检1.png" class="img-responsive"
                 alt="染色镜检" title="染色镜检"> 
       </a> 
    
    </div>
    
    <div class="col-md-3 col-sm-6 col-xs-6">
        <a href="${basePath}/experiment/pingban.action?codeName=${codeName}&sampleTypeId=1&detectMothod=2" class="thumbnail"> 
            <img src="${basePath }/images/micro/转种平板1.png" class="img-responsive"
                 alt="转种平板" title="转种平板"> 
       </a>
    
    </div>
    
     <div class="col-md-3 col-sm-6 col-xs-6">
     
        <a href="${basePath}/experiment/jianding.action?codeName=${codeName}&sampleTypeId=1&detectMothod=3" class="thumbnail"> 
            <img src="${basePath }/images/micro/直接鉴定1.png" class="img-responsive"
                 alt="直接鉴定" title="直接鉴定"> 
       </a>
      
    </div>

</div>

</div>
 -->
<script src="${basePath}/staticjs/experiment/sampleHandler.js?t=<%=Math.random() %>"></script>

