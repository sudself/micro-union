<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<link type="text/css" rel="stylesheet" href="${basePath}/css/aliyun/clustervmgroup.css">
<link type="text/css" rel="stylesheet" href="${basePath}/css/aliyun/virtual.css">
<div style="text-align:right">
   <label class="checkbox-inline" style="margin-top:0px;"><input type="checkbox" id="timeRefresh" style="margin-top:3px;" ><span style="margin-left:-5px;">自动刷新（每60s）</span></label><lable id="manualRefresh" class="manualRefresh" style="margin-top:0px;">刷新</lable></span>
</div>
<div id="taskresult-list" class="taskresult-list" style="">
   <div>
	<table class="table" style="table-layout:fixed;">
	   <tbody>
	      <tr>
	         <td>
				<table class="table table-striped table-bordered" id="sysInfoTable">
				   <caption class="panel-title" style="text-align:left">集群-虚机组-虚机汇总</caption>
				   <tbody class="dash-table-head">
				      <tr>
				         <th>集群数量</th>
				         <th width="12%" id="clusterNumber"></th>
				      </tr>
				      <tr>
				         <th>虚机组数量</th>
				         <th width="12%" id="vmGroupNumber"></th>
				      </tr>	
				      <tr>
				         <th>阿里云虚机数量</th>
				         <th width="12%" id="aVMNumber"></th>
				      </tr>
				      <tr>
				         <th>openstack虚机数量</th>
				         <th width="12%" id="oVMNumber"></th>
				      </tr>
				      <tr>
				         <th>云账号数量</th>
				         <th width="12%" id="yunAccountNumber"></th>
				      </tr>	      	      	            
				   </tbody>
				</table>	         
	         </td>
	         <td>
				<table class="table table-striped table-bordered" id="alertTable">
				   <caption class="panel-title" style="text-align:left">告警信息</caption>
				   <tbody class="dash-table-head">
				      <tr>
				         <th>端口告警</th>
				         <th width="12%" ></th>
				      </tr>
<!-- 				      <tr>
				         <th>站点告警</th>
				         <th></th>
				      </tr>	 -->
				      <tr>
				         <th>虚机告警（错误-已忽略）</th>
				         <th width="12%" ></th>
				      </tr>
				      <tr>
				         <th>虚机告警（错误-告警中）</th>
				         <th width="12%" ></th>
				      </tr>
				      <tr>
				         <th>虚机告警（警告-已忽略）</th>
				         <th width="12%" ></th>
				      </tr>
				      <tr>
				         <th>虚机告警（警告-告警中）</th>
				         <th width="12%" ></th>
				      </tr>					      	      	      	            
				   </tbody>
				</table>	         
	         </td>
	      </tr>
	      <tr>
	         <td>
				<table class="table table-striped table-bordered" id="cpuTable">
				   <caption class="panel-title" style="text-align:left">监控数据Top5-CPU使用率(%)</caption>
				   <thead>
				      <tr class="dash-table-head">
				         <th style="text-align:center">集群</th>
				         <th style="text-align:center">虚机</th>
				         <th style="text-align:center">CPU使用率（%）</th>
				      </tr>
				   </thead>
				   <tbody class="text-align: center;" id="cpuTableResult">
				   </tbody>
				</table>	         
	         </td>
	         <td>
				<table class="table table-striped table-bordered" id="internetTXTable">
				   <caption class="panel-title" style="text-align:left">监控数据Top5-出网流量</caption>
				   <thead>
				      <tr class="dash-table-head">
				         <th style="text-align:center">集群</th>
				         <th style="text-align:center">虚机</th>
				         <th style="text-align:center">出网流量</th>
				      </tr>
				   </thead>
				   <tbody id="internetTXTableResult">
				   </tbody>
				</table>	         
	         </td>
	      </tr>
	   </tbody>    
    </table>
	</div>	
</div>
<script type="text/javascript">
var basepath="${basePath}";
</script>

<script src="${basePath}/staticjs/aliyun/dashboard.js?t=<%=Math.random() %>"></script>