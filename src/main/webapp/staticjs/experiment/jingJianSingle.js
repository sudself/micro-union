$(document).ready(function() {
    init();
});

//选中的类型id
var selectIds = new Array();

/**复选框时间**/
function selectTypeE(ip){
    
    var typeId = $(ip).attr('id');
    
    if($(ip).attr('checked') == true){
        selectIds.push(typeId);//选中
    }else{
        //删除
        for(var i=0;i<selectIds.length;i++){
            if(selectIds[i] == typeId){
                selectIds.splice(i, 1);
                break;
            }
        }
    }
}


/**获取细菌涂片类型**/
function init(){
    
    var url=basePath+"/experiment/getDetectTypeList.action";
    
    var params={
            sampleTypeId:sampleTypeId,
            detectMothod:4
    };
    
    $.ajax({
        type : 'post',
        url : url,
        data:params,
        dataType : 'json',
        success : function(data) {
            $("#rowContainerDiv").html("");
            var htmlStr="";
            for(var i=0;i<data.length;i++){
                htmlStr+='<div class="col-md-6 col-sm-6 col-xs-6"><label><input type="checkbox" onclick="selectTypeE(this)" id="'+data[i].id+'">'+data[i].detect_type+'</label></div>';
            }
            $("#rowContainerDiv").html(htmlStr);
            
        },error: function(e) { 
            
        } 
    });
}

/**保存结果**/
function saveAndDealOther(){
    /**数据入库操作**/
    
    
    
    window.location = basePath+"/experiment/index.action";
}




