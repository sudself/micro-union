<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<c:set var="codeName" value='<%=request.getParameter("codeName")%>' />

<script type="text/javascript"> 
var basepath= "${basePath}";
</script>

<style type="text/css">

.labelCss{
    padding: 17px;
    margin-right: auto;
    margin-left: auto;
}

</style>


<div class="container">

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
       
       <a href="${basePath}/experiment/jingjian.action?codeName=${codeName}" class="thumbnail"> 
            <img src="${basePath }/images/sampleHandler/jingjian.png" class="img-responsive"
                 alt="染色镜检" title="染色镜检"> 
       </a> 
    
    </div>
    
    <div class="col-md-3 col-sm-6 col-xs-6">
        <a href="${basePath}/experiment/pingban.action?codeName=${codeName}" class="thumbnail"> 
            <img src="${basePath }/images/sampleHandler/pingban.png" class="img-responsive"
                 alt="转钟平板" title="转钟平板"> 
       </a>
    
    </div>
    
     <div class="col-md-3 col-sm-6 col-xs-6">
     
        <a href="${basePath}/experiment/jianding.action?codeName=${codeName}" class="thumbnail"> 
            <img src="${basePath }/images/sampleHandler/jianding.png" class="img-responsive"
                 alt="直接鉴定" title="直接鉴定"> 
       </a>
      
    </div>

</div>

</div>

<script src="${basePath}/staticjs/experiment/sampleHandler.js?t=<%=Math.random() %>"></script>

