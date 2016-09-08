$(document).ready(function() {
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
                        htmlStr+= '<h4>转种平板</h4>';
                    }
                    htmlStr+='</div>';
                    
                    htmlStr+='<div class="col-md-3 col-sm-4 col-xs-4" >  <div id="'+data[i].id +'" onclick="divSelected(this)" class="tuPianDiv">'+data[i].detect_type+'</div></div>';
                    
                }else if((i+1)%3==0){//第三个
                    htmlStr+='<div class="col-md-3 col-sm-4 col-xs-4" >  <div id="'+data[i].id +'" onclick="divSelected(this)" class="tuPianDiv">'+data[i].detect_type+'</div></div>';
                    htmlStr+='</div> </br> </br>';
                }else{//第二个
                    htmlStr+='<div class="col-md-3 col-sm-4 col-xs-4" >  <div id="'+data[i].id +'" onclick="divSelected(this)" class="tuPianDiv">'+data[i].detect_type+'</div></div>';
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


/**确认打印条码**/
function okPrintCode(){
    if(selectIds.length <1){
        alert("请选择涂片类型");
        return;
    }else{
        alert(selectIds.toString());
    }
}

/**染色**/
function zhuanZhongPingban(){
    /**更新转种平板记录到数据库*/   
    
    //跳转至转染色页面
    window.location = basePath+"/experiment/jingjian.action?codeName="+codeName+"&sampleTypeId=1&detectMothod=1";
}

/**处理其他标本**/
function backForward(){
    /**更新转种平板记录到数据库*/   
    
    window.location = basePath+"/experiment/index.action";
}