<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="modal fade"  id="tipModal" tabindex="-1" role="dialog" aria-labelledby="tipModalTitle" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                    aria-hidden="true">&times;</button>
                <h5 class="modal-title" id="tipModalTitle">提示</h5>
            </div>
            <div class="modal-body" id="tipModalBody">
                warning!
            </div>
            <div class="modal-footer" id="tipModalFooter">
                <button type="submit" id="saveBtn" class="btn btn-primary" >确定</button>
                <button type="button" id="cancelBtn" class="btn btn-primary" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
function showTipModal1(tipModalBody,tipModalTitle,cancelBtnFunction){
	if(!!tipModalTitle){
		$("#tipModalTitle").html(tipModalTitle);
	}
	
	if(!!tipModalBody){
		$("#tipModalBody").html(tipModalBody);
	}
	$("#saveBtn").addClass("hide");
	$("#cancelBtn").html("确定");
	
	if(cancelBtnFunction && typeof(cancelBtnFunction) == 'function'){
		$("#cancelBtn").unbind("click");
	    $("#cancelBtn").bind("click",function(){
	    	cancelBtnFunction();
	    });
	}
	
	$("#tipModal").modal("show");
//     var fbtn = [{
//     	"name":"确定",
//     	"func":cancelBtnFunction
//     }];
// 	initModal('',tipModalTitle,tipModalBody,fbtn);
}

function showTipModal2(tipModalBody,tipModalTitle,saveBtnFunction,cancelBtnFunction){
    if(!!tipModalTitle){
        $("#tipModalTitle").html(tipModalTitle);
    }
    
    if(!!tipModalBody){
        $("#tipModalBody").html(tipModalBody);
    }
    $("#saveBtn").html("确定");
    $("#saveBtn").removeClass("hide");
    $("#cancelBtn").html("取消");

    if(saveBtnFunction && typeof(saveBtnFunction) == 'function'){
        $("#saveBtn").unbind("click");
        $("#saveBtn").bind("click",function(){
        	saveBtnFunction();
        });
    }
    

    if(cancelBtnFunction && typeof(cancelBtnFunction) == 'function'){
        $("#cancelBtn").unbind("click");
        $("#cancelBtn").bind("click",function(){
            cancelBtnFunction();
        });
    }
    
    $("#tipModal").modal("show");
// 	var fbtn = [{
//         "name":"确定",
//         "func":saveBtnFunction
//     },{
//         "name":"取消",
//         "classStatus":"cancel",
//         "func":cancelBtnFunction
//     }];
//     initModal('',tipModalTitle,tipModalBody,fbtn);
}

function initModal(tipModalId,tipModalTitle,tipModalBody,footerBtns){
    if(!tipModalId){
    	tipModalId = "tipModal"+new Date().getTime();
    }
    if(!tipModalTitle){
    	tipModalTitle="提示";
    }
    
    if(!tipModalBody){
        tipModalBody="warning";
    }
    var fhtml = "";
    if(!!footerBtns && typeof(footerBtns)=='object' && footerBtns.length>0){
    	fhtml += '        <div class="modal-footer" id="tipModalFooter">';
   		for(var i=0;i<footerBtns.length;i++){
   			var fb1 = footerBtns[i];
   			var fb1Name = fb1.name;
   			if(!fb1Name){
                   continue;
               }
   			var fb1Id = fb1.id;
   			if(!fb1Id){
   				fb1Id = "btn"+i+(new Date().getTime());
   			}
   			var fbClass = "cancel"==fb1.classStatus?"btn-info":"btn-primary";
   			fhtml +='            <button type="submit" id="'+fb1Id+'" class="btn '+fbClass;
   			
   			var fbFunc = fb1.func;
   			if(!!fb1.func){
   				fhtml +='" onclick="'+fb1.func+'();" ';
   			}
   			
   			fhtml +='>'+fb1Name+'</button>'
   		}
    	fhtml+='        </div>'
    }
    var mhtml = '<div class="modal fade"  id="'+tipModalId+'" tabindex="-1" role="dialog" aria-labelledby="'+tipModalId+'Title" aria-hidden="true">'+
				    '<div class="modal-dialog">'+
				    '    <div class="modal-content">'+
				    '        <div class="modal-header">'+
				    '            <button type="button" class="close" data-dismiss="modal"'+
				    '                aria-hidden="true">&times;</button>'+
				    '           <h5 class="modal-title" id="'+tipModalId+'Title">'+tipModalTitle+'</h5>'+
				    '      </div>'+
				    '        <div class="modal-body" id="tipModalBody">'+
				    '            '+tipModalBody+''+
				    '        </div>'+
				             fhtml+
				    '    </div>'+
				    '</div>'+
				'</div>';
    $("body").append(mhtml);
    $("#"+tipModalId).modal("show");
    return  $("#"+tipModalId);
}
</script>