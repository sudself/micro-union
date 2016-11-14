$(document).ready(function() {
	setNavigationBar("标本录入1.png",basepath+"/sampleInput/sampleType/index.action","标本录入");
	getSampleType();
	
	  $("#sampleTypeInfo").on("click",'.thumbnail',function () {
		  var requUrl=basepath+"/sampleInput/sampleScan/scanIndex.action?id="+$(this).attr("data-id")+"&bottomcode="+$(this).attr("data-bottomcode");
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
				str+='<div class="col-xs-6 col-sm-3 col-md-2"><div  class="thumbnail center-text" style="cursor:pointer;" data-id="'+data[i].id+'" data-bottomcode="'+data[i].if_bottomcode+'">';
				str+='<img src="'+basepath+'/images/micro/'+data[i].sample_type+'1.png" class="img-responsive" alt="'+data[i].sample_type+'" title="'+data[i].sample_type+'">';
				str+='<div class="caption" style="color:#6f7b8a;"><p>'+data[i].sample_type+'</p></div></div></div>';
			}
			$("#sampleTypeInfo").html(str);
		},error: function(e) { 
			alertModel("danger","获取标本类型信息失败！");
		} 
	});
};