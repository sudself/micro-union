<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>微联欢迎你</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta content="" name="description">
<meta content="" name="author">
<!-- BEGIN CORE CSS FRAMEWORK -->
<link href="${basePath}/css/home/pace-theme-flash.css" rel="stylesheet"
	type="text/css" media="screen">
<link href="${basePath}/css/home/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="${basePath}/css/home/bootstrap-theme.min.css"
	rel="stylesheet" type="text/css">
<link href="${basePath}/css/home/animate.min.css" rel="stylesheet"
	type="text/css">
<link href="${basePath}/css/home/style.css" rel="stylesheet"
	type="text/css">
<script src="${basePath }/staticjs/jslib/jquery-1.10.2.js"></script>
<script src="${basePath }/staticjs/jslib/jquery.validate.js"></script>
<script src="${basePath }/staticjs/aliyun/aliyun.validate.expand.js"></script>
<script
	src="${basePath }/staticjs/aliyun/aliyun.validate.expand.messages_cn.js"></script>
<script type="text/javascript"
	src="${basePath}/staticjs/bootstrap.min.js"></script>
<style type="text/css">
html,body {
	height: 100%;
}

.box {
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='rgba(76, 194, 196, 0.81)',endColorstr='rgba(76, 194, 196, 0.81)'); /*  IE
	background-image:linear-gradient(bottom, rgba(76, 194, 196, 0.81) 0%, rgba(76, 194, 196, 0.81) 100%);
	background-image:-o-linear-gradient(bottom, rgba(76, 194, 196, 0.81) 0%, rgba(76, 194, 196, 0.81) 100%);
	background-image:-moz-linear-gradient(bottom, rgba(76, 194, 196, 0.81) 0%, rgba(76, 194, 196, 0.81) 100%);
	background-image:-webkit-linear-gradient(bottom, rgba(76, 194, 196, 0.81) 0%, rgba(76, 194, 196, 0.81) 100%);
	background-image:-ms-linear-gradient(bottom, rgba(76, 194, 196, 0.81) 0%, rgba(76, 194, 196, 0.81) 100%); */
	height: 100%;
	border-radius: inherit;
	border: 1px solid rgba(76, 194, 196, 0.81);
	padding: 0px;
	max-width:500px; 
	min-height:400px;
}
@media screen and (max-height:430px){
	.container {
		min-height:430px;
		padding-top:10px;
    }	
}	
@media screen and (max-width:400px){
	.container {
    	padding-left: 0px; 
    	padding-right: 0px;
    }
}

@media screen and (mix-width:401px){
	.container {
    	padding-left: 15x; 
    	padding-right: 15px;
    }
}
.form {
	margin: 25px auto 0px auto;
	padding-top: 25px;
}

.input-group {
	margin: 0px 0px 30px 0px !important;
}

.form-control,.input-group {
	height: 40px;
}

.form-group {
	margin-bottom: 0px !important;
}

.login-title {
	background-color: rgba(76, 194, 196, 0.81);
	padding: 20px 10px;
}

.login-title h1 {
	margin-top: 10px !important;
}

.login-title small {
	font-size: 60%;
	font-weight: 100;
	color: #fff;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif, "Microsoft Yahei", "微软雅黑";
}

.link p {
	line-height: 20px;
	margin-top: 30px;
}

.btn-sm {
	padding: 8px 24px !important;
	font-size: 16px !important;
}
</style>

</head>

<body onkeydown="keyLogin()">
<div id="alertModel" ></div>
<table style="vertical-align：middle;width:100%;height:100%;"><tr><td>
	<form id="loginForm">
		<div class="container">
		
			<div class="col-xs-10  col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 box">
				<div class="login-title text-center">
					<h1>
						<small>微联欢迎您</small>
					</h1>
				</div>

				<div class="login-content ">
					<div class="form">
						<div class="form-group">
							<div class="col-xs-11  ">
								<div class="input-group">
									<span class="input-group-addon "><span class="glyphicon glyphicon-user"></span></span> <input type="text"
										id="username" name="username" class="form-control"
										placeholder="用户名">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-11  ">
								<div class="input-group">
									<span class="input-group-addon "><span
										class="glyphicon glyphicon-lock"></span></span> <input
										type="password" id="password" name="password"
										class="form-control" placeholder="密码">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-6 col-xs-offset-6">
								<button type="submit" class="btn btn-sm btn-info" id="btn">
									<span class="glyphicon glyphicon-off"></span> 登录
								</button>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-6 link">
								<p class="text-center remove-margin">
									<small>忘记密码？</small> <a href="javascript:void(0)"><small>找回</small></a>
								</p>
							</div>
							<div class="col-xs-6 link">
								<p class="text-center remove-margin">
									<small>还没注册?</small> <a href="javascript:void(0)"><small>注册</small></a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			</td>
			</tr>
			
		</div>
	</form>
	</table>
	
	
</body>
<script type="text/javascript">
	function keyLogin() {
		if (event.keyCode == 13) //回车键的键值为13
			document.getElementById("btn").click(); //调用登录按钮的登录事件
	}

	/*表单验证*/
	$("#loginForm").validate({
		// 添加验证规则
		rules : {
			username : {
				required : true
			},
			password : {
				required : true
			}
		},
		submitHandler : function(form) {
			butOnclick();
			//$("#loaddiv").show();
			//return;
			//$('#isaddVirtualModel').modal('show');	
			//$('#addVirtualModel').modal('hide');
		}
	});
	function alertModel(type, popHtml) {
		//type类型  success  warning danger
		type = "alert-" + type;
		var model = '<div class="alert '+type+'"><a class="close" data-dismiss="alert">&times;</a>'
				+ popHtml + '</div>';
		$("#alertModel").html(model);
		$("#alertModel").fadeIn();
		$("#alertModel").fadeOut(5000);
	}
	function butOnclick() {
		var url1 = "${basePath}/loginAction/login.action";
		var username = $("#username").val();
		var password = $("#password").val();

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
					alertModel("danger", "用户名或密码错误！");
				}
			}
		});
	}
</script>
</html>