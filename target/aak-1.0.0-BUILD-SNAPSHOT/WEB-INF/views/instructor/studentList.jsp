<!DOCTYPE html>
<html lang="kr">

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" ><!-- content="IE=edge" -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
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

<style type="text/css">
 
   
    
  

</style>

</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
       <!-- Sidebar -->
		   <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
                       <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3" style="font-size: 20px;">
                <a class="sidebar-brand d-flex align-items-center justify-content-center" 
            href="http://localhost/all_about_knowledge/instructor/instructor_home.do">AAk 강사메인</a></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- 탭 메뉴 -->
            <li class="nav-item active">
                <a class="nav-link" href="http://localhost/all_about_knowledge/instructor/lectureManage/lectureList.do">  
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span style="font-size: 18px;">강의관리</span></a>
            </li>
            
             <li class="nav-item active">
                <a class="nav-link" href="http://localhost/all_about_knowledge/instructor/lectureManage/lectureApply.do">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span style="font-size: 18px;">강의신청</span></a>
            </li>
            
            <li class="nav-item active">
                <a class="nav-link" href="http://localhost/all_about_knowledge/instructor/qna/qnaList.do">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span style="font-size: 18px;">문의사항</span></a>
            </li>
            
            <li class="nav-item active">
                <a class="nav-link" href="http://localhost/all_about_knowledge/instructor/studentList.do">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span style="font-size: 18px;">수강생 관리</span>
                    </a>
            </li>


        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
				
                <!-- Topbar -->
               <nav
			class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

			<!-- Sidebar Toggle (Topbar) -->
			<button id="sidebarToggleTop"
				class="btn btn-link d-md-none rounded-circle mr-3">
				<i class="fa fa-bars"></i>
			</button>

			<!-- Topbar Search -->
			<form
				class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
			</form>

			<!-- Topbar Navbar -->
			<ul class="navbar-nav ml-auto">

				<!-- Nav Item - Search Dropdown (Visible Only XS) -->
				<li class="nav-item dropdown no-arrow d-sm-none"><a
					class="nav-link dropdown-toggle" href="#" id="searchDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
				</a> <!-- Dropdown - Messages -->
					<div
						class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
						aria-labelledby="searchDropdown">
						<form class="form-inline mr-auto w-100 navbar-search">
							<div class="input-group">
								<input type="text" class="form-control bg-light border-0 small"
									placeholder="Search for..." aria-label="Search"
									aria-describedby="basic-addon2">
								<div class="input-group-append">
									<button class="btn btn-primary" type="button">
										<i class="fas fa-search fa-sm"></i>
									</button>
								</div>
							</div>
						</form>
					</div></li>

				<!-- Nav Item - Alerts -->
				<li class="nav-item dropdown no-arrow mx-1"><a
					class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fas fa-bell fa-fw"></i>
				</a> <!-- Dropdown - Alerts -->
					<div
						class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
						aria-labelledby="alertsDropdown">
						<h6 class="dropdown-header">Alerts Center</h6>
						<a class="dropdown-item d-flex align-items-center" href="#">
							<div class="mr-3">
								<div class="icon-circle bg-primary">
									<i class="fas fa-file-alt text-white"></i>
								</div>
							</div>
							<div>
								<div class="small text-gray-500">December 12, 2019</div>
								<span class="font-weight-bold">A new monthly report is
									ready to download!</span>
							</div>
						</a> <a class="dropdown-item d-flex align-items-center" href="#">
							<div class="mr-3">
								<div class="icon-circle bg-success">
									<i class="fas fa-donate text-white"></i>
								</div>
							</div>
							<div>
								<div class="small text-gray-500">December 7, 2019</div>
								$290.29 has been deposited into your account!
							</div>
						</a> <a class="dropdown-item d-flex align-items-center" href="#">
							<div class="mr-3">
								<div class="icon-circle bg-warning">
									<i class="fas fa-exclamation-triangle text-white"></i>
								</div>
							</div>
							<div>
								<div class="small text-gray-500">December 2, 2019</div>
								Spending Alert: We've noticed unusually high spending for your
								account.
							</div>
						</a> <a class="dropdown-item text-center small text-gray-500" href="#">Show
							All Alerts</a>
					</div></li>


				<div class="topbar-divider d-none d-sm-block"></div>

				<!-- Nav Item - User Information -->
				<li class="nav-item dropdown no-arrow">
				<a class="nav-link dropdown-toggle d-flex align-items-center" href="http://localhost/all_about_knowledge/instructor_index.do"
					id="userDropdown" role="button" aria-haspopup="true" aria-expanded="false"> 
					<c:if test="${instd.image }.equals('')">
					
					<img class="img-profile rounded-circle"
						src="http://localhost/all_about_knowledge/upload/${instd.image }"
						style="margin-right: 10px;"> 
					</c:if>  
						<span class="mr-2 d-none d-lg-inline text-gray-600 small" style="font-size: 15px">Logout</span>
				</a></li>

				<!-- 오른쪽 상단 이미지 클릭 메뉴 -->
				<!-- Dropdown - User Information -->

				<!--  <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                로그아웃 드랍박스
                                 <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a> 
                            </div> -->

			</ul>

		</nav>
                <!-- End of Topbar -->
<!-- main -->
        
  <script>
function search() {
    var searchType = document.getElementById('searchSelect').value;
    var searchKeyword = document.getElementById('searchInput').value;

    // 검색어가 비어있는 경우 처리
    if (searchKeyword.trim() === '') {
        alert('검색어를 입력해주세요.');
        return;
    }

    // URL 파라미터 설정
    var url = 'studentList.do?searchType=' + encodeURIComponent(searchType) + '&searchKeyword=' + encodeURIComponent(searchKeyword);

    // 페이지 이동
    window.location.href = url;
}

// 엔터 키 입력 시 검색 실행
document.getElementById('searchInput').addEventListener('keypress', function(e) {
    if (e.key === 'Enter') {
        search();
    }
});
</script>   

   
 <div class="card-body d-flex flex-row justify-content-center align-items-center mb-4">
    <!-- 검색바 -->
   <select id="searchSelect" class="form-select me-2">
    <option value="아이디" ${searchType == '아이디' ? 'selected' : ''}>아이디</option>
    <option value="과목" ${searchType == '과목' ? 'selected' : ''}>과목</option>
    <option value="이름" ${searchType == '이름' ? 'selected' : ''}>이름</option>
</select>

<input type="text" id="searchInput" class="form-control" style="max-width: 350px;" value="${searchKeyword}">
    
    <button type="button" class="btn btn-primary" onclick="search()">🔍</button>
</div>
    
	 <a href="notice.do">공지</a>
	 <a href="examList.do">시험</a>
  
   <table class="table">
     <thead>
   
    			<tr>
                    <th class="id">아이디</th>
                    <th class="name">이름</th>
                    <th class="sub_code">과목</th>
                    <th class="status">학습현황</th>
                    <th class="score">합격여부</th>
                    
                </tr>
                    </thead>
             <tbody>
                            <c:catch var="exception">
                                <c:forEach var="student" items="${listStudent}">
                                    <tr>
                                        <td>${student.STD_ID}</td>
                                        <td>${student.name}</td>
                                        <td>${student.SUB_TITLE }</td>
                                        
                                        
                                        <td><c:choose>
                                           <c:when test="${student.status eq '0'}">
                                        미완료
                                        </c:when>
                                         <c:otherwise>
                                        ${student.status}
                                         </c:otherwise>
                                       </c:choose></td>
                                        
                                         <td><c:choose>
                                         <c:when test="${student.score eq '0'}">
                                        불합격
                                        </c:when>
                                          <c:otherwise>
                                         ${student.score}
                                          </c:otherwise>
                                         </c:choose></td>
                                         
                                    </tr>
                                </c:forEach>
                              
                            </c:catch>
                            <c:if test="${not empty exception}">
                                <tr>
                                    <td colspan="6" style="color:red;">오류가 발생했습니다: ${exception.message}</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>       
  

<!-- /main -->

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

           <jsp:include page="common/instructor_footer.jsp"></jsp:include>

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">Ã</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

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