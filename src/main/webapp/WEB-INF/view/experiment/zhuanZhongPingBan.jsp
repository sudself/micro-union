<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<c:set var="codeName" value='<%=request.getParameter("codeName")%>' />
<c:set var="sampleTypeId" value='<%=request.getParameter("sampleTypeId")%>' />
<c:set var="detectMothod" value='<%=request.getParameter("detectMothod")%>' />

<script type="text/javascript"> 
var basepath= "${basePath}";
var codeName= "${codeName}";
var sampleTypeId= "${sampleTypeId}";
var detectMothod= "${detectMothod}";
</script>

<style type="text/css">

.labelCss{
    padding: 17px;
    margin-right: auto;
    margin-left: auto;
}

.toggleClassBackG{
    background-color:#0000CC;
}

.tuPianDiv{
  padding: 9px;
  border:1px solid #0000FF;
  font-size:20px;
  text-align: center;  
  border-radius: 10px;
  margin-top:15px;
}

.handlerButton{
  background:#66ccff; 
  padding: 9px;
  border:1px solid #0000FF;
  font-size:17px;
  text-align: center; 
  border-radius: 15px;
  margin-top:10px;
}

</style>


<div class="container">

<div class="row"> 

    <div class="col-md-4 col-sm-3 col-xs-2">
    </div>
    <div class="col-md-4 col-sm-6 col-xs-8">
         <button type="button" style="width:100%;font-weight:bold;font-size:25px;padding: 8px;">医院条码：${codeName}</button>
    </div>

</div>
</br>
</br>

<div class="row"> 
    <div class="col-md-4 col-sm-6 col-xs-8">
       <h3>转种平板：</h3>
    </div>
</div>


<div id="rowContainer" class="row">

</div>

</br>

<div class="row" >

    <div class="col-md-3 col-sm-4 col-xs-6" >
       <div class="handlerButton" onclick="okPrintCode()">确认并打印条码</div>
    </div>
    
    <div class="col-md-3 col-sm-4 col-xs-6">
        <div class="handlerButton"  onclick="zhuanZhongPingban()" >染色</div>
    </div>
    
     <div class="col-md-3 col-sm-4 col-xs-6">
       <div class="handlerButton" onclick="backForward()">继续处理其他标本</div>
    </div>

</div>


</div>

<script src="${basePath}/staticjs/experiment/zhuanZhongPingBan.js?t=<%=Math.random() %>"></script>

