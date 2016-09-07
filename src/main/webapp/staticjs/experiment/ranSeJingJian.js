$(document).ready(function() {
    initRow();
});

/**初始化页面**/
function initRow(){
    var url=basePath+"/experiment/getDetectTypeList.action";
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
                if((i+1)%3==1){//每行三个  第一个
                    htmlStr+= '<div class="row">  <div class="col-md-3 col-sm-4 col-xs-4">';
                    if(i==0){
                        htmlStr+= '<h4>涂片类型选择</h4>';
                    }
                    htmlStr+='</div>';
                    
                    htmlStr+='<div class="col-md-3 col-sm-4 col-xs-4" >  <div class="tuPianDiv">'+data[i].detect_type+'</div></div>';
                    
                }else if((i+1)%3==0){//第三个
                    htmlStr+='<div class="col-md-3 col-sm-4 col-xs-4" >  <div class="tuPianDiv">'+data[i].detect_type+'</div></div>';
                    htmlStr+='</div> </br> </br>';
                }else{//第二个
                    htmlStr+='<div class="col-md-3 col-sm-4 col-xs-4" >  <div class="tuPianDiv">'+data[i].detect_type+'</div></div>';
                }
                
                if(i==data.length-1 && (i+1)%3!=0){
                    htmlStr+='</div> </br> </br>';
                }
            }
            $("#rowContainer").html(htmlStr);
            
        },error: function(e) { 
            
        } 
    });
    
}


/**打印条码**/
function printCode(){
    alert("处理打印条码");
}

/**染色镜检**/
function ranSeJingJian(){
    alert("处理染色镜检");
}

/**继续处理**/
function dealOtherSample(){
    window.location = basePath+"/experiment/index.action";
}

/**同时接种培养皿**/
function peiYangMin(){
    alert("接种培养皿");
}