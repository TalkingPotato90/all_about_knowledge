<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항</title>
<link rel="stylesheet" type="text/css"
	href="/all_about_knowledge/front/student/css/semantic.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="/all_about_knowledge/front/student/js/semantic.js"></script>

<style type="text/css">
.search-container {
	display: flex;
	justify-content: flex-end;
}
</style>
<script type="text/javascript">
	$(document).ready(function($) {
		$(".clickable-row").click(function() {
			window.location = $(this).data("href");
		});
		
		// 모달 열기 버튼 클릭 이벤트
		$('#openModalBtn').click(function() {
			$('#myModal').modal('show'); // 모달을 보이도록 설정
		});
		$("#btnWrite").click(function() {
			$("#frm").submit();

		});
	});
</script>
</head>
<body>

	<!-- 헤더 -->
	<jsp:include page="../site/main_header.jsp"></jsp:include>

	<div class="ui main container" style="padding-top: 20px; padding-bottom:300px">
		<h1 class="ui header">문의사항</h1>

		<!-- 질문 -->
		<div class="ui segment">
			<div>
				<h2>
				<c:out value="${uqd.title}" />
				</h2>
				<h5 style="color: #999;">작성자: <c:out value="${uqd.std_id}" /> | 작성일: <fmt:formatDate pattern="yyyy-MM-dd" value="${uqd.q_date }" /></h5>
			</div>
			<hr>
			<div>
			<c:out value="${uqd.q_content}" />
			</div>
		</div>
		
		<!-- 답변 -->
		<c:if test="${not empty uqd2.a_content}">
		<div class="ui segment">
			<div>
				<h2>
				Re: <c:out value="${uqd.title}" />
				</h2>
				<h5 style="color: #999;">작성자: <c:out value="${uqd2.id}" /> | 작성일: <fmt:formatDate pattern="yyyy-MM-dd" value="${uqd2.q_date }" /></h5>
			</div>
			<hr>
			<div>
			<c:out value="${uqd2.a_content}" />
			</div>
		</div>
		</c:if>
		<a href="site_qna.do">
			<button class="ui center button">목록</button>
		</a> 
		
		<!-- 수정 버튼 -->
	    <c:if test="${empty uqd2.a_content}">
	        <%-- <a href="site_qna_write.do?qna_no=${uqd.qna_no}">
				<button class="ui button">수정</button>
			</a> --%>
			<button id="openModalBtn" class="ui button" id="btnwrite">문의
				수정</button>
	    </c:if>
	    
	    <!-- 수정 폼 -->
	    <div class="ui modal" id="myModal">
			<i class="close icon"></i>
			<div class="header">문의사항 작성</div>
			<div class="content">
				<div class="ui form">
					<form id="frm" action="site_qna_modify.do" method="post">
						<div class="field">
							<label>작성자: <sec:authentication property='name' /> 
						  <%-- 작성일: <span th:text="${#dates.format(#dates.createNow(), 'yyyy-MM-dd')}"></span> --%></label>
						</div>
						<div class="field">
							<label>제목</label> <input type="text" name="title" id="title" value="${uqd.title}">
						</div>
						<div class="field">
							<label>내용</label>
							<input type="text" ro   ws="5" name="q_content" id="q_content" value="${uqd.q_content}">
							<div class="ui message" id="charCount">0/300자</div>
						</div>
				</div>
			</div>
			<div class="actions">
				<input type="button" class="ui positive button" value="작성"
					id="btnWrite">
					
				<input type="hidden" name="std_id" value="<sec:authentication property='name'/>">
				<input type="hidden" name="qna_no" value="${uqd.qna_no}"/>"
				</form>
			</div>
		</div>
	</div>

	<!-- 푸터 -->
	<jsp:include page="../site/main_footer.jsp"></jsp:include>

</body>

</html>