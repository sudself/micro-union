var gridWidth;
var currentPage=1;
var rownum=10;
$(document).ready(function() {
// 	导航栏
	generateNav("集群");
// 	选中菜单
	selectAction(2);
	
	gridWidth = $("#taskresult-list").width();
	$("#create-button").click(function(){
		$('#myModalLabel').html("新建集群")
		$('#saveButton').unbind('click')
		$('#clusterName').val('');
		$('#clusterName').attr('disabled', false)
		$('#envTypeSelect').val(0);
		$('#envTypeSelect').attr('disabled', false)
		$('#comment').val('');
		$('#saveButton').bind('click',function(){
			var valid = $("#newClusterForm").valid();
			if(!valid){
				return false;
			}
			var clusterName = $("#clusterName").val();
			var envType = $("#envTypeSelect").val();
			var desc = $("#comment").val();
			var params = {
					name : clusterName,
					envType : envType,
					desc : desc
				};
			var requUrl = basePath+"/clusterAction/createCluster.action";
				$.ajax({
					type : 'post',
					url : requUrl,
					data : params,
					
					dataType : 'json',
					success : function(data) {
						
						$("#cancel").click();
						if(data['code']!=0){
							alert(data['msg'])
						}
						reloadList();
					}
				});			
			});		
		$('#myModal').modal('show');
	})
	

	initGrid();
	showEditBt();
	showDelBt();
});

function reloadList(){
	$('#datagrid').clearGridData();
	$("#datagrid").jqGrid('setGridParam', {
		postData : {}, //发送数据 
		page : currentPage
	});
	$("#datagrid").trigger("reloadGrid");
	showEditBt();
	showDelBt();
}

function initGrid() {
	$("#datagrid").jqGrid({
	    url : basepath+"/clusterAction/listCluster.action",
	//     postData : params, //发送数据  
	    datatype : "json",
	    autoheight:true,
	    width : gridWidth,
	    shrinkToFit : jqGridWidthFit(gridWidth,120),
	    forceFit:true,
	    rownumbers : true,
	    colModel : [{
	        label : 'ID',
	        name : 'id',
	        index : 'id',
	        width : 60
	    },{
	        label : '',
	        name : 'envType',
	        index : 'envType',
	        width : 60,
	        hidden : true
	    },{
	        label : '环境类型',
	        name : 'envType',
	        index : 'envType',
	        width : 60,
			formatter : function(v, opt, rec) {
				switch (v) {
				case 0:
					v = "开发环境";
					break;					
				case 1:
					v = "测试环境";
					break;
				case 2:
					v = "演示环境";
					break;					
				case 3:
					v = "生产环境";
					break;
				default:
					v = "未知";
					break;
				}
				return v;
			}	        
	    },{
	        label : '集群名称',
	        name : 'clusterName',
	        index : 'clusterName',
	        width : 60
	    },{
	        label : '虚机组数量',
	        name : 'vmGroupNumber',
	        index : 'vmGroupNumber',
	        width : 60,
			formatter : function(v, opt, rec) {
				var r;
				if(v>0){
					r='<div><a href='+basepath+'/vmGroupAction/index.action?cid='+rec.id+' style="color:#0e2d5f;width:100%;margin:0 auto;">'+v+"个虚机组</a></div>"
				}
				else
					r='<div>'+v+'个虚机组</div>'
				return r;
			}        
	    },{
	        label : '虚机数量',
	        name : 'vmNumber',
	        index : 'vmNumber',
	        width : 60,
			formatter : function(v, opt, rec) {
				var r;
				if(v>0){
				
					r='<div><a href='+basepath+'/virtualAction/index.action?cid='+rec.id+'&vmgid=-1 style="color:#0e2d5f;width:100%;margin:0 auto;">'+v+"个虚机</a></div>"
				}
				else
					r='<div>'+v+'个虚机</div>'
				return r;
			}		        
	    },{
	        label : '创建时间',
	        name : 'createTime',
	        index : 'createTime',
	        width : 60
	    },{
	        label : '备注',
	        name : 'comment',
	        index : 'comment',
	        width : 60
	    }],
	    sortname : "id",
	    sortorder : "desc",
	    rowNum : rownum,
	    page : 1,
	    viewrecords : true,
	    altRows :true,
	    altclass:'someClass',
	    hidegrid : false,
	    multiselect : true,
		onSelectRow: function (rowId, status, e) { 
			showEditBt();
			showDelBt();    
	    },
	    onSelectAll:function(rowid, status) {
			showEditBt();
			showDelBt(); 
	    },
	    jsonReader : {
	        repeatitems : false
	    },
	    gridComplete : function() {        
	        jqGridpaper();
			var rowIds =$("#datagrid").jqGrid('getDataIDs').length;
			var heightNum=1+rowIds*33;
			$("#taskresult-list .ui-jqgrid-bdiv").height(heightNum);
	    }
	});	
/* 	$("#grid").find("input[type='checkbox']").each(function(){
		$(this).change(function(){
			var colid = $(this).parents('tr:last').attr('id');
			if( $(this).is(':checked')) {
	           $("#list1").jqGrid('setSelection', colid );
	           $(this).prop('checked',true);
	        }
	        return true;
		})
	});	 */
}
function getParams(){
	   var params = {};
	   params["page"] = currentPage;
	   params["rows"] = rownum; 
	   return params;
}
function jqGridpaper() {
    $.jqGridajaxPager.pager("datagrid", function(
            clickNum, el) {
        currentPage=clickNum;
        var params = getParams();
        $("#datagrid").jqGrid('setGridParam', {
            postData : params, //发送数据 
            page : clickNum
        }).trigger("reloadGrid");
    }, "pager");
}
function createCluster() {
	var clusterName = $("#clusterName").val();
	var envType = $("#envTypeSelect").val();
	var desc = $("#comment").val();
	var params = {
			name : clusterName,
			envType : envType,
			desc : desc
		};
	var requUrl = basePath+"/clusterAction/createCluster.action";
		$.ajax({
			type : 'post',
			url : requUrl,
			data : params,
			
			dataType : 'json',
			success : function(data) {
				alert(data['msg'])
				$("#cancel").click();
				if(data['code']==0){
					reloadList();
				}
			}
		});
}
function jqGridSelect(){
	return $("#datagrid").find("input[type='checkbox']").map(function(){
		var colid = $(this).parents('tr:last').attr('id');
		return {checked:$(this).is(":checked"),colId:colid};
	}).filter(function(){
		return this.checked
	}).map(function(){
		var colid = this.colId;
		var rowData = $("#datagrid").getRowData(colid);
		return rowData;
	});
}
function updateCluster(){
	var selected = jqGridSelect();
	if(selected.length === 0 ){
		alert("请选择需要编辑的列！");
		return ;
	}
	
	if(selected.length > 1){
		alert("不能同时编辑多条数据！");
		return ;
	}
	
	var rowData = selected.map(function(){
		return this.id;
	}).get()[0]
	$('#saveButton').unbind('click')
	$('#saveButton').bind('click',function(){
		var vmgid = selected[0].id
		var desc = $("#comment").val();
		var params = {
				id : vmgid,
				desc : desc
			};
		var requUrl = basePath+"/clusterAction/updateCluster.action";
			$.ajax({
				type : 'post',
				url : requUrl,
				data : params,
				
				dataType : 'json',
				success : function(data) {
					
					$("#cancel").click();
					if(data['code']!=0){
						alert(data['msg'])
					}
					reloadList();
				}
			});				
	});
	
	$('#clusterName').val(selected[0].clusterName);
	$('#clusterName').attr('disabled', 'true')
	$('#envTypeSelect').val(getEnvType(selected[0].envType));
//	$('#envTypeSelect').empty();
//	$('#envTypeSelect option:eq("'+selected[0].envType+'")').attr('selected','selected');
	$('#envTypeSelect').attr('disabled', 'true')
	$('#comment').val(selected[0].comment);
	$('#myModalLabel').html("修改集群")
	$('#myModal').modal('show');			
}
function deleteCluster(){
	var selected = jqGridSelect();
	if(selected.length === 0 ){
		alert("请选择需要删除的集群！");
		return ;
	}
	
//	if(selected.length > 1){
//		alert("不能同时删除多条数据！");
//		return ;
//	}	
	$('#delClusterModal').modal('show');
}
function  executeDeleteCluster(){
	var rowIds = $("#datagrid").jqGrid('getGridParam', 'selarrrow');
	
	var params = {
			ids : rowIds.toString()
		};
	var requUrl1 = basepath+"/clusterAction/deleteCluster.action";
		$.ajax({
			type : 'post',
			url : requUrl1,
			data : params,
			dataType : 'json',
			success : function(data) {
				$("#delCancel").click();
				if(data['code']!=0){
					alert(data['msg'])
				}
				currentPage = 1;//删除操作，刷新页面统一定位到第一页
				reloadList();
			}
		});
}
function getEnvType(text){
	var v = 0;
	switch (text) {
	case "开发环境":
		v = 0;
		break;					
	case "测试环境":
		v = 1;
		break;
	case "演示环境":
		v = 2;
		break;					
	case "生产环境":
		v = 3;
		break;
	default:
		v = 0;
		break;
	}
	return v;	
}
/*控制删除按钮是否可用*/
function showDelBt() {
	var rowIds = $("#datagrid").jqGrid('getGridParam', 'selarrrow');
	if (rowIds != "" && rowIds !=null) {
		$("#delete-button").removeClass("disabled");
	} else {
		$("#delete-button").addClass("disabled");
	}
}
/*控制编辑按钮是否可用*/
function showEditBt() {
	var rowIds = $("#datagrid").jqGrid('getGridParam', 'selarrrow');
	if (rowIds != "" && rowIds !=null) {
		$("#edit-button").removeClass("disabled");
	} else {
		$("#edit-button").addClass("disabled");
	}
}