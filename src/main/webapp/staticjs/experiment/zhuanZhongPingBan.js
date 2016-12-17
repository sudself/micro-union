$(document).ready(function() {
	setNavigationBar("标本处理.png",basepath+"/experiment/index.action","标本处理");
    initRow();
    if(null !=childCode && "" != childCode && childCode != undefined){
    	displayName = displayName+"#"+childCode;
    }
    $("#tiaoMaDisplayPingBan").text('条码：'+displayName);
});

//选中的类型id
var selectIds = new Array();

/**是否选中**/
function divSelected(div){
     $(div).toggleClass("toggleClassBackG");
     
     var detectTypeId = $(div).attr('id');
     
     if( $(div).hasClass("toggleClassBackG")){
         selectIds.push(detectTypeId);//选中
     }else{
         //删除
         for(var i=0;i<selectIds.length;i++){
             if(selectIds[i] == detectTypeId){
                 selectIds.splice(i, 1);
                 break;
             }
         }
     }
}

/**初始化页面**/
function initRow(){
    var url=basepath+"/experiment/getDetectTypeList.action";
    var params={
            sampleTypeId:sampleTypeId,
            detectMothod:detectMothod
    };
    
    $.ajax({
        type : 'post',
        url : url,
        data:params,
        dataType : 'json',
        success : function(data) {
            var htmlStr="";
            for(var i=0;i<data.length;i++){
                htmlStr+='<div class="col-md-3 col-sm-4 col-xs-6" >  <div id="'+data[i].id +'##'+ data[i].print_prefix +'" onclick="divSelected(this)" class="tuPianDiv" style="cursor:pointer;">'+data[i].detect_type+'</div></div>';
            }
            $("#rowContainer").html(htmlStr);
            
        },error: function(e) { 
            
        } 
    });
    
}


/**确认打印条码**/
function okPrintCode(){
    if(selectIds.length <1){
        alert("请选择平板类型");
        return;
    }else{
    	for(var i=0;i<selectIds.length;i++){
	    	//打印条码
    		var selectStr = selectIds[i].split("##");
    		var detectTypeId = selectStr[0];
    		var print_prefix = selectStr[1];
	    	var params={
	    			"detectTypeId":detectTypeId,
	    			"codeName":codeName,
	    			"sampleTypeId":sampleTypeId,
	    			"detectMothod":detectMothod,
	    			"childCode":childCode,
	    			"print_prefix":print_prefix
	    	};
	    	$.ajax({
	            type : 'post',
	            url : basepath+"/experiment/handle.action",
	            data:params,
	            async:false,
	            dataType : 'json',
	            success : function(data) {
	            	alert("打印成功！");
	            },error: function(e) { 
	                alert("打印异常！");
	            } 
	        });
    	}
    }
}

/**染色**/
function zhuanZhongPingban(){
    //跳转至转染色页面
    window.location = basepath+"/experiment/jingjian.action?codeName="+codeName+"&sampleTypeId="+sampleTypeId+"&detectMothod=1"+"&childCode="+childCode;
}

/**处理其他标本**/
function backForward(){
    window.location = basepath+"/experiment/index.action";
}