<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lecture list</title>

<link rel="stylesheet" type="text/css"
	href="/all_about_knowledge/front/student/css/semantic.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="/all_about_knowledge/front/student/js/semantic.js"></script>

<!-- Standard Meta -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">


<!-- Semantic UI CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
<script type="text/javascript"
	src="<c:url value ="/resources/js/datatables.min.js"/>"></script>
<style type="text/css">
.search-container {
	display: flex;
	justify-content: flex-end;
	margin-bottom: 1em;
}

.ui.horizontal.menu .dropdown.item {
	width: auto; /* 기본 너비 설정 */
	min-width: 120px; /* 최소 너비 설정 */
	text-align: center; /* 텍스트 가운데 정렬 */
}

.ui.horizontal.menu .dropdown.item>.menu {
	min-width: 100%; /* 메뉴 너비 설정 */
	width: auto; /* 메뉴 너비 자동 설정 */
}

.ui.dropdown.item {
	text-align: center; /* 텍스트 가운데 정렬 */
}
</style>
<script type="text/javascript">
$(document).ready(function() {
    // Semantic UI rating 초기화
    $('.ui.rating').rating({
        initialRating : 0,
        maxRating : 1
    });

    // 카테고리 dropdown 초기화
    $('#category').dropdown({
        
    });


    // AJAX로 카테고리 목록을 받아와서 동적으로 추가하는 부분
    $.ajax({
        url: "edu_cat_list.do",
        type: "GET",
        dataType: "JSON",
        error: function(xhr) {
            console.log(xhr.status + " : " + xhr.statusText);
            alert("서버 오류 발생");
        },
        success: function(jsonObj) {
            var output = "<ul>";

            $.each(jsonObj.list, function(i, jsonTemp) {
                var outputId = 'edusubOutput' + i;
                output += "<li class='item' onclick='searchSubcat(\"" + jsonTemp.cat_code + "\", \"" + outputId + "\")'>";
                output += jsonTemp.cat_name;
                output += "</li>";
              	//output += "<li id='" + outputId + "' style='display: none;'></li>";
            });

            output += "</ul>";
            $("#educatOutput").html(output).show(); // 카테고리 정보를 표시하고 출력
        }
    });//ajax
    
});//ready
	
	
function searchSubcat(cat_code, outputId) {
    var cat_code = cat_code;
    $.ajax({
        url: "edu_subcat_list.do",
        type: "GET",
        dataType: "JSON",
        data: { cat_code: cat_code },
        error: function(xhr) {
            console.log(xhr.status + " : " + xhr.statusText);
            alert("서버 오류 발생");
        },
        success: function(jsonObj) {
            var output = "<ul>";

            $.each(jsonObj.list, function(i, jsonTemp) {
                output += "<div class='item'>";
                output += jsonTemp.subcat_name;
                output += "</div>";
            });

            output += "</ul>";
            $("#" + outputId).html(output).show(); // 데이터를 불러온 후에 표시
        }
        });
		
		
	}
</script>

</head>
<body>

	<!-- 헤더 -->
	<jsp:include page="../site/main_header.jsp"></jsp:include>

	<div class="ui main container"
		style="padding-top: 20px; padding-bottom: 300px">
		<h1 class="ui header">개설강좌</h1>

		<!-- 카테고리 섹션 -->
		<div class="ui menu">
			<!-- 상위카테고리 -->
			<div class="ui pointing dropdown link item" id="category">
				<span class="text" id ="catbtn">카테고리</span> <i class="dropdown icon"></i>
				<div id="educatOutput" class="menu">
					<!-- 동적 쿼리 들어감 -->
					<!-- <ul>
						<li class="item">하위 카테고리</li>
						<li class="item">하위 카테고리</li>
						<li class="item">하위 카테고리</li>
						<li class="item">하위 카테고리</li>
					</ul> -->
				</div>
			</div>
			
			<!-- 하위카테고리 -->
			<div class="ui pointing dropdown link item" id="category">
				<span class="text">과목분류</span> <i class="dropdown icon"></i>
				<div id="edusubOutput" class="menu">
					<!-- 동적 쿼리 들어감 -->
					<!--  <ul>
						<li class="item">하위 카테고리</li>
						<li class="item">하위 카테고리</li>
						<li class="item">하위 카테고리</li>
						<li class="item">하위 카테고리</li>
					</ul> -->
				</div>
			</div>
		</div>


		<!-- 검색 -->
		<div class="search-container">
			<div class="ui icon input">
				<input type="text" placeholder="Search..."> <i
					class="search icon"></i>
			</div>
		</div>

		<!-- 정렬 -->
		<div
			style="display: flex; justify-content: space-between; align-items: center; margin-top: 10px; margin-bottom: 10px;">
			<div></div>
			<select class="ui search dropdown">
				<option value="이름순">이름순</option>
				<option value="최신순">최신순</option>
				<option value="좋아요순">좋아요순</option>
				<option value="인기순">인기순</option>
			</select>
		</div>

		<!-- 강의 카드 -->
		<div class="ui three stackable link cards" id="lectureCards">
			<c:forEach var="listLecture" items="${requestScope.listLecture }"
				varStatus="i">
				<div class="card" id="card">
					<a href="user_lecture_detail.do?sub_code=${listLecture.sub_code}"
						class="image"> <img
						src="http://localhost/all_about_knowledge/upload/${ listLecture.image }"
						class="card-img-top" alt="...">
					</a>
					<div class="content">
						<div class="header">
							<c:out value="${listLecture.sub_title}" />
						</div>
						<div class="meta">
							<a><c:out value="${listLecture.inst_id}" /></a> 강사님
						</div>
					</div>
					<div class="extra content">
						<span class="right floated">
							<div class="ui heart rating"></div>
						</span> <span> <i class="user icon"></i> +<c:out
								value="${listLecture.cnt}" />명 수강중
						</span>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>


	<!-- 푸터 -->
	<jsp:include page="../site/main_footer.jsp"></jsp:include>
</body>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- Semantic UI JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>
</html>