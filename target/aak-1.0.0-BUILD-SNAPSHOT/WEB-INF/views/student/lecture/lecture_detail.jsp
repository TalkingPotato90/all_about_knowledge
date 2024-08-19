<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 상세</title>
<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>

<!-- Semantic UI CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
<!-- Semantic UI JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="/all_about_knowledge/front/student/css/semantic.css">
<script src="/all_about_knowledge/front/student/js/semantic.js"></script>

<style type="text/css">
.search-container {
	display: flex;
	justify-content: flex-end;
}

.hidden {
	display: none;
}

.box {
	border: 1px solid #ccc;
	padding: 1em;
	margin-bottom: 0em;
	height: 200px; /* 박스의 높이 설정 (필요에 따라 조정) */
	margin-top: 1em;
}

.custom-large-image {
	width: 300px;
	height: 200px;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$('.ui.secondary.pointing.menu .item').on('click', function() {
			$('.ui.secondary.pointing.menu .item').removeClass('active'); // 모든 아이템에서 active 클래스 제거
			$(this).addClass('active'); // 클릭한 아이템에 active 클래스 추가

			var targetContent = $(this).data('content'); // 클릭한 아이템의 data-content 값을 가져옴
			$('.content').addClass('hidden'); // 모든 컨텐츠를 숨김
			$('#' + targetContent).removeClass('hidden'); // 클릭한 메뉴에 해당하는 컨텐츠를 보여줌
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
		
		//수강신청
		$('#btnApply').on('click', function() {
		    $.ajax({
		        url: '/all_about_knowledge/apply_subject.do',
		        type: 'POST',
		        data: $("#frm").serialize(),
		        success: function(response) {
		            alert(response.message);  // 서버에서 전달된 message를 alert로 출력
		        },
		        error: function() {
		            alert("수강 신청 중 오류가 발생했습니다.");
		        }
		    });
		});

		// 관심 강의 버튼 클릭 시 동작
		$('#likeButton').on('click', function() {
			$(this).toggleClass('active');
		});
		
		/* // 모달 열기 버튼 클릭 이벤트
		$('#openModalBtn').click(function() {
			$('#myModal').modal('show'); // 모달을 보이도록 설정
		}); */
		// 글자 수 세기
		$('#content').on('input', function() {
			var textLength = $(this).val().length;
			$('#charCount').text(textLength + '/300자');
		});
		$("#btnWriteQ").click(function() {
			$("#frmq").submit();
		});

	});
</script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../site/main_header.jsp"></jsp:include>

	<div class="ui main container" style="padding-bottom:300px">
		<!-- <h1 class="ui header"></h1> -->


		<div class="ui segment">
			<div class="ui grid">
				<div class="six wide column">
					<img class="left floated image custom-large-image"
						src="${pageContext.request.contextPath}/front/student/images/java.png">
				</div>
				<div class="ten wide column">
					<p>
					<div class="ui small breadcrumb">
						<a class="section"><!-- 상위 카테고리 -->
						<c:out value="${uld7.cat2}" />
						</a>
						
						<i class="right chevron icon divider"></i> 
						<a class="active section">
						<c:out value="${uld7.cat_name}" />
						</a>
					</div>
					<h2>
						<c:out value="${uld.sub_title}" />
					</h2>
					<br>
					<h5><c:out value="${uld6.cnt}" />명의 수강생</h5>
					<h5>
						<c:out value="${uld.inst_id}" />
					</h5>
					</p>
				</div>
			</div>
		</div>

		<div class="ui secondary pointing menu">
			<a class="item active" data-content="강의소개"> 강의소개 </a> <a class="item"
				data-content="강의목차"> 강의목차 </a> <a class="item" data-content="수료기준">수료기준
			</a> <a class="item" data-content="강의공지"> 강의공지 </a> <a class="item"
				data-content="강의문의"> 강의문의 </a>
		</div>

		<div class="ui grid">
			<div class="eleven wide column" style="padding-top:50px">
				<div id="강의소개" class="content">
					<c:out value="${uld.intro}" />
				</div>
				<!-- 강의목차 -->
				<div id="강의목차" class="content hidden">
					<table class="ui basic table">
						<thead>
							<tr>
								<th>목차</th>
								<th>제목</th>
								<th>시간</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="uld4" items="${requestScope.uld4 }" varStatus="i">
								<tr>
									<td><c:out value="${i.count }" /></td>
									<td><c:out value="${uld4.lec_title }" /></td>
									<td><c:out value="${uld4.time }" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- 수료기준 -->
				<div id="수료기준" class="content hidden">
					<p>수료 기준</p>
					<p>고정 - 모든 강의 수료 기준 동일</p>
				</div>
				<!-- 강의공지 -->
				<div id="강의공지" class="content hidden">
						<c:forEach var="uld3" items="${requestScope.uld3 }" varStatus="i">
					<div class="ui segment">
							<div>
								<h2>
									<c:out value="${uld3.title}" />
								</h2>
								<h5 style="color: #999;">
									작성자:<c:out value="${uld3.inst_id}" />
									| 작성일:<c:out value="${uld3.write_date}" />
								</h5>
							</div>
							<hr>
							<c:out value="${uld3.content}" />
					</div>
						</c:forEach>
				</div>
				<!-- 강의문의 -->
				<div id="강의문의" class="content hidden">
					<div style="text-align: right;">
						<button id="openModalBtn" class="ui button">문의 작성</button>
					</div>
					
					
<!-- /////////////////////////////////////강의문의 모달폼/////////////////////////////////////////////////// -->
					<div class="ui modal" id="myModal">
						<i class="close icon"></i>
						<div class="header">문의사항 작성</div>
						<div class="content">
							<div class="ui form">
								<form id="frmq" action="/all_about_knowledge/sub_qna_write_process.do" method="post">
									<div class="field">
										<label>작성자: <sec:authentication property='name' /> <%--| 
									  작성일: <span th:text="${#dates.format(#dates.createNow(), 'yyyy-MM-dd')}"></span> --%></label>
									</div>
									<div class="field">
										<label>제목</label> <input type="text" name="s_title" id="s_title"
											placeholder="제목을 입력하세요">
									</div>
									<div class="field">
										<label>내용</label>
										<textarea rows="5" name="s_content" id="s_content"
											placeholder="문의사항을 입력하세요"></textarea>
										<div class="ui message" id="charCount">0/300자</div>
									</div>
							</div>
						</div>
						<div class="actions">
							<input type="button" class="ui positive button" value="작성"
								id="btnWriteQ">
							<input type="hidden" name="s_stdId"
								value="<sec:authentication property='name'/>">
							<input type="hidden" name="s_subCode" value="<c:out value="${uld.sub_code}" />">
							</form>
						</div>
					</div>
					
<!-- /////////////////////////////////////강의문의리스트/////////////////////////////////////////////////// -->
					<c:forEach var="uld5" items="${requestScope.uld5 }" varStatus="i">
					<div id="qnalist">
					<div class="box" style="height: auto;">
						<h5>
							<c:out value="${uld5.question_title}" />
							<span style="float: right; color: #999;">작성자:<c:out value="${uld5.q_std_id}" />
								|작성일: <c:out value="${uld5.q_date}" /></span>
						</h5>
						<div class="ui divider"></div>
						<p><c:out value="${uld5.q_content}" /></p>
					</div>
					<div class="box inline"
						style="height: 80px; margin: 0; background-color: #f5f5f5;">
						<p><c:out value="${uld5.ans_content}" /></p>
					</div>
					</div>
					</c:forEach>
					
				</div>
			</div>
			<!-- 강의신청 폼 -->
			<div class="five wide column" style="padding-top:50px">
				<form id="frm" action="/all_about_knowledge/apply_subject.do" method="post">
				<div class="box inline">
					<h3></h3>
					<h3 class="ui center aligned header">무료강의</h3>
					<div class="ui center aligned buttons"
						style="display: flex; flex-direction: column;">
						
						<input type="button" id="btnApply" class="positive ui button"
							style="margin-bottom: 10px;" value="수강신청">수강 신청
						<input type="hidden" name="std_id" value="<sec:authentication property='name'/>">
						<input type="hidden" name="sub_code" value="${uld.sub_code}">
						
						 <button type="button" id="likeButton" class="ui icon button">
                    <i id="heartIcon" class="heart icon"></i> 관심 강의
                </button>
					</div>
				</div>
					</form>
				<div class="box inline" style="height: 80px; margin: 0;">
					<ul
						style="padding: 0; text-align: center; list-style-type: none; margin: 0;">
						<li>● 총 10개의 수업 (1시간 30분)</li>
						<li>● 3명이 관심강의로 선택했어요</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- 푸터 -->
	<jsp:include page="../site/main_footer.jsp"></jsp:include>

</body>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- Semantic UI JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>
</html>