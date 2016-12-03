$(document).ready(function() {
	setNavigationBar("标本处理.png",basepath+"/experiment/index.action","标本处理");
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

/**扫码之后，根据类型渲染页面**/
function scanCode(){
    var code = "123";
    
    $("#codeName").val(code);
    getTypes(code);
}


/**获取细菌涂片类型**/
function getTypes(code){
    
    var url=basepath+"/experiment/getJingJianTypeList.action";
    //需要根据code计算出涂片类型字段
    var params={
            detectTypeId:1
    };
    
    $.ajax({
        type : 'post',
        url : url,
        data:params,
        dataType : 'json',
        success : function(data) {
            $("#sampleInputNote").html("");
            $("#h4id").html(data.name);
            var typeList = data.resultList;
            var htmlStr="";
            for(var i=0;i<typeList.length;i++){
                htmlStr+='<div class="col-md-6 col-sm-6 col-xs-6 checkbox" ><label><i class="icon-check-empty"></i><input type="checkbox" name="infoNote" onclick="selectTypeE(this)" id="'+typeList[i].id+'">&nbsp;'+typeList[i].jing_jian_type+'</label></div>';
            }
            $("#sampleInputNote").html(htmlStr);

			$('input[name="infoNote"]').click(function(){
				var classStyle=$(this).is(':checked')==true?"icon-check":"icon-check-empty";
				$(this).prev().removeClass().addClass(classStyle);
				$("#dangerNote i").removeClass().addClass("icon-check-empty");
				$("input[name='dangerNote']").removeAttr("checked");
			}); 
        },error: function(e) { 
            
        } 
    });
}

/**保存结果**/
function saveAndDealOther(){
    /**数据入库操作**/
    
    window.location = basepath+"/experiment/index.action";
}




