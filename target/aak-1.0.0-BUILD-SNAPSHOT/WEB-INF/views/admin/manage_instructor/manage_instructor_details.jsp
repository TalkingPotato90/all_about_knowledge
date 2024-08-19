<%@page import="kr.co.sist.aak.domain.admin.InstructorManagementDomain"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<style>
th,td,tr{font-size: 12px; text-align: center;}

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
.tablefont{
font-size: 11px;
text-align: center;
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
                                    <a class="nav-link" href="manage_memberlist.do">
                                        회원 관리
                                    </a>
                                </li>
                                    </c:if>
                                <c:if test="${sessionScope.adminPermission.instructor_management == 'Y'}">
                                <li class="nav-item   active" >
                                    <a class="nav-link " href="manage_instructor.do">강사 관리
                                        </a>
                                </li>
                                        </c:if>
                                  <c:if test="${sessionScope.adminPermission.qna_management == 'Y'}">
                                <li class="nav-item ">
                                    
                                    <a class="nav-link " href="manage_qna.do">문의 관리</a>
                                </li>
                                    </c:if>
                                  <c:if test="${sessionScope.adminPermission.notice_management == 'Y'}">
                                <li class="nav-item ">
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
                <!-- 해당 강사가 진행하는 강의 제목  -->
                <div>
    <table class="table table-hover tablefont">
        <tbody id="subTitle">
            <tr><td>이 강사가 진행중인 강의</td></tr>
            <c:if test="${empty lectures}">
                <tr><td>해당 강사의 강의가 존재하지 않습니다.</td></tr>
            </c:if>
            <c:forEach var="lecture" items="${lectures}">
                <c:if test="${lecture != null}">
                    <tr><td><c:out value="${lecture}" /></td></tr>
                </c:if>
                <c:if test="${lecture == null}">
                    <tr><td>해당 강사의 강의가 존재하지 않습니다.</td></tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>
</div>
                </div>
                <div class="bg-white tm-block col-12" style="overflow:scroll;margin-left: 21vw;width: 62vw;position: fixed;height: 85%">
                    <div class="col-12">
                        <div class="col-12">
                         <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex" style=" margin-left :65% ;height:  40px; text-align: right; width: 100%;" > 
             <ol class="breadcrumb"style="width: 95%;background-color: transparent ; padding-top: 0px; " >
             <li class="breadcrumb-item">
             강사 관리
             </li>
             <li class="breadcrumb-item active">
             강사 상세</li></ol>
             </div>
             <div style="text-align: center; margin-top: 50px;" >
                            <h2 class="tm-block-title d-inline-block">강사 상세</h2>
             </div>
                            <div style="text-align: center; margin: auto;">
                            <div class="card" style="width: 200px;height: 200px; margin: auto; margin-bottom: 50px; margin-top: 50px;">
                            <img src="http://localhost/all_about_knowledge/upload/${ imd.image }"  class="card-img-top" alt="...">
                            </div>
                            </div>
                            <div>
                            <table class="table table-hover">
                            <tr>
                            <td>이름</td>
                            <td><c:out value="${ imd.name }"/> </td>
                            </tr>
                            <tr>
                            <td>강사아이디</td>
                            <td><c:out value="${ imd.inst_id }"/></td>
                            </tr>
                            <tr>
                            <td>자기소개</td>
                            <td><c:out value="${ imd.introduction }"/></td>
                            </tr>
                            <tr>
                            <td>연락처</td>
                            <td><c:out value="${ imd.phone }"/></td>
                            </tr>
                            <tr>
                            <td>이메일</td>
                            <td><c:out value="${ imd.email }"/></td>
                            </tr>
                            <tr>
                            <td>강사 학력사항</td>
                            <td><c:out value="${ imd.education }"/></td>
                            </tr>
                            <tr>
                            <td>주력 과목</td>
                            <td><c:out value="${ imd.major_subject }"/></td>
                            </tr>
                            
                            </table>
                            </div>
                            <div>
<div style="text-align:left: ;float: left; padding-left: 250px;">
<a href ="manage_instructor_modify.do?inst_id=${imd.inst_id }"><input type="button" class="btn btn-light btn-sm" value="강사 정보 수정" id ="btnModify"/></a>
</div>
<div style=" text-align: right; padding-right: 250px;">
<form action="manage_instructor_delete.do?noti_no=${imd.inst_id }" id ="deleteFrm">
<input type="hidden" value="${imd.inst_id}" name ="inst_id"/>
<input type="button" class="btn btn-light btn-sm" value="강사 정보 삭제" id ="btnDelete"/>
</form>
</div>
<div style="width: 100px; float: left;">
<input type="button" class="btn btn-link" value="&lt; 뒤로" id ="btnback"/>
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
	  $("#btnDelete").click(function(){
		  if (confirm('정말로 삭제하시겠습니까?')) {
		        $("#deleteFrm").submit();
		    }
	  })
	  
  })
  </script>
    <!-- https://getbootstrap.com/ -->
</body>

</html>