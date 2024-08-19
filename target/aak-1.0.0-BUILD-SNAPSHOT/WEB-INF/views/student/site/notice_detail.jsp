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

<style type="text/css">
.search-container {
	display: flex;
	justify-content: flex-end;
}
</style>
<script type="text/javascript">
	$(document).ready(function($) {
		$(".clickable-row").click(function() {
			window.location = $(this).data("href");
		});
	});
</script>
</head>
<body>

	<!-- 헤더 -->
	<jsp:include page="../site/main_header.jsp"></jsp:include>

	<div class="ui main container">
		<h1 class="ui header">공지사항</h1>

		<div class="ui segment">
			<div>
				<h2>
				<c:out value="${und.title}" />
				</h2>
				<h5 style="color: #999;">작성자: <c:out value="${und.id}" /> | 작성일: <fmt:formatDate pattern="yyyy-MM-dd" value="${und.write_date }" /></h5>
			</div>
			<hr>
			<div>
			<c:out value="${und.content}" />
			</div>
		</div>
		<a href="site_notice.do">
			<button class="ui center aligned button" id="listBtn">
				<i class="list icon"></i> 목록
			</button>
		</a>
	</div>

	<!-- 푸터 -->
	<jsp:include page="../site/main_footer.jsp"></jsp:include>
</body>

</html>