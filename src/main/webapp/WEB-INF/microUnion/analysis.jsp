<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />

<body >

<script type="text/javascript">
		$.jgrid.defaults.responsive = true;
		$.jgrid.defaults.styleUI = 'Bootstrap';
		var basepath= "${basePath}";
</script>
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
<script src="${basePath}/staticjs/micro/analysis.js?t=<%=Math.random() %>"></script>
</body>
