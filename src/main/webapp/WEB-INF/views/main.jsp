<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="/resources/css/bootstrap.css" />
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
</head>
<style>
.carousel-inner img {
	width: 100%;
	height: 70%;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />
	<div id="myCarousel" class="carousel slide" data-ride="carousel"
		style="margin-top: 3.5%">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="resources/images/a1.jpg" alt="Create">
				<div class="carousel-caption">
					<h3>Create</h3>
					<p>Create is always so much fun!</p>
				</div>
			</div>

			<div class="carousel-item">
				<img src="resources/images/a2.png" alt="Think">
				<div class="carousel-caption">
					<h3>Think</h3>
					<p>Think good and good follows!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="resources/images/a3.jpg" alt="Innovation">
				<div class="carousel-caption">
					<h3>Innovation</h3>
					<p>Innovation is challenging!</p>
				</div>
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#myCarousel" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>
	<div class="jumbotron jumbotron-fluid text-center">
		<div class="container">
			<h1>Study Helper</h1>
			<p>Study Helper is useful, most famous communication site.
		</div>
	</div>
</body>
</html>