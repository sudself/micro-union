$(document).ready(function() {
	
});


var sampleHanderUrl = basePath+"/experiment/sampleHander.action";

/**获得条码**/
function handerScanCode(){
	
	$("#codeName").val("123456789");
}


/**跳转到处理页面**/
var handerNext= function (){
	
	if($("#codeName").val() == "undefined"|| $("#codeName").val()==""){
		alert("医院条码为空");
		return ;
	}
	
	window.location = sampleHanderUrl+"?codeName="+$("#codeName").val()+"";
	
	/*var params ={
			codeName:	$("#codeName").val();
	}
	$.ajax({
		type : 'post',
		url : sampleHanderUrl,
		data : params,
		dataType : 'json',
		success : function(data) {
			
		}
	});*/
}
