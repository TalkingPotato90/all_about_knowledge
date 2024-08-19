
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<!--jQuery CDN 시작-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

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


<!-- <style type="text/css">

    .custom-label {
        padding-right: 10px; /* 시작과 끝에 동일한 간격을 주기 위한 padding 값 설정 */
    }
</style> -->


<!-- 동적인 행 추가  -->
<script type="text/javascript">
var cnt = 0;
$(function () {
	
	$("#add").click(function(){
		var lesson=$("#lesson").val();
		var title=$("#title").val();
		var explain=$("#explain").val();
		var fileNm=$("#fileNm").val();
		
		if( lesson == ""){
			alert("차시는 필수 입력");
			$("#lesson").focus();
			return;
		}
		if( title == ""){
			alert("제목 필수 입력");
			$("#title").focus();
			return;
		}
		if( explain == ""){
			alert("강의계획은 필수 입력");
			$("#explain").focus();
			return;
		}
		if( fileNm == ""){
			alert("강의 파일은 필수 입력");
			return;
		}
		
		 fileNm=fileNm.substring( fileNm.lastIndexOf("\\")+1);
		var output="<tr><td>"+ lesson+" </td><td>"+title+"</td><td>"+explain+"</td><td>"+fileNm+"</td></tr>";
		$("#tab > tbody").append(output);	//더 명확한 selector의 사용
		
		var lesson=$("#lesson").val("");
		var title=$("#title").val("");
		var explain=$("#explain").val("");
		var fileNm=$("#fileNm").val("");
	});
	
	$("#delete").click(function(){
		//$("#tab").remove();
		//아이디가 tab인 대상의 tbody 가장 마지막 tr을 삭제
		$("#tab > tbody > tr:last").remove();
	});


});//ready
</script>


</head>


<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<jsp:include page="../common/instructor_sidebar.jsp"></jsp:include>

	 <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
				<jsp:include page="../common/instructor_header.jsp"></jsp:include>

				<!-- 페이지 contents  -->
				  <div class="row">

				   
	<div class="container-fluid" style="width:70%; background-color:white;">
    <div class="card-body d-flex justify-content-center">
       <div class="dropdown me-2">
		  <a class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
		    카테고리
		  </a>
		  <ul class="dropdown-menu">
		    <li id="category1"><a class="dropdown-item" href="#">컴퓨터공학이론</a></li>
		    <li id="category2"><a class="dropdown-item" href="#">프로그래밍언어</a></li>
		  </ul>
	  </div>

        <div class="dropdown me-2">
            <a class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                과목명
            </a>
            
	           <ul class="dropdown-menu" id="division1"> <!-- 과목명 -->
	               <li><a class="dropdown-item" href="#">CS</a></li>
	           </ul>
	           <ul class="dropdown-menu" id="division2">
	               <li id="sub1"><a class="dropdown-item" href="#">Java</a></li>
	               <li id="sub2"><a class="dropdown-item" href="#">JavaScript</a></li>
	               <li id="sub3"><a class="dropdown-item" href="#">C</a></li>
	               <li id="sub4"><a class="dropdown-item" href="#">C++</a></li>
	           </ul>
               
        </div>
      </div>

    <form action="" id="output" method="post" enctype="application/x-www-form-urlencoded">
	<div id="apply_info" class="d-flex flex-column mt-3"> <!-- apply_info -->
    <!-- 강의 상세내용 -->
    <div id="label_group" class="d-flex flex-row justify-content-center">
        <div id="lec_detail" style="flex-direction: column;">
            <!-- 강의명 -->
            <div class="form-group d-flex align-items-center mb-3">
                <label for="lectureName"  style="width: 150px; margin-right: 20px;">강의명</label>
                <input type="text" id="lectureName" class="form-control" placeholder="강의명을 입력해주세요" aria-describedby="lectureName">
            </div>
            <!-- 학습개요 -->
            <div class="form-group d-flex align-items-center mb-3">
                <label for="studyOverview"  style="width: 150px; margin-right: 20px;">학습개요</label>
                <input type="text" id="studyOverview" class="form-control" placeholder="학습개요를 입력해주세요" aria-describedby="studyOverview">
            </div>
            <!-- 학습목표 -->
            <div class="form-group d-flex align-items-center mb-3">
                <label for="studyGoal"  style="width: 150px; margin-right: 20px;">학습목표</label>
                <input type="text" id="studyGoal" class="form-control" placeholder="학습목표를 입력해주세요" aria-describedby="studyGoal">
            </div>
            <!-- 강의이미지 -->
            <div class="form-group d-flex align-items-center mb-3">
                <label for="lectureImage"  style="width: 150px; margin-right: 20px;">강의이미지</label>
                <input type="file" id="lectureImage" class="form-control" aria-describedby="lectureImage">
            </div>
            <!-- 총 차시 수 -->
            <div class="form-group d-flex align-items-center mb-3">
                <label for="totalSessions" style="width: 150px; margin-right: 20px;">총 차시 수</label>
                <input type="text" id="totalSessions" class="form-control" value="8개" readonly aria-describedby="totalSessions">
            </div>
            <!-- 개설일자 -->
            <div class="form-group d-flex align-items-center mb-3">
                <label for="openDate"  style="width: 150px; margin-right: 20px;">개설일자</label>
                <input type="datetime-local" id="openDate" class="form-control" aria-describedby="openDate">
            </div>
            
    <!-- 강의 차시 -->
    <label style=" margin-top:10px; margin-bottom: 20px;">강의목차</label>
    
            <!-- 차시 -->
            <div class="form-group d-flex align-items-center mb-3">
                <label for="lesson" style="width: 150px; margin-right: 20px;">차시</label>
                <input type="text" id="lesson" class="form-control" placeholder="차시" aria-describedby="lesson">
            </div>
            <!-- 제목 -->
            <div class="form-group d-flex align-items-center mb-3">
                <label for="title"  style="width: 150px; margin-right: 20px;">제목</label>
                <input type="text" id="title" class="form-control" placeholder="제목" aria-describedby="title">
            </div>
            <!-- 설명 -->
            <div class="form-group d-flex align-items-center mb-3">
                <label for="explain"  style="width: 150px; margin-right: 20px;">설명</label>
                <input type="text" id="explain" class="form-control" placeholder="설명" aria-describedby="explain">
            </div>
            <!-- 파일 -->
            <div class="form-group d-flex align-items-center mb-3">
                <label for="fileNm"  style="width: 150px; margin-right: 20px;">파일</label>
                <input type="file" id="fileNm" class="form-control" aria-describedby="fileNm">
            </div>
            <!-- 버튼 -->
            <div style="text-align: center;">
                <input type="button" value="추가" class="btn btn-dark btn-sm ml-2" id="add">
                <input type="button" value="삭제" class="btn btn-light btn-sm ml-2" id="delete">
            </div>
        </div>
	<div>
	    <table id="tab" class="table" style="margin-left:25px">
	        <thead>
	            <tr>
	                <th scope="col" style="width:50px">차시</th>
	                <th scope="col" style="width:250px">제목</th>
	                <th scope="col" style="width:300px">설명</th>
	                <th scope="col" style="width:150px" value="${requestScope.f_Name }">첨부파일</th>
	            </tr>
	        </thead>
	        <tbody>
	        </tbody>
	        
	    </table>
	</div>
    </div>
	</form>
    <div style="text-align: center; margin-top: 40px; margin-bottom:20px;">
        <input type="submit" value="신청" class="btn btn-dark btn-sm" id="applyBtn">
        <input type="button" value="취소" class="btn btn-light btn-sm" id="cancelBtn">
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

    <!-- Page level plugins -->
	
</body>
</html>