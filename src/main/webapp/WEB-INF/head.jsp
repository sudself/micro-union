<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<link href="${basePath}/css/common.css" rel="stylesheet"  type="text/css"/>
<link href="${basePath}/css/main.css" rel="stylesheet"  type="text/css"/>
<div class="top" >
	<div class="boby_head_box">
		<div class="boby_head">
			<div class="logo">
				 <img style="margin-top: -5px;margin-left: -3px;" src="${basePath}/images/logo_top_flexmall.png" /> 
			</div>
			
			<div class="nav" onclick="butLoginOut();">
                 <img src="${basePath}/images/logo_right.png" /> 
            </div>
			
			<%-- <div class="nav" style="float:right">
				<div id="login_msg">
						<div class="left"></div>
						<div class="con">欢迎：<%=session.getAttribute("loginName")%></div>
						<div onclick="butLoginOut();"  class="nav_on" style="height: 20px;width: 28px;float: left;margin-top:8px;"></div>
				</div>
			</div> --%>
		</div>
	</div>
</div>
<script type="text/javascript">
	/* $(".nav > a").click(function(){
		$(this).attr("class", "nav_on");
	}); */
	function butLoginOut() {
		var url1 = "${basePath}/homeAction/loginOut.action";
		$.ajax({
			type : 'post',
			url : url1,
			async : false,
			dataType : 'json',
			success : function(data) {
				window.location = "${basePath}/loginAction/logout.action"
			}
		});
	}
	
	function changeBackground(obj) {
		$(".nav > a").each(function() {
			$(this).removeClass("nav_on");
		});
		$(obj).addClass("nav_on");
	}
	function gotoLogin(){
		window.location.href = scape_url;
	}
</script>
<script type="text/javascript" src="${basePath}/staticjs/global.js"></script>
