<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />

<body >
<link type="text/css" rel="stylesheet" href="${basePath }/staticjs/jslib/jqgrid/ui.jqgrid-bootstrap.css"></link>
<script>
		$.jgrid.defaults.responsive = true;
		$.jgrid.defaults.styleUI = 'Bootstrap';
</script>
<div style="background-color:  rgba(76, 194, 196, 0.81);">
<div class="container">

  <div class="row"> 
    <div class="col-xs-12 col-sm-12 col-md-12"> 
      <div id="samples-list" class="samples-list" style="">
		<table id="datagrid"></table>
		    <div>
		        <div id="pager" class="pager"></div>
		    </div>
		</div>
    </div> 
</div>
</div>
</div>
<script src="${basePath}/staticjs/micro/analysis.js?t=<%=Math.random() %>"></script>
</body>
