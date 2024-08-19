<!-- 
Desc : 사용자(학생)의 마이페이지 관심강의 화면
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
<title>마이페이지 - 관심강의</title>
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
	    loadData();
	    bindEnterButton();
	    
	    $('table').on('loadeddata', function() {
	        $('.ui.active.inverted.dimmer').removeClass('active').addClass('disabled');
	        $('.ui.large.text.loader').removeClass('active').addClass('disabled');
	    });
	});
	
	function loadData() {
	    var endpoint = '${pageContext.request.contextPath}/mypage/interest_lecture_data.do';
	    fetch(endpoint, {
	        headers: {
	            'Accept': 'application/json'
	        }
	    })
	    .then(response => {
	        if (!response.ok) {
	            throw new Error('네트워크 응답 없음');
	        }
	        return response.json();
	    })
	    .then(data => {
	        updateContent(data);
	        $('table').trigger('loadeddata');
	    })
	    .catch(error => {
	        alert('데이터 로드 실패!');
	    });
	}
	
	function updateContent(data) {
	    const tabSelector = ".ui.celled.padded.table.fav_container.center.aligned tbody";
	    $(tabSelector).empty();
	    data.forEach((lecture, index) => {
	        const row = createInterestLectureTable(lecture, index);
	        $(tabSelector).append(row);
	    });
	    
	    $('.ui.rating').rating({
	        initialRating: 1,
	        maxRating: 1
	    });
	}
	
	function createInterestLectureTable(lecture, index){
	    return `
		<tr>
	      <td class="one wide">\${lecture.catName}</td>
	      <td class="single line">\${lecture.subTitle}</td>
	      <td class="single line">\${lecture.name}</td>
	      <td class="one wide">
			<div class="ui heart rating"></div>
	      </td>
	      <td class="single line">
	      	<button class="ui green basic button enter-button" data-subcode="\${lecture.subCode}" data-subtitle ="\${lecture.subTitle}">
			  보기
			</button>
	      </td>
	    </tr>
	    `;
	}
	
	<!-- 이 부분 메인 홈페이지 강의 상세로 연결해야 함 -->
	function bindEnterButton() {
	    $(document).off('click', '.enter-button').on('click', '.enter-button', function() {
	        var subCode = $(this).data('subcode');
	        var subTitle = $(this).data('subtitle');
	        saveData({ subCode: subCode, subTitle: subTitle });
	    });
	}

	function saveData(data) {
	    $.post('${pageContext.request.contextPath}/mypage/save_subcode.do', data)
	        .done(function() {
	            window.location.href = '${pageContext.request.contextPath}/mypage/my_lecture_detail.do';
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
	  <a class="section">나의강의실</a>
	  <i class="right chevron icon divider"></i>
	  <div class="active section">관심강의</div>
	</div>
	
<div class="ui active inverted dimmer">
  <div class="ui large text loader">Loading</div>
</div>

<table class="ui celled padded table fav_container center aligned">
  <thead>
    <tr>
    <th class="single line">과목분류</th>
    <th>강좌명</th>
    <th class="one wide">강사명</th>
    <th class="single line">관심등록</th>
    <th class="one wide">강의상세</th>
  </tr></thead>
  <tbody>
   
  </tbody>
  <tfoot>
    <tr><th colspan="5">
      <div class="ui right floated pagination menu">
        <a class="icon item">
          <i class="left chevron icon"></i>
        </a>
        <a class="item">1</a>
        <a class="item">2</a>
        <a class="icon item">
          <i class="right chevron icon"></i>
        </a>
      </div>
    </th>
  </tr></tfoot>
</table>

</div>

</article>

</body>
</html>