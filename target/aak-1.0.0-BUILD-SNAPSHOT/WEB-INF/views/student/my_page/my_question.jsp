<!-- 
Desc : 사용자(학생)의 마이페이지 나의문의 화면
작성자 : 고한별
작성일 : 2024.06.12
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 나의문의</title>
<link rel="icon" href="/all_about_knowledge/favicon.png">
<link rel="stylesheet" type="text/css"
	href="/all_about_knowledge/front/student/css/semantic.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="/all_about_knowledge/front/student/js/semantic.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">
	$(function() {
		$('.tabular.menu .item').tab();
		/* initializeTabs(); */

		$(".clickable-row").click(function() {
			/* var title = $(this).data('title');
			var date = $(this).data('date');
			var content = $(this).data('content');
			var status = $(this).data('status');
			$('#modalTitle').text(title);
			$('#modalContent').text(content); */
			/* $('#modalInfo').text('작성자: ' + std_id + ' | 상태: ' + status); */
			$('#myModal').modal('show');
		});
		// 모달 열기 버튼 클릭 이벤트
		/* $('#openModalBtn').click(function() {
			$('#myModal').modal('show'); // 모달을 보이도록 설정
		}); */
		// 글자 수 세기
		$('#content').on('input', function() {
			var textLength = $(this).val().length;
			$('#charCount').text(textLength + '/300자');
		});

	}); // ready
	/* function initializeTabs() {
		$('.tabular.menu .item').tab({
			onVisible : function(tabPath) {
				loadDataForTab(tabPath);
			}
		});
	} */
</script>
</head>
<body class="mypage">
	<!-- 사이드 네비게이션 바 -->
	<jsp:include page="mypage_side_nav.jsp"></jsp:include>

	<!-- 탑 네비게이션 바 -->
	<jsp:include page="mypage_top_nav.jsp"></jsp:include>

	<!-- 컨텐츠 영역 -->
	<article class="my_article">
		<div class="mypage_content_div">
			<!-- breadcrumb 표시 -->
			<div class="ui small breadcrumb div_margin">
				<a class="section">나의강의실</a> <i class="right chevron icon divider"></i>
				<div class="active section">나의문의</div>
			</div>

			<!-- menu tab 표시 -->
			<div class="ui top attached tabular menu">
				<a class="item active" data-tab="first"> 강의 문의 </a> <a class="item"
					data-tab="second"> AAK 문의 </a>
			</div>

			<!-- 강의 문의 -->
			<div class="ui bottom attached tab segment active" data-tab="first">
				<table class="ui celled padded table center aligned">
					<thead>
						<tr>
							<th class="center-aligned narrow-column">번호</th>
							<th class="center-aligned">제목</th>
							<th class="center-aligned narrow-column">과목명</th>
							<th class="center-aligned narrow-column">작성자</th>
							<th class="center-aligned narrow-column">작성일</th>
							<th class="center-aligned narrow-column">답변상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list2" items="${requestScope.list2 }"
							varStatus="i">
							<tr class="clickable-row">
								<td class="center-aligned"><c:out value="${i.count }" /></td>
								<td class="left-aligned"><%-- <a
									href="site_qna_detail.do?qna_no=${list2.qna_no}"> --%> <c:out
											value="${list2.question_title}" />
								</a></td>
								<td class="center-aligned"><c:out value="${list2.q_subTitle}" /></td>
								<td class="center-aligned"><c:out value="${list2.q_std_id}" /></td>
								<td class="center-aligned"><fmt:formatDate
										pattern="yyyy-MM-dd" value="${list2.q_date }" /></td>
								<td class="center-aligned"><c:out value="${list2.q_status}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- 강의문의 모달창 -->
			<div class="ui modal" id="myModal">
				<i class="close icon"></i>
				<div class="header">문의사항</div>
				<div class="content">
					<div class="ui form">
						<div class="field" style="text-align: left;">
							<h4>과목명 : <c:out value="${list2.q_subTitle}" /></h4>
						</div>
						<div class="field">
							<label>제목</label>
							<div class="content-box" id="modalTitle">
							<c:out value="${list2.question_title}" />
							</div>
						</div>
						<div class="field">
							<label>내용</label>
							<div class="content-box" id="modalContent">
								<p id="modalContent">
								<c:out value="${list2.q_content}" />
								</p>
							</div>
						</div>
						<div class="field" style="text-align: right;">
							<label id="modalInfo">작성자: <c:out value="${list2.q_std_id}" /> | 작성일: <fmt:formatDate
										pattern="yyyy-MM-dd" value="${list2.q_date }" /></label>
						</div>
						<div class="divider"></div>
						<div class="field">
							<label>강사의 답변</label>
							<div class="content-box" id="modalReply">
								<p>
								<c:out value="${list2.ans_content}" />
								</p>
							</div>
							<div class="field" style="text-align: right;">
								<label id="modalInfo">작성자: <c:out value="${list2.ans_id}" /> 
								| 작성일: <fmt:formatDate
										pattern="yyyy-MM-dd" value="${list2.ans_date }" /></label>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 사이트 문의 -->
			<div class="ui bottom attached tab segment" data-tab="second">
				<a href="${pageContext.request.contextPath}/site_qna.do">
					<button class="ui center button">작성하기</button>
				</a>
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


			<!-- 문의사항 상세보기 모달창 -->
			<div class="ui modal" id="myModal">
				<i class="close icon"></i>
				<div class="header">문의사항</div>
				<div class="content">
					<div class="ui form">
						<div class="field" style="text-align: left;">
							<h4>과목명 : 자바란 무엇인가?</h4>
						</div>
						<div class="field">
							<label>제목</label>
							<div class="content-box" id="modalTitle"></div>
						</div>
						<div class="field">
							<label>내용</label>
							<div class="content-box" id="modalContent">
								<p id="modalContent">강의와 관련된 문의입니다. 강의와 관련된 문의입니다. 강의와 관련된
									문의입니다. 강의와 관련된 문의입니다. 강의와 관련된 문의입니다. 강의와 관련된 문의입니다. 강의와 관련된
									문의입니다. 강의와 관련된 문의입니다.</p>
							</div>
						</div>
						<div class="field" style="text-align: right;">
							<label id="modalInfo">작성자: std_id | 작성일: 2024-06-18</label>
						</div>
						<div class="divider"></div>
						<div class="field">
							<label>강사의 답변</label>
							<div class="content-box" id="modalReply">
								<p>강사의 답변입니다. 강사의 답변입니다. 강사의 답변입니다. 강사의 답변입니다. 강사의 답변입니다.
									강사의 답변입니다. 강사의 답변입니다. 강사의 답변입니다. 강사의 답변입니다. 강사의 답변입니다.</p>
							</div>
							<div class="field" style="text-align: right;">
								<label id="modalInfo">작성자: std_id | 작성일: 2024-06-18</label>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

	</article>

</body>
</html>