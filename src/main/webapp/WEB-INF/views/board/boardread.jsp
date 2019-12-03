<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>read the board</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />
	<div class="container" style="margin-top: 5%">
		<div class="text-center mb-3">
			<h3>
				<c:out value="${boardContent.boardTitle}" />
			</h3>
		</div>
		<div class="card shadow-sm">
			<div class="card-header">
				<span class="float-left font-weight-bold"><c:out
						value="${boardContent.userId}" /></span> <span class="float-right"><fmt:formatDate
						value="${boardContent.boardDate}" pattern="yyyy-MM-dd" /></span>
			</div>
			<div class="card-body" style="min-height: 350px">
				${boardContent.boardContent}</div>

		</div>
		<c:if test="${!empty sessionScope.id}">
			<div class="row mt-2">
				<div class="col-md-12 mt-1">
					<button type="button" data-toggle="collapse" data-target="#demo"
						class="float-left btn btn-primary" id="replyWrite">댓글쓰기</button>

					
						<div class="float-right">
						<button type="button" id="boardlist" class="btn btn-primary" onclick="location.href='/board/list'">목록</button>
						<c:if test="${sessionScope.id eq boardContent.userId or sessionScope.id eq 'root'}">
							<button type="button" class="btn btn-primary"
								onclick="location.href='/board/update?boardNo=${boardContent.boardNo}'">수정</button>
							<button type="button" id="deleteb" class="btn btn-primary">삭제</button>
						</c:if>
						</div>
					
				</div>
			</div>
		</c:if>



		<div class="collapse" id="demo" style="margin-top: 5%">
			<textarea name="replyText" id="replyText" cols="30" rows="10"class="form-control" required></textarea>
			<div class="row">
				<div class="mx-auto">
					<button class="mt-2 btn btn-primary" id="replybtn">작성 완료</button>
				</div>
			</div>
		</div>
		<br>

		<!-- 댓글 창 영역 비동기로 구현-->
		<div class=" rounded shadow-sm">
			<h6 class="border-bottom">Reply list</h6>
			<div id="replyList">
				
			</div>
		</div>
		<div class="mt-5"></div>
	</div>


<script src="/resources/ckeditor/ckeditor.js"></script>
<script>
//댓글쓰기 버튼 변경
$("#replyWrite").click(function(){
	if($("#replyWrite").html()=="댓글쓰기"){
		$("#replyWrite").html("  취 소   ");
	}else{
		$("#replyWrite").html("댓글쓰기");
	}	
});

//댓글불러오기 실행
$(document).ready(function(){
	showReplyList();
});

//댓글 저장
$("#replybtn").click(function(){		
	var replyContent=CKEDITOR.instances.replyText.getData().trim().replace(/(<br>|<br\/>|<br \/>)/g, '')
	if(replyContent.length<1){
		alert("입력란을 채우세요");
		return;
	}
	var paramData=JSON.stringify({"boardNo":"${boardContent.boardNo}","userId":"${sessionScope.id}","replyContent":replyContent});
	var headers={"Content-Type":"application/json","X-HTTP-Method-Override":"POST"};	
	$.ajax({
		url:"/reply/save",
		headers:headers,
		data:paramData,
		type:'POST',
		dataType:'text',
		success:function(result){
			console.log(result);
			console.log(JSON.parse(result)); 
			
			showReplyList();
			CKEDITOR.instances.replyText.setData('');
		}
	,error:function(error){
		console.log(error);
	}
	}); //ajax end
});

//게시글 삭제 재확인
		$("#deleteb").click(function(){
			var result = confirm("정말로 삭제하시겠습니까?");
			if(result==false){
				return;
			}else{
				location.href='/board/deleteb?boardNo=${boardContent.boardNo}';
			}			
		});		
		
		//댓글 불러오기
		function showReplyList(){
			var url="/reply/list";
			var paramData={"boardNo":"${boardContent.boardNo}"};
			
			
			$.ajax({
				type:'POST',
				url:url,
				data:paramData,
				dataType:'json',
				success:function(result){					
					var htmls="";
					if(result.length<1){											
						htmls+="<p>등록된 댓글이 없습니다.</p>";						
					}else{
						$(result).each(function(){
							htmls += '<div class="media text-muted pt-3" id="replyNo' + this.replyNo + '">';

							htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';

							htmls += '<title>Placeholder</title>';

							htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';

							htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';

							htmls += '</svg>';

							htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';

							htmls += '<span class="d-block">';

							htmls += '<strong class="text-gray-dark">' + this.userId + '</strong>';

							htmls += '<span style="padding-left: 7px; font-size: 9pt">';
							
							if("${sessionScope.id}"==this.userId||"${sessionScope.id}"=='root'){
								htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.replyNo + ', \'' + this.userId + '\', \'' + this.replyContent.replace(/(\n|\r\n)/g, '<br>') + '\' )" style="padding-right:5px">수정</a>';

								htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.replyNo + ')" >삭제</a>';
							}							

							htmls += '</span>';

							htmls += '</span>';							
							

							htmls += this.replyContent.replace(/(\n|\r\n)/g, '<br>');;
							

							htmls += '</p>';

							htmls += '</div>';

							
						}); // each end
					}					
					$("#replyList").html(htmls);					
				}// ajax success end
			}); //ajax end
		}		
		
		//댓글 수정
		function fn_editReply(replyNo,userId,replyContent){

			var htmls = "";

			htmls += '<div class="media text-muted pt-3" id="replyNo' + replyNo + '">';

			htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';

			htmls += '<title>Placeholder</title>';

			htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';

			htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';

			htmls += '</svg>';

			htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';

			htmls += '<span class="d-block">';

			htmls += '<strong class="text-gray-dark">' + userId + '</strong>';

			htmls += '<span style="padding-left: 7px; font-size: 9pt">';			
			
			htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + replyNo + ', \'' + userId + '\')" style="padding-right:5px">저장</a>';

			htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';

			htmls += '</span>';

			htmls += '</span>';		

			htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';

			htmls += replyContent;

			htmls += '</textarea>';			

			htmls += '</p>';

			htmls += '</div>';			
			
			htmls += '<script>';
			
			htmls += 'CKEDITOR.replace("editContent", ckeditor_config)';
			
			htmls += '<\/script>';
			
			$('#replyNo' + replyNo).replaceWith(htmls);

			$('#replyNo' + replyNo + ' #editContent').focus();
		}
	
		//댓글 수정 처리
		function fn_updateReply(replyNo,userId){

			var replyContent = CKEDITOR.instances.editContent.getData().replace(/(<br>|<br\/>|<br \/>)/g, '');	

			var paramData = JSON.stringify({"replyContent": replyContent,

					"replyNo":replyNo
			});		

			var headers = {"Content-Type" : "application/json"

					, "X-HTTP-Method-Override" : "POST"};			

			$.ajax({

				url: "/reply/update"

				, headers : headers

				, data : paramData

				, type : 'POST'

				, dataType : 'text'

				, success: function(result){

	                                console.log(result);
					showReplyList();
				}

				, error: function(error){

					console.log("에러 : " + error);

				}
			});

		}
			
		//댓글 삭제
		function fn_deleteReply(replyNo){
			var paramData={"replyNo":replyNo};
			$.ajax({
				url:"/reply/delete",
				data:paramData,
				type:'POST',
				dataType:'text',
				success:function(result){
					showReplyList();
				},
				error:function(error){
					console.log(error);
				}
				
			})//end ajax
		}
</script>

<!-- ckeditor 설정 -->
	<script src="/resources/ckeditor/ckeditor.js"></script>
	<script>
 var ckeditor_config = {
   resize_enaleb : false,
   enterMode : CKEDITOR.ENTER_BR,
   shiftEnterMode : CKEDITOR.ENTER_P,
   filebrowserUploadUrl : "/admin/goods/ckUpload"
 };
 
 
 var editor = CKEDITOR.replace("replyText", ckeditor_config);
 editor.on( 'required', function( evt ) {
	    editor.showNotification( 'This field is required.', 'warning' );
	    evt.cancel();
	} );
</script>
</body>
</html>