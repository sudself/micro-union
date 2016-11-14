<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />

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
	<form class="form-horizontal" role="form"> 
	<div id="sampleInputData">
	<div class="form-group"> 
        <label  class="col-xs-5 col-sm-4 col-md-3 control-label"><h3>标本处理</h3></label> 
        <div class="col-xs-7 col-sm-8 col-md-6"> 
        </div> 
    </div> 
    <div class="form-group"> 
        <label for="codeName" class="col-xs-5 col-sm-4 col-md-3 control-label">扫描条码</label> 
        <div class="col-xs-7 col-sm-8 col-md-6"> 
            <input type="text" class="form-control" id="codeName" name="codeName" placeholder="扫描条码"> 
        </div> 
    </div> 
        <div class="form-group"> 
        <label class="col-xs-5 col-sm-4 col-md-3 control-label"></label> 
        <div class="col-xs-7 col-sm-8 col-md-6"> 
            <button type="button" class="btn btn-info" onclick="handerScanCode()">添加备注信息</button> 
        </div> 
    </div>
	</div>
	</form>
</div>
<!--
<div class="container">

<div class="labelCss">
     <h3>标本处理</h3>
</div>
<div class="row"> 
    <div class="col-md-4 col-sm-4 col-xs-4" >
      <button type="button" onclick="handerScanCode()" style="border-radius: 10px;width:90%;font-weight:bold;font-size:25px;padding: 8px;">扫描条码</button>
    </div>
    
    <div class="col-md-6 col-sm-6 col-xs-6">
      <input type="text" id="codeName" name="codeName" style="border-radius: 5px;width:100%;border:1px solid #33CCFF" />
    </div>
</div>

</div>
-->

<script src="${basePath}/staticjs/experiment/experiment.js?t=<%=Math.random() %>"></script>

