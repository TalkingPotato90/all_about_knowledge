<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<style>
th,td,tr{font-size: 13px;}
a {text-decoration: none;}
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
                <div>
                <table class ="table table-hover">
                <tr><td>${ adminid }님, 환영합니다 !</td></tr>
                <tr><td>현재 권한</td><tr>
                <tr><td style="font-size: 11px;">${permission}</td></tr>
                </table>
                </div>
                </div>
                <div class="bg-white tm-block col-12" style="overflow:scroll;margin-left: 21vw;width: 62vw;position: fixed;height: 85%">
                    <div class="col-12">
                        <div class="col-12">
                        <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex" style=" margin-left :65% ;height:  40px; text-align: right; width: 100%;" > 
             <ol class="breadcrumb"style="width: 95%;background-color: transparent ; padding-top: 0px; " >
             <li class="breadcrumb-item">
             공지사항 관리
             </li>
             <li class="breadcrumb-item active">
             공지사항 수정 완료</li></ol>
             </div>
                    <div class="mb-3">
  						 <label for="exampleFormControlTextarea1" class="form-label">공지사항 제목</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${nmd.title }">
    </div>
					</div>
					<div class="mb-3">
					<label for="exampleFormControlTextarea1" class="form-label">공지사항 이미지</label>
					<div class="card" style="width: 200px;height: 200px; margin: auto; margin-bottom: 50px; margin-top: 50px;">
                            <img src="http://localhost/all_about_knowledge/upload/${ nmd.image }"  class="card-img-top" alt="...">
                            </div>
					</div>
					<div class="mb-3">
 						 <label for="exampleFormControlTextarea1" class="form-label">공지사항 내용</label>
  						<textarea class="form-control h-25" id="exampleFormControlTextarea1" rows="15"><c:out value="${ nmd.content }"/> </textarea>
</div>
<div>
<div style="width: 400px; float: left; padding-left: 200px">
<a href="manage_notification.do" ><input type="button" class="btn btn-link" value="&lt; 뒤로" id ="btnback"/></a> 
</div>
<div style="text-align:right; padding-right: 200px;">
<a href ="manage_notifi_notify.do?noti_no=${nmd.noti_no }"><input type="button" class="btn btn-light btn-sm" value="공지사항 수정" id ="btnModify"/></a>
</div>
</div>
           </div>
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
	  $("#btnback").click(function(){
		  history.back();
	  })
	  $("#btnModify").click(function(){
		  history.back();
	  })
	  
  })
  </script>
    <!-- https://getbootstrap.com/ -->
</body>

</html>