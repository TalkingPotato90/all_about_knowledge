<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" ><!-- content="IE=edge" -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>AAK</title>

    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="http://localhost/all_about_knowledge/resources/css/sb-admin-2.min.css" rel="stylesheet">

	<style>
	   .notice-container {
	       width: 80%; /* 원하는 가로 길이로 설정 */
	       margin: 0 auto; /* 가운데 정렬 */
	   }
	   
	   .table-container {
        border: 1px solid #000; /* 테이블을 감싸는 테두리 추가 */
        padding: 10px; /* 테두리와 테이블 사이의 간격 추가 */
    }
	</style>

</head>


<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
	<jsp:include page="../common/instructor_sidebar.jsp"></jsp:include>

	 <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
			<jsp:include page="../common/instructor_header.jsp"></jsp:include>
                
               	<div class="container-fluid" style="width:70%; background-color:white;">
	  				<div class="card-body d-flex flex-column justify-content-center">
    <!-- 강의 상세 정보 -->
    <div class="bg-white tm-block" style="width: 100% ">
  <div class="mb-3 d-flex align-items-center justify-content-center" style="width: 100%;">
    <div style="flex: 1; text-align: center;">
    <%-- http://localhost/all_about_knowledge/upload/${instd.image } --%>
       <%--  <img src="http://localhost/all_about_knowledge/upload/${lecDetail.image }"> --%>
       <img src="http://localhost/all_about_knowledge/upload/%EA%B0%95%EC%9D%98%EC%8D%B8%EB%84%A4%EC%9D%BC.png"/>
    </div>
    <div id="lec_info" class="d-flex flex-column" style="flex: 1;">
        <div class="mb-3">
        <input type="hidden" value="${lecDetail.lec_code}" name="lec_code" />
            <label class="form-label" style="font-size: 18px">강의명      <c:out value="${lecDetail.title}"/></label>
            <a href="http://localhost/all_about_knowledge/instructor/lectureManage/lectureEntrance.do">
                <input type="button" value="강의실 입장" class="btn btn-light btn-sm" style="margin-left:20px; font-size: 18px">
            </a>
        </div>
        <div class="mb-3">
            <label class="form-label" style="font-size: 18px"><!-- 총 강의시간 | 800분 -->
            총 시간        <c:out value="${lecDetail.total_time }"/></label> 
            <input type="button" value="문의관리" class="btn btn-light btn-sm" style="margin-left:20px; font-size: 18px">
        </div>
        <div class="mb-3">
            <label class="form-label" style="font-size: 18px">
             총 차시수      <c:out value="${lecDetail.total_no }"/></label> 
            <input type="button" value="뒤로가기" class="btn btn-light btn-sm" onclick="history.back()" style="margin-left:20px; font-size: 18px">
        </div>
    
    <!-- 진도현황 -->
   <div class="mb-3">
    <label for="customRange1" class="form-label" style="font-size: 18px">진도현황</label>
    <span style="display: flex; align-items: center;">
        <input type="range" class="form-range" disabled style="width: 150px; margin-right: 10px;">
        <strong style="font-size: 18px; display: inline;">75 %</strong>
    </span>
</div>



    
    <!-- 성적현황 -->
    <div class="mb-3">
    	
        <label class="form-label" style="font-size: 18px">성적현황</label>
        <strong style="margin-left:20px; font-size: 18px"><label>78 / 100</label></strong>
        
        <input type="button" value="시험관리" class="btn btn-light btn-sm" style="margin-left:20px; font-size: 18px"/>
        <input type="button" value="수강생관리" class="btn btn-light btn-sm" style="margin-left:10px; font-size: 18px"/>
    </div>
    </div>
</div>
    
    <!-- 테이블 -->
    <div class="mb-3 notice-container">
        <label class="form-label" style="font-size: 18px">공지사항</label>
        <input type="button" value="공지관리" class="btn btn-light btn-sm" style="margin-left:20px; font-size: 18px"/>
    </div>
    <div class="mb-3 notice-container table-container">
        <table class="table" style="margin-top:10px">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성일</th>
                </tr>
            </thead> 
            <tbody>
            <c:choose>
            <c:when test="${ not empty ntd }">
                <tr>
                    <td><c:out value="${ntd.notice_no}"/></td>
                    <td><c:out value="${ntd.title }"/></td>
                    <td><c:out value="${ntd.write_date }"/></td>
                </tr>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="3"> 
                     	<c:if test="${empty qna_no}">
				       공지사항이 존재하지 않습니다.
				   		</c:if>
                    </td>
                </tr>
            </c:otherwise>
                
                </c:choose>
             </tbody>
             </table> 
		</div>
				</div>
				</div>
				</div>
				</div>
				<jsp:include page="../common/instructor_footer.jsp"></jsp:include>	
	
	<!-- Bootstrap core JavaScript-->
    <script src="http://localhost/all_about_knowledge/resources/vendor/jquery/jquery.min.js"></script>
    <script src="http://localhost/all_about_knowledge/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="http://localhost/all_about_knowledge/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="http://localhost/all_about_knowledge/resources/js/sb-admin-2.min.js"></script>

	
</body>
</html>