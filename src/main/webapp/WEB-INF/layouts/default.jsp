<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<head>
<title><sitemesh:title default="中国联通·沃云平台混合云" /></title>
<link href="${basePath }/images/favicon.ico" rel="Shortcut Icon">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<jsp:include page="/WEB-INF/head.jsp" />
<jsp:include page="/WEB-INF/common.jsp" />
<sitemesh:head />
</head>
<body style="overflow-x:hidden;">
<script type="text/javascript">
    var basePath = '${basePath }';
    $(function() {
        window.basePath = "${basePath}";
    });
</script>
<style type="text/css">

</style>
<jsp:include page="/WEB-INF/user/aside.jsp" />

<jsp:include page="/WEB-INF/aliyun/commonTipModel.jsp" />
<div class="content-wrapper">
    <section class="content-header">
        <h1 class="public_nav_info"></h1>
     </section>
     <section class="content">  
        <sitemesh:body />
    </section>
</div>
<!-- <div id="footer" style="text-align: center; background-color: #000; color: #eeeeee; height: 30px; padding-top: 15px;"> -->
<!--     <label>版权所有 Copyright &copy; 2015 All Rights Reserved</label> -->
<!-- </div> -->
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
</script>
</body>
</html>