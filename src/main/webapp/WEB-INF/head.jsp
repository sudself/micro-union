<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String username = String.valueOf(session.getAttribute("loginName"));  
%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<style type="text/css">
</style>
</head>

<nav class="navbar navbar-default1" role="navigation">
    <div class="container-fluid" style="border-bottom: 1px solid rgba(168,195,216, 0.99);background-color:rgb(21,105,151);color:#fff;" >
    <div class="navbar-header">
		 <a  class="navbar-brand" style="line-height: 70px;height: 70px;padding:0px;" id="navigationBar" href="#" ></a>
    </div>
    <ul class="nav navbar-nav navbar-right" style="z-index:100;position:absolute;float:right;top:0px;right:20px;"> 
            <li ><a href="#" onclick="homePage();"  ><span class="glyphicon glyphicon-home"></span> 首页</a></a>
            </li>
            <li ><a href="#"><span class="glyphicon glyphicon-user"></span><%=username %></a>
            </li>
            <li ><a onclick="gotoLogin();" style="cursor:pointer;"><span class="icon-signout"></span> 退出</b></a>
            </li>
   </ul> 
<!--     <div class="collapse navbar-collapse" id="example-navbar-collapse">
        <ul class="nav navbar-nav navbar-right"> 
            <li class="dropdown" style="float:right;">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <span class="glyphicon glyphicon-user"></span> 用户信息 <b class="caret"></b>
                </a>
            <ul class="dropdown-menu">
                <li><a href="#" onclick="gotoLogin();" style="text-align:center;">退出</a></li>
            </ul>
          </li>
          <li style="float:right;"><a href="#" onclick="homePage();"  ><span class="glyphicon glyphicon-home"></span> 首页</a></li>
        </ul> 
    </div> -->
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
