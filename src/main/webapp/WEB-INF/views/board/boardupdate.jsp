<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update the board</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />

	<div class="container col-md-6" style="margin-top: 5%">
		<div class="text center">
			<h1>글쓰기</h1>
		</div>
		<form action="/board/update/data" method="post" class="">
			<input type="hidden" name="userId" value="${sessionScope.id}" /> <input
				type="hidden" name="boardNo" value="${boardContent.boardNo}" />

			<div class="form-group" style="margin-top: 2%">
				<label for="inputTitle" class="">제목</label> <input type="text"
					class="form-control" id="inputTitle" name="boardTitle" required
					autofocus value="${boardContent.boardTitle}" />
			</div>
			<div class="form-group col-sm-2 p-0">
				<label for="selectCate" class="">카테고리</label> <select name="cateNo"
					id="selectCate" class="form-control">
					<c:if test="${'root' eq sessionScope.id}">
						<option value="0" class="">공지</option>
					</c:if>
					<option value="1" class="">질문</option>
					<option value="2" class="">팁</option>
				</select>
			</div>
			<div class="form-group">
				<label for="inputText" class="">내용</label>
				<textarea name="boardContent" id="inputText" cols="30" rows="10"
					class="form-control" required>${boardContent.boardContent}</textarea>
			</div>
			<div class=" float-right">
				<button type="submit" class="btn btn-primary" id="insertfrm">수정
					완료</button>
			</div>
		</form>
	</div>	
	<script src="/resources/ckeditor/ckeditor.js"></script>
	<script>
		var ckeditor_config = {
			resize_enaleb : false,
			enterMode : CKEDITOR.ENTER_BR,
			shiftEnterMode : CKEDITOR.ENTER_P,
			filebrowserUploadUrl : "/admin/goods/ckUpload"
		};

		CKEDITOR.replace("inputText", ckeditor_config);
	</script>
	<script>
		
		$("#selectCate").val('<c:out value="${boardContent.cateNo}"/>');		
	</script>


</body>
</html>