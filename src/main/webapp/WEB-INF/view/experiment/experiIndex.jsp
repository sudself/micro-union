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
            <input type="text" style="width: 70%;" id="codeName" name="codeName" placeholder="扫描条码" onkeypress="javascript:return gosearch();"> 
            <input type="button" class="btn btn-info" onclick="handerScanCode()" value="提交"/>
        </div> 
    </div> 
    </div>
	</div>
	</form>
</div>

<script src="${basePath}/staticjs/experiment/experiment.js?t=<%=Math.random() %>"></script>

