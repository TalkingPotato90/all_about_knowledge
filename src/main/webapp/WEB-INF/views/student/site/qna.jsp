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
<link rel="stylesheet" type="text/css"
	href="../dist/components/icon.css">
<!-- Semantic UI CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">

<style type="text/css">
.search-container {
	display: flex;
	justify-content: flex-end;
	margin-top: 0.5em;
}

.pagination-container {
	display: flex;
	justify-content: center;
	margin-top: 150px; /* 위에서 주어진 마진 값 */
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
		// 글자 수 세기
		$('#content').on('input', function() {
			var textLength = $(this).val().length;
			$('#charCount').text(textLength + '/300자');
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


	<div class="ui main container"
		style="padding-top: 20px; padding-bottom: 700px">
		<h1 class="ui header">문의사항</h1>
		<div style="text-align: right;">
			<button id="openModalBtn" class="ui button" id="btnwrite">문의
				작성</button>
		</div>

		<%-- </sec:authorize> --%>
		<!-- 문의사항 작성 -->
		<div class="ui modal" id="myModal">
			<i class="close icon"></i>
			<div class="header">문의사항 작성</div>
			<div class="content">
				<div class="ui form">
					<form id="frm" action="site_qna_write_process.do" method="post">
						<div class="field">
							<label>작성자: <sec:authentication property='name' /> <%--| 
						  작성일: <span th:text="${#dates.format(#dates.createNow(), 'yyyy-MM-dd')}"></span> --%></label>
						</div>
						<div class="field">
							<label>제목</label> <input type="text" name="title" id="title"
								placeholder="제목을 입력하세요">
						</div>
						<div class="field">
							<label>내용</label>
							<textarea rows="5" name="q_content" id="q_content"
								placeholder="문의사항을 입력하세요"></textarea>
							<div class="ui message" id="charCount">0/300자</div>
						</div>
				</div>
			</div>
			<div class="actions">
				<input type="button" class="ui positive button" value="작성"
					id="btnWrite">
				</button>
				<input type="hidden" name="std_id"
					value="<sec:authentication property='name'/>">
				</form>
			</div>
		</div>

		<!-- 문의사항 리스트 -->
		<table class="ui celled selectable table" id="qna">
			<thead>
				<tr>
					<th class="center-aligned narrow-column">번호</th>
					<th class="center-aligned">제목</th>
					<th class="center-aligned narrow-column">작성자</th>
					<th class="center-aligned narrow-column">작성일</th>
					<th class="center-aligned narrow-column">답변상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${requestScope.list }" varStatus="i">
					<tr class="clickable-row">
						<td class="center-aligned"><c:out value="${i.count }" /></td>
						<td class="left-aligned"><a
							href="site_qna_detail.do?qna_no=${list.qna_no}"> <c:out
									value="${list.title}" />
						</a></td>
						<td class="center-aligned"><c:out value="${list.std_id}" /></td>
						<td class="center-aligned"><fmt:formatDate
								pattern="yyyy-MM-dd" value="${list.q_date }" /></td>
						<td class="center-aligned"><c:out value="${list.status}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>

	<!-- 푸터 -->
	<jsp:include page="../site/main_footer.jsp"></jsp:include>
</body>

</html>