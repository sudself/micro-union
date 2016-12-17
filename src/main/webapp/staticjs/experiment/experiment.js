$(document).ready(function() {
	setNavigationBar("标本处理.png",basepath+"/experiment/index.action","标本处理");
	$("#codeName").focus();
});


var sampleHanderUrl = basepath+"/experiment/sampleHander.action";

//防止回车form提交,输入框回车进行查询
function gosearch() 
{ 
	if(window.event.keyCode == 13) 
	{ 
		handerScanCode(); 
		return false; 
	} 
}

/**获得条码**/
function handerScanCode(){
    var code = $("#codeName").val();
    
    if(code == "undefined"|| code==""){
        alert("医院条码为空");
        return ;
    }else{
    	var codeString = code.split("#");
    	if(codeString.length>1){
    		queryDetectsByCode(code);
    	}else{
    		/**没有分隔符查询样本录入表**/
    		querySamplesTables(code);
    	}
    }
}

/**处理条码中含有#的数据**/
function queryDetectsByCode(code){
	var params = {
		code:code	
	};
	
	var url = basepath +"/experiment/queryDetectsByCode.action";
	$.ajax({
		type : 'post',
		url : url,
		data : params,
		dataType : 'json',
		success : function(data) {
			if(null == data){
				alert("没有找到对应的条码信息！！！");
			}else{
				window.location = sampleHanderUrl+"?codeName="+code.split("#")[0]+"&childCode="+code.split("#")[1]+"";
			}
		},
		error: function(e){
			alert(e);
		}
	});
	
}

/**查询样本录入表**/
function querySamplesTables(code){
	var params = {
			code : code
	};
	
	var url = basepath+"/experiment/querySampleTables.action";
	$.ajax({
		type : 'post',
		url : url,
		data : params,
		dataType : 'json',
		success : function(data) {
			var result = data.split("-")[0];
			
		   if(result == 'weiLuRu'){//无记录跳转到录入界面
				 window.location = basepath+"/sampleInput/sampleType/index.action";
			}else if(result == 'goDealOrPrint'){//有记录、未处理，跳转到样本处理页面
				 window.location = sampleHanderUrl+"?codeName="+code+"&sampleType="+data.split("-")[1];
			}
			/*else if(result == 'analysis'){//有处理完成记录跳转到统计分析页面
				 window.location = basepath+"/analysisAction/index.action?codeName="+code;
			}else if(result == 'jingJian'){//取决于最近一条记录的状态信息  镜检
				 window.location = basepath+"/experiment/jingJianSingle.action";
			}else{//ranSe
				 window.location = basepath+"/experiment/jingjian.action";
			}*/
		},
		error: function(e){
			alert(e);
		}
	});		
}


