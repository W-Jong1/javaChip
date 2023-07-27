<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<style>
.pContainer.pInfo {
	display: flex;
	border: 1px solid #ced4da;
	border-radius: 0.25rem;
}
.img.pInfo {
	margin: 10px;
	width: 100px;
	height: 100px;
	border: 1px solid #ced4da;
}
.pContainer.pInfo > div {
	/* div 안 중앙 정렬 */
	display : flex;
	justify-content : center;
	align-items : center;
}

select {
	color :#6f6f6f;
}
</style>
<script>
/* help */

var checkTitleFlag = false;
var checkPNoFlag = false;
var checkContentsFlag = false;
var submitFlag = false;

// help qna write submit
function helpSubmitFn() {
	
	// QnA 제목이 입력되지 않았을 때
	if($("#qTitle").val() == "") {
			checkTitleFlag = false;
			alert("제목을 입력해주세요.");
			$("#qTitle").focus();
			
			return;
		}else
	// QnA 내용이 입력되지 않았을 때
	if($("#qContents").val() == "") {
			checkContentsFlag = false;
			alert("내용을 입력해주세요.");
			$("#qContents").focus();
			
			return;
		}else
	// QnA 제목과 내용이 있을경우
	{
		checkTitleFlag = true;
		checkContentsFlag = true;
	}
	
	// 상품 QnA가 선택되고, 상품이 선택되지 않았을 때	
	if( $("#qType").val() == "pQna" ) {
		
			if($("#pNo").val() == 0) {
				checkPNoFlag = false;
				alert("질문하실 상품을 선택해주세요.");
				 $("#pNo").focus();
			}else {
			// 상품QnA가 선택되고, 상품이 선택되었을 경우
				checkPNoFlag = true;
			}
	}else {
	// 일반 QnA일때	
		checkPNoFlag = true;
	
	}
	// Flag확인하고 submit
	if(checkTitleFlag && checkPNoFlag && checkContentsFlag){
		submitFlag = true;
	}
	
	if(submitFlag) {
		$("form").submit();
	}
}

// help qna Type select
function selectQTypeFn(){	
	
	var htmlTag = "";	
	
	if ( $("#qType").val() == "pQna" ) {
		/* 상품 select start*/
		htmlTag += "<p>문의 상품<p>";
		htmlTag += "<select name='pNo' id='pNo' class='board-type nice-select' onchange='selectPNoFn();'>";
		/* 상품 option start */
		htmlTag += "<option ";
		htmlTag += "value = '" + 0 + "'>";
		htmlTag += "=====상품 선택=====";
		htmlTag += "</option>";
		/* 상품 option end */
		/* 상품 option start */
		htmlTag += "<option ";
		htmlTag += "value = '" + 1 + "'>";
		htmlTag += "커피1";
		htmlTag += "</option>";
		/* 상품 option end */
		/* 상품 option start */
		htmlTag += "<option ";
		htmlTag += "value = '" + 2 + "'>";
		htmlTag += "커피2";
		htmlTag += "</option>";
		/* 상품 option end */
		htmlTag += "</select>";
		/* 상품 select end */
	}else{
		return $("#addQnaSelect").html("");
	}
		return $("#addQnaSelect").html(htmlTag);
}

function selectPNoFn(){	
	
	var htmlTag = "";	
	// 상품 QnA일때,
	if ( $("#qType").val() == "pQna" ) {
		
		// qNo가 선택되지 않았을 때,
		if ( $("#qNo").val() == "0" ) {
			
		}else {
		// qNo가 선택되었을 때,
			htmlTag += "<div class='pContainer pInfo'>"
			htmlTag += "<div class='img pInfo'>"
			htmlTag += " 상품 이미지"
			htmlTag += "</div>"
			htmlTag += "<div>"
			htmlTag += " 상품 명 : " + $("#pNo").val();
			htmlTag += "</div>"
			htmlTag += "</div>"
		}
	// 상품 QnA가 아닐 때
	}else{
		
	}
		return $("#pInfo").html(htmlTag);
}

window.onload = selectQTypeFn;
window.onload = selectPNoFn;

// qna select 창
function openSelectProducnFn() {
	window.open(
	"productList.jsp",
	"상품 선택",
	"width=500, height=300, top=50, left=50, scrollbars=yes"
	);
}

// 게시글 취소 재확인 문구
function helpResetFn() {
	if( confirm("작성된 게시글을 취소하시겠습니까?") ) {
		//true
		location.href="qna.do";
	}else {
		// false
		return;
	}	
}

</script>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>글 쓰기</h2>
						<div class="breadcrumb__option">
							<a href="<%= request.getContextPath() %>/">Home</a>
							<a href="#">고객센터</a>
							<span>QnA 글 쓰기</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="board-box spad">
		<div class="container">
			<div class="write-form">
				<form action="qnaWrite.do" method="post">
					<div class="d-flex flex-column bd-highlight mb-3">
						<div class="p-2 bd-highlight">
							<h4><b>Qna 글쓰기</b></h4>
						</div>
						<div class="p-2 bd-highlight">
							<p>구분<p>
							<select name="qType" id="qType" class="board-type"  onchange="selectQTypeFn();">
								<option value="nQna"
								<c:if test="${ qType eq 'n'}"> selected</c:if>
								>일반 Q&amp;A</option>
								
								<option value="pQna"
								<c:if test="${ qType eq 'p'}"> selected</c:if>
								>상품 Q&amp;A
								
								</option>
							</select>
						</div>
						<div class="p-2 bd-highlight" id="addQnaSelect">
						</div>
						<div class="p-2 bd-highlight" id="pInfo">
						</div>
					<div class="p-2 bd-highlight">
						<p>제목<p>
						<input type="text" name="qTitle" id="qTitle" class="form-control" aria-label="subject" placeholder="제목을 입력하세요.">
					</div>
					<div class="p-2 bd-highlight">
						<textarea class="form-control" name="qContents" id="qContents" rows="10"></textarea>
					</div>
						<div class="p-2 bd-highlight">
							<div class="input-group mb-1">
									<div class="custom-file">
										<input type="file" class="custom-file-input" id="inputGroupFile02">
										<label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">Choose file</label>
									</div>
							</div>
						</div>
						<div class="p-2 bd-highlight" align="center">
							<button type="button" class="btn btn-outline-secondary" style="margin-right:20px;" onclick="helpResetFn">취소하기</button>
							<button type="button" class="btn btn-dark" onclick="helpSubmitFn()">작성하기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
<%@ include file="../include/footer.jsp" %>