<!DOCTYPE html>
<html lang="kr">

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" ><!-- content="IE=edge" -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    <title>AAK</title>

    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="http://localhost:8080/all_about_knowledge/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<script>
 
    $(document).ready(function(){
    	   

        // 완료 버튼 클릭 시
        $("#updateSubmit").click(function(){
            if(confirm("변경내용을 저장 하시겠습니까?")) {
                $("#frmpost").attr("action", "exam_update.do");
                $("#frmpost").submit();
              
            } else {
               
            }
        });

       
    });
    
</script>


<style type="text/css">
    form {
        max-width: 800px;
        margin: 20px auto;
        text-align: center;
    }

   
    .sub {
        width: 300px;
        margin: 20px 0;
    }
    .test-box {
        border: 1px solid #ccc;
        padding: 10px;
        margin-bottom: 10px;
        border-radius: 5px;
    }
    textarea {
        width: 400px;
        height: 100px;
        margin-bottom: 10px;
    }
    .test-box input[type="text"] {
        width: 400px;
        margin-bottom: 5px;
    }
    #btn-write, #btn-update {
        margin-top: 20px;
    }
</style>

</head>
<script>
    
</script>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

     
 <!-- Sidebar -->
		   <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
                       <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3" style="font-size: 20px;">
                <a class="sidebar-brand d-flex align-items-center justify-content-center" 
            href="http://localhost:8080/all_about_knowledge/instructor/instructor_home.do">AAk 강사메인</a></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- 탭 메뉴 -->
            <li class="nav-item active">
                <a class="nav-link" href="http://localhost:8080/all_about_knowledge/instructor/lectureManage/lectureList.do">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span style="font-size: 18px;">강의관리</span></a>
            </li>
            
             <li class="nav-item active">
                <a class="nav-link" href="http://localhost:8080/all_about_knowledge/instructor/lectureManage/lectureApply.do">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span style="font-size: 18px;">강의신청</span></a>
            </li>
            
            <li class="nav-item active">
                <a class="nav-link" href="http://localhost:8080/all_about_knowledge/instructor/qna/qnaList.do">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span style="font-size: 18px;">문의사항</span></a>
            </li>
            
            <li class="nav-item active">
                <a class="nav-link" href="http://localhost:8080/all_about_knowledge/instructor/studentList.do">
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
				<a class="nav-link dropdown-toggle d-flex align-items-center" href="http://localhost:8080/all_about_knowledge/instructor_index.do"
					id="userDropdown" role="button" aria-haspopup="true" aria-expanded="false"> 
					<c:if test="${instd.image }.equals('')">
					
					<img class="img-profile rounded-circle"
						src="http://localhost:8080/all_about_knowledge/upload/${instd.image }"
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
<div>
<h3>문제수정</h3>
 <c:catch var="e">
    <form action="exam_update.do" method="post" id="frmpost">
        <div id="test">
            <c:choose>
                <c:when test="${empty examlist}">
                    <p>문제가 없습니다.</p>
                </c:when>
                <c:otherwise>
                    <c:forEach var="exam" items="${examlist}" varStatus="loop">
                        <div class="test-box">
                            <textarea name="CONTENT" >${exam.CONTENT}</textarea><br>
                            1번 보기 <input type="text" name="EX_1" value="${exam.EX_1}" /><br>
                            2번 보기 <input type="text" name="EX_2" value="${exam.EX_2}" /><br>
                            3번 보기 <input type="text" name="EX_3" value="${exam.EX_3}" /><br>
                            4번 보기 <input type="text" name="EX_4" value="${exam.EX_4}" /><br>
                            정답: <input type="text" name="SOLUTION" value="${exam.SOLUTION}" />
                            <input type="text" name="q_NO" value="${exam.q_NO}" readonly />
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
        <input type="button" class="btn btn-info btn-sm" value="저장" id="updateSubmit" style="margin-top: 50px; float: right;"/>
    <a href="examList.do"><button class="btn btn-info btn-sm" style="margin-top: 50px; float: right;">취소</button></a>
    </form>
    </c:catch>
<c:if test="${not empty e}">
        조회 중 오류가 발생했습니다.
    </c:if>
    
</div>
<!-- /main -->
               

            </div>
            

            <jsp:include page="../common/instructor_footer.jsp"></jsp:include>
	</div>
            <!-- End of Footer -->

       
        <!-- End of Content Wrapper -->

   
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
    <script src="http://localhost:8080/all_about_knowledge/resources/vendor/jquery/jquery.min.js"></script>
    <script src="http://localhost:8080/all_about_knowledge/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="http://localhost:8080/all_about_knowledge/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="http://localhost:8080/all_about_knowledge/resources/js/sb-admin-2.min.js"></script>

</body>

</html>