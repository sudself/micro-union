<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<c:set var="codeName" value='<%=request.getParameter("codeName")%>' />

<script type="text/javascript"> 
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
         <button type="button" style="width:100%;font-weight:bold;font-size:25px;padding: 8px;">医院条码：${codeName}</button>
    </div>

</div>

</br>
</br>

<div class="row">

    <div class="col-md-3 col-sm-4 col-xs-4">
     <h4>涂片类型选择</h4>
    </div>
    
    <div class="col-md-3 col-sm-4 col-xs-4" >
       <div class="tuPianDiv">一般细菌涂片-01</div>
    </div>
    
    <div class="col-md-3 col-sm-4 col-xs-4">
        <div class="tuPianDiv">真菌涂片-02</div>
    </div>
    
     <div class="col-md-3 col-sm-4 col-xs-4">
       <div class="tuPianDiv">淋球菌涂片-03</div>
    </div>

</div>

</br>
</br>

<div class="row" >

    <div class="col-md-3 col-sm-4 col-xs-4">
    </div>
    
    <div class="col-md-3 col-sm-4 col-xs-4">
       <div class="tuPianDiv">痰液涂片</div>
    </div>
    
    <div class="col-md-3 col-sm-4 col-xs-4" >
       <div class="tuPianDiv">结核分枝杆菌涂片-04</div>
    </div>
    
    <div class="col-md-3 col-sm-4 col-xs-4">
        <div class="tuPianDiv">放线菌及诺卡菌涂片-05</div>
    </div>
    
</div>

</br>
</br>

<div class="row" >

    <div class="col-md-3 col-sm-4 col-xs-4">
    </div>
    
     <div class="col-md-3 col-sm-4 col-xs-4">
       <div class="tuPianDiv">寄生虫涂片-06</div>
    </div>

</div>


</br>
</br>
</br>

<div class="row" >

    <div class="col-md-3 col-sm-4 col-xs-4">
        <div class="handlerButton" onclick="printCode()">确认并打印条码</div>
    </div>
    
    <div class="col-md-3 col-sm-4 col-xs-4" >
       <div class="handlerButton"  onclick="ranSeJingJian()">染色镜检</div>
    </div>
    
    <div class="col-md-3 col-sm-4 col-xs-4">
        <div class="handlerButton" onclick="dealOtherSample()">继续处理其他标本</div>
    </div>
    
     <div class="col-md-3 col-sm-4 col-xs-4">
       <div class="handlerButton" onclick="peiYangMin()" >同时接种培养皿</div>
    </div>

</div>


</div>

<script src="${basePath}/staticjs/experiment/ranSeJingJian.js?t=<%=Math.random() %>"></script>

