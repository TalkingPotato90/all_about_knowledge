<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<style>
th,td,tr{font-size: 13px;}
a {text-decoration: none;}
.cursor{cursor: progress;}
</style>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>All_About_Knowledge</title>
    <!--

    Template 2108 Dashboard

	http://www.tooplate.com/view/2108-dashboard

    -->
    <link rel="stylesheet" href="http://localhost/all_about_knowledge/front/admin/css/fullcalendar.min.css">
    <link rel="stylesheet" href="http://localhost/all_about_knowledge/front/admin/css/index-DO6cl02t.css"> 
   
    <!-- https://fullcalendar.io/ -->
     <link rel="stylesheet" href="http://localhost/all_about_knowledge/front/admin/css/family.css">
    <!-- https://fonts.google.com/specimen/Open+Sans -->
    <link rel="stylesheet" href="http://localhost/all_about_knowledge/front/admin/css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="http://localhost/all_about_knowledge/front/admin/css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="http://localhost/all_about_knowledge/front/admin/css/tooplate.css">
<style type="text/css">
#recentNotice{
font-size: 9px;
}
</style>

<body id="reportsPage">
    <div class="" id="home">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="navbar navbar-expand-xl navbar-light bg-light">
                        <a class="navbar-brand" href="admin_main.do">
                            <h3 class="tm-site-title mb-0">All About Knowledge</h3>
                        </a>
                        <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mx-auto">
                              <c:if test="${sessionScope.adminPermission.category_management == 'Y'}">
    
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#void" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">교육과목관리
                                        
                                    </a>
                                     <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="manage_edu_cat.do">교육카테고리리스트</a>
                                        <a class="dropdown-item" href="manage_lecture.do">강의신청리스트</a>
                                    </div>
                                </li>
                                </c:if>
                                <c:if test="${sessionScope.adminPermission.member_management == 'Y'}">
                                <li class="nav-item ">
                                    <a class="nav-link " href="manage_memberlist.do">
                                        회원 관리
                                    </a>
                                </li>
                                </c:if>
                               <c:if test="${sessionScope.adminPermission.instructor_management == 'Y'}">
                                <li class="nav-item " >
                                    <a class="nav-link " href="manage_instructor.do">강사 관리
                                        </a>
                                </li>
								</c:if>
								<c:if test="${sessionScope.adminPermission.qna_management == 'Y'}">
                                
                                <li class="nav-item  ">
                                    <a class="nav-link" href="manage_qna.do">문의 관리</a>
                                </li>
                                </c:if>
                                <c:if test="${sessionScope.adminPermission.notice_management == 'Y'}">
                                <li class="nav-item  active">
                                    <a class="nav-link " href="manage_notification.do">
                                        공지사항 관리
                                    </a>
                                </li>
                                </c:if>
                                <c:if test="${sessionScope.auth == 'SUPER'}">
                                <li class="nav-item">
                                    <a class="nav-link " href="manage_admin.do">
                                        관리자 관리
                                    </a>
                                </li>
                                </c:if>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link d-flex" href="admin_index_logout.do">
                                        <i class="far fa-user mr-2 tm-logout-icon"></i>
                                        <span>Logout</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            </div>
             <!-- row -->
         <div class="container" style="padding: 1rem">
                <div class="bg-white tm-block col-12" style="width: 20vw;border: 2px solid skyblue;position: fixed;height: 85%;padding-bottom: 20px;padding-top: 20px;" >
                <!-- 아이디 정보 -->
               <div>
                <table class ="table table-hover">
                <tr><td>${ adminid }님, 환영합니다 !</td></tr>
                <tr><td>현재 권한</td><tr>
                <tr><td style="font-size: 11px;">${permission}</td></tr>
                </table>
                </div>
                <!-- 공지사항 정보 로드 -->
                <div>
                <table class="table table-hover">
                <tbody id ="recentNotice">
                
                </tbody>
                </table>
                </div>
                </div>
                <div class="bg-white tm-block col-12" style="overflow:scroll;margin-left: 21vw;width: 62vw;position: fixed;height: 85%">
                    <div class="col-12">
                         <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex" style=" margin-left :65% ;height:  40px; text-align: right; width: 100%;" > 
             <ol class="breadcrumb"style="width: 95%;background-color: transparent ; padding-top: 0px; " >
             <li class="breadcrumb-item">
             공지사항 관리
             </li>
             <li class="breadcrumb-item active">
             공지사항 작성</li></ol>
             </div>
    <form id ="frm" action="notification_write_form_process.do" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
  						 <label for="exampleFormControlTextarea1" class="form-label">공지사항 제목</label>
    <div class="mb-3">
      <input type="email" class="form-control" id="exampleFormControlInput1" name="title">
    </div>
					</div>
                    <div class="mb-3">
  						 <label for="exampleFormControlTextarea1" class="form-label">공지사항 글 번호</label>
    <div class="mb-3">
      <input type="email" class="form-control" value="${requestScope.noti_no }" id="exampleFormControlInput1" name="noti_no" readonly="readonly">
    </div>
					</div>
					<div class="mb-3">
 				<label for="exampleFormControlTextarea1" class="form-label">공지사항 이미지</label>
				 <input class="form-control" type="file" id="image" name="image" onchange="readURL(this);"/>	
				 <div style="text-align: center; height: 300px;">
				<img id="preview" class="card-img-top" style="width: 300px; height: auto;"/>	
				 </div>
					<div class="mb-3">
					</div>
 						 <label for="exampleFormControlTextarea1" class="form-label">공지사항 내용</label>
  						<textarea class="form-control h-25" id="exampleFormControlTextarea1" rows="15" name ="content"></textarea>
</div>
<div style="text-align: center;">
<input type="button" class="btn btn-link" value="작성" id ="btnwrite"/>
<input type="button" class="btn btn-link" value="취소" id ="btnback"/>
</div>
    </form>
                        </div>
                    </div>
                </div>
            </div>
 <script type="text/javascript" src="<c:url value ="/resources/js/jquery-3.3.1.min.js"/>"></script>
  <!-- https://jquery.com/download/ -->
   <script type="text/javascript" src="<c:url value ="/resources/js/bootstrap.min.js"/>"></script>
  <script type="text/javascript">
  $(function(){
	  var adminId = '<%= session.getAttribute("adminid") %>';
      
      if (adminId == '' || adminId == 'null') {
          location.href = 'http://localhost/all_about_knowledge/admin_index.do';
      }
	  $.ajax({
			url: "manage_notifi_recent.do",
	        type: "GET",
	        dataType: "JSON",
	        error: function(xhr) {
	            console.log(xhr.status + " : " + xhr.statusText);
	            alert("서버 오류 발생");
	        },
	        success: function(jsonObj){
	        	$("#recentNotice").empty();
	        		var output="<tr><td>공지사항 제목</td><td>"+jsonObj.title+"</td></tr>";
	        		output+="<tr><td>공지사항 작성ID</td><td>"+jsonObj.id+"</td></tr>";
	        		output+="<tr><td>공지사항 내용</td><td>"+jsonObj.content+"</td></tr>";
	        		output+="<tr><td>공지사항 작성날짜</td><td>"+jsonObj.write_date+"</td></tr>";
	        	$("#recentNotice").html(output);
	        	
	        }
	        });
		
	  
	  
	  
	  $("#btnback").click(function(){
		  history.back();
	  })
  $("#btnwrite").click(function(){
	  $("body").addClass("cursor");
			// 이미지만 업로드하도록 설정
			var file = $("#image").val();
			var selectedExt = file.substring(file.lastIndexOf(".")+1);

			var extArr = ["png", "jpg", "gif", "jpeg", "bmp"];
			var flag = false;

			for(var i = 0; i < extArr.length; i++) {
			if(selectedExt == extArr[i]) {
			flag = true;
			break;
			} // end if
			} // end for

			if(!flag) {
			alert(selectedExt + "는 업로드 가능한 파일의 확장자가 아닙니다.");
			return;
			} // end if
			
			$("#frm").submit();
			 $("#btnwrite").attr("disabled", true);
			}); // click
  })
  function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      document.getElementById('preview').src = e.target.result;
    };
    reader.readAsDataURL(input.files[0]);
  } else {
    document.getElementById('preview').src = "";
  }
}
  </script>
    <!-- https://getbootstrap.com/ -->
</body>

</html>