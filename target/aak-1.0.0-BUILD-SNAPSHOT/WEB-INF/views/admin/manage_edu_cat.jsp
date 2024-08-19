<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<style>
.main{font-size: 12px;}
.align{
vertical-align: middle;
}
.side{
font-size: 11px;
text-align: center;
}
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
                                <li class="nav-item dropdown   active">
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
                <hr  class="border border-primary border-1 opacity-50">
                <div>
                <table class ="table table-hover side">
                <tbody id ="catSubCnt">
                <tr><td colspan="2">각 상위카테고리 조회시 <br>각 카테고리에 속하는 과목수가 보여집니다.</td></tr>
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
             교육과목 관리
             </li>
             <li class="breadcrumb-item active">
             교육 카테고리 리스트</li></ol>
             </div>
                            	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
</div>	
                    <div style="text-align: center;margin: auto;" >
                    <!-- <select class="form-select form-select-lg mb-3" aria-label="Large select example" >
                    --> <label>상위 교육 카테고리 명  </label>
                   <!--  </select> -->
                    <input type="button" class="btn btn-outline-primary btn-sm" value="조회" id ="catbtn"/>
                    <a href ="manage_edu_cat_add.do"><input type="button" class="btn btn-outline-primary btn-sm" value="상위 카테고리 추가" id ="catbtnAdd"/></a>
                    <div id ="educatOutput"  style="text-align: center;margin: auto;">
                    </div>
                    </div>
                  <!--   <div id ="edusubOutput" style="text-align: center;margin: auto;"></div> -->
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
         
                
                 $.ajax({
                     url: "manage_edu_cat_list.do",
                     type: "GET",
                     dataType: "JSON",
                     error: function(xhr) {
                         console.log(xhr.status + " : " + xhr.statusText);
                         alert("서버 오류 발생");
                     },
                     success: function(jsonObj) {
                         var output = "<table class='table table-hover align main' style='margin: auto; text-align: center;'>";
                        
                         $.each(jsonObj.list, function(i, jsonTemp) {
                             var outputId = 'edusubOutput' + i;
                             output += "<tr><td style='vertical-align: middle;'>" + jsonTemp.cat_name + "</td>";
                             output += "<td class='align'><input type='button' class='btn btn-outline-primary btn-sm' value='조회' onclick='searchSubcat(\"" + jsonTemp.cat_code + "\", \"" + outputId + "\")'/></td></tr>";
                             output += "<tr><td colspan='2'><div id='" + outputId + "' style='display: none;'></div></td></tr>";
                         });
                         output += "</table>";
                         $("#educatOutput").html(output).show(); // 카테고리 정보를 표시하고 출력
                     }
                 }); // ajax
           /*   }); // click */

             // 접기 버튼 이벤트 리스너 추가
             $(document).on("click", "[id^=btnfold1_]", function(){
                 var id = $(this).attr('id').replace('btnfold1_', '');
                 $("#edusubOutput" + id).toggle();
             });
       
        $("#catbtnAdd").click(function(){
        	
        })
        
        
        });

         function searchSubcat(cat_code, outputId) {
        	 var cat_code =cat_code;
             $.ajax({
                 url: "manage_edu_subcat_list.do",
                 type: "GET",
                 dataType: "JSON",
                 data: { cat_code: cat_code },
                 error: function(xhr) {
                     console.log(xhr.status + " : " + xhr.statusText);
                     alert("서버 오류 발생");
                 },
                 success: function(jsonObj) {
                     var output = "<table class='table table-hover' style='margin: auto; width:70%;text-align:center;'>"
                    	 +"<tr><td class='align' style='vertical-align: middle;'>하위 교육 카테고리</td>"
                     +"<td  clss='align'><a href='manage_edu_cat_add.do?prime_cat_code="+cat_code+"'><input type ='button' class = 'btn btn-outline-primary btn-sm' value ='추가'/></a></td></tr>";
                     $.each(jsonObj.list, function(i, jsonTemp) {
                         output += "<tr><td  clss='align'>" + jsonTemp.cat_name + "</td></tr>";
                     });
                     output += "<tr><td class='align' style ='text-align:right;'><input type='button' class='btn btn-link btn-sm' value='접기' id='btnfold2_" + outputId + "'/></td><tr>"
                    +"</table>"
                     
                     $("#" + outputId).html(output).show(); // 데이터를 불러온 후에 표시

                     // 동적으로 생성된 접기 버튼 이벤트 리스너 추가
                     $("#btnfold2_" + outputId).on("click", function() {
                         $("#" + outputId).toggle();
                     });
                 }
             });
             $.ajax({
                 url: "manage_edu_cat_subCnt.do",
                 type: "GET",
                 dataType: "JSON",
                 data:{ prime_cat_code: cat_code },
                 error: function(xhr) {
                     console.log(xhr.status + " : " + xhr.statusText);
                     alert("서버 오류 발생");
                 },
                 success: function(jsonObj) {
                    $("#catSubCnt").empty();
                	 var output = "<tr><td colspan='2'>상위 카테고리별 과목 수</td></tr>";
                    	if(jsonObj.flag){
                         output += "<tr><td>카테고리 명</td><td>" + jsonObj.prime_cat_code + "</td></tr>";
                         output += "<tr><td>과목 수</td><td>"+jsonObj.subject_count+"</td></tr>";
                    	}else{
                         output += "<tr><td colspan ='2'>해당하는 상위 카테고리 내 하위 카테고리가 없어<br/>정보 조회에 실패했습니다.</td></tr>";
                    		
                    	}
                         
                    
                     $("#catSubCnt").html(output); // 카테고리 정보를 표시하고 출력
                 }
             }); // ajax
         }
               
    </script>
</body>

</html>