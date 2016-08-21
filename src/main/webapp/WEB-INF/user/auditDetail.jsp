<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>配额详情</title>
<link href="${basePath }/css/scape/index.css" rel="stylesheet" type="text/css" />
<link href="${basePath }/css/bootstrap/style.css" rel="stylesheet" type="text/css" />
<link href="${basePath }/css/bootstrap/bootstrap.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${basePath}/staticjs/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${basePath}/staticjs/left.js"></script>
<script>
function toBack(){
	auditListReqForm.action = window.localStorage.getItem("lastUrl");
	auditListReqForm.submit();
}

$(function() {	
	function selectAction(value){
    	$(".treeview").find(".treeview-menu").find("li").each(function(){
			var _value=$(this)[0].innerHTML.substring(1);
			if(value==_value){
				$(this).parent().parent().click();
				$(".treeview").css({background:"#2c3849"});
        		$(this).css({background:"#E8B41E"});
			}
		})
    }
	
	var detailFrom = window.localStorage.getItem("detailFrom");
	if (detailFrom == "userList"){
		selectAction("申请信息");
	}
	else if (detailFrom == "resourceAuditList"){
		selectAction("资源审批");
	}
	else if (detailFrom == "openAuditList"){
		selectAction("开通审批");
	}
	
});

</script>
</head>

<body>

<jsp:include page="aside.jsp" />

<div class="content-wrapper">
    <section class="content-header">
       <h1>管理>用户详情</h1>
     </section>
     <section class="content">
        <div class="container theme-showcase" role="main" style="width:100%;max-height:785px;background-color:#ffffff">
           <div class="main" style="min-width:800px">
				<div class="host_box" style="margin:21px 0px;width:100%">
					<div class="host_title">
						<a href="#" onclick="javascript:toBack();return false;">
							 <img src="${basePath}/images/back_icon.png" width="22px" height="22px;" />
						</a>
					</div>
		
					<br/>
				    <div class="radauthgrpcontentDetail">详情页面</div>
				    <c:if test="${items.size() == 0 }">
				    	<span style="color:red">租户已删除！</span>
				    </c:if>
				    <c:if test="${novaQuota == '1' }">
				    	<span style="color:red">获取nova配额失败！</span>
				    </c:if>
				    <c:if test="${volumeQuota == '1' }">
				    	<span style="color:red">获取volume配额失败！</span>
				    </c:if>
				    <c:if test="${netQuota == '1' }">
				    	<span style="color:red">获取network配额失败！</span>
				    </c:if>
					<div class="quota_box">
		                 <span class="borderLeft">用户名称：${quotaViewReq.userName}</span>
		            </div>
					<div class="host_con">
						<div class="host_quota_detail">
						
							<div class="host_li_title">
								<span name="baseUL" class="select_status">状态信息</span>
							</div>
							 
							<ul id="baseUL">
								<c:if test="${order.status == 0 }">
									<li>状态： 未审批</li>
								</c:if>
								<c:if test="${order.status == 1 }">
									<li>状态： 审批通过</li>
								</c:if>
								<c:if test="${order.status == 2 }">
									<li>状态： 已拒绝</li>
								</c:if>
								<c:if test="${order.status == 3 }">
									<li>状态：销售审批通过</li>
								</c:if>
								<c:if test="${order.status == 4 }">
									<li>状态： 资源审批通过</li>
								</c:if>
								<c:if test="${order.oper_status == 0 }">
									<li>租户开通状态： 未开通</li>
								</c:if>
								<c:if test="${order.oper_status == 1 }">
									<li>租户开通状态： 正在开通中</li>
								</c:if>
								<c:if test="${order.oper_status == 2 }">
									<li>租户开通状态： 开通成功</li>
								</c:if>
								<c:if test="${order.oper_status == 3 }">
									<li>租户开通状态： 开通失败</li>
								</c:if>
								<li>申请时间：<fmt:formatDate value="${order.insert_time}" pattern="yyyy-MM-dd HH:mm:ss"/></li>
								<li>最新更新时间： <fmt:formatDate value="${order.update_time}" pattern="yyyy-MM-dd HH:mm:ss"/></li>
							</ul>
						</div>
					</div>
					
					<div class="host_con">
						<div class="host_quota_detail">
						
							<div class="host_li_title">
								<span name="baseUL" class="select_status">配额信息</span>
							</div>
							 
							<ul id="baseUL">
								<c:forEach items="${items}" var="item">
									<c:if test="${item.item == 'cores' }">
										<li>虚拟CPU：${item.number} ${item.unit } </li>
									</c:if>
									<c:if test="${item.item == 'ram' }">
										<li>虚拟内存：${item.number} ${item.unit } </li>
									</c:if>
									<c:if test="${item.item == 'gigabytes' }">
										<li>云硬盘容量：${item.number} ${item.unit } </li>
									</c:if>
									<c:if test="${item.item == 'securityGroups' }">
										<li>安全组：${item.number} ${item.unit } </li>
									</c:if>
									<c:if test="${item.item == 'floatingIps' }">
										<li>浮动IP：${item.number} ${item.unit } </li>
									</c:if>
									<c:if test="${item.item == 'networks' }">
										<li>虚拟网络数量：${item.number} ${item.unit } </li>
									</c:if>
									<c:if test="${item.item == 'firewalls' }">
										<li>虚拟防火墙：${item.number} ${item.unit } </li>
									</c:if>
									
									<c:if test="${item.item == 'loadbalances' }">
										<li>虚拟负载均衡器：${item.number} ${item.unit } </li>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
					
					<div class="host_con">
						<div class="host_quota_detail">
						
							<div class="host_li_title">
								<span name="baseUL" class="select_status">审批信息</span>
							</div>
							 
							<ul id="baseUL">
							    
								<c:forEach items="${audits}" var="item">
								   <li>
								      <c:if test="${item.auditor_role == 1 }">销售</c:if><c:if test="${item.auditor_role == 2 }">资源</c:if><c:if test="${item.auditor_role == 3 }">开通</c:if>审批:
								      <c:if test="${item.audit_status == 1 }">拒绝</c:if>
								      <c:if test="${item.audit_status == 0 }">通过</c:if>
								   </li>
								   <li><c:if test="${item.auditor_role == 1 }">销售</c:if><c:if test="${item.auditor_role == 2 }">资源</c:if><c:if test="${item.auditor_role == 3 }">开通</c:if>审批员： ${item.auditor_name }
								   </li>
								   <li><c:if test="${item.auditor_role == 1 }">销售</c:if><c:if test="${item.auditor_role == 2 }">资源</c:if><c:if test="${item.auditor_role == 3 }">开通</c:if>审批意见： <span title="${item.comment }"><c:if test="${fn:length(item.comment)>20 }">${fn:substring(item.comment,0,20)}...</c:if><c:if test="${fn:length(item.comment)<=20 }">${item.comment}</c:if></span>
								   </li>
								   <li><c:if test="${item.auditor_role == 1 }">销售</c:if><c:if test="${item.auditor_role == 2 }">资源</c:if><c:if test="${item.auditor_role == 3 }">开通</c:if>审批时间：<fmt:formatDate value="${item.insert_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
								   </li>
								</c:forEach>
							</ul>
						</div>
					</div>
					 
				</div>
			</div>
			
		   <form name="auditListReqForm" action=""  method="post">
		       <input type="hidden" id="hideNameCon" name="quotaViewReq.nameCondition" value="${quotaViewReq.nameCondition }" />
		       <input type="hidden" id="hideStatusCon" name="quotaViewReq.statusCondition" value="${quotaViewReq.statusCondition }"/>
		    </form>
        
        </div>
     </section>
</div>

	
</body>
</html>