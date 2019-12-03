<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board main</title>
<style>
.table .thead-primary th {
	color: #ffffff;
	background-color: #007bff;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false"/>
	<div class="container content" style="margin-top: 8%">
		<div class="table-responsive">
			<table class="table table-hover table-bordered">
			<thead class="thead-primary">
				<tr>
					<th class="text-center" style="width:50%">제목</th>
					<th class="text-center" style="width:10%">카테고리</th>
					<th class="text-center" style="width:10%">작성자</th>
					<th class="text-center" style="width:10%">조회수</th>
					<th class="text-center" style="width:20%">작성일</th>
				</tr>
			</thead>

			<c:choose>
				<c:when test="${!empty list}">
					<c:forEach items="${list}" var="brd">
						<tr>
							<td class="text-left"><a href="/board/read?boardNo=${brd.boardNo}" class="">${brd.boardTitle}</a></td>
							<td class="text-center">${brd.cateName}</td>
							<td class="text-center">${brd.userId}</td>
							<td class="text-center">${brd.boardHit}</td>
							<td class="text-center"><fmt:formatDate
									value="${brd.boardDate}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5" class="text-center">게시글이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		</div>
		
<script>
//이전 버튼
function fn_prev(page, range, rangeSize,searchType, keyword){
	page=parseInt(page);
	range=parseInt(range);
	rangeSize=parseInt(rangeSize);
	
	var page=((range-2) * rangeSize) + 1;
	var range = range -1;
	
	var url = "/board/list";
	url=url+"?page="+page;
	url=url+"&range="+range;
	url=url+"&searchType="+searchType;
	url=url+"&keyword="+keyword;
	location.href=url;
}

//페이지 번호 클릭
function fn_pagination(page, range, rangeSize,searchType, keyword){
	var url="/board/list";
	url=url+"?page="+page;
	url=url+"&range="+range;
	url=url+"&searchType="+searchType;
	url=url+"&keyword="+keyword;
	location.href=url;
}

//다음 버튼
function fn_next(page, range, rangeSize, searchType, keyword){
	page=parseInt(page);
	range=parseInt(range);
	rangeSize=parseInt(rangeSize);
	
	var page=(range * rangeSize) + 1;
	var range = range +1;
	
	var url="/board/list";
	url=url+"?page="+page;
	url=url+"&range="+range;
	url=url+"&searchType="+searchType;
	url=url+"&keyword="+keyword;
	location.href=url;
}
</script>
		<div class="row">			
			<div class=" mx-auto">
				<ul class="pagination">
					<c:if test="${pagination.prev}">
						<li class="page-item"><a href="#" class="page-link"
						 onClick="fn_prev('${pagination.page}','${pagination.range}', '${pagination.rangeSize}',
						 '${pagination.searchType}','${pagination.keyword}')">&lt;</a></li>
					</c:if>
					
					<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
						<li class="page-item <c:out value="${pagination.page==idx ? 'active' :''}"/>">
							<a href="#" class="page-link" onClick="fn_pagination('${idx}','${pagination.range}','${pagination.rangeSize}',
							'${pagination.searchType}','${pagination.keyword}')">${idx}</a>
						</li>
					</c:forEach>
					
					<c:if test="${pagination.next}">
						<li class="page-item"><a href="#" class="page-link"
						 onClick="fn_next('${pagination.range}','${pagination.range}','${pagination.rangeSize}',
						 '${pagination.searchType}','${pagination.keyword}')">&gt;</a></li>
					</c:if>					
				</ul>				
			</div>
		</div>

		<div class="row mb-4">
			<div class=" mx-auto">
				<form class="form-inline">
					<div class="form-group">
						<select name="searchType" id="searchType" class="form-control">
							<option value="boardTitle" class="">제목</option>
							<option value="userId" class="">작성자</option>
							<option value="cateName" class="">카테고리</option>
							<option value="boardContent" class="">본문</option>
						</select>
					</div>
					<div class="form-group">
						<input type="text" name="keyword" id="keyword" class="form-control" />
						<button type="button" class="btn btn-primary" id="btnSearch">검색</button>
					</div>
				</form>
			</div>			
		</div>

	<c:if test="${!empty sessionScope.id}">
		<div class=" float-right">
			<button class="btn btn-primary" onclick="location.href='/board/insertpage'">글쓰기</button>
		</div>
	</c:if>
	</div>

</body>
<script>
	$("#board").addClass("active")
	
	$(document).on('click','#btnSearch',function(e){
		e.preventDefault();
		var key=$('#keyword').val();
		if(key==''){
			alert("검색어를 입력하세요");
			return;
		}
		var url="/board/list";
		url=url+"?searchType="+$('#searchType').val();
		url=url+"&keyword="+$('#keyword').val();
		location.href=url;
	});
	
</script>
</html>