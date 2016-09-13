<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<style type="text/css">
.jianbian{ 
FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=rgba(86, 194, 196, 0.81),endColorStr=rgba(76, 194, 196, 0.81)); /*IE*/ 
background:-moz-linear-gradient(top,rgba(86, 194, 196, 0.81),rgba(76, 194, 196, 0.81));/*火狐*/ 
background:-webkit-gradient(linear, 0% 0%, 0% 100%,from(rgba(86, 194, 196, 0.81)), to(rgba(76, 194, 196, 0.81)));/*谷歌*/ 
background-image: -webkit-gradient(linear,left bottom,left top,color-start(0, rgba(86, 194, 196, 0.81)),color-stop(1, rgba(76, 194, 196, 0.81)));/* Safari & Chrome*/ 
filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=rgba(86, 194, 196, 0.81), endColorstr=rgba(76, 194, 196, 0.81)); /*IE6 & IE7*/ 
-ms-filter: "progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=rgba(86, 194, 196, 0.81), endColorstr=rgba(76, 194, 196, 0.81))"; /* IE8 */ 
} 
</style>
</head>

<nav class="navbar navbar-default1 " role="navigation">
    <div class="container-fluid" style="border-bottom: 1px solid rgba(86, 194, 196, 0.81);" >
    <div class="navbar-header">
       <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse" >
			<span class="sr-only">切换导航</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		 <a  class="navbar-brand" style="line-height: 70px;height: 70px;padding:0px;" href="#" >
            <img src="${basePath}/images/logo_right.png" height="70px;margin:0px;" >
        </a>
        
    </div>
    <div class="collapse navbar-collapse" id="example-navbar-collapse">
        <ul class="nav navbar-nav navbar-right"> 
            <li  class="dropdown" style="float:right;">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <span class="glyphicon glyphicon-user"></span> 用户信息 <b class="caret"></b>
                </a>
            <ul class="dropdown-menu">
                <li ><a href="#" onclick="gotoLogin();" style="text-align:center;">退出</a></li>
            </ul>
          </li>
        </ul> 
    </div>
    </div>
</nav>


<%-- <div class="top" >
	<div class="boby_head_box">
		<div class="boby_head">
			<div class="logo">
				 <img style="margin-top: -5px;margin-left: -3px;" src="${basePath}/images/logo_top_flexmall.png" /> 
			</div>
			
			<div class="nav" onclick="homePage();">
                 <img src="${basePath}/images/logo_right.png" /> 
            </div>
			

		</div>
	</div>
</div>--%>
<script type="text/javascript">

	function homePage() {
		window.location = "${basePath}/homePage/index.action"
	}
	
	function changeBackground(obj) {
		$(".nav > a").each(function() {
			$(this).removeClass("nav_on");
		});
		$(obj).addClass("nav_on");
	}
	function gotoLogin(){
		window.location.href = "${basePath}/loginAction/logout.action";
	}
</script>
<script type="text/javascript" src="${basePath}/staticjs/global.js"></script>
