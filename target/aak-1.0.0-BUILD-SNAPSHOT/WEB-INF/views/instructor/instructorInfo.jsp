<!DOCTYPE html>
<html>

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" ><!-- content="IE=edge" -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<!--bootstrap 시작-->
<link href="http://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="http://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->
    <title>AAK</title>

    <!-- Custom fonts for this template-->
    <link href="http://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="http://localhost/all_about_knowledge/resources/css/sb-admin-2.min.css" rel="stylesheet">

	<!-- Bootstrap CSS -->
	<!-- <link href="http://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LJ3XOMiYvVRy4X4H6YphqQLzzsUz1+cPTnWBXOpacAdMQuPBM0dAVPvcjFpzeFnC" crossorigin="anonymous"> -->
	
	<!-- Bootstrap JavaScript -->
	<script src="http://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-Um/z5h4jUjzfcVklr/dWUp5QL7fWHazAqGqJSK1ovRPqVxB5LQcbxV/tdxJmpt3V" crossorigin="anonymous"></script>


<!-- 동적인 행 추가  -->
<script type="text/javascript">
var cnt = 0;
$(function () {
	
	$("#updateBtn").click(function(){
		var ext=$("#lectureImage").val();
		
		if(ext==""){
			alert("파일을 선택해주세요")
			return;
		}
	});//click;
});//ready
</script>


</head>


<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
	<jsp:include page="common/instructor_sidebar.jsp"></jsp:include>
		
	 <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
			<jsp:include page="common/instructor_header.jsp"></jsp:include>	
             
				<!-- 페이지 contents  -->
				  <div class="row">

				   <div class="col-xl-8 col-lg-7">
				   <div class="card shadow mb-4">
				   
	<div class="container-fluid">
    <div class="card-body d-flex justify-content-center">
    
      </div>
      
      
    <div id="apply_info" class="d-flex flex-column mt-3"> <!-- apply_info -->
    <!-- 강사 개인정보수정 -->
    <div id="" class="d-flex flex-row justify-content-center">
        <form action="instructorInfoProcess.do" method="post" id="instInfoFrm" style="flex-direction: column;">
            <!-- 강의명 -->
            <div class="form-group d-flex align-items-center mb-3">
                <label for="lectureName"  style="width: 150px; margin-right: 20px;">이름</label>
                <input type="text" id="lectureName" class="form-control" placeholder="이름을 입력해주세요" aria-describedby="lectureName">
            </div>
            <!-- 학습개요 -->
            <div class="form-group d-flex align-items-center mb-3">
                <label for="studyOverview"  style="width: 150px; margin-right: 20px;">이메일</label>
                <input type="text" id="studyOverview" class="form-control" placeholder="이메일을 입력해주세요" aria-describedby="studyOverview">
            </div>
            <!-- 학습목표 -->
            <div class="form-group d-flex align-items-center mb-3">
                <label for="studyGoal"  style="width: 150px; margin-right: 20px;">강사소개</label>
                <input type="text" id="studyGoal" class="form-control" placeholder="강사소개를 입력해주세요" aria-describedby="studyGoal">
            </div>
            <!-- 강의이미지 -->
            <div class="form-group d-flex align-items-center mb-3">
                <label for="lectureImage"  style="width: 150px; margin-right: 20px;">이미지</label>
                <input type="file" id="lectureImage" class="form-control" aria-describedby="lectureImage">
            </div>
            <div class="form-group d-flex align-items-center mb-3">
                <label for="studyGoal"  style="width: 150px; margin-right: 20px;">연락처</label>
                <input type="text" id="studyGoal" class="form-control" placeholder="연락처를 입력해주세요" aria-describedby="studyGoal">
            </div>
            <div class="form-group d-flex align-items-center mb-3">
                <label for="studyGoal"  style="width: 150px; margin-right: 20px;">학력</label>
                <input type="text" id="studyGoal" class="form-control" placeholder="학력을 입력해주세요" aria-describedby="studyGoal">
            </div>
            <div class="form-group d-flex align-items-center mb-3">
                <label for="studyGoal"  style="width: 150px; margin-right: 20px;">주력과목</label>
                <input type="text" id="studyGoal" class="form-control" placeholder="주력과목을 입력해주세요" aria-describedby="studyGoal">
            </div>
	    

	    <div style="text-align: center;">
		    <input type="button" value="수정" class="btn btn-dark btn-sm" id="updateBtn"/>
		    <input type="button" value="취소" class="btn btn-light btn-sm" id="cancleBtn" onclick="history.back()"/>
	    </div>
	</div>
	    

</div>
</div>
		<jsp:include page="common/instructor_footer.jsp"></jsp:include>
			
	
	<!-- Bootstrap core JavaScript-->
    <script src="http://localhost/all_about_knowledge/resources/vendor/jquery/jquery.min.js"></script>
    <script src="http://localhost/all_about_knowledge/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="http://localhost/all_about_knowledge/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="http://localhost/all_about_knowledge/resources/js/sb-admin-2.min.js"></script>


	
</body>
</html>