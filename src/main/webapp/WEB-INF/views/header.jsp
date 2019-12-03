<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session = "true" %>
<html>
<head>
<link rel="stylesheet" href="/resources/css/bootstrap.css" />
<!--경로 앞에 / 를 넣으면 왜 안될까  -->
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-primary navbar-dark fixed-top">
		<a class="navbar-brand text-white" href="/main">StudyHelper</a>
		<ul class="navbar-nav mr-auto">
			<li class="nav-item font-weight-bold"><a class="nav-link" id="aboutus" href="/about">AboutUS</a></li>
			<li></li>
			<li class="nav-item font-weight-bold"><a class="nav-link" id="board" href="/board/list">게시판</a></li>
		</ul>
		<div>
			<c:choose>
				<c:when test='${not empty sessionScope.id}'>					
					<div>
					<span class="mr-3 text-white"><c:out value="${id}님 "></c:out></span>
						<button class="btn btn-light my-2 my-sm-0" onclick="location.href='/logout'">logout</button>
					</div>
				</c:when>
				<c:otherwise> 
					<button class="btn btn-light my-2 my-sm-0" onclick="location.href='/login'">login</button>
				</c:otherwise>
			</c:choose>
		</div>
	</nav>
	<script>	
	</script>
	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
</body>
</html>