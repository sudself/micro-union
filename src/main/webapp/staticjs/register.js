function judgeName(){
	if (!checkName("name")){
		window.msg.alert("您输入的账号不合法,账号包括字母、数字和下划线，以字母开头",window.msg.alert.typeEnum.error);
		return false;
	}
	
	if ($.trim($("#name").val()) == "" || $("#name").val().length > 20){
		window.msg.alert("请输入1~20位的登录账号",window.msg.alert.typeEnum.error);
		return false;
	}

	if (checkRepeat()){
		return false;
	}
	return true;
	
}

function judgeUser(){
	if (!checkAlphaNumber("description")){
		window.msg.alert("您输入的用户名称包含异常字符，请重新输入",window.msg.alert.typeEnum.error);
		return false;
	}
	return true;
}

function judgePwd(){
	if ($("#password").val().length != 0){
		$("#pass-wrap-div").show();
		if ($("#passStrength div").hasClass("strengthLv0")){
			window.msg.alert("密码强度过低，请重新输入",window.msg.alert.typeEnum.error);
			return false;
		}
		return true;
	}
	else{
		$("#pass-wrap-div").hide();
		window.msg.alert("请输入密码！",window.msg.alert.typeEnum.error);
		return false;
	}
	
}

function judgeConfirmPwd(){
	if ($("#password").val().length != 0 && $("#confirmPassword").val().lengtgh != 0){
		if ($("#password").val() != $("#confirmPassword").val()){
			window.msg.alert("密码与确认密码输入不一致，请重新输入！",window.msg.alert.typeEnum.error);
			return false;
		}	
	}
	else if ($("#confirmPassword").val().lengtgh == 0){
		window.msg.alert("请输入确认密码！",window.msg.alert.typeEnum.error);
		return false;
	}
	return true;
	
}

function checkName(id) {
	var value = $("#" + id).val();
	var pattern = new RegExp(/^[a-zA-Z]{1}[0-9a-zA-Z_]{1,}$/); 
	if (!pattern.test(value)) {
		return false;
	}
	return true;
}

function checkAlphaNumber(id) {
	var value = $("#" + id).val();
	var pattern = new RegExp("^([\u4E00-\uFA29]|[\uE7C7-\uE7F3]|[a-zA-Z0-9])*$"); 
	if (!pattern.test(value)) {
		return false;
	}
	return true;
}

function checkRepeat(){
	$.ajax({
		type : "post",
		url : "checkRepeat.action",
		dataType : "json",
		data : {
			name : $("#name").val()
		},
		success : function(data) {
			if (data == "true") {
				window.msg.alert("您输入的账号已经存在，请重新输入",window.msg.alert.typeEnum.error);
				//$("#nameuniquecheck").val($("#name").val());
				return true;
			} 
			else{
				return false;
			}
		}
	});
}

function PasswordStrength(passwordID,strengthID){
	this.init(strengthID);
	var _this = this;
	document.getElementById(passwordID).onkeyup = function(){
		
	_this.checkStrength(this.value);
	}
};
PasswordStrength.prototype.init = function(strengthID){
	var id = document.getElementById(strengthID);
	var div = document.createElement('div');
	var strong = document.createElement('strong');
	id.appendChild(div);
	this.oStrength = div;
	document.getElementById("pwdem").appendChild(strong);
	this.oStrengthTxt = strong;
};
	PasswordStrength.prototype.checkStrength = function (val){
	var aLvTxt = ['','低','中','高'];
	var lv = 0;
	if(val.match(/[a-z]/g)){lv++;}
	if(val.match(/[0-9]/g)){lv++;}
	if(val.match(/(.[^a-z0-9])/g)){lv++;}
	if(val.length < 8){lv=0}
	if(lv > 3){lv=3;}
	this.oStrength.className = 'strengthLv' + lv;
	this.oStrengthTxt.innerHTML = aLvTxt[lv];
}; 

function judgeEmail(){
	if ($("#email").val() != "") {
		if (!checkEmail("email")) {
			window.msg.alert("邮箱格式不正确！",window.msg.alert.typeEnum.error);
			return false;
		}
	}
	return true;
}

function checkEmail(id) {
	var email = $("#" + id).val();
	var pattern = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
	if (!pattern.test(email)) {
		return false;
	}
	return true;
}

function judgePhone(){
	if($("#telephone").val() != ""){
		if(!checkTel("telephone")){
			window.msg.alert("手机号码格式不正确！",window.msg.alert.typeEnum.error);
			return false;
		}
	}
	return true;
}

function checkTel(id){
	var mobile = $("#" + id).val();
	if(mobile.length==0)
    {
       return false;
    }    
    if(mobile.length!=11)
    {
        return false;
    }
    var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1})|(14[0-9]{1}))+\d{8})$/;
    if(!myreg.test(mobile))
    {
        return false;
    }
    return true;
}

function checkNumber(id, info) {
	var value = $("#" + id).val();
	var pattern = /^[0-9]+$/;
	if (!pattern.test(value)) {
		window.msg.alert(info + "只能填写数字",window.msg.alert.typeEnum.error);
		return false;
	}
	return true; 
}

function selectBundle(flag){
	if (flag == 0){
		changeBtnStyle("bundleA");
		changeResourceNum(1);
		setResourceReadonly();
	}else if (flag == 1){
		changeBtnStyle("bundleB");
		changeResourceNum(2);
		setResourceReadonly();
	}else if (flag == 2){
		changeBtnStyle("bundleC");
		changeResourceNum(4);
		setResourceReadonly();
	}else if (flag == 3){
		changeBtnStyle("bundleCustom");
		changeResourceNum(1);
		removeResourceReadonly();
	}
}

function changeBtnStyle(id){
	$("#bundleDiv button").each(function(){
	    if ($(this).hasClass("btn-primary")){
	    	$(this).removeClass("btn-primary").addClass("btn-default");
	    }
	  });
	
	if ($("#"+id).hasClass("btn-default")){
		$("#"+id).removeClass("btn-default").addClass("btn-primary");			
	}
}

function changeResourceNum(multiple){
	$("#cores").val(20*multiple);
	$("#ram").val(50000*multiple);
	$("#gigabytes").val(1000*multiple);
	$("#securityGroups").val(30*multiple);
	$("#floatingIps").val(20*multiple);
	$("#networks").val(20*multiple);
	$("#firewalls").val(20*multiple);
	$("#loadbalances").val(20*multiple);
}

function setResourceReadonly(){
	$("#cores").attr("readonly","readonly");
	$("#ram").attr("readonly","readonly");
	$("#gigabytes").attr("readonly","readonly");
	$("#securityGroups").attr("readonly","readonly");
	$("#floatingIps").attr("readonly","readonly");
	$("#networks").attr("readonly","readonly");
	$("#firewalls").attr("readonly","readonly");
	$("#loadbalances").attr("readonly","readonly");
}

function removeResourceReadonly(){
	$("#cores").removeAttr("readonly");
	$("#ram").removeAttr("readonly");
	$("#gigabytes").removeAttr("readonly");
	$("#securityGroups").removeAttr("readonly");
	$("#floatingIps").removeAttr("readonly");
	$("#networks").removeAttr("readonly");
	$("#firewalls").removeAttr("readonly");
	$("#loadbalances").removeAttr("readonly");
}
