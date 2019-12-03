<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css" />
<!--경로 앞에 / 를 넣으면 왜 안될까  -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
	body{
		background-image : url('/resources/images/home.gif');
		background-repeat : no-repeat;
		background-size : cover;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />
	<div class="container" style="margin-top: 7%">
		<div class="row">
			<div class="col-sm-4  mx-auto">
				<div class="card card-signin border-primary my-5">
					<div class="card-body">
						<h3 class="card-title text-center">로그인</h3>
						<br>
						<form class="form-signin" action="/loginPost" method="post"
							id="loginfrm">
							<div class="form-label-group">
								<input type="text" class="form-control" id="inputId"
									name="userId" placeholder="아이디" required autofocus><br>
							</div>
							<div class="form-label-group">
								<input type="password" id="inputPassword" name="userPw"
									class="form-control" placeholder="비밀번호" required>
							</div>
							<br>
							<br>
							<button class="btn btn-lg btn-primary btn-block text-uppercase"
								id="loginbtn" type="submit">로그인</button>
							<br>
						</form>
						<button class="btn btn-lg btn-primary btn-block text-uppercase"
							onclick="location.href='/register'">회원가입</button>
						<br>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
	$(document).ready(function(){
		$("#loginfrm").submit(function(){
			var user={userId:$("#inputId").val(),
					userPw:$("#inputPassword").val()}
			console.log(user)
			$.ajax({
				method:"post",
				dataType:"text",				
				url:"/loginPost",
				data:user,
				success:function(data){
					console.log(data);
					if(data==="1"){
						alert("로그인 되었습니다.");
						location.href="/"
					}else{
						alert("아이디 또는 비밀번호가 일치하지 않습니다.");						
					}					
				},
				error:function(){
					alert("error");
				}
			});
			
			return false;
		});
	});
	
</script>
</body>
</html>