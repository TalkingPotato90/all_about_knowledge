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

    <div class="ui segment">

        <form class="ui form" action="imp_cat_add_confirm.do" method="post">

            <div class="ui checkbox">
                <input type="checkbox" name="subCatCheck">
                <label>하위 카테고리 생성</label>
            </div>

            <div class="three fields">
                <div class="field"></div>
                <div class="field">
                    <label>상위카테고리코드</label>
                    <input name="primeCatCode" type="text" placeholder="상위카테고리코드" readonly>
                </div>
            </div>

            <div class="three fields">
                <div class="field"></div>
                <div class="field">
                    <label>상위카테고리명</label>
                    <input name="primeCatName" type="text" placeholder="상위카테고리명">
                </div>
            </div>

            <div class="three fields disabled">
                <div class="field"></div>
                <div class="field">
                    <label>카테고리코드</label>
                    <input name="catCode" type="text" placeholder="카테고리코드" readonly>
                </div>
            </div>

            <div class="three fields disabled">
                <div class="field"></div>
                <div class="field">
                    <label>카테고리명</label>
                    <input name="catName" type="text" placeholder="카테고리명">
                </div>
            </div>

            <div class="text_right">
                <div class="ui basic red button">취소</div>
                <button type="submit" class="ui basic green button">추가</button>
            </div>

        </form>
    </div>

</div>
</article>
</body>
</html>