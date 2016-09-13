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

<div class="labelCss">
     <h3>标本处理</h3>
</div>

<div class="row"> 
    <div class="col-md-4 col-sm-4 col-xs-4" >
      <button type="button" onclick="handerScanCode()" style="width:90%;font-weight:bold;font-size:25px;padding: 8px;">扫描条码</button>
    </div>
    
    <div class="col-md-6 col-sm-6 col-xs-6">
      <input type="text" id="codeName" name="codeName" style="width:100%;border:1px solid #33CCFF" />
    </div>
</div>

</div>


<script src="${basePath}/staticjs/experiment/experiment.js?t=<%=Math.random() %>"></script>

