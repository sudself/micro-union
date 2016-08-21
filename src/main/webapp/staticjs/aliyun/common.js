var generateNav = function() {
	for ( var i = 0; i < arguments.length; i++) {
		if (i < arguments.length - 1) {
			$(".public_nav_info").append("<span class='small'>"+arguments[i]+"&nbsp;&gt;&nbsp;</span>");
		} else {
			$(".public_nav_info").append("<span class='big'>"+arguments[i]+"</span>");
		}
	}
	$(".public_nav_info").show();
};

var showMessageModal=function(str,waitTime){
	
	$("#waitWarningMessage").html(str);
	var isModalHide=$("#waitWarningModel").attr("aria-hidden");
	if(isModalHide=="true"||isModalHide!=true){
		$("#waitWarningModel").modal("show");
	}
	var re = /^[1-9]+[0-9]*]*$/ ;   
	if (re.test(waitTime)) {
		 setTimeout(function(){$("#waitWarningModel").modal("hide");}, waitTime);
	}
};

var hideMessageModal=function(waitTime){
	var re = /^[1-9]+[0-9]*]*$/ ;   
	if (re.test(waitTime)) {
		setTimeout(function(){$("#waitWarningModel").modal("hide");}, waitTime);
	}else{
		$("#waitWarningModel").modal("hide");
	}
};

