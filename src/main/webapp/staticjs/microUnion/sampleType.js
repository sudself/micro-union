$(document).ready(function() {
	setNavigationBar("标本录入.png",basepath+"/sampleInput/sampleType/index.action","标本录入");
	getSampleType();
	
	  $("#sampleTypeInfo").on("click",'img',function () {
		  var requUrl=basepath+"/sampleInput/sampleScan/scanIndex.action?id="+$(this).parent().attr("data-id")+"&bottomcode="+$(this).parent().attr("data-bottomcode");
		  window.location.href=requUrl;
	   });
	 
});

var getSampleType=function(){
	var requUrl=basepath+"/sampleInput/sampleType/querySamplesTypes.action";
	$.ajax({
		type : 'post',
		url : requUrl,
		dataType : 'json',
		success : function(data) {
			var str="";
			for(var i=0;i<data.length;i++){
				str+='<div class="col-xs-6 col-sm-3 col-md-2"><div data-id="'+data[i].id+'" data-bottomcode="'+data[i].if_bottomcode+'">';
				str+='<img style="cursor:pointer;" onmouseover="chooseImgClass(this,0);" onmouseout="chooseImgClass(this,1);" src="'+basepath+'/images/micro/'+data[i].sample_type+'1.png" class="img-responsive" alt="'+data[i].sample_type+'" title="'+data[i].sample_type+'">';
				str+='<div class="caption img-responsive" style="color:#6f7b8a;text-align:center;height:40px;max-width:200px;"><p>'+data[i].sample_type+'</p></div></div></div>';
			}
			$("#sampleTypeInfo").html(str);
		},error: function(e) { 
			alertModel("danger","获取标本类型信息失败！");
		} 
	});
};