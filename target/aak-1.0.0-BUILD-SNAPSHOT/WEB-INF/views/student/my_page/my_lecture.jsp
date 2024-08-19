<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
    info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 나의강의</title>
<link rel="icon" href="${pageContext.request.contextPath}/favicon.png">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/front/student/css/semantic.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/front/student/js/semantic.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">
	$(function() {
	    initializeTabs();
	    loadDataForTab('first');
	    bindEnterButton();
	    
	    $('table').on('loadeddata', function() {
	        $('.ui.active.inverted.dimmer').removeClass('active').addClass('disabled');
	        $('.ui.large.text.loader').removeClass('active').addClass('disabled');
	    });
	});
	
	function initializeTabs() {
	    $('.tabular.menu .item').tab({
	        onVisible: function(tabPath) {
	            loadDataForTab(tabPath);
	        }
	    });
	}
	
	function loadDataForTab(tabPath) {
	    var endpoint = tabPath === 'first' ? '${pageContext.request.contextPath}/mypage/get_lecture_data/progress.do' : '${pageContext.request.contextPath}/mypage/get_lecture_data/complete.do';
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
	        updateTabContent(tabPath, data);
	        $('table').trigger('loadeddata');
	    })
	    .catch(error => {
	        alert('데이터 로드 실패!');
	    });
	}
	
	function updateTabContent(tabPath, data) {
	    const tabSelector = `.ui.bottom.attached.tab.segment[data-tab="\${tabPath}"] tbody`;
	    $(tabSelector).empty();
	    data.forEach((lecture, index) => {
	        const row = createLectureRow(lecture, index);
	        $(tabSelector).append(row);
	    });
	    $('.progress').progress();
	    bindEnterButton();
	}
	
	function createLectureRow(lecture, index) {
	    const examStatusClass = lecture.examStatus === '응시가능' ? 'green' : 'red';
	    const progressColor = lecture.percent === 0 ? 'red' : 'yellow';
	    return `
		        <tr>
		            <td class="one wide">\${lecture.catName}</td>
		            <td class="single line">\${lecture.subTitle}</td>
		            <td>\${lecture.name}</td>
		            <td class="single line">
		                <button class="ui \${examStatusClass} tiny basic button">\${lecture.examStatus}</button>
		            </td>
		            <td>
		                <div class="ui \${progressColor} progress" data-percent="\${lecture.percent}" id="progress\${index}">
		                    <div class="bar"></div>
		                </div>
		            </td>
		            <td>\${lecture.percent}%</td>
		            <td class="single line">
		                <button class="ui basic tiny button">문의</button>
		            </td>
		            <td class="single line">
		                <button class="ui right labeled icon green basic button enter-button" data-percent="\${lecture.percent}" data-subcode="\${lecture.subCode}" data-subtitle ="\${lecture.subTitle}">
		                    <i class="right arrow icon"></i> 입장
		                </button>
		            </td>
		        </tr>
	    `;
	}
	
	function bindEnterButton() {
	    $(document).off('click', '.enter-button').on('click', '.enter-button', function() {
	        var subCode = $(this).data('subcode');
	        var subTitle = $(this).data('subtitle');
	        var percent = $(this).data('percent');
	        saveData({ subCode: subCode, subTitle: subTitle, percent: percent });
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
    <div class="active section">나의강의</div>
</div>

<div class="ui active inverted dimmer">
  <div class="ui large text loader">Loading</div>
</div>

<div class="ui top attached tabular menu">
    <a class="item active" data-tab="first">진행중인강좌</a>
    <a class="item" data-tab="second">완료된강좌</a>
</div>
<div class="ui bottom attached tab segment active" data-tab="first">
    <table class="ui celled padded table center aligned">
	    <thead>
		    <tr>
		        <th class="single line">과목분류</th>
		        <th>강좌명</th>
		        <th class="one wide">강사명</th>
		        <th class="one wide">시험</th>
		        <th class="three wide">진도율</th>
		        <th class="one wide">퍼센트</th>
		        <th class="one wide">문의</th>
		        <th class="one wide">강의실입장</th>
		    </tr>
	    </thead>
	    <tbody>
	    </tbody>
	    <tfoot>
    <tr><th colspan="8">
      <div class="ui right floated pagination menu">
        <a class="icon item">
          <i class="left chevron icon"></i>
        </a>
        <a class="item">1</a>
        <a class="item">2</a>
        <a class="item">3</a>
        <a class="item">4</a>
        <a class="icon item">
          <i class="right chevron icon"></i>
        </a>
      </div>
    </th>
  </tr></tfoot>
        </table>
</div>

<div class="ui bottom attached tab segment" data-tab="second">
<table class="ui celled padded table center aligned">
	    <thead>
		    <tr>
		        <th class="single line">과목분류</th>
		        <th>강좌명</th>
		        <th class="one wide">강사명</th>
		        <th class="one wide">시험</th>
		        <th class="three wide">진도율</th>
		        <th class="one wide">퍼센트</th>
		        <th class="one wide">문의</th>
		        <th class="one wide">강의실입장</th>
		    </tr>
	    </thead>
	    <tbody>
	    </tbody>
	    <tfoot>
    <tr><th colspan="8">
      <div class="ui right floated pagination menu">
        <a class="icon item">
          <i class="left chevron icon"></i>
        </a>
        <a class="item">1</a>
        <a class="item">2</a>
        <a class="item">3</a>
        <a class="item">4</a>
        <a class="icon item">
          <i class="right chevron icon"></i>
        </a>
      </div>
    </th>
  </tr></tfoot>
        </table>
</div>
</div>

</article>

</body>
</html>
