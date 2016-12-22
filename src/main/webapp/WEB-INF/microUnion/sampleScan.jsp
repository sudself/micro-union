<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<c:set var="bottomcode" value='<%=Integer.parseInt(request.getParameter("bottomcode"))%>' />
<c:set var="typeId" value='<%=Integer.parseInt(request.getParameter("id"))%>' />
<script type="text/javascript">
	var basepath = "${basePath}";
	var bottomcode="${bottomcode}";
	var typeId="${typeId}";
</script>
<div class="container">
	<form class="form-horizontal" role="form"> 
	<div id="sampleInputData">
	<div class="form-group"> 
	<span class="glyphicon glyphicon-plus"></span>
        <label for="hospitalCode" class="col-xs-5 col-sm-4 col-md-3 control-label"><h3>标本录入</h3></label> 
        <div class="col-xs-7 col-sm-8 col-md-6"> 
        </div> 
    </div> 
    <div class="form-group"> 
        <label for="hospitalCode" class="col-xs-5 col-sm-4 col-md-3 control-label">扫描条码</label> 
        <div class="col-xs-7 col-sm-8 col-md-6"> 
            <input type="text" class="form-control" id="hospitalCode" placeholder="扫描条码"  onkeypress="javascript:return doAction();"> 
        </div> 
    </div> 
    <c:if test="${bottomcode==1}">
    <div class="form-group"> 
        <label for="lastname" class="col-xs-5 col-sm-4 col-md-3 control-label">扫描瓶身条码(血，脑，体）</label> 
        <div class="col-xs-7 col-sm-8 col-md-6"> 
            <input type="text" class="form-control" id="bottleCode" placeholder="扫描瓶身条码(血，脑，体）"  onkeypress="javascript:return doAction2();">
        </div> 
    </div> 
    </c:if>
    <div class="form-group"> 
        <label class="col-xs-5 col-sm-4 col-md-3 control-label"></label> 
        <div class="col-xs-7 col-sm-8 col-md-6"> 
            <button type="button" class="btn btn-info" onclick="queryRmarksList()">添加备注信息</button> 
        </div> 
    </div> 
    </div>
    <div id="sampleInputNote" style="display:none;">
    	<div class="form-group"> 
        	<label for="hospitalCode" class="col-xs-6"><h3>标注备注信息</h3></label> 
    	</div> 
       <div class="form-group"> 
        <div class="col-xs-6 dangerNote" >
            <h4><label for="name" style="font-weight:bold;font-size: 14px;">拒收血培养标本 <i class="icon-check-empty"></i></label></h4>
            <div id="dangerNote"></div> 
        </div>
        <div class="col-xs-6 infoNote" >
        <h4><label for="name" style="font-weight:bold;font-size: 14px;">标注信息 <i class="icon-check-empty"></i></label></h4>
        <div id="infoNote"></div>
        </div>
        </div>
        <div class="form-group"> 
        <label class="col-xs-6 control-label"></label> 
        <div class="col-xs-6" > 
            <button type="button" style="margin-left:20px" class="btn btn-info" onclick="addRmark()">完成备注</button> 
        </div> 
    </div> 
    </div>
</form>
</div>
<script src="${basePath}/staticjs/microUnion/sampleScan.js"></script>