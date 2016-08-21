<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>审核用户</title>
<link href="${basePath }/css/bootstrap/style.css" rel="stylesheet" type="text/css" />
<link href="${basePath }/css/bootstrap/bootstrap.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${basePath}/staticjs/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${basePath}/staticjs/left.js"></script>
<title></title>
<script>

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
	
	var auditFrom = window.localStorage.getItem("auditFrom");
	if (auditFrom == "userList"){
		selectAction("申请信息");
	}
	else if (auditFrom == "resourceAuditList"){
		selectAction("资源审批");
	}
	else if (auditFrom == "openAuditList"){
		selectAction("开通审批");
	}
	
});

	function toBack(){
		auditReqForm.action = window.localStorage.getItem("lastUrl");
		auditReqForm.submit();
	}

	function passUser() {
		var status = parseInt($("#auditStatus").val());
		var role;
		if (status == "0"){
			//role = 1;
			role = 2;
		}else if(status == "3"){
			role = 2;
		}else if(status == "4"){
			role = 3;
		}
		if ($.trim($("#remark").val()) == "") {
			alert("请填写审核意见！");
			return;
		}
		var new_status;
		if (status == 0) {
			//new_status = 3;
			new_status = 4;
		} else if (status == 3) {
			new_status = status + 1;
		} else if (status == 4) {
			new_status = 1;
		}
		$.ajax({
					type : 'post',
					url : "${basePath}/userManageAction/auditUser.action",
					data : {
						auditStatus : new_status,
						auditRemark : $.trim($("#remark").val()),
						auditUserId : $("#auditUserId").val(),
						auditRole : role,
						cloudscape_user_id: $("#cloudscape_user_id").val()

					},
					dataType : 'json',
					success : function(data) {
						if(data){
							alert(data);
						}else{
							alert("用户通过审核");
						}
						location.href = "${basePath}/userManageAction/toUserList.action";
						if (status == 0) {
							//location.href = "${basePath}/auditAction/toSaleAuditList.action";
							location.href = "${basePath}/auditAction/toResourceAuditList.action";
						} else if (status == 3) {
							location.href = "${basePath}/auditAction/toResourceAuditList.action";
						} else if (status == 4) {
							location.href = "${basePath}/auditAction/toOpenAuditList.action";
						}
					}
				});
		$("#passBtn").attr("disabled", true);
	}

	function refuseUser() {
		if ($.trim($("#remark").val()) == "") {
			alert("请填写审核意见！");
			return;
		}
		var status = parseInt($("#auditStatus").val());
		var role;
		if (status == "0"){
			//role = 1;
			role = 2;
		}else if(status == "3"){
			role = 2;
		}else if(status == "4"){
			role = 3;
		}
		var status = parseInt($("#auditStatus").val());
		$.ajax({
					type : 'post',
					url : "${basePath}/userManageAction/auditUser.action",
					data : {
						auditStatus : "2",
						auditRemark : $.trim($("#remark").val()),
						auditUserId : $("#auditUserId").val(),
						cloudscape_user_id: $("#cloudscape_user_id").val(),
						auditRole : role

					},
					dataType : 'json',
					success : function(data) {
						alert("用户未被通过审核");
						location.href = "${basePath}/userManageAction/toUserList.action";
						if (status == 0) {
							//location.href = "${basePath}/auditAction/toSaleAuditList.action";
							location.href = "${basePath}/auditAction/toResourceAuditList.action";
						} else if (status == 3) {
							location.href = "${basePath}/auditAction/toResourceAuditList.action";
						} else if (status == 4) {
							location.href = "${basePath}/auditAction/toOpenAuditList.action";
						}
					}
				});
		$("#refuseBtn").attr("disabled", true);
	}
</script>
</head>

<body>

<jsp:include page="aside.jsp" />

<div class="content-wrapper">
    <section class="content-header">
       <h1>管理>审核用户</h1>
     </section>
     <section class="content">
		<div class="container theme-showcase" role="main" style="width:100%;height:700px;background-color:#ffffff">
            <input type="hidden" name="auditUserId" id="auditUserId" value="${auditUserId}" /> 
			<input type="hidden" name="auditStatus" id="auditStatus" value="${auditStatus}" />
			<input type="hidden" name="cloudscape_user_id" id="cloudscape_user_id" value="${cloudscape_user_id}" />
	
	        <h2 class="form-signin-heading">审核
	            <a href="#" onclick="javascript:toBack();return false;" class="pull-right">
	                <img src="${basePath}/images/back_icon.png" width="22px" height="22px;" />
	            </a>
	        </h2>
	        <div class="form-group">
	            <label>审核意见</label>
	            <textarea id="remark" class="form-control" rows="5" maxlength="250"></textarea>
	        </div>
	        
	        <div style="display: inline;">
	            <button class="btn btn-lg btn-primary " id="passBtn" style="width:100px;text-align：center"  onclick="passUser()" >通过</button>
	            <button class="btn btn-lg " id="refuseBtn" style="width:100px;text-align：center; margin-left:10px;"  onclick="refuseUser()">拒绝</button>
	        </div>
        
        </div>
     </section>
</div>
  
	<form name="auditReqForm" action=""  method="post">
       <input type="hidden" id="hideNameCon" name="quotaViewReq.nameCondition" value="${quotaViewReq.nameCondition }" />
       <input type="hidden" id="hideStatusCon" name="quotaViewReq.statusCondition" value="${quotaViewReq.statusCondition }"/>
    </form>
</body>
</html>

