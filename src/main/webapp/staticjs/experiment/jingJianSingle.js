$(document).ready(function() {
	setNavigationBar("标本处理.png",basepath+"/experiment/index.action","标本处理");
});

//选中的类型id
var selectIds = new Array();

/**复选框时间**/
function selectTypeE(ip){
    
    var typeId = $(ip).attr('id');
    if($(ip).is(':checked')==true){
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
    
    var code = $("#codeName").val();
    if(code == "undefined"|| code==""){
    	alert("请输入条码");
    	return ;
    }else if(code.indexOf("#")<0 || (code.indexOf("#")+1) == code.length){
    	alert("条码格式不对");
    	return ;
    }
    getTypes(code);
}

var detectId = -1;

/**获取细菌涂片类型**/
function getTypes(code){
    
    var url=basepath+"/experiment/getJingJianTypeList.action";
    //需要根据code计算出涂片类型字段
    var params={
            detectTypeId:1,
            code:code
    };
    
    detectId = -1;
    
    $.ajax({
        type : 'post',
        url : url,
        data:params,
        dataType : 'json',
        success : function(data) {
            $("#sampleInputNote").html("");
            $("#h4id").html(data.name);
            if(data.detectId == undefined){
            	alert("未找到条码对应的处理记录！");
            	return;
            }else{
            	detectId = data.detectId;
            }
            
            var typeList = data.resultList;
            if(typeList == undefined || typeList.length == 0){
            	alert("请检查样本处理结果配置表！");
            	return;
            }
            var detectResultList = data.detectResultList;
            var htmlStr="";
            for(var i=0;i<typeList.length;i++){
            	if(detectResultList == undefined || detectResultList.length == 0){
            		 htmlStr+='<div class="col-md-6 col-sm-6 col-xs-6 checkbox" ><label><i class="icon-check-empty"></i><input type="checkbox" name="infoNote" onclick="selectTypeE(this)" id="'+typeList[i].id+'">&nbsp;'+typeList[i].content+'</label></div>';
            	}else{
            		var flag = false;
            		for(var j=0;j<detectResultList.length;j++){
            			if(detectResultList[j].detectResultId == typeList[i].id){
            				htmlStr+='<div class="col-md-6 col-sm-6 col-xs-6 checkbox" ><label><i class="icon-check"></i><input type="checkbox"  name="infoNote" onclick="selectTypeE(this)" id="'+typeList[i].id+'">&nbsp;'+typeList[i].content+'</label></div>';
                			flag = true;
                			break;
            			}
            		}
            		if(!flag){
            			htmlStr+='<div class="col-md-6 col-sm-6 col-xs-6 checkbox" ><label><i class="icon-check-empty"></i><input type="checkbox" name="infoNote" onclick="selectTypeE(this)" id="'+typeList[i].id+'">&nbsp;'+typeList[i].content+'</label></div>';
            		}
            	}
                
            }
            $("#sampleInputNote").html(htmlStr);

			$('input[name="infoNote"]').click(function(){
				var classStyle=$(this).is(':checked')==true?"icon-check":"icon-check-empty";
				$(this).prev().removeClass().addClass(classStyle);
				$("#dangerNote i").removeClass().addClass("icon-check-empty");
				$("input[name='dangerNote']").removeAttr("checked");
			}); 
			
			if(detectResultList == undefined || detectResultList.length == 0){
				$("#baoCunId").attr("disabled",false); 
			}else{
				$("#baoCunId").attr("disabled",true); 
			}
			
        },error: function(e) { 
        	$("#baoCunId").attr("disabled",false); 
        } 
    });
}

/**保存结果**/
function saveAndDealOther(){
	
	 if(selectIds.length <1){
	        alert("请选择涂片类型");
	        return;
	 }else{
		 var params={
	    			"detectId":detectId,
	    			"selectIds":selectIds.toString()
	    	};
		 $.ajax({
	            type : 'post',
	            url : basepath+"/experiment/handleDetectResult.action",
	            data:params,
	            dataType : 'json',
	            success : function(data) {
	            	$("#baoCunId").attr("disabled",true); 
	            	alert("保存成功！");
	            },error: function(e) { 
	                alert("保存异常！");
	            } 
	      });
			 
	 }
}




