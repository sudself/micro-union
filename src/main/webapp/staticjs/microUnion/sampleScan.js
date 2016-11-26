$(document).ready(function() {
	setNavigationBar("标本录入.png",basepath+"/sampleInput/sampleType/index.action","标本录入");
});

var queryRmarksList=function(){
	$("#sampleInputNote").hide();
	$("#dangerNote").html("");
	$("#infoNote").html("");
	var requUrl=basepath+"/sampleInput/sampleRemarks/remarksList.action";
	var params={
			sampleTypeId:typeId
	};
	$.ajax({
		type : 'post',
		url : requUrl,
		data:params,
		dataType : 'json',
		success : function(data) {
			var dangerStr="";
			var infoStr="";
			for(var i=0;i<data.length;i++){ 
				if(data[i].type==0){
					dangerStr+='<div class="checkbox"><label><i class="icon-check-empty"></i><input type="checkbox" name="dangerNote" value="'+data[i].id+'">&nbsp;'+data[i].content+'</label></div>';
				}else if(data[i].type==1){
					infoStr+='<div class="checkbox"><label><i class="icon-check-empty"></i><input type="checkbox" name="infoNote" value="'+data[i].id+'">&nbsp;'+data[i].content+'</label></div>';
				}
			}
			$("#dangerNote").html(dangerStr);
			$("#infoNote").html(infoStr);
			$("#sampleInputData").hide();
			$("#sampleInputNote").show();
			
			$('input[name="dangerNote"]').click(function(){ 
				var classStyle=$(this).is(':checked')==true?"icon-check":"icon-check-empty";
				$(this).prev().removeClass().addClass(classStyle);
				$("#infoNote i").removeClass().addClass("icon-check-empty"); 
				$("input[name='infoNote']").removeAttr("checked");
			}); 

			$('input[name="infoNote"]').click(function(){
				var classStyle=$(this).is(':checked')==true?"icon-check":"icon-check-empty";
				$(this).prev().removeClass().addClass(classStyle);
				$("#dangerNote i").removeClass().addClass("icon-check-empty");
				$("input[name='dangerNote']").removeAttr("checked");
			}); 
		},error: function(e) { 
			
		} 
	});
};

var addRmark=function(){
	var params={
			"sample.hospitalCode":$("#hospitalCode").val(),	
			"sample.sampleType":typeId,
			"sample.bottleCode":bottomcode==1?$("#bottleCode").val():null
	};
	
	var chk_value=[];
	$('input[name="dangerNote"]:checked').each(function(){ 
		
		chk_value.push($(this).val()); 
	}); 
	if(chk_value.length==0){
	$('input[name="infoNote"]:checked').each(function(){ 
		chk_value.push($(this).val()); 
	}); 
	}
	if(chk_value.length>0){
		params.chkValue=chk_value.toString();
	}
    var requUrl=basepath+"/sampleInput/sampleScan/addSample.action";
    $.ajax({
		type : 'post',
		url : requUrl,
		data:params,
		dataType : 'json',
		success : function(data) {
			window.location.href=basepath+"/sampleInput/sampleType/index.action";
		},error: function(e) { 
			alertModel("danger","标本录入失败！");
		} 
		});
};
