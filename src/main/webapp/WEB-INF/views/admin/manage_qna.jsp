<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

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


<style>
	.right {
  		 text-align: right;
		}
		
	.custom-font-size {
   		font-size: 12px;
	}
	
</style>


</head>

<body id="reportsPage">
    <div class="" id="home">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="navbar navbar-expand-xl navbar-light bg-light">
                        <a class="navbar-brand" href="adminindex.do">
                            <i class="fas fa-3x fa-tachometer-alt tm-site-icon"></i>
                            <h1 class="tm-site-title mb-0">All About Knowledge</h1>
                        </a>
                        <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mx-auto">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#void" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">교육과목관리
                                        
                                    </a>
                                     <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="manage_edu_cat.do">교육카테고리리스트</a>
                                        <a class="dropdown-item" href="manage_lecture.do">강의신청리스트</a>
                                    </div>
                                </li>
                                <li class="nav-item " >
                                    <a class="nav-link " href="manage_memberlist.do">회원 관리
                                        </a>
                                </li>
                                <li class="nav-item " >
                                    <a class="nav-link " href="manage_instructor.do">강사 관리
                                        </a>
                                </li>
								
                                <li class="nav-item active">
                                    <a class="nav-link " href="manage_qna.do" >문의 관리
                                    </a>
                                    
                                </li>
                                <li class="nav-item ">
                                    <a class="nav-link " href="manage_notification.do">
                                        공지사항 관리
                                    </a>
                                </li>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link d-flex" href="admin_index.do">
                                        <i class="far fa-user mr-2 tm-logout-icon"></i>
                                        <span>Logout</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
             <!-- row -->
          <div class="container" style="padding: 1rem">
            
               <div class="bg-white tm-block col-12" style="width: 20%;border: 2px solid skyblue;position: fixed;height: 85%;padding-bottom: 20px;padding-top: 20px;" ></div>
                <div class="bg-white tm-block col-12" style="  margin-left: 25%; width:auto" >
              
                       <div class="col-12">
          <div class="col-12">
          
                    <table class="table table-hover"  style="width: 100%;margin: auto; text-align: center;">
                   
                    <thead>
                    <tr>
                    <th class="custom-font-size">NO</th>
                    <th class="custom-font-size">문의 제목</th>
                    <th class="custom-font-size">아이디</th>
                    <th class="custom-font-size">문의 날짜</th>
                    <th class="custom-font-size">상태</th>
                    </tr>
                    </thead>
                 
                  
                    <tbody>
                    <c:forEach var="qmd" items="${requestScope.qnaList }" varStatus="i">
                    <tr>
                    <td class="custom-font-size"><c:out value="${qmd.qna_no}"/></td>
                    <td class="custom-font-size"><a href="manage_qna_details.do?qna_no=${qmd.qna_no}&status=${qmd.status}"><c:out value="${qmd.title }"/></td>                 
                    <td class="custom-font-size"><c:out value="${qmd.std_id }"/></a></td>             
                    <td class="custom-font-size"><c:out value="${qmd.q_date}"/></td>
                    <td class="custom-font-size"> 
                    <c:choose>
       				 <c:when test="${qmd.status == 'N'}">미확인</c:when>
       				 <c:when test="${qmd.status == 'Y'}">확인</c:when>
       				 <c:when test="${qmd.status == 'D'}">삭제</c:when>
           		 	</c:choose>
           		 	</td>
                    </tr>
                    </c:forEach>
                    </tbody>
                
                    </table>
                    
                    
                </div>
         
           
    </div>
        <footer class="row tm-mt-small">
         
        </footer>
        </div>
        </div>
    </div>
     <script type="text/javascript" src="<c:url value ="/resources/js/jquery-3.3.1.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value ="/resources/js/bootstrap.min.js"/>"></script>
	</div>
</body>
                  

</html>