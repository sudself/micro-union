<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理</title>

<script>
	var pageSize = 10;
	$(function() {	
		generateNav("用户");
		selectAction(0);
		
		
		var status = $("#hideStatusCon").val();
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
						userStatus : $("#hideStatusCon").val()
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
						var description = "";
						var user_id = "";
						
						for ( var i = 0; i < dataList.length; i++) {

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
								description = "--";
							} else {
								description = dataList[i].description;
							}
							if(dataList[i].status == 0){
								statusDesc = "未处理";
							}else if(dataList[i].status == 1){
								statusDesc = "已通过";
							}else if(dataList[i].status == 2){
								statusDesc = "未通过";
							}else if(dataList[i].status == 3){
								statusDesc = "销售审批通过";
							}else if(dataList[i].status == 4){
								statusDesc = "资源审批通过";
							}
							
							liHtml += '<tr id='+dataList[i].id+'><td align="center"><span class="field">' + (startRowNo++) + '</span></td>';
							liHtml += '<td><span id="userName_td'+dataList[i].id+'" class="field"  >' + dataList[i].name + '</span></td>';
							liHtml += '<td><span class="field">' + email + '</span></td>';
							liHtml += '<td><span class="field">' + telephone + '</span></td>';
							liHtml += '<td><div class="field" style="width:140px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap" title="'+description+'">' + description + '</div></td>';
							liHtml += '<td><span class="field">' + statusDesc + '</span></td>';
							liHtml += '<td align="center" class="operateTd"><div onclick=showDetail("' + dataList[i].id + '","' + dataList[i].name + '") class="table_details_btn"></div></td></tr>';
						}
						$("#listmac").append(liHtml);
						initTablePager(data);
					}
				});
	}

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

	function handleValue() {
		$("#hideNameCon").val($("#userName").val());
		$("#hideStatusCon").val($("#userStatus").val());
	}
</script>


</head>
<body style="overflow-x:hidden;">


					<div class="container theme-showcase" role="main" style="width:100%;height:740px;background-color:#ffffff">
					    <div class="header">
                            <h3>申请用户信息</h3>
                        </div>
					    <div class="form-inline button-bar" style="padding-left:30px; margin-bottom: 20px;">
					        <div class="form-group" style="margin-right:10px">
					            <span>登录账户</span>
					            <input type="text" id="userName" class="select2 form-control" style="width:150px;"/>
					        </div>
					            <span>状态</span>
					            <select id="userStatus" class="select2 form-control" style="width:150px;">
					                <option value="">全部</option>
					                <option value="0">未处理</option>
					                <option value="1">已通过</option>
					                <option value="2">未通过</option>
					               <!--  <option value="3">销售审批通过</option> -->
					                <option value="4">资源审批通过</option>
					            </select>
					            
					            <button type="button" ng-disabled="isDisabled('os-start')" class="btn btn-default"  onclick="handleValue();loadTableData(1)">
					                <span class="glyphicon glyphicon-search" aria-hidden="true"></span> 搜索
					            </button>
					            <button type="button" class="btn btn-primary" style="margin-left:20px" onclick="location='${basePath }/userAction/toRegister.action'">
					                <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 申请
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

</body>
</html>