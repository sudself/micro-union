<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<c:set var="sampleTypeId" value='<%=Integer.parseInt(request.getParameter("id"))%>' />
<script type="text/javascript">
	var basepath = "${basePath}";
</script>
<div class="container">
	<form class="form-horizontal" role="form"> 
	<div id="sampleInputData">
    <div class="form-group"> 
        <label for="hospitalCode" class="col-xs-3 col-sm-3 col-md-2 control-label">扫描条码</label> 
        <div class="col-xs-7 col-sm-8 col-md-6"> 
            <input type="text" class="form-control" id="hospitalCode" placeholder="扫描条码"> 
        </div> 
    </div> 
    <c:if test="${sampleTypeId==1}">
    <div class="form-group"> 
        <label for="lastname" class="col-xs-3 col-sm-3 col-md-2 control-label">扫描瓶身条码(血，脑，体）</label> 
        <div class="col-xs-7 col-sm-8 col-md-6"> 
            <input type="text" class="form-control" id="bottleCode" placeholder="扫描瓶身条码(血，脑，体）">
        </div> 
    </div> 
    </c:if>
    <div class="form-group"> 
        <label class="col-xs-3 col-sm-3 col-md-2 control-label"></label> 
        <div class="col-xs-7 col-sm-8 col-md-6"> 
            <button type="submit" class="btn btn-info">添加备注信息</button> 
        </div> 
    </div> 
    </div>
    <div id="sampleInputNote">
        
    </div>
</form>
</div>
<script src="${basePath}/staticjs/microUnion/sampleScan.js"></script>