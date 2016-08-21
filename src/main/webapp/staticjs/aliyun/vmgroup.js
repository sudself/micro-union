	
    var gridWidth;
    var currentPage=1;
    var rownum=10;
    var curClusterId = 0;
    var defaultUrl = basepath+"/vmGroupAction/listVMGroup.action";
    var queryVMGroupByClusterUrl = basePath+"/vmGroupAction/listVMGroupByCluster.action";
	$(document).ready(function() {
		// 	导航栏
		generateNav("虚机组");
		// 	选中菜单
		selectAction(3);

		gridWidth = $("#taskresult-list").width();
		
		initclustertType();
		
		$("#createVMGroup").click(function(){
			$('#myModalLabel').html("新建虚机组")
			$('#saveButton').unbind('click')
			$('#clustertTypeNew').selectedIndex=0;
			$('#clustertTypeNew').attr('disabled', false)
			$('#groupName').val('');
			$('#groupName').attr('disabled', false)
			$('#comment').val('');
			$('#saveButton').bind('click',function(){
					var valid = $("#newVMGroupForm").valid();
					if(!valid){
						return false;
					}
					var groupName = $("#groupName").val();
					var clusterId = $("#clustertTypeNew").val();
					var desc = $("#comment").val();
					var params = {
							name : groupName,
							cid : clusterId,
							desc : desc
						};
					var requUrl = basePath+"/vmGroupAction/createVMGroup.action";
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
								var url="";
								var params = {};
								if(curClusterId==0)
									url = defaultUrl;
								else{
									url = queryVMGroupByClusterUrl;
									params["cid"]=curClusterId;
								}
								reloadList();
							}
						});				
				});
			$('#myModal').modal('show');
		})
		
		
		cid = getUrlParam('cid');
		if(cid!=null && cid!=""){
			curClusterId = cid;
			$("#clustertType").val(curClusterId);
			var params = {
					cid : curClusterId,
				};			
			initGrid(queryVMGroupByClusterUrl,params);
		}
		else{
			var params = {}
			initGrid(defaultUrl,params);
		}
		showEditBt();
	});
	
	/*初始化参数   集群  */
	function initclustertType(){
		var requUrl = basepath+"/clusterAction/listAllCluster.action";
			$.ajax({
				type : 'post',
				url : requUrl,
				async: false, 
				dataType : 'json',
				success : function(data) {
					var str="";
					var str2 = "";
					var clusterId="";
					str+='<option value=0>所有集群</option>'
					for(var i=0;i<data.rows.length;i++){
						str+='<option value='+data.rows[i].id+'>'+data.rows[i].clusterName+'</option>';
						str2+='<option value='+data.rows[i].id+'>'+data.rows[i].clusterName+'</option>';
					}
					$("#clustertType").html(str);
					$("#clustertTypeNew").html(str2);

			}});//curClusterId

	}
	function reloadList(url,params){
		$("#clustertType").val(curClusterId);
		$('#datagrid').clearGridData();
		$("#datagrid").jqGrid('setGridParam', {
			url:url,
			postData : params, //发送数据 
			page : currentPage
		});
		$("#datagrid").trigger("reloadGrid");
		showEditBt();
	}
	function initGrid(url,params) {
		$("#datagrid").jqGrid({
		    url : url,
	        postData : params, //发送数据  
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
		        name : 'clusterId',
		        index : 'clusterId',
		        width : 60,
		        hidden : true
		    },{
		        label : '集群名称',
		        name : 'clusterName',
		        index : 'clusterName',
		        width : 60
		    },{
		        label : '虚机组名称',
		        name : 'groupName',
		        index : 'groupName',
		        width : 60        	        
		    },{
		        label : '虚机组描述',
		        name : 'comment',
		        index : 'comment',
		        width : 60
		    },{
		        label : '虚机数量',
		        name : 'vmNumber',
		        index : 'vmNumber',
		        width : 60,
				formatter : function(v, opt, rec) {
					var r;
					if(v>0){
						r='<div><a href='+basepath+'/virtualAction/index.action?cid='+rec.clusterId+'&vmgid='+rec.id+' style="color:#0e2d5f;width:100%;margin:0 auto;">'+v+"个虚机</a></div>"
					}
					else
						r='<div>'+v+'个虚机</div>'
					return r;
				}		        
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
	}
//	function saveVMGroup() {
//		var groupName = $("#groupName").val();
//		if(groupName==null || groupName==""){
//			alert("虚拟机组名称不能为空");
//			return;
//		}
//		var clusterId = $("#clustertTypeNew").val();
//		var desc = $("#comment").val();
//		var params = {
//				name : groupName,
//				cid : clusterId,
//				desc : desc
//			};
//		var requUrl = basePath+"/vmGroupAction/createVMGroup.action";
//			$.ajax({
//				type : 'post',
//				url : requUrl,
//				data : params,
//				
//				dataType : 'json',
//				success : function(data) {
//					alert(data['msg'])
//					$("#cancel").click();
//					if(data['code']==0){
//						var url="";
//						var params = {};
//						if(curClusterId==0)
//							url = defaultUrl;
//						else{
//							url = queryVMGroupByClusterUrl;
//							params["cid"]=curClusterId;
//						}
//						reloadList(url,params);
//					}
//				}
//			});
//	}
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
	        $("#clustertType").val(curClusterId);
	        var params = getParams();
	        $("#datagrid").jqGrid('setGridParam', {
	            postData : params, //发送数据 
	            page : clickNum
	        }).trigger("reloadGrid");
	    }, "pager");
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
	function updateVMGroup(){
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
			var requUrl = basePath+"/vmGroupAction/updateVMGroup.action";
				$.ajax({
					type : 'post',
					url : requUrl,
					data : params,
					
					dataType : 'json',
					success : function(data) {
//						alert(data['msg'])
						$("#cancel").click();
						if(data['code']!=0){
							alert(data['msg'])
						}
						reloadList();
					}
				});				
		});
		
		$('#clustertTypeNew').val(selected[0].clusterId);
		$('#clustertTypeNew').attr('disabled', 'true')
		$('#groupName').val(selected[0].groupName);
		$('#groupName').attr('disabled', 'true')
		$('#comment').val(selected[0].comment);
		$('#myModalLabel').html("修改虚机组")
		$('#myModal').modal('show');			
	}
	function editVMGroup(){
		var clusterId = $("#clustertTypeNew").val();
		var desc = $("#comment").val();
		var params = {
				cid : clusterId,
				desc : desc
			};
		var requUrl = basePath+"/vmGroupAction/updateVMGroup.action";
			$.ajax({
				type : 'post',
				url : requUrl,
				data : params,
				
				dataType : 'json',
				success : function(data) {
					alert(data['msg'])
					$("#cancel").click();
					if(data['code']==0){
						var url="";
						var params = {};
						if(curClusterId==0)
							url = defaultUrl;
						else{
							url = queryVMGroupByClusterUrl;
							params["cid"]=curClusterId;
						}
						reloadList(url,params);
					}
				}
			});		
	}
	function searchByCluster(){
		var clusterId = $("#clustertType").val();
		curClusterId = clusterId;
		currentPage = 1;
		if(clusterId==0){
			reloadList(defaultUrl,{});
		}
		else{
//			var requUrl = basePath+"/vmGroupAction/listVMGroupByCluster.action";
			var params = {
					cid : clusterId,
				};
			$('#datagrid').clearGridData();
			$("#datagrid").jqGrid('setGridParam', {
				url:queryVMGroupByClusterUrl,
				postData : params, //发送数据 
				page : currentPage
			});
			$("#datagrid").trigger("reloadGrid");			
		}
	}
    //获取url中的参数
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg);  //匹配目标参数
        if (r != null) return unescape(r[2]); return null; //返回参数值
    }
    /*控制编辑按钮是否可用*/
    function showEditBt() {
    	var rowIds = $("#datagrid").jqGrid('getGridParam', 'selarrrow');
    	if (rowIds != "" && rowIds !=null) {
    		$("#updateVMGroup").removeClass("disabled");
    	} else {
    		$("#updateVMGroup").addClass("disabled");
    	}
    }