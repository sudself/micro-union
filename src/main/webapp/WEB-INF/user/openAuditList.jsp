<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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

<% 
	String detailBackUrl = "/auditAction/toOpenAuditList.action";
	request.setAttribute("detailBackUrl", detailBackUrl);
%>

<script>
	var pageSize = 10;
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
		selectAction("开通审批");
		
		if (status != "") {
			$("#userStatus").find("option[value=" + status + "]").attr("selected", true);
			$("#userName").val($("#hideNameCon").val());
		}
		handleValue();
		loadTableData(1);
	});
	function loadTableData(currentpage) {
		var requUrl = "${basePath}/userManageAction/queryUsers.action";
		$.ajax({
					type : 'post',
					url : requUrl,
					data : {
						page : currentpage,
						rows : pageSize,
						userName : $("#hideNameCon").val(),
						userStatus : 4
					},
					dataType : 'json',
					success : function(data) {
						$("#listmac").text("");
						var dataList = data.data;
						var liHtml = "";
						var startRowNo = data.startRowNo;
						var statusDesc = "";
						var email = "";
						var telephone = "";
						var tenant_name = "";
						var userDesc = "";
						for ( var i = 0; i < dataList.length; i++) {
							if (dataList[i].status == 0) {
								statusDesc = "未处理";
							} else if (dataList[i].status == 1) {
								statusDesc = "已通过";
							} else if (dataList[i].status == 2) {
								statusDesc = "未通过";
							} else if (dataList[i].status == 3) {
								statusDesc = "销售审批通过";
							} else if (dataList[i].status == 4) {
								statusDesc = "资源审批通过";
							}

							if (dataList[i].email == null) {
								email = "--";
							} else {
								email = dataList[i].email;
							}

							if (dataList[i].telephone == null) {
								telephone = "--";
							} else {
								telephone = dataList[i].telephone;
							}

							if (dataList[i].tenant_name == null) {
								tenant_name = "--";
							} else {
								telephone = dataList[i].telephone;
							}
							if (dataList[i].description == null) {
								userDesc = "--";
							} else {
								userDesc = dataList[i].description.split(":")[0];
							}
							liHtml += '<tr id='+dataList[i].id+'><td align="center"><span class="field">'
									+ (startRowNo++) + '</span></td>';
							liHtml += '<td><span id="userName_td'+dataList[i].id+'" class="field"  >'
									+ dataList[i].name + '</span></td>';
							liHtml += '<td><span class="field">' + email
									+ '</span></td>';
							liHtml += '<td><span class="field">' + telephone
									+ '</span></td>';
							liHtml += '<td><div class="field" style="width:130px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap" title="'+userDesc+'">' + userDesc
									+ '</div></td>';

							liHtml += '<td><span class="field">' + statusDesc
									+ '</span></td>';
							if (dataList[i].status == 0) {
								liHtml += '<td class="operateTd" align="center"><div onclick=showDetail("'
										+ dataList[i].id
										+ '","'
										+ dataList[i].name
										+ '") class="table_details_btn"></div><div onclick=showAudit("'
										+ dataList[i].id
										+ '") class="table_audit_btn"></div></td></tr>';
							} else if (dataList[i].status == 1) {
								liHtml += '<td class="operateTd" align="center"><div onclick=showDetail("'
										+ dataList[i].id
										+ '","'
										+ dataList[i].name
										+ '") class="table_details_btn"></div></td></tr>';
							} else if (dataList[i].status == 2) {
								liHtml += '<td class="operateTd" align="center"><div onclick=showDetail("'
										+ dataList[i].id
										+ '","'
										+ dataList[i].name
										+ '") class="table_details_btn"></div></td></tr>';
							} else if (dataList[i].status == 3) {
								liHtml += '<td class="operateTd" align="center"><div onclick=showDetail("'
										+ dataList[i].id
										+ '","'
										+ dataList[i].name
										+ '") class="table_details_btn"></div><div onclick=showAudit("'
										+ dataList[i].id
										+ '") class="table_audit_btn"></div></td></tr>';
							} else if (dataList[i].status == 4) {
								liHtml += '<td class="operateTd" align="center"><div onclick=showDetail("'
										+ dataList[i].id
										+ '","'
										+ dataList[i].name
										+ '") class="table_details_btn"></div><div onclick=showAudit("'
										+ dataList[i].id
										+ '") class="table_audit_btn"></div></td></tr>';
							}
						}
						$("#listmac").append(liHtml);
						initTablePager(data);
					}
				});
	}

	function showDetail(id, name) {
		window.localStorage.setItem("detailFrom","openAuditList");
		
		$("#hideUserId").val(id);
		$("#hideUserName").val(name);
		window.localStorage.setItem("lastUrl",location.href);
		qutoDetailReqForm.submit();

	}

	function showAudit(id) {
		window.localStorage.setItem("auditFrom","openAuditList");
		
		var user_id = "<%=request.getParameter("user_id")%>";
		$("#cloudscape_user_id").val(user_id);
		$("#hideAuditId").val(id);
		$("#hideStatusCon").val(4);
		window.localStorage.setItem("lastUrl",location.href);
		auditForm.submit();
	}

	function handleValue() {
		$("#hideNameCon").val($("#userName").val());
		$("#hideStatusCon").val($("#userStatus").val());
	}
</script>
</head>
<body style="overflow-x:hidden;">

<jsp:include page="aside.jsp" />

<div class="content-wrapper">

	<section class="content-header">
         <h1><a href="javascript:void(0)">管理</a>&gt;<a href="javascript:void(0)">开通审批</a></h1>
     </section>
      <section class="content">
				<div class="container theme-showcase" role="main" style="width:100%;height:740px;background-color:#ffffff">
				    <div class="header">
                         <h3>开通审批用户信息</h3>
                   </div>
				    <div class="form-inline button-bar" style="padding-left:30px; margin-bottom: 20px;">
				        <div class="form-group" style="margin-right:10px">
				            <span>登录账户</span>
				            <input type="text" id="userName" class="select2 form-control" style="width:150px;"/>
				        </div>
				            
				        <button type="button" ng-disabled="isDisabled('os-start')" class="btn btn-default"  onclick="handleValue();loadTableData(1)">
				            <span class="glyphicon glyphicon-search" aria-hidden="true"></span> 搜索
				        </button>
				    </div>
				
				
				    <div class="col-md-12">
				        <table border="0" cellpadding="0" cellspacing="0" class="table table-bordered table-hover wordwrap">
				            <thead>
				            <tr class="active">
				                <td style="width: 6%"><label class="field">编号</label></td>
				                <td style="width: 12%"><label class="field">登录账户</label></td>
				                <td style="width: 15%"><label class="field">邮箱</label></td>
				                <td style="width: 12%"><label class="field">手机号</label></td>
				                <td style="width: 15%"><label class="field">用户名称</label></td>
				                <td id="auditTd" style="width: 15%;display: none"><label class="field">审核意见</label></td>
				                <td><label class="field">状态</label></td>
				                <td  style="width: 18%"><label class="field">操作</label></td>
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
				
					<form name="auditForm" action="${basePath}/userManageAction/showAudit.action" method="post">
					    <input type="hidden" id="cloudscape_user_id" name="cloudscape_user_id" />
						<input type="hidden" id="hideAuditId" name="auditUserId" /> 
						<input type="hidden" id="hideStatusCon" name="auditStatus" value="4" />
					</form>
      </section>
 </div>
 
</body>
</html>