<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
	// 공지사항 삭제
	function noticeDelFn() {
		document.delFrm.submit();
	}
</script>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>공지사항</h2>
						<div class="breadcrumb__option">
							<a href="<%= request.getContextPath() %>">Home</a>
							<a href="#">고객센터</a>
							<a href="notice.do">공지사항</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="board-box spad">
		<div class="container">
			<h4> 글 보기</h4>
			<table class="table" style="margin-top:40px; margin-bottom:50px; font-size:11pt;">
				<tr>
					<td style="width:12%">제목</td>
					<td colspan="2">${vo.nTitle}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td colspan="2">${vo.uName}</td>
				</tr>
				
				<fmt:parseDate value="${vo.nDate}" pattern="yyyy-MM-dd HH:mm:ss" var="dateStr"/>
 				<fmt:formatDate value="${dateStr}" pattern="yyyy.MM.dd HH:mm:ss" var="boardDate"/>
 				
				<tr style="color:gray; font-size:10pt;">
					<td colspan="2">작성일  ${boardDate}</td>
				</tr>
				<tr>
					<td colspan="3" style="white-space:pre-line;">
						${vo.nContents}
					</td>
			    </tr>
			    <tr>
			      <td colspan="3"><button type="button" class="btn btn-secondary" style="margin-right:15px;" onclick="location.href='notice.do'">목록으로</button>
						<button type="button" class="btn btn-outline-primary" style="margin-right:15px;" onclick="location.href='noticeModify.do'">수정하기</button>
						<button type="button" class="btn btn-outline-danger" onclick="noticeDelFn();">삭제하기</button>
						<form name="delFrm" method="post" action="qnaDelete.do">
							<input type="hidden" name="nNo" value="${vo.nNo}">
						</form>
			      </td>
			    </tr>
			</table>
			<table class="table table-striped">
			    <tr>
			      <th scope="row" style="width:12%">▲이전글</th>
			      <td>사업자 회원들께 공지드립니다.</td>
			    </tr>
			    <tr>
			      <th scope="row">▼다음글</th>
			      <td>안녕하세요</td>
			    </tr>
			</table>
	    </div>
	</section>
<%@ include file="../include/footer.jsp" %>