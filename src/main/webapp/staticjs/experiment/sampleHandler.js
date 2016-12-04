$(document).ready(function() {
	setNavigationBar("标本处理.png",basepath+"/experiment/index.action","标本处理");
	
    if(null !=childCode && "" != childCode && childCode != undefined){
    	displayName = displayName+"#"+childCode;
    }
	$("#tiaoMaDisplay").text('医院条码：'+displayName);
});