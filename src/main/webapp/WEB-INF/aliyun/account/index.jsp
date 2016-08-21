<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<link type="text/css" rel="stylesheet" href="${basePath}/css/aliyun/account.css?t=<%=Math.random() %>"></link>

<div class="form-group" id="myOptionBar">
<button type="button" class="btn btn-primary" onclick="addAccount();" id="addAccount">新建</button>
<button type="button" class="btn btn-primary disabled" onclick="updateAccount();" id="updateAccount">修改</button>
<button type="button" class="btn btn-primary disabled" onclick="delAccount();" id="delAccount">删除</button>
<span style="float:right;margin-right:80px;vertical-align: middle;height:20px;margin-top:10px;">
<span id="tip" style="color:blue"></span>&nbsp;&nbsp;	
<label class="checkbox-inline"><input type="checkbox" id="timeRefresh" style="margin-top:3px;" ><span style="margin-left:-5px;">自动刷新（每30s）</span></label><lable id="manualRefresh" class="manualRefresh">刷新</lable>
<lable id="accountRefresh" onclick="accountSync();" class="manualRefresh">同步帐号</lable>
</span>
</div>
<div id="taskresult-list" class="taskresult-list" style="">
    <table id="datagrid"></table>
    <div id="dd"></div>
    <div>
        <div id="pager" class="pager"></div>
    </div>
</div>

<!-- 新建帐号  -->
<div class="modal fade" id="myModalAddAccount" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel"><span id="addAccountTitle"></span></h5>
			</div>
			<form class="form-horizontal" id="addAccountForm" role="form">
				<div class="modal-body">
					<div class="form-group">
						<label class="col-sm-4 control-label">云账号名称 ：</label>
						<!-- <span style="color:red">* </span> -->
						<input class="col-sm-8 form-control conditionSelect" type="text"
							name="accountNameText" id="cloudAccountName" style="width: 200px;">
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">云插件：</label> <select name="selectType"
							class="col-sm-8 form-control conditionSelect" onchange="selectChange();"
							id="typeIDSelect" style="width: 200px;">
							<option selected value="-1">- - 请选择 - -</option>
							<option value=0>阿里云插件</option>
							<option value=1>联通沃云插件</option>
						</select>
					</div>
					<div id="aliyunShow" style="display: none;">
						<div class="form-group">
							<label class="col-sm-4 control-label">Access Key ID：</label> <input
								class="col-sm-8 form-control conditionSelect" type="text" name="keyIDText"
								id="keyID" style="width: 200px;">
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">Access Key Secret：</label>
							<input class="col-sm-8 form-control conditionSelect" type="password"
								name="keySecretText" id="keySecret" style="width: 200px;">
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">备注：</label>
							<input class="col-sm-8 form-control conditionSelect" type="text"
								id="marka" style="width: 200px;">
						</div>
					</div>
					<div id="woyunShow" style="display: none;">
						<div class="form-group">
							<label class="col-sm-4 control-label">tenantName：</label> <input
								class="col-sm-8 form-control conditionSelect" type="text" name="tenantNameText"
								id="tenantName" style="width: 200px;">
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">username：</label> <input
								class="col-sm-8 form-control conditionSelect" type="text" name="usernameText"
								id="username" style="width: 200px;">
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">password：</label> <input
								class="col-sm-8 form-control conditionSelect" type="password" name="passwordText"
								id="password" style="width: 200px;">
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">endpoint：</label> <input
								class="col-sm-8 form-control conditionSelect" type="text" name="endpointText"
								id="endpoint" style="width: 200px;">
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">备注：</label>
							<input class="col-sm-8 form-control conditionSelect" type="text"
								id="markw" style="width: 200px;">
						</div>
					</div>
				</div>
				<div class="modal-footer" id="submitBtn">
					<button type="submit" class="btn btn-primary" onclick="validateFunc();" id="accountSaveBtn">保存</button>
					<button type="button" class="btn btn-primary" id="accountCancelBtn" data-dismiss="modal">取消</button>
				</div>
			</form>
		</div>
	</div>
</div>


<!-- 验证状态弹出框  -->
<div class="modal fade"  id="accountUpdateStatusModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h5 class="modal-title" id="accountUpdateStatusModalLabel">提示</h5>
			</div>
			<div class="modal-body">
					<div class="form-group">
					<span id="tip2"></span>
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" id="accountUpdateStatusbtn" class="btn btn-primary" data-dismiss="modal">确定
				</button>
			</div>
		</div>
	</div>
</div>

<!-- 同步帐号弹出框  -->
<div class="modal fade"  id="accountSyncModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h5 class="modal-title" id="accountUpdateStatusModalLabel">提示</h5>
			</div>
			<div class="modal-body">
					<div class="form-group">
					<span id="tip4"></span>
					</div>
			</div>
		</div>
	</div>
</div>

<!-- 删除帐号 -->
<div class="modal fade"  id="delAccountModal" tabindex="-1" role="dialog" aria-labelledby="delAccountModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h5 class="modal-title" id="delAccountModalLabel">删除帐号</h5>
			</div>
			<div class="modal-body">
					<div class="form-group">
						您所选的帐号  将执行删除帐号操作，您是否确认操作？
					</div>
			</div>
			<div class="modal-footer">
			    <button type="button" class="btn btn-primary" onclick="executedelAccount();">删除</button>
				<button type="button" id="displaydelAccount" class="btn btn-primary" data-dismiss="modal">取消
				</button>
			</div>
		</div>
	</div>
</div>

<!-- 删除帐号提示框 -->
<div class="modal fade"  id="delAccountModalTip" tabindex="-1" role="dialog" aria-labelledby="delAccountModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h5 class="modal-title" id="delAccountModalLabel">删除帐号提示</h5>
			</div>
			<div class="modal-body">
					<div class="form-group">
						<span id="tip3"></span>
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" id="displaydelAccountTip" class="btn btn-primary" data-dismiss="modal">确定
				</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">	
var basepath= "${basePath}";
</script>
<script src="${basePath}/staticjs/aliyun/account.js?t=<%=Math.random() %>"></script>
