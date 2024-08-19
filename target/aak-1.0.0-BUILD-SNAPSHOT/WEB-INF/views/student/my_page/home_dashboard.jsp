<!-- 
Desc : 사용자(학생)의 마이페이지 홈(대시보드) 화면
작성자 : 고한별
작성일 : 2024.06.12
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
    info = "" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 홈</title>
<link rel="icon" href="/all_about_knowledge/favicon.png">
<link rel="stylesheet" type="text/css" href="/all_about_knowledge/front/student/css/semantic.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="/all_about_knowledge/front/student/js/semantic.js"></script>
<style type = "text/css">
</style>
<script type = "text/javascript">
	$(function() {
		$('#enterNeedExam').click(function(){
            window.location.href = '${pageContext.request.contextPath}/mypage/my_lecture_detail.do';
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

<!-- breadcrumb 표시 -->
<div class="ui small breadcrumb div_margin">
  <a class="section">나의강의실</a>
  <i class="right chevron icon divider"></i>
  <div class="active section">대시보드</div>
</div>

<!-- 통계 -->
<div class="ui three statistics div_margin">
  <div class="statistic ui segment div_margin trim_width">
    <div class="label">
      전체 수강 강의 수
    </div>
    <div class="value">
      ${totalLectureCount}
    </div>
  </div>
  <div class="statistic ui segment div_margin trim_width">
    <div class="label">
      진행 중인 강의 수
    </div>
    <div class="value">
      ${processLectureCount}
    </div>
  </div>
  <div class="statistic ui segment div_margin trim_width">
    <div class="label">
      완료된 강의 수
    </div>
    <div class="value">
      ${completeLectureCount}
    </div>
  </div>
</div>

<!-- 강의 정보 -->
<div class="ui segment div_margin">
<div class="ui two cards trim_width">
  <div class="card">
    <div class="content">
  	<a class="ui red ribbon label">시험 응시가 필요한 강의</a>
      <div class="header header_align_top">이것이 자바일까?
      <div class="ui green label align_right">진행</div>
      </div>
      <div class="description">
        시바수현
      </div>
    </div>
    
    <div class="content">
    <table class="ui celled striped table">
  <thead>
  	<tr>
  	<th class="collapsing">번호</th>
  	<th>제목</th>
	<th class="center aligned">날짜</th>
	</tr>
  </thead>
  <tbody>
    <tr>
      <td class="center aligned">
        4
      </td>
      <td>뭐요</td>
      <td class="collapsing">2024-06-12</td>
    </tr>
    <tr>
      <td class="center aligned">
        3
      </td>
      <td>이것은</td>
      <td>2024-06-12</td>
    </tr>
    <tr>
      <td class="center aligned">
        2
      </td>
      <td>공지사항</td>
      <td>2024-06-12</td>
    </tr>
    <tr>
      <td class="center aligned">
        1
      </td>
      <td>테이블</td>
      <td>2024-06-12</td>
    </tr>
  </tbody>
</table>
</div>
    
    <div class="ui bottom attached button black" id="enterNeedExam">
      <i class="angle double right icon"></i>
      강의실 입장
    </div>
  </div>
  
  <div class="card">
    <div class="content">
    	<a class="ui gray ribbon label">마지막으로 수강한 강의</a>
      <div class="header header_align_top">이것이 자바일까?
      <div class="ui green label align_right">진행</div>
      </div>
      <div class="description">
        시바수현
      </div>
    </div>
    <div class="content">
    <table class="ui celled striped table">
  <thead>
  	<tr>
  	<th class="collapsing">번호</th>
  	<th>제목</th>
	<th class="center aligned">날짜</th>
	</tr>
  </thead>
  <tbody>
    <c:forEach var="notice" items="${lastNotice}" varStatus="status">
	    <tr>
	        <td class="center aligned">${status.index + 1}</td>
	        <td>${notice.title}</td>
	        <td class="collapsing">${notice.writeDate}</td>
	    </tr>
	</c:forEach>
  </tbody>
</table>
</div>
    
    <div class="ui bottom attached button black">
      <i class="angle double right icon"></i>
      강의실 입장
    </div>
  </div>
  
  
</div>
</div>
</div>
</article>

</body>
</html>