<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录</title>
<link rel="stylesheet" type="text/css" href="${basePath}/css/common.css">
<link rel="stylesheet" type="text/css" href="${basePath}/css/login.css">
<script type="text/javascript" src="${basePath}/staticjs/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	function checkForm() {
		alert("<%=application.getAttribute("flexStackURL")%>");
		if (!check('id_username', '用户名') || !check('id_password', '密码')) {
			return false;
		}
		return false;
	}
	function check(id, info) {
		if ($.trim($("#" + id).val()) == "") {
			alert(info + "不能为空！");
			return false;
		}
		return true;
	}
</script>
</head>
<body style="color: #333333">
	<!--顶部 Begin-->
	<jsp:include page="../head.jsp" />
	<!--顶部 End-->
	<div style="visibility: hidden;">
		<iframe src="<%=application.getAttribute("flexStackURL")%>"></iframe>
	</div>

	<div class="main">
		<div class="login">
			<div class="login_header" >
				<h3>登录</h3>
			</div>
			<form id="id_form" ng-controller="DummyCtrl" name="" autocomplete="on"
			onsubmit="return checkForm()"
			action='<%=application.getAttribute("flexStackURL")%>'
			method="POST">
			<div style='display: none'>
				<input type='hidden' name='csrfmiddlewaretoken' value='' id="id_csrfmiddlewaretoken" />
			</div>
			<div class="login_body clearfix">
					<input type="hidden" name="region" value="http://127.0.0.1:5000/v2.0" id="id_region" />

					<div class="control_group clearfix" >
						<label for="id_username">用户名</label> 
						<div>
							<input class="input" autofocus="autofocus" type="text" name="username" id="id_username" />
						</div>
					</div>

					<div class="control_group clearfix">
						<label for="id_password">密码</label>
						<div>
							<input class="input" type="password" name="password" id="id_password" />
						</div>
					</div>
			</div>
			<div class="login_footer">
				<button type="submit" class="btn-primary" style="float:right;" >登入</button>
			</div>
		</form>
		</div>
	</div>
</body>
</html>