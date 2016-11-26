$(document).ready(function() {
	setNavigationBar("标本处理.png",basepath+"/experiment/index.action","标本处理");
    initRow();
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
                
               /* if((i+1)%3==1){//每行三个  第一个
                    htmlStr+= '<div class="row">  <div class="col-md-3 col-sm-4 col-xs-4">';
                    if(i==0){
                        htmlStr+= '<h4>涂片类型选择</h4>';
                    }
                    htmlStr+='</div>';
                    
                    htmlStr+='<div class="col-md-3 col-sm-4 col-xs-4" >  <div id="'+data[i].id +'##'+ data[i].print_prefix +'" onclick="divSelected(this)" class="tuPianDiv">'+data[i].detect_type+'</div></div>';
                    
                }else if((i+1)%3==0){//第三个
                    htmlStr+='<div class="col-md-3 col-sm-4 col-xs-4" >  <div id="'+data[i].id +'##'+ data[i].print_prefix +'" onclick="divSelected(this)" class="tuPianDiv">'+data[i].detect_type+'</div></div>';
                    htmlStr+='</div> </br> </br>';
                }else{//第二个
                    htmlStr+='<div class="col-md-3 col-sm-4 col-xs-4" >  <div id="'+data[i].id +'##'+ data[i].print_prefix +'" onclick="divSelected(this)" class="tuPianDiv">'+data[i].detect_type+'</div></div>';
                }
                
                if(i==data.length-1 && (i+1)%3!=0){
                    htmlStr+='</div> </br> </br>';
                }*/
            }
            $("#rowContainer").html(htmlStr);
            
        },error: function(e) { 
            
        } 
    });
    
}

/**打印条码**/
function printCode(){
    if(selectIds.length <1){
        alert("请选择涂片类型");
        return;
    }else{
    	for(var i=0;i<selectIds.length;i++){
	    	//打印条码
    		var selectStr = selectIds[i].split("##");
    		var detectTypeId = selectStr[0];
    		var print_prefix = selectStr[1];
    		var printCode = codeName+detectMothod+print_prefix;  //后续按条码算法需要更新
	    	alert(printCode);
	    	//
	    	var params={
	    			"detectTypeId":detectTypeId,
	    			"printCode":printCode,
	    			"codeName":codeName,
	    			"sampleTypeId":sampleTypeId
	    	};
	    	$.ajax({
	            type : 'post',
	            url : basepath+"/experiment/handle.action",
	            data:params,
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

/**染色之后并镜检**/
function ranSeJingJian(){
    /**更新染色记录到数据库*/   
    
    /**跳转到镜检页面**/
    window.location = basepath+"/experiment/jingJianSingle.action?codeName="+codeName+"&sampleTypeId="+sampleTypeId+"&detectMothod=4";
}

/**继续处理**/
function dealOtherSample(){
    /**更新染色记录到数据库*/   
    
    window.location = basepath+"/experiment/index.action";
}

/**同时接种培养皿**/
function peiYangMin(){
    /**更新染色记录到数据库*/   
    
    //跳转至转种平板页面
    window.location = basepath+"/experiment/pingban.action?codeName="+codeName+"&sampleTypeId=1&detectMothod=2";
}