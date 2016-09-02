<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
	var basepath = "${basePath}";
</script>
<div class="container">
	<div class="row" id="sampleTypeInfo"></div>
</div>
<script src="${basePath}/staticjs/microUnion/sampleType.js"></script>