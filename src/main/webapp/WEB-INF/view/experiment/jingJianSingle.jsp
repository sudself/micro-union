<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<c:set var="codeName" value='<%=request.getParameter("codeName")%>' />
<c:set var="sampleTypeId" value='<%=request.getParameter("sampleTypeId")%>' />
<c:set var="detectMothod" value='<%=request.getParameter("detectMothod")%>' />

<script type="text/javascript"> 
var basepath= "${basePath}";
var sampleTypeId= "${sampleTypeId}";
var detectMothod= "${detectMothod}";
</script>

<style type="text/css">

.labelCss{
    padding: 17px;
    margin-right: auto;
    margin-left: auto;
}

.handlerButton{
  background:#66ccff; 
  padding: 4px;
  border:1px solid #0000FF;
  font-size:14px;
  text-align: center; 
  border-radius: 12px;
}

</style>


<div class="container">


<div class="row"> 
    <div class="col-md-4 col-sm-4 col-xs-4" onclick="scanCode()" style="text-align:right;font-weight:bold;">
      <!-- <button type="button" onclick="scanCode()" style="width:90%;font-weight:bold;font-size:25px;padding: 8px;">扫描玻片条码:</button> -->
       <h3>扫描玻片条码: </h3>
    </div>
    
    <div class="col-md-6 col-sm-8 col-xs-8">
      <input type="text" id="codeName" name="codeName" style="border:1px solid #33CCFF" />
    </div>
</div>

<div class="row"> 
    <div class="col-md-6 col-sm-6 col-xs-8">
       <h4 id="h4id"></h4>
    </div>
</div>
<br>
<br>

<div id="rowContainer">
	<div id="rowContainerDiv" class="row" style="padding: 5px;font-size:12px">
	</div>
</div>


</br>
<div class="row" >

    <div class="col-md-6 col-sm-6 col-xs-6">
        <div></div>
    </div>
    
    <div class="col-md-2 col-sm-4 col-xs-4">
        <div class="handlerButton" onclick="saveAndDealOther()">继续处理其他标本</div>
    </div>

</div>
</div>

<script src="${basePath}/staticjs/experiment/jingJianSingle.js?t=<%=Math.random() %>"></script>

