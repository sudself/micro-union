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
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta content="" name="description">
<meta content="" name="author">
<!-- BEGIN CORE CSS FRAMEWORK -->
<link href="${basePath}/css/home/pace-theme-flash.css" rel="stylesheet" type="text/css" media="screen">
<link href="${basePath}/css/home/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${basePath}/css/home/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
<link href="${basePath}/css/home/animate.min.css" rel="stylesheet" type="text/css">
<link href="${basePath}/css/home/style.css" rel="stylesheet" type="text/css">
<script src="${basePath }/staticjs/jslib/jquery-1.10.2.js"></script>
<script src="${basePath }/staticjs/jslib/jquery.validate.js"></script>
<script src="${basePath }/staticjs/aliyun/aliyun.validate.expand.js"></script>
<script src="${basePath }/staticjs/aliyun/aliyun.validate.expand.messages_cn.js"></script>

<style type="text/css">
html,body {
	height: 100%;
}
.box {
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='rgba(76, 194, 196, 0.81)', endColorstr='rgba(76, 194, 196, 0.81)'); /*  IE
	background-image:linear-gradient(bottom, rgba(76, 194, 196, 0.81) 0%, rgba(76, 194, 196, 0.81) 100%);
	background-image:-o-linear-gradient(bottom, rgba(76, 194, 196, 0.81) 0%, rgba(76, 194, 196, 0.81) 100%);
	background-image:-moz-linear-gradient(bottom, rgba(76, 194, 196, 0.81) 0%, rgba(76, 194, 196, 0.81) 100%);
	background-image:-webkit-linear-gradient(bottom, rgba(76, 194, 196, 0.81) 0%, rgba(76, 194, 196, 0.81) 100%);
	background-image:-ms-linear-gradient(bottom, rgba(76, 194, 196, 0.81) 0%, rgba(76, 194, 196, 0.81) 100%); */
	margin: 0 auto;
	position: absolute;
	width: 100%;
	height: 100%;
}
.login-box {
	width: 100%;
	max-width:500px;
	height: 400px;
	position: absolute;
	top: 50%;
    border-radius:inherit;
	margin-top: -200px;
	border:1px solid rgba(76, 194, 196, 0.81);

	/*设置负值，为要定位子盒子的一半高度*/
	
}
@media screen and (min-width:500px){
	.login-box {
		left: 50%;
		/*设置负值，为要定位子盒子的一半宽度*/
		margin-left: -250px;
	}
}	

.form {
	width: 100%;
	max-width:500px;
	height: 270px;
	margin: 25px auto 0px auto;
	padding-top: 25px;
}	
.login-content {
	height: 290px;
	width: 100%;
	max-width:500px;
	float: left;
	background-color: #fff;
}		
	
	
.input-group {
	margin: 0px 0px 30px 0px !important;
}
.form-control,
.input-group {
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
    font-size:60%;
    font-weight:100;
	color:#fff;
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
<div class="box">
<form id="loginForm">
		<div class="login-box">
			<div class="login-title text-center">
				<h1><small>微联欢迎您</small></h1>
			</div>
			
			<div class="login-content ">
			<div class="form">
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon "><span class="glyphicon glyphicon-user"></span></span>
							<input type="text" id="username" name="username" class="form-control" placeholder="用户名">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon "><span class="glyphicon glyphicon-lock"></span></span>
							<input type="password" id="password" name="password" class="form-control" placeholder="密码">
						</div>
					</div>
				</div>
				<div class="form-group form-actions">
					<div class="col-xs-4 col-xs-offset-4 ">
						<button type="submit" class="btn btn-sm btn-info"  id="btn" ><span class="glyphicon glyphicon-off"></span> 登录</button>
					</div>
				</div>
				<div class="form-group" >
					<div class="col-xs-6 link">
						<p class="text-center remove-margin"><small>忘记密码？</small> <a href="javascript:void(0)" ><small>找回</small></a>
						</p>
					</div>
					<div class="col-xs-6 link">
						<p class="text-center remove-margin"><small>还没注册?</small> <a href="javascript:void(0)" ><small>注册</small></a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
</div>

</body>
	<script type="text/javascript">
		function keyLogin() {
			if (event.keyCode == 13) //回车键的键值为13
				document.getElementById("btn").click(); //调用登录按钮的登录事件
		}

		/*表单验证*/
		$("#loginForm").validate({
		    // 添加验证规则
		    rules: {
		    	username:{
		            required: true
		        },
		        password:{
		        	 required: true
			    }
		    },
		    submitHandler: function (form) {
		    	butOnclick();
		    	//$("#loaddiv").show();
		    	//return;
		    	//$('#isaddVirtualModel').modal('show');	
		    	//$('#addVirtualModel').modal('hide');
		    }
		}); 
		
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
						$(".help").text("用户名或者密码错误！")
					}
				}
			});
		}
	</script>
</html>