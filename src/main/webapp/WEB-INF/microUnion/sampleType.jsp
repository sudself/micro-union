<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<div style="background-color: rgba(76, 194, 196, 0.81);">
			<div class="container" style="height:100%;">
				<div class="row">
					<div class="col-xs-6 col-sm-3 col-md-2">
						<a href="#" class="thumbnail"> <img
							src="${basePath }/images/micro/IndexPage1.jpg"
							class="img-responsive" alt="标本录入" title="标本录入">
						</a>
					</div>
					<div class="col-xs-6 col-sm-3 col-md-2">
						<a href="#" class="thumbnail"> <img
							src="${basePath }/images/micro/IndexPage2.jpg"
							class="img-responsive" alt="标本处理" title="标本处理">
						</a>
					</div>
					<div class="col-xs-6 col-sm-3 col-md-2">
						<a href="#" class="thumbnail"> <img
							src="${basePath }/images/micro/IndexPage1.jpg"
							class="img-responsive" alt="结果判读" title="结果判读">
						</a>
					</div>
					<div class="col-xs-6 col-sm-3 col-md-2">
						<a href="#" class="thumbnail"> <img
							src="${basePath }/images/micro/IndexPage1.jpg"
							class="img-responsive" alt="统计分析" title="统计分析">
						</a>
					</div>
				</div>
			</div>
</div>
<script src="${basePath}/staticjs/aliyun/virtual/virtualList.js?t=<%=Math.random() %>"></script>