<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />

<script type="text/javascript"> 
<%-- var codeName = "<%=request.getParameter("codeName")%>"; --%>
var codeName="123456789";
var basepath= "${basePath}";
</script>

<style type="text/css">

.labelCss{
    padding: 17px;
    margin-right: auto;
    margin-left: auto;
}

.tuPianDiv{
  padding: 9px;
  border:1px solid #0000FF;
  font-size:20px;
  text-align: center;  
  border-radius: 10px;
}

.handlerButton{
  background:#66ccff; 
  padding: 9px;
  border:1px solid #0000FF;
  font-size:17px;
  text-align: center; 
  border-radius: 15px;
}

</style>


<div class="container">

<div class="row"> 

    <div class="col-md-4 col-sm-3 col-xs-2">
    </div>
    <div class="col-md-4 col-sm-6 col-xs-8">
         <button type="button" style="width:100%;font-weight:bold;font-size:25px;padding: 8px;">医院条码：123456789</button>
    </div>

</div>

</br>
</br>

<div class="row">

    <div class="col-md-3 col-sm-4 col-xs-4">
     <h4>转种平板</h4>
    </div>
    
    <div class="col-md-3 col-sm-4 col-xs-4" >
       <div class="tuPianDiv">BA</div>
    </div>
    
    <div class="col-md-3 col-sm-4 col-xs-4">
        <div class="tuPianDiv">CA</div>
    </div>
    
     <div class="col-md-3 col-sm-4 col-xs-4">
       <div class="tuPianDiv">MAC</div>
    </div>

</div>

</br>
</br>

<div class="row" >

    <div class="col-md-3 col-sm-4 col-xs-4">
    </div>
    
    <div class="col-md-3 col-sm-4 col-xs-4">
       <div class="tuPianDiv">MH</div>
    </div>
    
    <div class="col-md-3 col-sm-4 col-xs-4" >
       <div class="tuPianDiv">SS</div>
    </div>
    
    <div class="col-md-3 col-sm-4 col-xs-4">
        <div class="tuPianDiv">CBA</div>
    </div>
    
</div>

</br>
</br>

<div class="row" >

    <div class="col-md-3 col-sm-4 col-xs-4">
    </div>
    
     <div class="col-md-3 col-sm-4 col-xs-4">
       <div class="tuPianDiv">ANA</div>
    </div>

</div>

</br>
</br>
</br>

<div class="row" >

    <div class="col-md-3 col-sm-4 col-xs-4">
    </div>
    
    <div class="col-md-3 col-sm-4 col-xs-4" >
       <div class="handlerButton" onclick="okPrintCode()">确认并打印条码</div>
    </div>
    
    <div class="col-md-3 col-sm-4 col-xs-4">
        <div class="handlerButton"  onclick="zhuanZhongPingban()" >转种平板</div>
    </div>
    
     <div class="col-md-3 col-sm-4 col-xs-4">
       <div class="handlerButton" onclick="backForward()">继续处理其他标本</div>
    </div>

</div>


</div>

<script src="${basePath}/staticjs/experiment/zhuanZhongPingBan.js?t=<%=Math.random() %>"></script>

