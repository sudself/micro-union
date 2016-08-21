<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<html>
<head>
<link href="${basePath }/images/favicon.ico" rel="Shortcut Icon">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>中国联通·沃云平台混合云</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta content="" name="description">
<meta content="" name="author">
<!-- BEGIN CORE CSS FRAMEWORK -->
<link href="${basePath}/css/home/pace-theme-flash.css" rel="stylesheet" type="text/css" media="screen">
<link href="${basePath}/css/home/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${basePath}/css/home/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
<link href="${basePath}/css/home/animate.min.css" rel="stylesheet" type="text/css">
<!-- END CORE CSS FRAMEWORK -->
<!-- BEGIN CSS TEMPLATE -->
<link href="${basePath}/css/home/style.css" rel="stylesheet" type="text/css">
<link href="${basePath}/css/home/wo.css" rel="stylesheet" type="text/css">
<script src="${basePath }/staticjs/jslib/jquery-1.10.2.js"></script>
<!-- END CSS TEMPLATE -->
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="error-body no-top  pace-done" onkeydown="keyLogin()">
	<div class="pace  pace-inactive">
		<div class="pace-progress" data-progress-text="100%"
			data-progress="99" style="width: 100%;">
			<div class="pace-progress-inner"></div>
		</div>
		<div class="pace-activity"></div>
	</div>
	<div class="container">
		<div class="row login-container column-seperation">
			<div class="col-md-4 col-md-offset-2 p-l-40">
				<h2>
					<img src="${basePath}/images/logo_top_flexmall.png">
				</h2>
				<br> <br>
				<p class="text-muted">版权所有：中国联通研究院</p>
				<p class="text-muted">平台版本号：v2.0.5</p>
				<p class="text-muted">虚拟化组件版本号：2015.12 v6</p>
				<br>
			</div>
			<div class="col-md-4">
				<br>
					<div class="row">
						<div class="form-group col-md-10">
							<label class="form-label"><i class="fa fa-user m-r-20"></i>登录账号</label>
							<div class="controls">
								<div class="input-with-icon  right">
									<i class=""></i> <input type="text" name="username"
										id="username" class="form-control">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-10">
							<label class="form-label"><i
								class="fa fa-unlock-alt m-r-20"></i>密 码</label>
							<div class="controls">
								<div class="input-with-icon  right">
									<i class=""></i> <input type="password" name="password"
										id="password" class="form-control"> <span style="color:red" class="help"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-10">
							<button onclick="javascript:butOnclick()" id="btn" class="btn btn-primary btn-cons pull-right"  style="width: 120px;">登 录</button>
						</div>
					</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		function keyLogin() {
			if (event.keyCode == 13) //回车键的键值为13
				document.getElementById("btn").click(); //调用登录按钮的登录事件
		}

		function butOnclick() {
			var url1 = "${basePath}/loginAction/login.action";
			var username = $("#username").val();
			var password = $("#password").val();
			if (username == "") {
				$(".help").text("用户名不能为空！")
				return false;
			} else if (password == "") {
				$(".help").text("密码不能为空！")
				return false;
			}
			var params = {
				username : username,
				password : password,
			};
			$.ajax({
				type : 'post',
				url : url1,
				data : params,
				async : false,
				dataType : 'json',
				success : function(data) {
					if (data == "success") {
						window.location = "${basePath}/homePage/index.action"
					} else {
						$(".help").text("用户名或者密码错误！")
					}
				}
			});
		}
	</script>
</body>
</html>