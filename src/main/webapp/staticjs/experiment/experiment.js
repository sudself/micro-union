$(document).ready(function() {
	
});


var sampleHanderUrl = basePath+"/experiment/sampleHander.action";

/**获得条码**/
function handerScanCode(){
    var code = "123456789";
    
    if(code == "undefined"|| code==""){
        alert("医院条码为空");
        return ;
    }
	$("#codeName").val(code);
	jumpByCode(code);
}

/**根据code类型跳转到**/
function jumpByCode(code){
    if(code != null){
        //样本处理页面
        window.location = sampleHanderUrl+"?codeName="+$("#codeName").val()+"";
    }else{
        
    }
}


