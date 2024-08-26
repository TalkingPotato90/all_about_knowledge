<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 교육카테고리 관리</title>
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
            <th>상위카테고리코드</th>
            <th>카테고리코드</th>
            <th>카테고리명</th>
            <th>상태</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td class="collapsing">
                <div class="ui fitted slider checkbox">
                    <input type="checkbox"> <label></label>
                </div>
            </td>
            <td>CAT_00001</td>
            <td>CAT_00008</td>
            <td>java</td>
            <td><a class="ui olive label">사용중</a></td>
        </tr>
        </tbody>
        <tfoot class="full-width">
        <tr>
            <th></th>
            <th colspan="4">
                <div class="ui right floated small primary labeled icon button">
                    <i class="plus icon"></i> 카테고리 추가
                </div>
                <div class="ui small yellow labeled icon button">
                    <i class="edit icon"></i> 수정
                </div>
                <div class="ui small red labeled icon button">
                    <i class="minus icon"></i> 삭제
                </div>
                <div class="ui small green labeled icon button">
                    <i class="check icon"></i> 활성화
                </div>
                <div class="ui small orange labeled icon button">
                    <i class="x icon"></i> 비활성화
                </div>
            </th>
        </tr>
        </tfoot>
    </table>

</div>
</article>
</body>
</html>