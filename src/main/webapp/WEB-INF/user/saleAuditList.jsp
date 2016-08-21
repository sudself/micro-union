<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理</title>
<link href="${basePath }/css/scape/index.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="${basePath}/staticjs/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${basePath}/staticjs/common.js"></script>
<script>
	var pageSize = 10;

	$(function() {
		if (status != "") {
			$("#userStatus").find("option[value=" + status + "]").attr("selected", true);
			$("#userName").val($("#hideNameCon").val());
		}

		handleValue();
		loadTableData(1);
	});
	function loadTableData(currentpage) {
		var requUrl = "${basePath}/userManageAction/queryUsers.action";
		var status = $("#hideStatusCon").val();
		$.ajax({
					type : 'post',
					url : requUrl,
					data : {
						page : currentpage,
						rows : pageSize,
						userName : $("#hideNameCon").val(),
						userStatus : 0
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
							liHtml += '<tr id='+dataList[i].id+'><td><span class="field">'
									+ (startRowNo++) + '</span></td>';
							liHtml += '<td><span id="userName_td'+dataList[i].id+'" class="field"  >'
									+ dataList[i].name + '</span></td>';
							liHtml += '<td><span class="field">' + email
									+ '</span></td>';
							liHtml += '<td><span class="field">' + telephone
									+ '</span></td>';
							liHtml += '<td><span class="field">' + userDesc
									+ '</span></td>';
							liHtml += '<td><span class="field">' + statusDesc
									+ '</span></td>';
							if (dataList[i].status == 0) {
								liHtml += '<td class="operateTd"><div onclick=showDetail("'
										+ dataList[i].id
										+ '","'
										+ dataList[i].name
										+ '") class="table_details_btn"></div><div onclick=showAudit("'
										+ dataList[i].id
										+ '") class="table_audit_btn"></div></td></tr>';
							} else if (dataList[i].status == 1) {
								liHtml += '<td class="operateTd"><div onclick=showDetail("'
										+ dataList[i].id
										+ '","'
										+ dataList[i].name
										+ '") class="table_details_btn"></div></td></tr>';
							} else if (dataList[i].status == 2) {
								liHtml += '<td class="operateTd"><div onclick=showDetail("'
										+ dataList[i].id
										+ '","'
										+ dataList[i].name
										+ '") class="table_details_btn"></div></td></tr>';
							} else if (dataList[i].status == 3) {
								liHtml += '<td class="operateTd"><div onclick=showDetail("'
										+ dataList[i].id
										+ '","'
										+ dataList[i].name
										+ '") class="table_details_btn"></div><div onclick=showAudit("'
										+ dataList[i].id
										+ '") class="table_audit_btn"></div></td></tr>';
							} else if (dataList[i].status == 4) {
								liHtml += '<td class="operateTd"><div onclick=showDetail("'
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
		$("#hideUserId").val(id);
		$("#hideUserName").val(name);
		$("#hideAction").val("saleAuditAction");
		window.localStorage.setItem("lastUrl",location.href);
		qutoDetailReqForm.submit();

	}

	function showAudit(id) {
		var user_id = "<%=request.getParameter("user_id")%>";
		$("#hideAuditId").val(id);
		$("#hideStatusCon").val(0);
		$("#cloudscape_user_id").val(user_id);
		window.localStorage.setItem("lastUrl",location.href);
		auditForm.submit();
	}

	function handleValue() {
		$("#hideNameCon").val($("#userName").val());
		$("#hideStatusCon").val($("#userStatus").val());
	}
</script>
</head>

<body>
	<div class="main">
		<div class="host_box">
			<div class="user_box">
				<span>名称</span><input type="text" id="userName" class="user_btn" />

				<input type="button" name="搜索" value="搜索"
					onclick="handleValue();loadTableData(1)" class="user_search" /><font></font>
			</div>
			<div class="host_con">
				<table border="0" cellpadding="0" cellspacing="0" class="tab_top">
					<thead class="host_con_title">
						<tr>
							<td style="width: 80px"><span class="field">编号</span></td>
							<td style="width: 200px"><span class="field">名称</span></td>
							<td style="width: 200px"><span class="field">邮箱</span></td>
							<td style="width: 200px"><span class="field">手机号</span></td>
							<td><span class="field">描述</span></td>
							<td id="auditTd" style="width: 200px; display: none"><span
								class="field">审核意见</span></td>
							<td style="width: 150px"><span class="field">状态</span></td>
							<td><span class="field">操作</span></td>
						</tr>
					</thead>

					<tbody id="listmac">

					</tbody>
				</table>
			</div>
			<div id="new_page"></div>
		</div>
	</div>


	<form name="qutoDetailReqForm" action="${basePath}/auditAction/showAuditDetail.action" method="post">
		<input type="hidden" id="hideUserId" name="quotaViewReq.userId" /> 
		<input type="hidden" id="hideAction" name="saleAuditAction" />
		<input type="hidden" id="hideUserName" name="quotaViewReq.userName" /> 
		<input type="hidden" id="hideNameCon" name="quotaViewReq.nameCondition" value="${quotaViewReq.nameCondition }" /> 
		<input type="hidden" id="hideStatusCon" name="quotaViewReq.statusCondition" value="${quotaViewReq.statusCondition }" />
	</form>
	
	<form name="auditForm"
		action="${basePath}/userManageAction/showAudit.action" method="post">
		<input type="hidden" id="hideAuditId" name="auditUserId" />
		<input type="hidden" id="cloudscape_user_id" name="cloudscape_user_id" />
		<input type="hidden" id="hideAuditStatus" name="auditStatus" value="0" />
	</form>
</body>
</html>