<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<div class="container">
		<div class="row justify-content-center" style="margin-top: 9%">
			<div class="col-md-5">
				<div class="card bg-white border-primary ">
					<div class="card-header text-center font-weight-bold"><h1 class="mt-3">회원가입</h1></div>
					<div class="card-body pb-0">
						<form class="form-horizontal" method="post"
							action="/register/register" id="registerfrm">
							<div class="form-group">
								<label for="name" class="control-label">아이디</label>
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa"
										aria-hidden="true"></i></span> <input type="text"
										class="form-control rounded-right" name="name"
										placeholder="아이디 입력" id="inputId" required autofocus />
									<button type="button" class="btn btn-primary ml-3 px-3" id="idCheck">아이디 확인</button>
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="control-label">비밀번호</label>
								<div class="col-sm-8 p-0">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
											type="password" class="form-control" name="password"
											placeholder="비밀번호 입력" id="inputPw" required/>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="confirm" class="control-label">비밀번호 확인</label>
								<div class="col-sm-17 p-0">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
											type="password" class="form-control rounded-right" name="confirm"
											id="confirm" placeholder="비밀번호 재확인" required/>
											<button type="button" class="btn btn-primary ml-2" id="pwCheck" >비밀번호 확인</button>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="control-label">이름</label>
								<div class="col-sm-8 p-0">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
											type="text" class="form-control" name="email" id="inputName"
											placeholder="이름 입력" required/>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="email" class="control-label">이메일</label>
								<div class="col-sm-8 p-0">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
											type="email" class="form-control" name="email" id="inputEmail"
											placeholder="이메일 입력" required/>
									</div>
								</div>
							</div>
							<div class="form-group ">
								<button type="submit"
									class="btn btn-primary btn-lg btn-block login-button" id="registerbtn">회원가입</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>	
	var availableId=false;
	var passwordCheck=false;
	
	<!--회원가입 버튼 전송-->
		$(document).ready(function() {
			$("#registerfrm").submit(function() {
				if(availableId==false){
					alert('중복된 아이디입니다.');
					return false;
				}
				if(passwordCheck==false){
					alert('비밀번호를 다시 확인하세요.');
					return false;
				}
				var user = {
					userId : $("#inputId").val(),
					userPw : $("#inputPw").val(),
					userName : $("#inputName").val(),
					userEmail : $("#inputEmail").val(),
				}
				console.log(user)
				$.ajax({
					method : "post",
					dataType : "text",
					url : "/register/register",
					data : user,
					success : function(data) {
						console.log(data);
						if (data ==1) {
							alert("회원가입이 완료되었습니다.");
							location.href = "/"
						} else {
							alert("회워가입이 실패하였습니다.");
						}
					},
					error : function() {
						alert("error");
					}
				});
				return false;
			});
		});
		
	<!--아이디 중복검사-->
		$("#idCheck").click(function(){
			var id=$("#inputId").val();
			var regexp=/[0-9a-zA-Z;\-]/;
			if(id.length>12 || id.length<4){
				alert("아이디는 최소 4자 최대 10자까지 가능합니다.");
				return;
			}
			for(var i=0; i<id.length;i++){
				if(id.charAt(i)!=" " && regexp.test(id.charAt(i))==false){
					alert("특수문자는 입력하실 수 없습니다.");
					return;
				}
			}
			$.ajax({
				url:"/idcheck",
				type:"POST",
				cache:false,
				data:{userId:$("#inputId").val()},			
				success: function(response){
					if(response==1){
						alert("중복된 아이디입니다.");
						availableId=false;
					}
					else{
						alert("사용가능한 아이디입니다.");
						availableId=true;
					}
				}
		});			
		});
		
		<!--비밀번호 검사-->
		$("#pwCheck").click(function(){
			if($("#inputPw").val()!=$("#confirm").val()){
				alert("비밀번호를 일치하지 않습니다.");
				passwordCheck=false;
			}else{
				alert('비밀번호가 일치합니다.');
				passwordCheck=true;
			}
		});
		
		
	</script>
</body>
</html>