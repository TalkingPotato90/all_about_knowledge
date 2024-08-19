<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<style>
th{font-weight: normal;font-size: 13px;}
tr{vertical-align: middle;}
td{vertical-align: middle; font-size: 13px;}
.permission{
text-align: center;
}
.tbl{

}
input[type="checkbox"]{
zoom:0.6;
      }

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
    <!-- https://fullcalendar.io/ -->
     <link rel="stylesheet" href="http://localhost/all_about_knowledge/front/admin/css/family.css">
    <!-- https://fonts.google.com/specimen/Open+Sans -->
    <link rel="stylesheet" href="http://localhost/all_about_knowledge/front/admin/css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="http://localhost/all_about_knowledge/front/admin/css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="http://localhost/all_about_knowledge/front/admin/css/tooplate.css">

</head>

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
                                <li class="nav-item dropdown   ">
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
                                <li class="nav-item">
                                    <a class="nav-link" href="manage_memberlist.do">
                                        회원 관리
                                    </a>
                                </li>
                                </c:if>
                                  <c:if test="${sessionScope.adminPermission.instructor_management == 'Y'}">
                                <li class="nav-item " >
                                    <a class="nav-link" href="manage_instructor.do">강사 관리
                                        </a>
                                </li>
                                </c:if>
	 <c:if test="${sessionScope.adminPermission.qna_management == 'Y'}">
                                <li class="nav-item">
                                    <a class="nav-link" href="manage_qna.do">문의 관리</a>
                                </li>
                                </c:if>
       <c:if test="${sessionScope.adminPermission.notice_management == 'Y'}">
                                <li class="nav-item">
                                    <a class="nav-link " href="manage_notification.do">
                                        공지사항 관리
                                    </a>
                                </li>
                                </c:if>
                                <c:if test="${sessionScope.auth == 'SUPER'}">
                                <li class="nav-item active">
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
                <div class="bg-white tm-block col-12"  style=" text-align: center ;margin-left:5px; overflow:scroll;width: 75vw;position: fixed;height: 85%">
                    <div class="col-12">
                        <div class="col-12">
                        <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex" style=" margin-left :65% ;height:  40px; text-align: right; width: 100%;" > 
             <!-- <ol class="breadcrumb"style="width: 95%;background-color: transparent ; padding-top: 0px; " >
             <li class="breadcrumb-item">
             교육과목 관리
             </li>
             <li class="breadcrumb-item active">
             교육 카테고리 리스트</li></ol> -->
             </div>
               <div class="d-grid gap-2 d-md-flex justify-content-md-end">
</div>	
                    <div style="text-align: center;margin: auto;width: 75%"  >
                    <div style="text-align: right;">
                    <br>
                    <input type="button" class="btn-light" id ="btnunfold" value="관리자 추가"/>
                    <br>
                    <br>
                    </div>
                    <div>
                    <table class="table table-hover" >
                    <thead>
                    <tr>
                    <th>관리자 아이디</th>
           	 		<th>교육과목</th>
            		<th>강사</th>
            		<th>문의</th>
            		<th>회원</th>
            		<th>공지사항</th>
            		<th>수정</th>
                    </tr>
                    </thead>
                    <tbody id ="adminList">
                    <c:forEach var="list" items="${ list }" varStatus="i">
                    <tr><td>${list.id }</td>
                    <td>
                    <input type="checkbox" id="category_management_${list.id}" value="Y" <c:if test="${list.category_management == 'Y'}">checked</c:if>> Y
                </td>
                <td>
                    <input type="checkbox" id="instructor_management_${list.id}" value="Y" <c:if test="${list.instructor_management == 'Y'}">checked</c:if>> Y
                </td>
                <td>
                    <input type="checkbox" id="qna_management_${list.id}" value="Y" <c:if test="${list.qna_management == 'Y'}">checked</c:if>> Y
                </td>
                <td>
                    <input type="checkbox" id="member_management_${list.id}" value="Y" <c:if test="${list.member_management == 'Y'}">checked</c:if>> Y
                </td>
                <td>
                    <input type="checkbox" id="notice_management_${list.id}" value="Y" <c:if test="${list.notice_management == 'Y'}">checked</c:if>> Y
                </td>
                <td><input type="button" value="수정" onclick="modify('${list.id}"/>
                </td> 
                </tr>
                    </c:forEach>
                    </tbody>
                    </table>
                    </div>
                    <div id ="adminAdd" style="display: none;" class="tab"> 
                    관리자 추가
                    <br>
                    <br>
                    <table class="table table-hover" >
                    <tr><td>관리자 아이디</td><td><input type="text" name ="id"/></td></tr>
                    <tr><td>비밀번호</td><td><input type="password" name ="password"/></td></tr>
                    </table>
                    <br>
                    <br>
                    <br>
                    <table class="table table-hover" >
                    <tr><td>교육과목</td><td><input type="checkbox" name="category_management" value="Y"/></td></tr>
                    <tr><td>강사</td><td><input type="checkbox" name="instructor_management" value="Y"/></td></tr>
                    <tr><td>문의</td><td><input type="checkbox" name="qna_management" value="Y"/></td></tr>
                    <tr><td>회원</td><td><input type="checkbox" name="member_management" value="Y"/></td></tr>
                    <tr><td>공지사항</td><td><input type="checkbox" name="notice_management" value="Y"/></td></tr>
                    </table>
                    <input type="button" class="btn-light" id ="btnAdd" value="정보 추가"/>
                    <input type="button" class="btn-light" id ="btnfold" value="접기"/>
                    </div>
                    
                    </div>
                        </div>
                    </div>
                </div>
            </div>
          
 </div>

 <script type="text/javascript" src="<c:url value ="/resources/js/jquery-3.3.1.min.js"/>"></script>
 <script type="text/javascript" src="<c:url value ="/resources/js/bootstrap.min.js"/>"></script>
  <script type="text/javascript">
        $(function() {
        	var adminId = '<%= session.getAttribute("adminid") %>';
            
            if (adminId == '' || adminId == 'null') {
                location.href = 'http://localhost/all_about_knowledge/admin_index.do';
            }
        	 const tab=document.querySelector('.tab');
         $("#btnunfold").click(function(){
        	 tab.style.display = 'block';
         })
         $("#btnfold").click(function(){
        	 tab.style.display = 'none';
         })
         $("#btnAdd").click(function(){
        let data = {
            id: $('input[name="id"]').val(),
            password: $('input[name="password"]').val(),
            category_management: $('input[name="category_management"]:checked').val() || 'N',
            instructor_management: $('input[name="instructor_management"]:checked').val() || 'N',
            qna_management: $('input[name="qna_management"]:checked').val() || 'N',
            member_management: $('input[name="member_management"]:checked').val() || 'N',
            notice_management: $('input[name="notice_management"]:checked').val() || 'N'
        };

        $.ajax({
            type: "POST",
            url: "manage_adminadd.do",
            data: data,
            success: function(response) {
                alert("관리자가 성공적으로 추가되었습니다.");
                $('input[name="id"]').val('');
                $('input[name="password"]').val('');
                $('input[name="category_management"]').prop('checked', false);
                $('input[name="instructor_management"]').prop('checked', false);
                $('input[name="qna_management"]').prop('checked', false);
                $('input[name="member_management"]').prop('checked', false);
                $('input[name="notice_management"]').prop('checked', false);
        	 	tab.style.display = 'none';
        	 	refreshAdminList();
           
            },
            error: function(xhr, status, error) {
                alert("관리자 추가 중 오류가 발생했습니다.");
            }
        });
    });
         function refreshAdminList() {
             $.ajax({
                 type: "GET",
                 url: "manage_adminadd.do",
                 success: function(data) {
                     var adminList = $("#adminList");
                     adminList.empty(); 
                     var row ='';
                     data.forEach(function(admin, i) {
                         row += '<form id="frm' + i + '" method="post" action="modify_admin.do">';
                         row += '<tr>';
                         row += '<td>' + admin.id + '</td>';
                         row += '<td>';
                         row += '<input type="checkbox" id="category_management_' + admin.id + '" value="Y"' + (admin.category_management == 'Y' ? ' checked' : '') + '> Y';
                         row += '</td>';
                         row += '<td>';
                         row += '<input type="checkbox" id="instructor_management_' + admin.id + '" value="Y"' + (admin.instructor_management == 'Y' ? ' checked' : '') + '> Y';
                         row += '</td>';
                         row += '<td>';
                         row += '<input type="checkbox" id="qna_management_' + admin.id + '" value="Y"' + (admin.qna_management == 'Y' ? ' checked' : '') + '> Y';
                         row += '</td>';
                         row += '<td>';
                         row += '<input type="checkbox" id="member_management_' + admin.id + '" value="Y"' + (admin.member_management == 'Y' ? ' checked' : '') + '> Y';
                         row += '</td>';
                         row += '<td>';
                         row += '<input type="checkbox" id="notice_management_' + admin.id + '" value="Y"' + (admin.notice_management == 'Y' ? ' checked' : '') + '> Y';
                         row += '</td>';
                         row += '<td><input type="button" value="수정" onclick="modify(\'' + admin.id +'\')"/></td>';
                         row += '</tr>';
                         row += '</form>';
                     });
                         adminList.html(row);
                 },
                 error: function(xhr, status, error) {
                     alert("관리자 리스트를 가져오는 중 오류가 발생했습니다.");
                 }
             });
             
         }
         refreshAdminList();
     });
        function modify(id,i){
        	var id=id;
        	let data = {
        	        id: id,
        	        category_management: $('#category_management_' + id).is(':checked') ? 'Y' : 'N',
        	        instructor_management: $('#instructor_management_' + id).is(':checked') ? 'Y' : 'N',
        	        qna_management: $('#qna_management_' + id).is(':checked') ? 'Y' : 'N',
        	        member_management: $('#member_management_' + id).is(':checked') ? 'Y' : 'N',
        	        notice_management: $('#notice_management_' + id).is(':checked') ? 'Y' : 'N'
        	    };
        	        $.ajax({
        	            type: "POST",
        	            url: "manage_modify.do",
        	            data: data,
        	            success: function(response) {
        	                alert("관리자 권한이 성공적으로 변경되었습니다.");
        	        	 	refreshAdminList();
        	            },
        	            error: function(xhr, status, error) {
        	                alert("관리자 추가 중 오류가 발생했습니다.");
        	            }
        });
        }
        
    </script>
</body>

</html>