var gridWidth;
var sysInfoUrl=basePath+"/dashboardAction/systeminfo.action";
var monitorUrl=basePath+"/dashboardAction/monitorinfo.action";
var topx=5;
var refresh=60000;
var myInterval ;
$(document).ready(function() {
// 	导航栏
	generateNav("仪表盘");
// 	选中菜单
	selectAction(0);
	
	gridWidth = $("#taskresult-list").width();
	
	initAll();
});

function initAll(){

	clearData();
	
	showCommonMask();
	
	initsysInfoTable();
	
	initCPUInternetTXTable();
}
function clearData(){
	$("#clusterNumber").text();
	$("#vmGroupNumber").text();
	$("#aVMNumber").text();
	$("#oVMNumber").text();
	$("#yunAccountNumber").text();
	
	$('#cpuTableResult').html("");
	$('#internetTXTableResult').html("");
	
}
function initsysInfoTable() {

		$.ajax({
			type : 'post',
			url : sysInfoUrl,
//			data : params,
			dataType : 'json',
			success : function(data) {
				if(0!=data['code']){
					alert(data['msg'])
				}
				else{
					//填充数据
					$("#clusterNumber").text(data.obj['clusterNumber']);
					$("#vmGroupNumber").text(data.obj['vmGroupNumber']);
					$("#aVMNumber").text(data.obj['aliyunVMNumber']);
					$("#oVMNumber").text(data.obj['openstackVMNumber']);
					$("#yunAccountNumber").text(data.obj['yunAccountNumber']);
				}
			}
		});
}
function getParams(){
	   var params = {};
	   params["page"] = currentPage;
	   params["rows"] = rownum; 
	   return params;
}
function initCPUInternetTXTable() {
	var params={
			topx:topx
	};
	$.ajax({
		type : 'post',
		url : monitorUrl,
		data : params,
		dataType : 'json',
		success : function(data) {
			if(0!=data['code']){
//				alert(data['msg'])
			}
			else{
				//填充数据
				var relRowNumber = data.obj.monitorInfo.TOP5_CPU.length;
				var html1 = "";
				var html2 = "";
				for(var i=0;i<relRowNumber;i++)
				{
					html1+="<tr style='text-align:center'><td>"+data.obj.monitorInfo.TOP5_CPU[i].clusterName+"</td>"+
							"<td>"+data.obj.monitorInfo.TOP5_CPU[i].vmName+"</td>"+
							"<td>"+data.obj.monitorInfo.TOP5_CPU[i].cpu+"</td></tr>";
					html2+="<tr style='text-align:center'><td>"+data.obj.monitorInfo.TOP5_InternetTX[i].clusterName+"</td>"+
							"<td>"+data.obj.monitorInfo.TOP5_InternetTX[i].vmName+"</td>"+
							"<td>"+data.obj.monitorInfo.TOP5_InternetTX[i].InternetTX+"</td></tr>";					
				}
				$('#cpuTableResult').html(html1);
				$('#internetTXTableResult').html(html2);
			}
			hideCommonMask();
		}
	});
}
/*定时刷新虚机信息*/
$("#timeRefresh").click(function(){
	var flag=$("#timeRefresh").is(':checked');
	if(flag){
		myInterval= window.setInterval(initAll,refresh);
	}else{
		window.clearInterval(myInterval);
	}
});

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