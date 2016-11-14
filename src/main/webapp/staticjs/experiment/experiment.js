$(document).ready(function() {
	setNavigationBar("标本处理1.png",basepath+"/experiment/index.action","标本处理");
});


var sampleHanderUrl = basepath+"/experiment/sampleHander.action";

/**获得条码**/
function handerScanCode(){
    var code = $("#codeName").val();
    
    if(code == "undefined"|| code==""){
        alert("医院条码为空");
        return ;
    }
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


