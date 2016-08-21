<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />

<div id="taskresult-list" class="taskresult-list" style="">
    <table id="datagrid"></table>
    <div>
        <div id="pager" class="pager"></div>
    </div>
</div>

<script type="text/javascript">
    var basepath="${basePath}";
	$(document).ready(function() {
		
		//导航栏
		generateNav("监控告警");
		//选中菜单
		selectAction(9);
		
		
		var gridWidth = $("#taskresult-list").width();
		$("#search-button").click(function() {
			var tempParam = getParams();
			currentPage = 1;
			$('#datagrid').clearGridData();
			$("#datagrid").jqGrid('setGridParam', {
				postData : tempParam, //发送数据 
				page : currentPage
			});
			$("#datagrid").trigger("reloadGrid");
		});

		/*jqGrid绑定表格数据*/
		$("#datagrid").jqGrid({
			url : "${basePath}/monitorAlarm/initGrid.action",
			postData : getParams(), //发送数据  
			datatype : "json",
			autoheight : true,
			width : gridWidth,
			shrinkToFit : jqGridWidthFit(gridWidth, 120),
			forceFit : true,
			rownumbers : true,
			colModel : [ {
				label : '告警序号',
				name : 'securityGroupId',
				index : 'securityGroupId',
				width : 80
			},{
				label : '虚机',
				name : 'securityGroupName',
				index : 'securityGroupName',
				width : 80
			}, {
				label : '集群',
				name : 'vpcId',
				index : 'vpcId',
				width : 60
			}, {
				label : '告警信息',
				name : 'instanceCount',
				index : 'instanceCount',
				width : 40
			}, {
				label : '告警类型',
				name : 'netType',
				index : 'netType',
				width : 60
			}, {
				label : '告警开始时间',
				name : 'creationTime',
				index : 'creationTime',
				width : 80
			}, {
				label : '告警持续时间',
				name : 'description',
				index : 'description',
				width : 80
			}, {
				label : '告警状态',
				name : 'instanceName',
				index : 'instanceName',
				width : 80
			}, {
				label : '虚机状态',
				name : 'instanceName',
				index : 'instanceName',
				width : 80
			}, {
				label : '操作',
				name : 'instanceName',
				index : 'instanceName',
				width : 80
			}

			],
			sortname : "securityGroupId",
			sortorder : "desc",
			rowNum : 15,
			page : 1,
			viewrecords : true,
			altRows : true,
			altclass : 'someClass',
			hidegrid : false,
			multiselect : true,
			jsonReader : {
				repeatitems : false
			},
			gridComplete : function() {
				jqGridpaper();
			}
		});
	});

	/*安全组分页绑定*/
	function jqGridpaper() {
		$.jqGridajaxPager.pager("datagrid", function(clickNum, el) {
			currentPage = clickNum;
			var params = getParams();
			$("#datagrid").jqGrid('setGridParam', {
				postData : params, //发送数据 
				page : clickNum
			}).trigger("reloadGrid");
		}, "pager");
	}

	function getParams() {
		var netOptionType = $("#netOptionType").val();
		var netOptionValue = $.trim($("#netOptionValue").val());
		var regionAddress = $("#regionSelect").val();
		netOptionType=(netOptionValue==""?-1:netOptionType);
		var params = {
			imageOptionType : netOptionType,
			imageOptionValue : netOptionValue,
			regionAddress : regionAddress
		};
		return params;
	}
</script>
