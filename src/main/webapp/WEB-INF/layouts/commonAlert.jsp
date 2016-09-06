<div id="alertModel" style="float:right;" >

</div>
<div id="loaddiv" class="loaddiv" style="display: none;"></div>
<div id="loadbg" class="loadbg" style="display: none;"></div>
<div class="modal fade"  id="waitWarningModel" tabindex="-1" role="dialog" aria-labelledby="waitWarningModelLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content"  >
			<div class="modal-header">
			<button type="button" class="close" id="waitWarningModelLabelBT" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h5 class="modal-title" id="waitWarningModelLabel">提示框</h5>
			</div>
			<div class="modal-body">
			<div class="form-group" style="text-align:center;" id="waitWarningMessage"> 
                                            
            </div>	
			</div>		
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
//显示遮罩层
function showCommonMask(){
	$("#loaddiv").show();
	$("#loadbg").show();
}
//隐藏遮罩层
function hideCommonMask(){
    $("#loaddiv").hide();
    $("#loadbg").hide();
}

function alertModel(type,popHtml){
	//type类型  success  warning danger
	type="alert-"+type;
	var model='<div class="alert '+type+'"><a class="close" data-dismiss="alert">&times;</a>'+popHtml+'</div>';
    $("#alertModel").html(model);
    $("#alertModel").fadeIn();
    $("#alertModel").fadeOut(5000);
}
</script>