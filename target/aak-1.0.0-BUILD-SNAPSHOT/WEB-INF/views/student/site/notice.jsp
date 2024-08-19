<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" type="text/css"
	href="/all_about_knowledge/front/student/css/semantic.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="/all_about_knowledge/front/student/js/semantic.js"></script>
<link rel="stylesheet" type="text/css"
	href="../dist/components/icon.css">
<!--jQuery CDN 시작-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->
<!-- Semantic UI CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
	<link rel="stylesheet" href="http://localhost/all_about_knowledge/front/student/css/datatables.min.css">
	<!-- <script type="text/javascript" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script> -->
    <!-- <link rel="stylesheet" href="http://localhost/all_about_knowledge/front/admin/css/datatables.datatables.css"> -->
<style type="text/css">
.search-container {
	display: flex;
	justify-content: flex-end;
}

.pagination-container {
	display: flex;
	justify-content: center;
	margin-top: 150px; /* 위에서 주어진 마진 값 */
}

.center-aligned {
	text-align: center !important;
}

.left-aligned {
	text-align: left !important;
}

.right-aligned {
	text-align: right !important;
}
.narrow-column {
        width: 120px;
    }

</style>
<script type="text/javascript" src="<c:url value ="/resources/js/datatables.min.js"/>"></script>

<script type="text/javascript">
	$(document).ready(function($) {
		$(".clickable-row").click(function() {
			window.location = $(this).data("href");
		});
		
		// DataTables 초기화
		var table = $("#notice").DataTable({
	        "processing": true,
	        "serverSide": false, // 클라이언트 측에서 데이터 처리
	        "columns": [
	            { "data": "index" },
	            { "data": "titleLink" },
	            { "data": "write_date" },
	            { "data": "status" }
	        ],
	        /* "initComplete": function(settings, json) {
	            // 검색 입력 필드에 placeholder 설정
	            $('.dataTables_filter input[type="search"]').attr('placeholder', 'search..');
	        } */
	    });
		
		
		
	});
</script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../site/main_header.jsp"></jsp:include>

	<!-- main container -->
	<div class="ui main container" style="padding: 20px">
			<h1 class="ui header">공지사항</h1>

		<!-- <div class="search-container">
			<div class="ui icon input">
				<input type="text" placeholder="Search..."> <i
					class="search icon"></i>
			</div>
		</div> -->

		<table class="ui celled selectable table" id="notice">
    <thead>
        <tr>
            <th class="center-aligned narrow-column">번호</th>
            <th class="center-aligned">제목</th>
            <th class="center-aligned narrow-column">작성자</th>
            <th class="center-aligned narrow-column">작성일</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="list" items="${requestScope.list }" varStatus="i">
            <tr>
                <td class="center-aligned"><c:out value="${i.count }" /></td>
                <td class="left-aligned">
                    <a href="site_notice_detail.do?title=${list.title}">
                        <c:out value="${list.title}" />
                    </a>
                </td>
                <td class="center-aligned"><c:out value="${list.id}" /></td>
                <td class="center-aligned">
                    <fmt:formatDate pattern="yyyy-MM-dd" value="${list.write_date }" />
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

		 <!-- <div class="ui container">
			<div class="pagination-container">
				<div class="ui pagination menu">
					<a class="active item"> 1 </a>
					<div class="disabled item">...</div>
					<a class="item"> 10 </a> <a class="item"> 11 </a> <a class="item">
						12 </a>
				</div>
			</div>

		</div>  -->
	</div>

	<!-- 푸터 -->
	<jsp:include page="../site/main_footer.jsp"></jsp:include>
</body>

</html>