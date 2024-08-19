<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible">
<!-- content="IE=edge" -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!--bootstrap 시작-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<title>AAK</title>

<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="http://localhost/all_about_knowledge/resources/css/sb-admin-2.min.css"
	rel="stylesheet">

</head>


<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<jsp:include page="../common/instructor_sidebar.jsp"></jsp:include>


		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<jsp:include page="../common/instructor_header.jsp"></jsp:include>

				<!-- 문의리스트 -->
				<div class="container-fluid"
					style="width: 70%; background-color: white;">
					<div
						class="card-body d-flex flex-row justify-content-center align-items-center mb-4">
						<!-- 검색바 -->
						<div class="dropdown me-2">
							<button class="btn btn-secondary dropdown-toggle" type="button"
								data-bs-toggle="dropdown" aria-expanded="false">승인여부</button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">승인</a></li>
								<li><a class="dropdown-item" href="#">대기중</a></li>
								<li><a class="dropdown-item" href="#">반려</a></li>
							</ul>
						</div>

						<div class="dropdown me-2">
							<button class="btn btn-secondary dropdown-toggle" type="button"
								data-bs-toggle="dropdown" aria-expanded="false">제목</button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">Action</a></li>
								<li><a class="dropdown-item" href="#">Another action</a></li>
								<li><a class="dropdown-item" href="#">Something else
										here</a></li>
							</ul>
						</div>

						<input type="text" class="form-control" style="max-width: 350px;">
						<input type="button" class="input-group-text" value="🔍">

					</div>

					<div class="container-fluid">
						<!-- 리스트 -->
						<table id="tab" class="table table-hover" class="d-flex flex-col">
							<thead>
								<tr>
									<th scope="col">작성자</th>
									<th scope="col">과목명</th>
									<th scope="col">제목</th>
									<th scope="col">답변여부</th>
									<th scope="col">작성일</th>
								</tr>
							</thead>
							<tbody id="output">
								<c:forEach var="qnaList" items="${qnaList}" varStatus="i">
									<tr>
										<td><c:out value="${qnaList.std_id}" /></td>
										<td><c:out value="${qnaList.sub_title}"/></td>
										<td><a href="qnaDetail.do?qna_no=${qnaList.qna_no}">
										<c:out value="${qnaList.title}"/></a></td>
										<td><c:out value="${qnaList.status}"/></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd" value="${qnaList.q_date}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<div class="container-fluid">
						<!-- 페이지네이션 -->
						<div id="pn" class="d-flex justify-content-center">
							<nav aria-label="Page navigation example">
								<ul class="pagination">
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="../common/instructor_footer.jsp"></jsp:include>


			<!-- Bootstrap core JavaScript-->
			<script
				src="http://localhost/all_about_knowledge/resources/vendor/jquery/jquery.min.js"></script>
			<script
				src="http://localhost/all_about_knowledge/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

			<!-- Core plugin JavaScript-->
			<script
				src="http://localhost/all_about_knowledge/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

			<!-- Custom scripts for all pages-->
			<script
				src="http://localhost/all_about_knowledge/resources/js/sb-admin-2.min.js"></script>

</body>
</html>