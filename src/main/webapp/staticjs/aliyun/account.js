	var gridWidth;
	var currentPage=1;
	var refresh=30000;
	var myInterval ;  
	var typeIDSelect;
	var aou = 0;
	var accountId=0;
	var rowNum = 10;
	$(document).ready(function() {
		// 	导航栏
		generateNav("云账号管理");
		// 	选中菜单
		selectAction(8);
		gridWidth = $("#taskresult-list").width();
		initJqGrid();
		$("#cb_datagrid").click(function(){
			showDelBt();
		});
		
		$("#accountUpdateStatusbtn").click(function(){
			$("#delAccount").addClass("disabled");
			$("#updateAccount").addClass("disabled");
			refreshBtn();
		});
		$("#displaydelAccountTip").click(function(){
			refreshBtn();
		});
		$("#displaydelAccount").click(function(){
			$("#delAccount").addClass("disabled");			
			searchAccountInfo();
		});
		
		$("#manualRefresh").click(function(){
			$("#delAccount").addClass("disabled");
			$("#updateAccount").addClass("disabled");
			searchAccountInfo();
		});
		
		$("#timeRefresh").click(function(){
			var flag=$("#timeRefresh").is(':checked');
			if(flag){
				myInterval= window.setInterval(searchAccountInfo,refresh);
			}else{
				window.clearInterval(myInterval);
			}
		});
		
	});

	
	/*同步帐号accountSync*/
	function accountSync() {
    	var requUrl1 = basepath+"/cloudAccountAction/accountSync.action";
    	$('#accountSyncModal').modal('show');
    	$("#tip4").html("同步中，请稍候...");  
    	$.ajax({
            cache:false,   
            timeout:60000,
			type : 'post',
			url : requUrl1,
			dataType : 'json',
			error:function(jqXHR, textStatus, errorThrown){   
				if(textStatus=="timeout"){
					$('#accountSyncModal').modal('hide');
					$('#accountUpdateStatusModal').modal('show');
                    $("#tip2").html('<div style="color:red">同步超时，请重试！</div>');
                }
            },
			success : function(data) {
				$('#accountSyncModal').modal('hide');
				$('#accountUpdateStatusModal').modal('show');
				$("#tip2").html("同步成功！");
			}
		});
	}
	
	function validateFunc(){
		$("#addAccountForm").validate({
		    // 添加验证规则
		    rules: {
		    	accountNameText:{
		            required: true
		        },
		        selectType:{
		        	required: true,
		        	selectType: true
		        },
		        keyIDText:{
		        	 required: true
		        },
		        keySecretText:{
		        	 required: true
		        },
		        tenantNameText:{
		        	 required: true
		        },
		        usernameText:{
		        	 required: true
		        },
		        passwordText:{
		        	 required: true
		        },
		        endpointText:{
		        	 required: true
		        }
		    },
		    submitHandler: function (data) {
		    	var requUrl1 = basepath+"/cloudAccountAction/addAccount.action";
		    	var requUrl2 = basepath+"/cloudAccountAction/updateAccount.action";
		    	var accountName = $("#cloudAccountName").val();
				typeIDSelect = $("#typeIDSelect").val();
				if (typeIDSelect == 0) {
					var keyID = $("#keyID").val();
					var keySecret = $("#keySecret").val();
					var marka = $("#marka").val();
					var params = {
							accountId : accountId,
							accountName : accountName,
							typeIDSelect : typeIDSelect,
							keyID : keyID,
							keySecret : keySecret,
							mark : marka
					};
				}else if (typeIDSelect == 1) {
					var tenantName = $("#tenantName").val();
					var username = $("#username").val();
					var password = $("#password").val();
					var endpoint = $("#endpoint").val();
					var markw = $("#markw").val();
					var params = {
							accountId : accountId,
							accountName : accountName,
							typeIDSelect : typeIDSelect,
							tenantName : tenantName,
							username : username,
							password : password,
							endpoint : endpoint,
							mark : markw
					};
				}
				if (aou==1) {
					$.ajax({
						type : 'post',
						url : requUrl1,
						data : params,
						dataType : 'json',
						success : function(data) {
							$("#accountCancelBtn").click();
							if (data=='exists') {
								$('#accountUpdateStatusModal').modal('show');
								$("#tip2").html('<div style="color:red">此帐号已被添加，添加失败！</div>');  
							}
							refreshBtn();
						}
					});
				}else if (aou==2) {
					$.ajax({
						type : 'post',
						url : requUrl2,
						data : params,
						dataType : 'json',
						success : function(data) {
							$("#accountCancelBtn").click();
							if (data=='exists') {
								$('#accountUpdateStatusModal').modal('show');
								$("#tip2").html('<div style="color:red">此帐号已被添加，修改失败！</div>');  
							}
							refreshBtn();
						}
					});
				}
		    }
		}); 
	}
	
	
	/*控制删除按钮是否可用*/
	function showDelBt() {
		var rowIds = $("#datagrid").jqGrid('getGridParam', 'selarrrow');
		if (rowIds.length == 1 ) {
			$("#updateAccount").removeClass("disabled");
		}else {
			$("#updateAccount").addClass("disabled");
		}
		if (rowIds != "") {
			$("#delAccount").removeClass("disabled");
		} else {
			$("#delAccount").addClass("disabled");
		}
	}
	
	
	/*查询帐号详情*/
	function searchAccountInfo() {
		$('#datagrid').clearGridData();
		$("#tip").html("");  
		$("#datagrid").jqGrid('setGridParam', {
//			postData : tempParam, //发送数据 
			page : currentPage
		});
		$("#datagrid").trigger("reloadGrid");
	}
	
	/*验证帐号 刷新*/
	function refreshBtn() {
		$('#datagrid').clearGridData();
		$("#datagrid").jqGrid('setGridParam', {	
			page : currentPage
		});
		$("#datagrid").trigger("reloadGrid");
	}
	
	/*获取查询参数信息*/
	function getParams() {
//		var clustertType = $("#clustertType").val();
//		var virtualGroup = $.trim($("#virtualGroup").val());
//		var virtualName = $("#virtualName").val();
		var params = {
			/*clustertType : clustertType,
			virtualGroup : virtualGroup,
			virtualName : virtualName*/
		};
		return params;
	}

	
	
	/*新建帐号*/
	function addAccount(){
		aou = 1;
		$('#typeIDSelect').removeAttr("disabled");
		$('#myModalAddAccount label.error').remove();
		$('#myModalAddAccount .error').removeClass("error");
		$("#cloudAccountName").val('');
		$("#typeIDSelect").val(-1);
		$("#keyID").val('');
		$("#keySecret").val('');
		$("#tenantName").val('');
		$("#username").val('');
		$("#password").val('');
		$("#endpoint").val('');
		$("#marka").val('');
		$("#markw").val('');
		$("#addAccountTitle").text('新建云账号');
		$('#aliyunShow').hide();
		$('#woyunShow').hide();
		$('#myModalAddAccount').modal('show');
	}
	
	/*更新帐号*/
	function updateAccount(){
		aou = 2;
		$('#myModalAddAccount label.error').remove();
		$('#myModalAddAccount .error').removeClass("error");
		var accountIds = $("#datagrid").jqGrid('getGridParam', 'selarrrow');
		if(accountIds.length == 1){
			accountId = accountIds[0];
			var accountData = $('#datagrid').jqGrid('getRowData',accountIds[0]);
			$("#addAccountTitle").text('修改云账号：'+accountData.accountName);
			var params = {
				accountId : accountId
			};
			var requUrl1 = basepath+"/cloudAccountAction/selectAccount.action";
				$.ajax({
					type : 'post',
					url : requUrl1,
					data : params,
					dataType : 'json',
					success : function(data) {
						if (data.typeId==0) {
							$("#cloudAccountName").val(data.accountName);
							$("#typeIDSelect").val(data.typeId);
							$('#typeIDSelect').attr('disabled', 'true')
							$("#keyID").val(data.username);
							$("#keySecret").val(data.password);
							$("#marka").val(data.mark);
							$('#woyunShow').hide();
							$('#aliyunShow').show();
							$('#myModalAddAccount').modal('show');
						}else if (data.typeId==1) {
							$("#cloudAccountName").val(data.accountName);
							$("#typeIDSelect").val(data.typeId);
							$('#typeIDSelect').attr('disabled', 'true')
							$("#tenantName").val(data.tenantname);
							$("#username").val(data.username);
							$("#password").val(data.password);
							$("#endpoint").val(data.endpoint);
							$("#markw").val(data.mark);
							$('#aliyunShow').hide();
							$('#woyunShow').show();
							$('#myModalAddAccount').modal('show');
						}
					}
				});
		}
	}
	
	
	function selectChange() {
		var typeIDSelect = $("#typeIDSelect").val();
		if (typeIDSelect==0) {
			$('#aliyunShow').show();
			$('#woyunShow').hide();
		}else if (typeIDSelect==1) {
			$('#woyunShow').show();
			$('#aliyunShow').hide();
		}else {
			$('#aliyunShow').hide();
			$('#woyunShow').hide();
		}
	}
	
	/*更新帐号状态*/
	function accountUpdateStatus(obj) {
		var id = $(obj).attr("data-id");
//		var userName = $("#userSelect").val();
		var params = {
			id : id
		};
		var requUrl1 = basepath+"/cloudAccountAction/accountUpdateStatus.action";
		$('#accountSyncModal').modal('show');
    	$("#tip4").html("验证中，请稍候..."); 
		$.ajax({
			cache:false,   
			timeout:5000,
			type : 'post',
			url : requUrl1,
			data : params,
			dataType : 'json',
			error:function(jqXHR, textStatus, errorThrown){   
				if(textStatus=="timeout"){
					$('#accountSyncModal').modal('hide');
					$('#accountUpdateStatusModal').modal('show');
                    $("#tip2").html("验证超时，请重试！");  
                }
            },
			success : function(data) {
//				alert(JSON.stringify(data));
				$('#accountSyncModal').modal('hide');
				$('#accountUpdateStatusModal').modal('show');
				if (data=='1') {
					$("#tip2").html("帐号有效！");  
				}else if (data=='0') {
					$("#tip2").html('<div style="color:red">帐号无效！</div>');
				}
			}
		});
	}
	

	
	
/*删除帐号*/
	function delAccount() {
		var rowIds = $("#datagrid").jqGrid('getGridParam', 'selarrrow');
		if(rowIds!=""){
			$('#delAccountModal').modal('show');
		}
	}
		
	function  executedelAccount(){
		var rowIds = $("#datagrid").jqGrid('getGridParam', 'selarrrow');
		var ids =[];
		for ( var i = 0; i < rowIds.length; i++) {
			var cl = rowIds[i];
			var model = $("#datagrid").jqGrid('getRowData', cl);
			ids[i] = model.id;
		}
		var params = {
				ids : ids.toString()
			};
		var requUrl1 = basepath+"/cloudAccountAction/accountDelete.action";
			$.ajax({
				type : 'post',
				url : requUrl1,
				data : params,
				dataType : 'json',
				success : function(data) {
					$("#delAccountModal").modal("hide");
					if(data['code']!=0){
						$("#delAccountModalTip").modal("show");
						$("#tip3").html(data['msg']);  
					}else{
						currentPage=1;
						searchAccountInfo();
					}
				}
			});
	}
	
	/*分页绑定*/
	function jqGridpaper() {
		$.jqGridajaxPager.pager("datagrid", function(clickNum, el) {
			var params = getParams();
			currentPage=clickNum;
			$("#datagrid").jqGrid('setGridParam', {
				postData : params, //发送数据 
				page : currentPage
			}).trigger("reloadGrid");
		}, "pager");
	}
	
	/*jqGrid绑定表格数据*/
	function initJqGrid() {		
		$("#datagrid").jqGrid({
							url : basepath+"/cloudAccountAction/list.action",
							postData : getParams(), //发送数据  
							datatype : "json",
							autoheight : true,
							width : gridWidth,
							shrinkToFit : jqGridWidthFit(gridWidth, 120),
							forceFit : true,
							rownumbers : true,
							colModel : [
									{
										label : '序号',
										name : 'id',
										index : 'id',
										width : 8,
										hidden : true
									},
									{
										label : '名称',
										name : 'accountName',
										index : 'accountName',
										width : 20
									},
									{
										label : '插件',
										name : 'typeId',
										index : 'typeId',
										width : 15,
										formatter : function(v, opt, rowObject) {
											var str="<div style='width:46px;float:left;'>";
											if(v==0){
												str+="<image title='阿里云' style='width:22px;height:18px;' src='"+basepath+"/images/aliyun.png'></image>";
												str+="&nbsp;阿里云插件</div>";
											}else if(v==1){
												str+="<image title='沃云' style='width:22px;height:18px;' src='"+basepath+"/images/wo.png'></image>";
												str+="&nbsp;沃云插件</div>";
											}
											return str;
										}
									},
									{
										label : '帐号状态',
										name : 'status',
										index : 'status',
										width : 7,
										formatter : function(v, opt, rec) {
											switch (v) {
											case 0:
												v = '<div style="color:red">无效</div>';
												break;
											case 1:
												v = '有效';
												break;
											default:
												v = '<div style="color:red">无效</div>';
												break;
											}
											return v;
										}
									},
									{
										label : '云主机',
										name : 'vmCount',
										index : 'vmCount',
										width : 10,
										formatter: function (v, opt, rec) {
											if (v != 0) {
												v = '<div style="color:#428BCA">'+v+'台</div>';
											}else {
												v = v + '台';
											}
											return v;
										}
									},
									{
										label : '同步状态',
										name : 'syncStatus',
										index : 'syncStatus',
										width : 10,
										formatter : function(v, opt, rec) {
											switch (v) {
											case 0:
												v = '<div style="color:red">更新失败</div>';
												break;
											case 1:
												v = '更新成功';
												break;
											default:
												v = '<div style="color:red">更新失败</div>';
												break;
											}
											return v;
										}
									},
									{
										label : '上次同步时间',
										name : 'updateTime',
										index : 'updateTime',
										width : 15,
										formatter : function(v, opt, rec) {
											if (v==null) {
												v = 'N/A';
//												v = '<div style="color:red">N/A</div>';
											}
											return v;
										}
									},
									{
										label : '创建时间',
										name : 'createTime',
										index : 'createTime',
										width : 15
									},
									{
										label : '备注',
										name : 'mark',
										index : 'mark',
										width : 17
									},
									{
										label : "操作",
										name : "operator",
										index : "operator",
										width : 80,
										align : "center",
										fixed : true
									}
							
							],
							rowNum : rowNum,
							page : 1,
							viewrecords : true,
							altRows : true,
							altclass : 'someClass',
							hidegrid : false,
							multiselect : true, 
//							multiboxonly:true, //单选
							onSelectRow: function (rowId, status, e) {       
								showDelBt();   
						    },
							jsonReader : {
								repeatitems : false
							},
							gridComplete : function() {
								var rowIds =$("#datagrid").jqGrid('getDataIDs').length;
								var heightNum=1+rowIds*33;
								$("#taskresult-list .ui-jqgrid-bdiv").height(heightNum);
								var ids = $("#datagrid").jqGrid('getDataIDs');
								for ( var i = 0; i < ids.length; i++) {
									var cl = ids[i];
									var model = $("#datagrid").jqGrid('getRowData', cl);
									var operatorS = "<div><button type='button' data-id='"+ model.id+ "' class='btn btn-link' onclick='accountUpdateStatus(this);'>验证帐号</button>";
									operatorS += "<div>";
									$("#datagrid").jqGrid('setRowData', cl, {
										operator : operatorS
									});
								}
								jqGridpaper();
							}
						});
	}
	
	/*导入虚机*/
	function importVirtual(){
		$('#importVirtualModel').modal('show');
	}