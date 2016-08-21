<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理</title>
<link href="${basePath }/css/bootstrap/style.css" rel="stylesheet" type="text/css" />
<link href="${basePath }/css/bootstrap/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="${basePath }/css/bootstrap/bootstrap-theme.css" rel="stylesheet" type="text/css" />
<link href="${basePath }/css/action.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${basePath}/staticjs/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${basePath}/staticjs/left.js"></script>
<script type="text/javascript" src="${basePath}/staticjs/common.js"></script>
<script type="text/javascript" src="${basePath}/staticjs/bootstrap.min.js"></script>

<script>
	var pageSize = 10;
	$(function() {	
		
		function selectAction(value){
	    	$(".treeview").find(".treeview-menu").find("li").each(function(){
	    		var liId= parseInt($(this).attr("id"));
				if(liId==value){
					$(this).parent().parent().click();
					$(".treeview").css({background:"#2c3849"});
	        		$(this).css({background:"#E8B41E"});
				}
			})
	    }
		selectAction(1);
		
		var status = $("#hideStatusCon").val();
		if (status != "") {
			$("#userStatus").find("option[value=" + status + "]").attr("selected", true);
			$("#userName").val($("#hideNameCon").val());
		}

	});

	function showDetail(id, name) {
		window.localStorage.setItem("detailFrom","userList");
		
		$("#hideUserId").val(id);
		$("#hideUserName").val(name);
		window.localStorage.setItem("lastUrl",location.href);
		qutoDetailReqForm.submit();

	}

	function showAudit(id) {
		window.localStorage.setItem("auditFrom","userList");
		
		$("#hideAuditId").val(id);
		$("#hideStatusCon").val($("#userStatus").val());
		auditForm.submit();
	}

</script>


</head>
<body style="overflow-x:hidden;">

<jsp:include page="../user/aside.jsp" />

<div class="content-wrapper">

	<section class="content-header">
                <h1><a href="javascript:void(0)">管理</a>&gt;<a href="javascript:void(0)">实例</a></h1>
     </section>
      <section class="content">        
					<div class="container theme-showcase" role="main" style="width:100%;height:740px;background-color:#ffffff">
					    <div class="form-inline button-bar" style="padding-left:30px; margin-bottom: 20px;">
				            <select id="userStatus" class="select2 form-control" style="width:150px;">
				                <option value="">全部</option>
				                <option value="0">未处理</option>
				                <option value="1">已通过</option>
				                <option value="2">未通过</option>
				               <!--  <option value="3">销售审批通过</option> -->
				                <option value="4">资源审批通过</option>
				            </select>
				            
				            <div class="form-group" style="margin-right:10px">
					            <input type="text" id="userName" class="select2 form-control" style="width:150px;"/>
					        </div>
				            
				            <button type="button" ng-disabled="isDisabled('os-start')" class="btn btn-default" >
				                <span class="glyphicon glyphicon-search" aria-hidden="true"></span> 搜索
				            </button>
					    </div>
					    <div class="col-md-12">
					        <table border="0" cellpadding="0" cellspacing="0" class="table table-bordered table-hover wordwrap">
					            <thead>
					            <tr class="active">
					                <td style="width: 6%"><label class="field">编号</label></td>
					                <td style="width: 15%"><label class="field">登录账户</label></td>
					                <td style="width: 17%"><label class="field">邮箱</label></td>
					                <td style="width: 14%"><label class="field">手机号</label></td>
					                <td style="width: 17%"><label class="field">用户名称</label></td>
					                <td id="auditTd" style="width: 17%; display: none"><label class="field">审核意见</label></td>
					                <td><label class="field">状态</label></td>
					                <td style="width: 10%"><label class="field">操作</label></td>
					            </tr>
					            </thead>
					
					            <tbody id="listmac">
					
					            </tbody>
					        </table>
					    </div>
					    <div id="new_page1"></div>
					</div>
					
					
						<form name="qutoDetailReqForm" action="${basePath}/auditAction/showAuditDetail.action" method="post">
							<input type="hidden" id="hideUserId" name="quotaViewReq.userId" /> 
							<input type="hidden" id="hideUserName" name="quotaViewReq.userName" /> 
							<input type="hidden" id="hideNameCon" name="quotaViewReq.nameCondition" value="${quotaViewReq.nameCondition }" /> 
							<input type="hidden" id="hideStatusCon" name="quotaViewReq.statusCondition" value="${quotaViewReq.statusCondition }" />
						</form>
					
						<form name="auditForm"
							action="${basePath}/userManageAction/showAudit.action" method="post">
							<input type="hidden" id="hideAuditId" name="auditUserId" /> 
							<input type="hidden" id="hideStatusCon" name="auditStatus" />
						</form>
      </section>
</div>

</body>
</html>