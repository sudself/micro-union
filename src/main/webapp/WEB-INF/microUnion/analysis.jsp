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
		<form class="form-horizontal" role="form"> 
		    <div class="form-group"> 
		        <label for="codeName" class="col-xs-5 col-sm-4 col-md-3 control-label">扫描医院条码</label> 
		        <div class="col-xs-7 col-sm-8 col-md-6"> 
		            <input type="text" style="width: 70%;" id="codeName" name="codeName" placeholder="扫描医院条码" onkeypress="javascript:return gosearch();"> 
		            <input type="button" class="btn btn-info" onclick="initAll()" value="提交"/>
		        </div> 
		    </div> 
		 </form>
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
