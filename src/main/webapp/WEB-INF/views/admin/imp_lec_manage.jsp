<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 강의 신청 관리</title>
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
<jsp:include page="util/imp_side_nav.jsp"></jsp:include>

<!-- 탑 네비게이션 바 -->
<jsp:include page="util/imp_top_nav.jsp"></jsp:include>

<!-- 컨텐츠 영역 -->
<article class="my_article">
<div class="mypage_content_div">

    <table class="ui compact celled definition table">
        <thead class="full-width">
        <tr>
            <th></th>
            <th>과목코드</th>
            <th>과목명</th>
            <th>강사명</th>
            <th>카테고리</th>
            <th>총 차시</th>
            <th>상태</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td class="collapsing">
                <div class="ui fitted slider checkbox">
                    <input type="checkbox"><label></label>
                </div>
            </td>
            <td>SUB_000001</td>
            <td>이것은 테스트 강의</td>
            <td>김선생</td>
            <td>java</td>
            <td>20</td>
            <td><a class="ui olive label">신청</a></td>
        </tr>
        </tbody>
        <tfoot class="full-width">
        <tr>
            <th></th>
            <th colspan="6">
                <div class="ui right floated small green labeled icon button">
                    <i class="check icon"></i> 승인
                </div>
                <div class="ui right floated small red labeled icon button">
                    <i class="x icon"></i> 반려
                </div>
            </th>
        </tr>
        </tfoot>
    </table>

</div>
</article>
</body>
</html>