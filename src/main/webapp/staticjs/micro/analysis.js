var gridWidth;
var currentPage=1;
var rownum=10;
var myInterval ;
$(document).ready(function() {
	gridWidth = $("#samples-list").width();
	initAll();
});

function initAll(){
	clearData();
	
	showCommonMask();
	
	initSamplesTable();
}
function clearData(){
	$('#samplesTableResult').html("");
}
function getParams(){
	   var params = {};
	   params["page"] = currentPage;
	   params["rows"] = rownum; 
	   return params;
}
function initSamplesTable() {
	$("#datagrid").jqGrid({
	    url : "list.action",
	    postData : getParams(), //发送数据  
	    datatype : "json",
	    autoheight:true,
	    width : gridWidth,
	    shrinkToFit : jqGridWidthFit(gridWidth,120),
	    forceFit:true,
	    rownumbers : true,
	    colModel : [{
	        label : '医院条码',
	        name : 'hospital_code',
	        index : 'hospital_code',
	        width : 100,
	    },{
	        label : '瓶身条码',
	        name : 'bottle_code',
	        index : 'bottle_code',
	        width : 100
	    },{
	        label : '患者信息',
	        name : 'patient_info',
	        index : 'patient_info',
	        width : 60
	    },{
	        label : '录入时间',
	        name : 'receive_time',
	        index : 'receive_time',
	        width : 60
	    },{
	        label : '标本类型',
	        name : 'sample_type_name',
	        index : 'sample_type_name',
	        width : 60
	    },{
	        label : '当前状态',
	        name : 'status',
	        index : 'status',
	        width : 60
	    },{
	        label : '标本信息标志',
	        name : 'sample_content',
	        index : 'sample_content',
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
	    jsonReader : {
	        repeatitems : false
	    },
	    gridComplete : function() {        
	        jqGridpaper();
			var rowIds =$("#datagrid").jqGrid('getDataIDs').length;
			var heightNum=1+rowIds*33;
			$("#samples-list .ui-jqgrid-bdiv").height(heightNum);
			
			hideCommonMask();
	    }
	});	
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
/*定时刷新虚机信息*/
/*$("#timeRefresh").click(function(){
	var flag=$("#timeRefresh").is(':checked');
	if(flag){
		myInterval= window.setInterval(initAll,refresh);
	}else{
		window.clearInterval(myInterval);
	}
});*/

/*手动刷新虚机信息*/
$("#manualRefresh").click(function(){
	initAll();
});
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