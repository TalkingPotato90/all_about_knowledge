<!-- 
Desc : 사용자(학생)의 마이페이지 시험 응시 화면
작성자 : 고한별
작성일 : 2024.06.21
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
    info = "" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		
		<title>나의강의 - 시험</title>
		
		<link rel="icon" href="/all_about_knowledge/favicon.png">
		<link rel="stylesheet" type="text/css" href="/all_about_knowledge/front/student/css/semantic.css">
		
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"
		  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
		  crossorigin="anonymous"></script>
		<script src="/all_about_knowledge/front/student/js/semantic.js"></script>
	
		<script type="text/javascript">
			$(function() {
				$('.special.modal')
				  .modal({
					  centered: true,
					  blurring: true
				  })
				  .modal('show');
				
				$('#confirm').click(function(){
		            window.location.href = '${pageContext.request.contextPath}/mypage/mypage_home.do';
		        });
				
			}); // ready
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
			
				<!-- breadcrumb 시작 -->
				<div class="ui small breadcrumb div_margin">
					<a class="section" href="${pageContext.request.contextPath}/mypage/mypage_home.do">나의강의실</a>
					<i class="right chevron icon divider"></i>
					<a class="section" href="${pageContext.request.contextPath}/mypage/my_lecture.do">나의강의</a>
					<i class="right chevron icon divider"></i>
					<div class="active section">시험</div>
				</div>
				<!-- breadcrumb 종료 -->
				
				<!-- 시험 점수 확인 모달 창 시작 -->
				<div class="ui special mini modal">
				    <div class="ui icon header">
				        <i class="edit icon"></i> 시험종료
				    </div>
				
				    <div class="content">
				        <p>[ <c:out value="${sessionScope.sub_title}"/> ] 의 시험 성적은</p>
				        <p><c:out value="${totalScore}"/>점 입니다.</p>
				    </div>
				
				    <div class="actions">
				        <div class="ui green ok inverted button" id="confirm">
				            <i class="checkmark icon"></i> 확인
				        </div>
				    </div>
				</div>
				<!-- 시험 점수 확인 모달 창 종료 -->
				
			</div>
		</article>
		<!-- 컨텐츠 영역 종료 -->
		
	</body>
</html>