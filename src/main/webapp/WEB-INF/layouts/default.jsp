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
<style type="text/css">
.linear{ 
overflow-x:hidden;
background-image:url("/micro-union/images/bg.jpg");
} 
</style>

<jsp:include page="/WEB-INF/common.jsp" />

</head>
<body class="linear">
<script type="text/javascript">
    var basePath = '${basePath }';
    $(function() {
        window.basePath = "${basePath}";
    });
</script>
<jsp:include page="/WEB-INF/layouts/commonAlert.jsp" />
<div >
<jsp:include page="/WEB-INF/head_index.jsp" />
     <section> 
        <sitemesh:body />
    </section>
</div>
</body>
</html>