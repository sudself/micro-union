<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<head>
<title><sitemesh:title default="微联" /></title>
<link href="${basePath }/images/favicon.ico" rel="Shortcut Icon">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta content="" name="description">
<meta content="" name="author">
<jsp:include page="/WEB-INF/common.jsp" />
</head>
<body style="overflow-x:hidden;">
<script type="text/javascript">
    var basePath = '${basePath }';
    $(function() {
        window.basePath = "${basePath}";
    });
</script>
<div >
     <section> 
        <sitemesh:body />
    </section>
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
</script>
</body>
</html>