<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
var basePath='${basePath}';
</script>
<!--左侧菜单-->
<aside class="main-sidebar" style="height:750px;">
    <ul class="sidebar-menu">
		<li class="active treeview">
         <%--  <a href="#">
            <i class="fa fa-files-o"><img src="${basePath}/images/icn_admin.png" /></i>
            <span>阿里云管理</span>
			<i class="fa fa-angle-left pull-right"><img src="${basePath}/images/icn_arrow_r.png" /></i>
          </a> --%>
          <ul class="treeview-menu">
            <li id="0">仪表盘</li>
            <!-- <li id="1">实例</li>    -->
            <li id="2">集群</li>
            <li id="3">虚机组</li>
           <!--  <li id="4">镜像</li>      
            <li id="5">安全组</li> -->
            <li id="6">虚机</li>
            <li id="7">虚机模板</li>
            <li id="9">监控告警</li>
            <li id="8">云账号管理</li>
          </ul>
        </li>
	</ul>
</aside>