<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="kr">

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" ><!-- content="IE=edge" -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>AAK</title>

    <!-- Custom fonts for this template-->
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="http://localhost/all_about_knowledge/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
	<jsp:include page="common/instructor_sidebar.jsp"></jsp:include>
     
        
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
				<jsp:include page="common/instructor_header.jsp"></jsp:include>
                <div class="container-fluid" >
					
				   <div class="col-xl-8 col-lg-7" style="width: 100%">
				   <div class="card shadow mb-4">
				   <!-- 강사 소개 -->
				   
				<div id="content1" class="card-body d-flex" style="width:100%">
				<!-- http://localhost/all_about_knowledge/resources/img/profile.jpg" -->
				    <div id="img" style="padding-right: 20px;">
				       <img class="rounded-circle" src="http://localhost/all_about_knowledge/upload/${instd.image }">
				   		<%-- <strong><c:out value="${sessionScope.inst_id }"/></strong> --%>
				   </div>
				   <div id="introduce" class="d-flex flex-column" style="padding-left: 20px;">
				   <%-- <label><c:out value="${instd.inst_id}"/></label> --%>
				       <%-- <div>
				           <label>아이디</label>
				           <h5><c:out value="${SessionScope.inst_id }"/></h5>
				       </div> --%>
				       <span>
				           <label>이름</label>
				           <!-- <input type="text" value="곽우신" /> -->
				           <h5><c:out value="${instd.name }"/></h5>
				       </span>
				       <span>
				           <label>이메일</label>
				           <!-- <input type="text" value="kws1234@naver.com"/> -->
				           <h5><c:out value="${instd.email }"/></h5>
				       </span>
				       <span>
				           <label>강사소개글</label>
				           <!-- <h5>JAVA 관련 강의를 주로 진행하며 체계적인 커리큘럼과 탄탄한 강의로 개념을 쏙쏙 이해시켜드립니다</h5> -->
				           <h5><c:out value="${instd.introduction }"/></h5>
				           <a href="instructorInfo.do">
				           <input type="button" value="수정" class="btn btn-light btn-sm" style="position: absolute; bottom: 10px; right: 10px; padding: 10px;"/>
					        </a>
					        </span>
					    </div>
				</div>
				
				</div>

                        </div>
                   <div id="content2" class="col-xl-8 col-lg-7" style="width: 100%;">
    <div class="row">
        <!-- 미답변 문의 수 -->
        <div class="col-xl-4 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1" style="font-size: 20px;">
                                미답변 문의 수
                            </div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800" style="font-size: 20px;">
                            <c:out value="${noReplyCnt}"/>건
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 강의 개설현황 -->
        <div class="col-xl-4 col-md-6 mb-4">
            <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1" style="font-size: 20px;">
                                강의 개설현황
                            </div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800" style="font-size: 20px;">
                            <c:out value="${openCnt}"/>/<c:out value="${totalCnt }"/>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 반려리스트 -->
        <div class="col-xl-4 col-md-12 mb-4">
            <div class="card border-left-secondary shadow h-100 py-2">
                <div class="card-body">
                    <table class="table">
                        <tbody>
                        <c:forEach var="recList" items="${recList}" varStatus="i">
                            <tr class="table-secondary">
                                <td colspan="3">
                                    반려
                                    <a href="lectureManage/rejectList.do">
                                        <input type="button" value="상세" style="float:right;background-color: #444; color: white;">
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>과목명</td>
                                <td colspan="2">반려사유</td>
                            </tr>
                            <tr>
                                <td><c:out value="${recList.sub_code }"/></td>
                                <td colspan="2"><c:out value="${recList.reason }"/></td>
                            </tr> 
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

            </div>

        </div>
		<jsp:include page="common/instructor_footer.jsp"></jsp:include>
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
    <script src="http://localhost/all_about_knowledge/resources/vendor/jquery/jquery.min.js"></script>
    <script src="http://localhost/all_about_knowledge/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="http://localhost/all_about_knowledge/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="http://localhost/all_about_knowledge/resources/js/sb-admin-2.min.js"></script>


</body>

</html>