<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
	var basepath = "${basePath}";
</script>
<div class="container">
<div class="row">
	<div class="form-group"> 
        <label for="hospitalCode" class="col-xs-5 col-sm-4 col-md-3 control-label"><h3>标本类型</h3></label> 
        <div class="col-xs-7 col-sm-8 col-md-6"> 
        </div> 
    </div> 
</div>
	<div class="row" id="sampleTypeInfo"></div>
</div>
<script src="${basePath}/staticjs/microUnion/sampleType.js"></script>