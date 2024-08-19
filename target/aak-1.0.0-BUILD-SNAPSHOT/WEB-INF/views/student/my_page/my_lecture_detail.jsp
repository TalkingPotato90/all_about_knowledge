<!-- 
Desc : 사용자(학생)의 마이페이지 나의 강의 상세 페이지
작성자 : 고한별
작성일 : 2024.06.17
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
    info = "" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의강의 - 강의상세</title>
<link rel="icon" href="/all_about_knowledge/favicon.png">
<link rel="stylesheet" type="text/css" href="/all_about_knowledge/front/student/css/semantic.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="/all_about_knowledge/front/student/js/semantic.js"></script>
<style type = "text/css">
	.progress-container {
	    display: flex;
	    align-items: center;
	    width: 100%;
	}
	.progress-container .progress {
	    flex-grow: 1;
	    margin-left: 10px;
	}
	
</style>
<script type = "text/javascript">
	$(function() {
		$('.progress').progress();
		bindEnterButton();
	}); // ready
	
	function bindEnterButton() {
	    $(document).off('click', '.playButton').on('click', '.playButton', function() {
	        var lecCode = $(this).data('leccode');
	        saveData(lecCode);
	    });
	}

	function saveData(lecCode) {
	    $.post('${pageContext.request.contextPath}/mypage/save_leccode.do', { lecCode: lecCode })
	        .done(function() {
	            window.location.href = '${pageContext.request.contextPath}/mypage/play_lecture.do';
	        });
	}
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
	  <div class="active section">강의상세</div>
	</div>
	
	<c:if test="${not empty errorMessage}">
	    <div class="ui red message">
	        <i class="close icon"></i>
	        ${errorMessage}
	    </div>
	</c:if>

<div class="ui sizer vertical segment div_margin">
  <div class="ui huge header">${ lectureInfo.subTitle }</div>
    <div class="ui segment">
  <div class="ui grid">
  <div class = "three wide column">
    <div class="ui fluid image">
      <img src="/all_about_knowledge/upload/${ lectureInfo.subImage }">
    </div>
  </div>
  
  <div class="two wide column">
	<p> ${ lectureInfo.intro } </p>
	<p> ${ lectureInfo.goal } </p>
    </div>
     
    <div class="four wide column">
	    <div class="progress-container">
	    	<label>진도율 : &nbsp;</label>
		    <div class="ui indicating progress no_margin progress" data-percent= "${ lectureInfo.percent }">
			  	<div class="bar">
			  		<div class="progress"></div>
			  	</div>
		  	</div>
	  	</div>
	  	
	  	<div>&nbsp;</div>
	  	
	  	<div>
	  		<label>시험 : &nbsp;</label>
  			<a class="ui inverted mini red button" href="${pageContext.request.contextPath}/mypage/exam_confirm.do">시험응시</a>
  		</div>
  		
  		<div>&nbsp;</div>
  		
	  	<div>
	  		<label>문의 : &nbsp;</label>
	  		<button class="ui inverted mini olive button">문의하기</button>
	    </div>
    </div>
    
     <div class="four wide column">
     <div class="ui fluid image">
      <img src="/all_about_knowledge/upload/${ lectureInfo.instImage }">
    </div>
    </div>

     <div class="three wide column">
      <p>강사명 : ${ lectureInfo.name }</p>
      <p>${ lectureInfo.introduction }</p>
    </div>
    
  </div>
  
  <table class="ui celled table center aligned">
  <thead>
    <tr><th class="one wide">회차</th>
    <th>수업명</th>
    <th class="one wide">상태</th>
    <th class="two wide">재생</th>
  </tr></thead>
  <tbody>
	<c:forEach var="lecture" items="${detailLecture}" varStatus="status">
		<tr>
			<td>${status.index + 1}</td>
			<td>${lecture.title}</td>
			<td>
				<c:choose>
					<c:when test="${lecture.status == 'C'}">
						<div class="ui blue label">완료</div>
					</c:when>
					<c:when test="${lecture.status == 'P'}">
						<div class="ui yellow label">진행</div>
					</c:when>
					<c:otherwise>
						<div class="ui red label">미수강</div>
					</c:otherwise>
				</c:choose>
			</td>
			<td>
				<div class="ui animated mini green button playButton" tabindex="0" data-leccode="${lecture.lecCode}">
					<div class="visible content">재생</div>
					<div class="hidden content">
						<i class="caret square right icon"></i>
					</div>
				</div>
			</td>
		</tr>
	</c:forEach>
  </tbody>
</table>
  </div>
</div>
</div>
</article>

</body>
</html>