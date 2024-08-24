<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 레이아웃</title>
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
	
	}); // ready
</script>
</head>
<body class="mypage">
<!-- 사이드 네비게이션 바 -->
<jsp:include page="imp_side_nav.jsp"></jsp:include>

<!-- 탑 네비게이션 바 -->
<jsp:include page="imp_top_nav.jsp"></jsp:include>

<!-- 컨텐츠 영역 -->
<article class="my_article">
<div class="mypage_content_div">
    <div class="ui segment div_margin">
        <div class="ui three cards trim_width">
            <div class="card">
                <div class="content">
                    <a class="ui red ribbon label">학생</a>
                    <div class="header header_align_top">오늘의 현황</div>
                    <div class="description">
                        <p>전체 회원 수 : </p>
                        <p>신규 회원 수 : </p>
                        <p>탈퇴 회원 수 : </p>
                    </div>
                </div>
                <div class="content">
                    <div class="header header_align_top">일별 신규 회원</div>
                </div>
            </div>

            <div class="card">
                <div class="content">
                    <a class="ui blue ribbon label">강사</a>
                    <div class="header header_align_top">교육관리</div>
                    <div class="description">
                        <p>전체 강사 수 : </p>
                        <p>전체 강좌 수 : </p>
                        <p>개설 신청 수 : </p>
                    </div>
                </div>
                <div class="content">
                    <div class="header header_align_top">월별 신규 강의</div>
                </div>
            </div>

            <div class="card">
                <div class="content">
                    <a class="ui green ribbon label">커뮤니티</a>
                    <div class="header header_align_top">문의사항</div>
                    <div class="description">
                        미확인 문의 수
                    </div>
                </div>
                <div class="content">
                    <div class="header header_align_top">오늘 들어 온 문의사항</div>
                </div>
            </div>


        </div>
    </div>

</div>
</article>
</body>
</html>