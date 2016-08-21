<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.aliyuncs.auth.Credential" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />

<% 
	Map<String,Credential> credentialMap = (Map<String,Credential>)application.getAttribute("credentialMap");
%>

<div>
	<div style="margin-bottom: 10px;">
	  <span> 阿里云账号：</span>
      <select id="userSelect">
	       	<c:forEach var="item" items="${credentialMap}" >   
					<option value="${item.key }">${item.key }</option> 
			</c:forEach> 
      </select>
      <span style="color:black;margin-left:20px;margin-right: 20px;">|</span>
	  <span> 区域列表：</span>
	  <select id="regionSelect">
      </select>
	</div>
 </div>
<script type="text/javascript">
$(document).ready(function() {
	loadRegions();
});
function loadRegions() {
	var requUrl = "${basePath}/regionAction/get.action";
	$.ajax({
		type : 'post',
		url : requUrl,
		async: false, 
		dataType : 'json',
		success : function(data) {
			regionOption = "";
			for ( var i = 0; i < data.length; i++) {
				regionOption += '<option value ="'
				regionOption += data[i].regionId;
				regionOption += '" >';
				regionOption += data[i].localName;
				regionOption += '</option>';
			}
			$("#regionSelect").html(regionOption);
		}
	});
}
</script>