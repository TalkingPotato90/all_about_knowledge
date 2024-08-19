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
	href="http://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="http://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<!--jQuery CDN 시작-->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<title>AAK</title>

<link
	href="http://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="http://localhost/all_about_knowledge/resources/css/sb-admin-2.min.css"
	rel="stylesheet">

<!-- Bootstrap CSS -->
<link
	href="http://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">

<!-- 동적인 행 추가  -->
 <script>
 $(document).ready(function () {
     // 카테고리 선택 시 과목명 변경
     $('#category').change(function () {
         var selectCategory = $(this).val();
         $('#cat_code').val(selectCategory);
         var param = { "subCode": selectCategory };
         $.ajax({
             url: "http://localhost/all_about_knowledge/instructor/lectureManage/subtitle.do",
             type: "GET",
             data: param,
             dataType: "json",
             error: function(xhr) {
                 console.log(xhr.status);
                 alert("다시 시도해주세요");
             },
             success: function(jsonObj) {
                 var sel = $("#cat_code")[0];
                 sel.length = 0;
                 $.each(jsonObj.data, function(i, jsonTemp) {
                     sel.options[i] = new Option(jsonTemp.cat_name, jsonTemp.cat_code);
                 });
             }
         });
     });

     $('#subject').change(function() {
         var selectSubject = $(this).val();
         $('#sub_code').val(selectSubject);
     });

     $("#addBtn1").click(function () {
    	 var frm=$("#addLectureForm")[0];
         var formData = new FormData(frm);
       /*   formData.append("lecNm", $("#lecNm").val());
         formData.append("intro", $("#intro").val());
         formData.append("goal", $("#goal").val());
         formData.append("lectureImage", $("#lectureImage")[0].files[0]);
         formData.append("totalSession", $("#totalSession").val()); */

         var imageName="";
         //강의썸네일 전송
         $.ajax({
             url: "http://localhost/all_about_knowledge/instructor/lectureManage/lectureApply_result.do",
             type: "POST",
             contentType: false,
             processData: false,
             data: formData,
             async: false,
             dataType: "json",
             success: function (json) {
                 alert("강의이미지가 업로드 되었습니다.");
                 imageName=json.fsName;
                 
                 if ($("#lectureImage").val() === "") {
                     alert("파일을 선택해주세요");
                     return;
                 } 
             },
             error: function (xhr) {
                 console.log(xhr.status);
                 alert("다시 시도해주세요");
             }
         });
          
         var cat_code=$('#subject').val();
         var subTitle=$('#lecNm').val();
         var cat_code=$('#cat_code').val();
         var intro=$('#intro').val();
         var goal=$('#goal').val();
         
         var param = { 
        		 "cat_code": cat_code,
        		 "sub_title": subTitle,
        	 	 "cat_code": cat_code,
        		 "intro": intro,
        		 "goal": goal,
        		 "total_no": totalSession,
        		 "image":imageName
         };
         
        
	 	 // 강의 상세 내용만 보내기
         $.ajax({
             url: "http://localhost/all_about_knowledge/instructor/lectureManage/lecInfo.do",
             type: "post",
             data: param,
             dataType: "json",
             success: function(jsonObj) {
            	 $("#sub_code").val(jsonObj.sub_code);
                 alert("강의상세가 입력되었습니다."+jsonObj.sub_code);
                 //jsonObject에 들어있는 sub_code를 input type=hidden에 넣어준다.
                 
             },
             error: function(xhr) {
                 console.log(xhr.status);
                 alert("다시 시도해주세요"+ xhr.status+", "+ xhr.statusText);
             }
         });
     });
/* 
     // 차시 추가 버튼
     $("#addBtn2").click(function(){
         var lesson = $("#lesson").val();
         var title = $("#title").val();
         var explain = $("#explain").val();
         var fileNm = $("#upfile").val();

         if (fileNm) {
             fileNm = fileNm.substring(fileNm.lastIndexOf("\\") + 1);
         }

         if ($("#lectureImage").val() === "" || $("#upfile").val() === "") {
             alert("파일을 선택해주세요");
             return;
         }

         if (lesson === "" || title === "" || explain === "") {
             alert("모든 필드를 입력해주세요");
             return;
         }

         var output = "<tr><td>" + lesson + "</td><td>" + title + "</td><td>" + explain + "</td><td>" + fileNm + "</td></tr>";
         $("#tab > tbody").append(output);

         $("#lesson").val("");
         $("#title").val("");
         $("#explain").val("");
         $("#upfile").val(""); 
     });
 */
 
 
 $("#addBtn2").click(function () {
	 var frm=$("#addLectureForm")[0];
     var formData = new FormData(frm);
  
     var videoName="";
     
     //강의파일 전송
     $.ajax({
         url: "http://localhost/all_about_knowledge/instructor/lectureManage/lectureApply_result.do",
         type: "POST",
         contentType: false,
         processData: false,
         data: formData,
         async: false,
         dataType: "json",
         success: function (json) {
             alert("강의영상이 업로드 되었습니다.");
             videoName=json.fsName2;
         },
         error: function (xhr) {
             console.log(xhr.status);
             alert("다시 시도해주세요");
         }
     });
      
     /* var lesson=$('#lesson').val(); */
     var title=$('#title').val();
     var lec_explain=$('#explain').val();
     
     var param = { 
    		 "cat_code": cat_code,
    		 "lec_code": lec_code,
    	 	 "title": title,
    		 /* "time": */
    		 "f_name":videoName
    		 "lec_explain":lec_explain
     };
   //  #{sub_code},#{lec_code},#{title},#{time},#{status},#{f_name},#{lec_explain}
    
 	 // 강의 상세 내용만 보내기
     $.ajax({
         url: "http://localhost/all_about_knowledge/instructor/lectureManage/leclesson.do",
         type: "post",
         data: param,
         dataType: "json",
         success: function(jsonObj) {
        	 
            // alert("강의목차가 추가되었습니다."+jsonObj.sub_code());
             // 테이블에 행 추가
             var fileNm = $("#upfile").val();
             if (fileNm) {
                 fileNm = fileNm.substring(fileNm.lastIndexOf("\\") + 1);
             }

             var output = "<tr><td>" + lesson + "</td><td>" + title + "</td><td>" + explain + "</td><td>" + fileNm + "</td></tr>";
             $("#tab > tbody").append(output);

             // 필수 입력 필드 검증
             if ($("#upfile").val() === "") {
                 alert("파일을 선택해주세요");
                 return;
             } 

             if (lesson === "" || title === "" || explain === "") {
                 alert("모든 필드를 입력해주세요");
                 return;
             }

             
             
         },
         error: function(xhr) {
             console.log(xhr.status);
             alert("다시 시도해주세요"+ xhr.status+", "+ xhr.statusText);
         }
     });
 	
 });
 
 
     $("#delete").click(function(){
         $("#tab > tbody > tr:last").remove();
     });

     $('#addLectureForm').on('submit', function (event) {
         event.preventDefault();
         var formData = new FormData(this);

         $.ajax({
             url: "http://localhost/all_about_knowledge/instructor/lectureManage/lectureApply_result.do",
             type: "POST",
             contentType: false,
             processData: false,
             data: formData,
             dataType: "json",
             error: function(xhr) {
                 console.log(xhr.status);
                 alert("다시 시도해주세요");
             },
             success: function(response) {
                 alert("해당 강의가 추가되었습니다.");
             }
         });
     });
 });
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


					<div class="container-fluid"
						style="width: 70%; background-color: white;">

						<div class="card-body d-flex justify-content-center">

							<div class="dropdown me-2">
								<select id="category" class="form-control" name="category">
							<c:forEach var="list" items="${ requestScope.catList }" varStatus="i">
								<option value="${list.cat_code }"><c:out value="${ list.cat_name }"/></option>
							</c:forEach>	
								</select>
							</div>

							<div class="dropdown me-2">
								<select id="cat_code" class="form-control" name="cat_code">
									<option value="" disabled selected><strong>과목명</strong></option>
									<option value="JAVA">JAVA</option>
									<option value="JavaScript">JavaScript</option>
									<option value="C">C</option>
									<option value="C++">C++</option>
									<option value="자료구조">자료구조</option>
									<option value="운영체제">운영체제</option>

								</select>

							</div>
						</div>

							
							<div id="apply_info" class="d-flex flex-column mt-3">

						<form id="addLectureForm" method="post" enctype="multipart/form-data">
							<input type="hidden" id="cat_code" name="cat_code" value="${cat_code }"/>
				
								<!-- apply_info -->
								<!-- 강의 상세내용 -->
								<div id="label_group"
									class="d-flex flex-row justify-content-center">
									<div id="lec_detail" style="flex-direction: column;">
										<!-- 강의명 -->
										<div class="form-group d-flex align-items-center mb-3">
											<label for="lectureName"
												style="width: 150px; margin-right: 20px;">강의명</label> <input
												type="text" id="lecNm" name="lecNm" class="form-control"
												placeholder="강의명을 입력해주세요" aria-describedby="lectureName">
										</div>
										<!-- 학습개요 -->
										<div class="form-group d-flex align-items-center mb-3">
											<label for="studyOverview"
												style="width: 150px; margin-right: 20px;">학습개요</label> <input
												type="text" id="intro" name="intro" class="form-control"
												placeholder="학습개요를 입력해주세요" aria-describedby="studyOverview">
										</div>
										<!-- 학습목표 -->
										<div class="form-group d-flex align-items-center mb-3">
											<label for="studyGoal"
												style="width: 150px; margin-right: 20px;">학습목표</label> <input
												type="text" id="goal" name="goal" class="form-control"
												placeholder="학습목표를 입력해주세요" aria-describedby="studyGoal">
										</div>
										<!-- 강의이미지 -->
										<div class="form-group d-flex align-items-center mb-3">
											<label for="lectureImage"
												style="width: 150px; margin-right: 20px;">강의이미지</label> <input
												type="file" id="lectureImage" name="lectureImage" class="form-control"
												aria-describedby="lectureImage">
											<!-- 	<input type="button" value="추가" class="align-items-center btn btn-dark btn-sm ml-2" id="lectureImgBtn" />
												<input type="hidden" id="lectureImage2" /> -->
										</div>
										<!-- 총 차시 수 -->
										<div class="form-group d-flex align-items-center mb-3">
											<label for="totalSessions"
												style="width: 150px; margin-right: 20px;">총 차시 수</label> <input
												type="text" id="totalSession" name="totalSession" class="form-control"
												aria-describedby="totalSessions">
										</div>
										<!-- 개설일자 -->
										<!--<div class="form-group d-flex align-items-center mb-3">
											<label for="openDate"
												style="width: 150px; margin-right: 20px;">개설일자</label> <input
												type="datetime-local" id="createDate" class="form-control"
												aria-describedby="openDate">
										</div> -->
										<div style="text-align: center;">
											<input type="button" value="추가" class="align-items-center btn btn-dark btn-sm ml-2" id="addBtn1" />
										</div>
									</form>
									
									<form id="lectureLessonForm" method="post" enctype="multipart/form-data">
										<input type="hidden" id="sub_code" name="sub_code" />
										<!-- 강의 차시 -->
										<label style="margin-top: 10px; margin-bottom: 20px;">강의목차</label>

										<!-- 차시 -->
										<div class="form-group d-flex align-items-center mb-3">
											<label for="lesson" style="width: 150px; margin-right: 20px;">차시</label>
											<input type="text" id="lesson" name="lesson" class="form-control"
												placeholder="차시" aria-describedby="lesson">
										</div>
										<!-- 제목 -->
										<div class="form-group d-flex align-items-center mb-3">
											<label for="title" style="width: 150px; margin-right: 20px;">제목</label>
											<input type="text" id="title" name="title" class="form-control"
												placeholder="제목" aria-describedby="title">
										</div>
										<!-- 설명 -->
										<div class="form-group d-flex align-items-center mb-3">
											<label for="explain"
												style="width: 150px; margin-right: 20px;">설명</label> <input
												type="text" id="explain" name="explain" class="form-control"
												placeholder="설명" aria-describedby="explain">
										</div>
										<!-- 파일 -->
										<div class="form-group d-flex align-items-center mb-3">
											<label for="fileNm" style="width: 150px; margin-right: 20px;">파일</label>
											<input type="file" name="upfile" id="upfile"
												class="form-control" aria-describedby="fileNm">
										</div>
										<!-- 버튼 -->
										<div style="text-align: center;">
											<input type="button" value="추가" class="btn btn-dark btn-sm ml-2" id="addBtn2"> 
											<input type="button" value="삭제" class="btn btn-light btn-sm ml-2" id="delete">
										</div>
										</form>
									</div>
									<div>
										<table id="tab" class="table" style="margin-left: 25px">
											<thead>
												<tr>
													<th scope="col" style="width: 50px">차시</th>
													<th scope="col" style="width: 250px">제목</th>
													<th scope="col" style="width: 300px">설명</th>
													<th scope="col" style="width: 150px">첨부파일</th>
												</tr>
											</thead>

										</table>
									</div>
								</div>
				

						<div
							style="text-align: center; margin-top: 40px; margin-bottom: 20px;">
							<input type="button" value="신청" class="btn btn-dark btn-sm" id="applyBtn"> 
								<input type="button" value="취소" class="btn btn-light btn-sm" id="cancelBtn">
						</div>
					</div>
				</div>
			</div>
		</div>


		<jsp:include page="../common/instructor_footer.jsp"></jsp:include>
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