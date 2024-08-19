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
<style type = "text/css">
</style>
<script type="text/javascript">
	$(function() {
		$('.ui.radio.checkbox').checkbox();
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
	<!-- breadcrumb 표시 -->
	<div class="ui small breadcrumb div_margin">
	  <a class="section" href="${pageContext.request.contextPath}/mypage/mypage_home.do">나의강의실</a>
	  <i class="right chevron icon divider"></i>
	  <a class="section" href="${pageContext.request.contextPath}/mypage/my_lecture.do">나의강의</a>
	  <i class="right chevron icon divider"></i>
	  <div class="active section">시험</div>
	</div>
	
	<div class="ui segment div_margin">
	<div class="ui form">
<form action="/all_about_knowledge/mypage/examSubmit.do" method="post">
    <c:if test="${not empty examList}">
        <c:forEach var="exam" items="${examList}" varStatus="status">
            <div class="grouped fields">
                <label>${exam.qNo}. ${exam.content}</label>
                <div class="field">
                    <div class="ui radio checkbox">
                        <input type="radio" name="examResults[${status.index}].answer" value="1">
                        <label>${exam.ex1}</label>
                    </div>
                </div>
                <div class="field">
                    <div class="ui radio checkbox">
                        <input type="radio" name="examResults[${status.index}].answer" value="2">
                        <label>${exam.ex2}</label>
                    </div>
                </div>
                <div class="field">
                    <div class="ui radio checkbox">
                        <input type="radio" name="examResults[${status.index}].answer" value="3">
                        <label>${exam.ex3}</label>
                    </div>
                </div>
                <div class="field">
                    <div class="ui radio checkbox">
                        <input type="radio" name="examResults[${status.index}].answer" value="4">
                        <label>${exam.ex4}</label>
                    </div>
                </div>
                <input type="hidden" name="examResults[${status.index}].qNo" value="${exam.qNo}">
            </div>
        </c:forEach>
    </c:if>
    <c:if test="${empty examList}">
        <p>등록된 시험이 없습니다.</p>
    </c:if>
    <div class="text_right">
        <button type="submit" class="ui inverted olive button">제출</button>
    </div>
</form>
  
</div>
</div>

</div>
</article>
</body>
</html>