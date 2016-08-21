<%@page import="com.certus.helper.Constants"%>
<%@page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册</title>
<link rel="stylesheet" type="text/css" href="${basePath}/css/index.css">
<link rel="stylesheet" type="text/css" href="${basePath}/css/common.css">
<link rel="stylesheet" type="text/css" href="${basePath}/css/register.css">
<link rel="stylesheet" type="text/css" href="${basePath}/css/alert.css">
<link href="${basePath}/css/bootstrap.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${basePath}/staticjs/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${basePath}/staticjs/common.js"></script>
<script type="text/javascript" src="${basePath}/staticjs/alert.js"></script>
<script type="text/javascript" src="${basePath}/staticjs/register.js"></script>
<script type="text/javascript">
	
	function cancel(){
		$("#name").val("");
		$("#userContact").val();
		$("#password").val("");
		$("#confirmPassword").val("");
		$("#email").val("");
		$("#telephone").val("");
		$("#description").val("");
	}

	function register() {
		//提交前校验
		if (!(judgeName() && judgeUser() && judgePwd() &&　judgeConfirmPwd() && judgeEmail() && judgePhone())){
			return;
		}
		
		if ($("#cores").val()) {
			if (!checkNumber("cores", "虚拟CPU")) {
				return;
			}
		}
		
		if ($("#ram").val()) {
			if (!checkNumber("ram", "虚拟内存")) {
				return;
			}
		}
		
		if ($("#gigabytes").val()) {
			if (!checkNumber("gigabytes", "云存储容量")) {
				return;
			}
		}
		
		if ($("#securityGroups").val()) {
			if (!checkNumber("securityGroups", "主机防火墙数量")) {
				return;
			}
		}
		
		if ($("#floatingIps").val()) {
			if (!checkNumber("floatingIps", "公网IP数量")) {
				return;
			}
		}
		
		if ($("#networks").val()) {
			if (!checkNumber("networks", "虚拟网络数量")) {
				return;
			}
		}
		
		if ($("#firewalls").val()) {
			if (!checkNumber("firewalls", "虚拟防火墙数量")) {
				return;
			}
		}
		
		if ($("#loadbalances").val()) {
			if (!checkNumber("loadbalances", "虚拟负载均衡数量")) {
				return;
			}
		}
		
		$("#submitUser").attr("disabled",true);
		
		var cores = "";
		var ram = "";
		var gigabytes = "";
		var securityGroups = "";
		var floatingIps = "";
		var networks = "";
		var firewalls = "";
		var loadbalances = "";
		var customFlag = "1";
		
		cores = $("#cores").val();
		ram = $("#ram").val();
		gigabytes = $("#gigabytes").val();
	    securityGroups = $("#securityGroups").val();
	    floatingIps = $("#floatingIps").val();
	    networks = $("#networks").val();
	    firewalls = $("#firewalls").val();
	    loadbalances = $("#loadbalances").val();

		if (!cores) {
			cores = 20;
		}
		
		if (!ram) {
			ram = 50000;
		}
		
		if(!securityGroups){
			securityGroups = 30;
		}
		
		if (!gigabytes) {
			gigabytes = 1000;
		}
		
		if (!networks) {
			networks = 20;
		}
		
		if(!floatingIps){
			floatingIps = 20;
		}
		
		if (!firewalls) {
			firewalls = 20;
		}
		
		if (!loadbalances) {
			loadbalances = 20;
		}
		
		
		// 只允许数字
		$.ajax({
			type : "post",
			url : "${basePath}/userAction/register.action",
			dataType : "json",
			data : {
				name : $("#name").val(),
				password : $("#password").val(),
				email : $("#email").val(),
				telephone : $("#telephone").val(),
				description : $("#description").val(),
				cores :cores,
				gigabytes: gigabytes,
				ram : ram,
				securityGroups: securityGroups,
				floatingIps:floatingIps,
				networks : networks,
				firewalls: firewalls,
				loadbalances: loadbalances,
				customFlag: customFlag
			},
			success : function(data) {
				if (data.error != null) {
					window.msg.alert(data.error.errorDetail,window.msg.alert.typeEnum.error);
				} else {
					window.msg.alert("申请成功！",window.msg.alert.typeEnum.success);
					location.href = "${basePath}/userManageAction/toUserList.action";
				}
			}
		});
		
		$("#submitUser").removeAttr("disabled");
	}


	$(function(){
		$("#bundleA").click();
		new PasswordStrength('password','passStrength');
	});
</script>
</head>
<body>
	<!--顶部 Begin-->
	<%-- <jsp:include page="../head.jsp" /> --%>
	<!--顶部 End-->
	
	<input type="hidden" id="nameuniquecheck" name="nameuniquecheck" value=""/>

	<div class="main">
		<div class="fre">
			<!--左边 Menu Begin-->
			<div class="left_box">
				<div class="left_box_head" ><div style="margin-left:45px;">申请</div></div>
				<div style="height:1170px;background:url('${basePath}/images/yixun.jpg') no-repeat center center;">
					<span style="color:#575757;">
						<!-- <span><h3 style="color:red;fl">说明</h3></span>带*的为必填项，标红项为不正确信息。 -->
					</span>
				</div>
			</div>
			<!--左边 Menu End-->
			<!--右边  Begin-->
			<div class="right_box">
				<div class="right_box_head">
					<a href="${basePath}/index.action">首页</a><font>&nbsp;&nbsp;</font><a href="#">申请</a><font></font>
				</div>
				<!--内容可编辑区域 开始-->
				<div class="modal-content">
					<div class="modal-body">
						<div class="alert alert-info" style="line-height:1">
								用户信息
						</div>
						<div style="border-bottom:1px #ccc solid;border-right:1px #ccc solid;border-left:1px #ccc solid;margin-top:-20px;">
						  	<div style="padding-top:30px;">
								<form class="form-horizontal">
										<div class="form-group">
											<label class="col-sm-2 control-label" style="float:left;margin-right:20px;"><span style="font-weight:bold;">用户名称</span></label>
											<div class="col-sm-10">
												<input  class="form-control" id="description" type="text" maxlength="20" onblur="judgeUser()"/>
												<span style="color:blue">用户名称(例如:天河用户1)</span>
											</div>
										</div><br/>
										
										<div class="form-group">
											<label class="col-sm-2 control-label" style="float:left;margin-right:20px;"><span style="font-weight:bold;">用户联系人</span></label>
											<div class="col-sm-10">
												<input  class="form-control" id="userContact" type="text" maxlength="50" />
												<span style="color:blue">用户联系人(例如：张三)</span>
											</div>
										</div><br/>
										
										<div class="form-group">
											<label class="col-sm-2 control-label" style="float:left;margin-right:20px;"><span style="font-weight:bold;">手&nbsp;&nbsp;机</span></label>
											<div class="col-sm-10">
												<input  class="form-control" id="telephone" type="text" maxlength="20" onblur="judgePhone()"/>
											</div>
										</div><br/>
										
										<div class="form-group">
											<label class="col-sm-2 control-label" style="float:left;margin-right:20px;"><span style="font-weight:bold;">邮&nbsp;&nbsp;箱</span></label>
											<div class="col-sm-10">
												<input  class="form-control" id="email" type="text" maxlength="50" onblur="judgeEmail()"/>
											</div>
										</div><br/>
										
										<div class="form-group">
											<label class="col-sm-2 control-label" style="float:left;margin-right:20px;"><span style="font-weight:bold;">登录账号</span><span id="nameLabel">*</span></label>
											<div class="col-sm-10">
												<input  class="form-control" id="name" type="text" maxlength="50" onblur="judgeName()"/>
												<span style="color:blue">用户登录账号(例如：user1)</span>
											</div>
										</div><br/>
										
										<div class="form-group">
											<label class="col-sm-2 control-label" style="float:left;margin-right:20px;"><span style="font-weight:bold;">密 &nbsp; &nbsp;码</span><span id="passwordLabel">*</span></label>
											<div class="col-sm-10">
												<input  class="form-control" id="password" type="password" maxlength="25" onblur="judgePwd()"/>
												<span style="color:blue">密码至少8位</span>
												<div class="pass-wrap" style="margin-left:180px;display:none" id="pass-wrap-div">
                                                     <em id="pwdem">密码强度：</em>
                                                    <div id="passStrength"></div>
                                                </div> 
											</div>
										</div><br/>
										
										<div class="form-group">
											<label class="col-sm-2 control-label" style="float:left;margin-right:20px;"><span style="font-weight:bold;">确认密码</span><span id="confirmPasswordLabel">*</span></label>
											<div class="col-sm-10">
												<input  class="form-control" id="confirmPassword" type="password" maxlength="25" onblur="judgeConfirmPwd()"/>
											</div>
										</div><br/>
										
										<div class="form-group" id="bundleDiv">
										    <label class="col-sm-2 control-label" style="float:left;margin-right:20px;"><span style="font-weight:bold;">套&nbsp;&nbsp;餐</span></label>
                                            <button id="bundleA" type="button"  class="btn btn-default bundleBtn active" onclick="selectBundle(0)">套餐A</button>
                                            <button id="bundleB" type="button"  class="btn btn-default bundleBtn active" onclick="selectBundle(1)">套餐B</button>
                                            <button id="bundleC" type="button"  class="btn btn-default bundleBtn active" onclick="selectBundle(2)">套餐C</button>
                                            <button id="bundleCustom" type="button"  class="btn btn-default bundleBtn active" onclick="selectBundle(3)">自定义</button>
                                        </div><br/><br/>
								</form>	
							</div>
						</div>
					</div>
				</div>
				<div class="modal-content" >
					<div class="modal-body">
						<div class="alert alert-info" style="line-height:1">
								配额 *
						</div>
						<div style="border-bottom:1px #ccc solid;border-right:1px #ccc solid;border-left:1px #ccc solid;margin-top:-20px;">
						  	<div style="padding-top:30px;">
								<form class="form-horizontal">
										<div class="form-group">
											<label class="col-sm-2 control-label" style="float:left;margin-right:20px;"><span style="font-weight:bold;">虚拟CPU：</span></label>
											<div class="col-sm-10">
												<input  class="form-control" id="cores" type="text" maxlength="10" placeholder="20" />
												<span style="color:blue">虚拟化vcpu，默认主频为 2.1GHz</span>
											</div>
										</div><br/>
										<div class="form-group">
											<label class="col-sm-2 control-label" style="float:left;margin-right:20px;"><span style="font-weight:bold;">虚拟内存（MB）：</label>
											<div class="col-sm-10">
												<input  class="form-control" id="ram" type="text" maxlength="10" placeholder="50000" />
											</div>
										</div><br/>
										<div class="form-group">
											<label class="col-sm-2 control-label" style="float:left;margin-right:20px;"><span style="font-weight:bold;">云存储容量（GB）：</label>
											<div class="col-sm-10">
												<input  class="form-control" id="gigabytes" type="text" maxlength="10" placeholder="1000" />
											    <span style="color:blue">虚拟快存储资源池容量</span>
											</div>
										</div><br/>
								</form>	
							</div>
						</div>
					</div>
				</div>
				<div class="modal-content" >
					<div class="modal-body">
						<div class="alert alert-info" style="line-height:1">
								网络增值服务 *
						</div>
						<div style="border-bottom:1px #ccc solid;border-right:1px #ccc solid;border-left:1px #ccc solid;margin-top:-20px;">
						  	<div style="padding-top:30px;">
								<form class="form-horizontal">
										<div class="form-group">
											<label class="col-sm-2 control-label" style="float:left;margin-right:20px;"><span style="font-weight:bold;">主机防火墙：</span></label>
											<div class="col-sm-10">
												<input  class="form-control" id="securityGroups"  type="text" maxlength="10" placeholder="30"/>
												<span style="color:blue">主机防火墙，通过ACL控制主机的访问</span>
											</div>
										</div><br/>
										<div class="form-group">
											<label class="col-sm-2 control-label" style="float:left;margin-right:20px;"><span style="font-weight:bold;">公网IP：</span></label>
											<div class="col-sm-10">
												<input  class="form-control" id="floatingIps"   type="text" maxlength="10" placeholder="20"/>
											    <span style="color:blue">公网可以直接访问的IP地址，用户绑定到主机或防火墙，负载均衡</span>
											</div>
										</div><br/>
										<div class="form-group">
											<label class="col-sm-2 control-label" style="float:left;margin-right:20px;"><span style="font-weight:bold;">虚拟网络：</span></label>
											<div class="col-sm-10">
												<input  class="form-control" id="networks"   type="text" maxlength="10" placeholder="20"/>
											</div>
										</div><br/>
										<div class="form-group">
											<label class="col-sm-2 control-label" style="float:left;margin-right:20px;"><span style="font-weight:bold;">虚拟防火墙：</span></label>
											<div class="col-sm-10">
												<input  class="form-control" id="firewalls"   type="text" maxlength="10" placeholder="20"/>
												<span style="color:blue">虚拟化的防火墙，保护虚拟网络，主机等虚拟资源</span>
											</div>
										</div><br/>
										<div class="form-group">
											<label class="col-sm-2 control-label" style="float:left;margin-right:20px;"><span style="font-weight:bold;">虚拟负载均衡器：</span></label>
											<div class="col-sm-10">
												<input  class="form-control" id="loadbalances"   type="text" maxlength="10" placeholder="20"/>
											</div>
										</div><br/>
								</form>	
							</div>
						</div>
					</div>
				</div>
				<div class="panel">
						<div style="width:300px;margin-left:150px;"> 
							<button type="button" class="btn btn-primary" id="submitUser" onclick="register()" >提交</button>
						</div>
						
						<div style="width:300px;margin-left:280px;"> 
							<button type="button" class="btn btn-defaut" onclick="cancel()">重置</button>
						</div>
				        	
				</div>
			 <div class="right_box_content">
			 </div>

	</div>
  </div>
</div>
</body>
</html>