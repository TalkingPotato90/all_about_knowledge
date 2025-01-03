<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<style>
th,td,tr{font-size: 12px; text-align: center;}
#myChart{
width: 15vw;height: auto;
}
.myChart{
width: 15vw;height: auto;
}
</style>


<style>
        .notification-dot {
            display: inline-block;
            width: 10px;
            height: 10px;
            background-color: blue;
            border-radius: 50%;
            position: absolute;
            top: -5px;
            right: -5px;
        }
        .notification-container {
            position: relative;
        }
        .blinking {
            animation: blinking 1s infinite;
        }
        @keyframes blinking {
            0% { opacity: 1; }
            50% { opacity: 0; }
            100% { opacity: 1; }
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
    <link rel="stylesheet" href="http://localhost:8080/all_about_knowledge/front/admin/css/fullcalendar.min.css">
    <!-- https://fullcalendar.io/ -->
     <link rel="stylesheet" href="http://localhost:8080/all_about_knowledge/front/admin/css/family.css">
    <!-- https://fonts.google.com/specimen/Open+Sans -->
    <link rel="stylesheet" href="http://localhost:8080/all_about_knowledge/front/admin/css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="http://localhost:8080/all_about_knowledge/front/admin/css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="http://localhost:8080/all_about_knowledge/front/admin/css/tooplate.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	
<script type ="text/javascript">
function validateForm() {
    let isValid = true;
    let errorMessage = '';

    const name = document.querySelector('input[name="name"]').value.trim();
    const tel = document.querySelector('input[name="tel"]').value.trim();
    const email = document.querySelector('input[name="email"]').value.trim();
    const birth = document.querySelector('input[name="birth"]').value.trim();

    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (name === '') {
        isValid = false;
        errorMessage += '이름을 입력해주세요.\n';
    }
    if (tel === '') {
        isValid = false;
        errorMessage += '연락처를 입력해주세요.\n';
    }
    if (email === '') {
        isValid = false;
        errorMessage += '이메일을 입력해주세요.\n';
    } else if (!emailPattern.test(email)) {
        isValid = false;
        errorMessage += '올바른 이메일 형식으로 입력해주세요.\n';
    }
    if (birth === '') {
        isValid = false;
        errorMessage += '생년월일을 입력해주세요.\n';
    }

    if (!isValid) {
        alert(errorMessage);
    }

    return isValid;
}




<!-- -----알람 메소드------ -->
$(document).ready(function() {
	
	var adminId = '<%= session.getAttribute("adminid") %>';
    
    if (adminId == '' || adminId == 'null') {
        location.href = 'http://localhost:8080/all_about_knowledge/admin_index.do';
    }
	
	
    let previousQnaCount = null;
    let fetchCount = 0; // 요청 횟수를 추적하는 변수
    const maxFetchCount = 10; // 최대 요청 횟수

    function fetchQnaCounts() {
        if (fetchCount >= maxFetchCount) {
            clearInterval(fetchInterval); // 최대 요청 횟수에 도달하면 간격 타이머를 중지
            return;
        }
        $.ajax({
            url: "manage_qna_new.do",
            type: "GET",
            dataType: "json",
            error: function(xhr, status, error) {
                console.error('AJAX request failed:', xhr.status, xhr.responseText);
            },
            success: function(jsonObj) {
                console.log('AJAX request succeeded:', jsonObj); // 응답 내용을 로그에 출력
                $("#newQna").empty();
                if (jsonObj.cnt !== undefined) { // 응답이 유효한지 확인
                    var output = "<tr><td>오늘의 문의: " + jsonObj.cnt + "</td></tr>"; 
                    $("#newQna").html(output);
                    
                    // 이전 데이터와 비교하여 알림 표시
                    if (previousQnaCount !== null && previousQnaCount !== jsonObj.cnt) {
                        showNotification();
                    }
                    previousQnaCount = jsonObj.cnt; // 이전 데이터를 현재 데이터로 갱신
                } else {
                    console.error('Invalid JSON response');
                }
                fetchCount++; // 요청 횟수 증가
            }
        });
    }

    function showNotification() {
        let notificationDot = $('<div class="notification-dot blinking"></div>');
        $("#newQna").append(notificationDot);
        setTimeout(function() {
            notificationDot.remove();
        }, 5000); // 5초 후에 알림 제거
    }

    // 초기 데이터 로드
    fetchQnaCounts();

    // (60초)마다 데이터 갱신
    const fetchInterval = setInterval(fetchQnaCounts, 60000);
});


$(function(){
	 $.ajax({
	        url: "manage_member_pre.do",
	        type: "GET",
	        dataType: "json",
	        error: function(xhr, status, error) {
	            console.error('AJAX request failed:', xhr.status, xhr.responseText);
	        },
	        success: function(jsonObj) {
	            console.log('AJAX request succeeded:', jsonObj); // 응답 내용을 로그에 출력
	            $("#preMember").empty();
	            if (jsonObj && jsonObj.p !== undefined && jsonObj.n !== undefined) { // 응답이 유효한지 확인
	                var output = "<tr><td>현재 회원 수: " + jsonObj.p + "</td></tr>";
	                output += "<tr><td>탈퇴 한 회원 수: " + jsonObj.n + "</td></tr>";
	                $("#preMember").html(output);
	            } else {
	                console.error('Invalid JSON response');
	            }
	        }
	    }); 
});


	 $(document).ready(function(){
         $("#updateSubmit").click(function(){
             $("#frmGet").attr("action", "manage_member_details.do");
             $("#frmGet").submit();
         });


         
         $("#saveSubmit").click(function(){
        	 if (validateForm()) {
        		 if(!confirm("변경내용을 저장 하시겠습니까?")){
         	    
         		}else{
            	 $("#frmGet").attr("action", "manage_member_modyify.do");
            	 $("#frmGet").submit();
         	    
         		}
        	 }
         });

         var cnt = "${cnt}";
         if (cnt == 1) {
             alert("수정 완료");
             location.href="manage_member_details.do?std_id=${std_id}&flag=0";
         }else if(cnt == 2){
        	 alert("입력하지 않은 값이 있습니다.")
        	 location.href="manage_member_details.do?std_id=${std_id}&flag=0";
         }else if(cnt == 3){
        	 alert("이메일 형식이 아닙니다.")
        	 location.href="manage_member_details.do?std_id=${std_id}&flag=0";
         }
         
  
         $("#back").click(function(){
		
        	 location.href="manage_memberlist.do";

         });

     });

	 function validateInput(event) {
         const charCode = event.which ? event.which : event.keyCode;
         const charStr = String.fromCharCode(charCode);
         // 정규 표현식을 사용하여 문자만 허용
         if (!/^[a-zA-Z]*$/.test(charStr)) {
             event.preventDefault();
         }
     }
	 
	 function formatTelInput(event) {
         const input = event.target;
         let value = input.value.replace(/[^0-9]/g, ''); // 숫자 이외의 문자 제거

         // 최대 11자리까지만 입력 허용
         if (value.length > 11) {
             value = value.substring(0, 11);
         }

         // 3번째 자리와 이후 4번째 자리마다 '-' 추가
         if (value.length > 3) {
             value = value.substring(0, 3) + '-' + value.substring(3);
         }
         if (value.length > 8) {
             value = value.substring(0, 8) + '-' + value.substring(8);
         }

         input.value = value;
     }
	 function validateEmail(event) {
	        const emailInput = event.target;
	        const emailValue = emailInput.value;
	        const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
	        const emailError = document.getElementById('emailError');
	        if (!emailPattern.test(emailValue)) {
	            emailError.style.display = 'inline';
	        } else {
	            emailError.style.display = 'none';
	        }
	    }
	 function validateNameLength(event) {
	        if (event.target.value.length > 10) {
	            event.target.value = event.target.value.substring(0, 10);
	        }
	    }
	 
</script>





<body id="reportsPage">
    <div class="" id="home">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="navbar navbar-expand-xl navbar-light bg-light">
                        <a class="navbar-brand" href="admin_main.do">
                            <h2 class="tm-site-title mb-0">All About Knowledge</h2>
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
                             <li class="nav-item active " >
                                    <a class="nav-link " href="manage_memberlist.do">회원 관리
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
                                
                                <li class="nav-item">
                                    <a class="nav-link " href="manage_qna.do" >문의 관리
                                    </a>
                                    
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
                <!-- 아이디 정보 -->
                <div>
                <!-- 아이디 권한 정보  -->
                <table class ="table table-hover">
                <tr><td>${ adminid }님, 환영합니다 !</td></tr>
                <tr><td>현재 권한</td><tr>
                <tr><td style="font-size: 11px;">${permission}</td></tr>
                </table>
                
                </div>
                <div></div>
                <!-- 회원 -->
                <div>
                <table class ="table table-hover">
                <tbody id ="preMember">
                
                </tbody>
                </table>
                
                </div>
                <hr  class="border border-primary border-1 opacity-50">
                
                <c:if test="${sessionScope.adminPermission.qna_management == 'Y'}">
                <!-- -----알람 view------ -->
        		<div class="notification-container">
                <table class="table table-hover">
                    <tbody id="newQna"></tbody>
                </table>
            	</div>
                </c:if>
              
              
              
              
             </div>
            
               
                 <div class="bg-white tm-block col-12" style="overflow:scroll;margin-left: 21vw;width: 62vw;position: fixed;height: 85%">    
                 <div class="col-12">
                        <div class="col-12">
                  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex" style=" margin-left :65% ;height:  40px; text-align: right; width: 30%;" > 
             <ol class="breadcrumb"style="width: 95%;background-color: transparent ; padding-top: 0px; " >
             <li class="breadcrumb-item">
             회원 관리
             </li>
             <li class="breadcrumb-item active">
             회원 상세</li></ol>
             </div>
                           
          	<form action="manage_member_details.do" method="get" id ="frmGet" style="width: 1100px;margin-inline: auto;">
                       <div class="col-12">
         		 <div class="col-12">
         		 
         		 
         		 
         		 
         		 
         		 <table class="table table-hover" style="width: 100%; margin: auto; text-align: center;">
    <tbody>
        <tr>
            <th style="font-size: 18px;">아이디</th>
            <td style="font-size: 18px;">
                <c:out value="${mmDomain.std_id}"/>
                <input type="hidden" name="std_id" value="${mmDomain.std_id}" readonly>
            </td>
        </tr>
        <tr>
            <th style="font-size: 18px;">이름</th>
            <td style="text-align: center; font-size: 18px;">
                <c:choose>
                    <c:when test="${requestScope.flag eq '0'}">
                        <c:out value="${mmDomain.name}"/>
                        <input type="hidden" name="name" value="<c:out value='${mmDomain.name}'/>" readonly>
                    </c:when>
                    <c:otherwise>
                        <input type="text" name="name" value="<c:out value='${mmDomain.name}'/>" style="text-align: center;" onkeypress="validateInput(event)" oninput="validateNameLength(event)">
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <th style="font-size: 18px;">연락처</th>
            <td style="text-align: center; font-size: 18px;">
                <c:choose>
                    <c:when test="${requestScope.flag eq '0'}">
                        <c:out value="${mmDomain.tel}"/>
                        <input type="hidden" name="tel" value="${mmDomain.tel}" readonly>
                    </c:when>
                    <c:otherwise>
                        <input type="text" name="tel" value="${mmDomain.tel}" style="text-align: center;" oninput="formatTelInput(event)">
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <th style="font-size: 18px;">이메일</th>
            <td style="text-align: center; font-size: 18px;">
                <c:choose>
                    <c:when test="${requestScope.flag eq '0'}">
                        <c:out value="${mmDomain.email}"/>
                        <input type="hidden" name="email" value="${mmDomain.email}" readonly>
                    </c:when>
                    <c:otherwise>
                        <input type="email" name="email" value="${mmDomain.email}" style="text-align: center;" oninput="validateEmail(event)"><br>
                        <span id="emailError" style="display: none; color: red; font-size: 12px;">이메일 형식으로 적어주세요</span>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <th style="font-size: 18px;">생년월일</th>
            <td style="text-align: center; font-size: 18px;">
                <c:choose>
                    <c:when test="${requestScope.flag eq '0'}">
                        <c:out value="${mmDomain.birth}"/>
                        <input type="hidden" name="birth" value="${mmDomain.birth}" readonly>
                    </c:when>
                    <c:otherwise>
                        <input type="date" name="birth" value="${mmDomain.birth}" style="text-align: center;">
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <th></th>
            <td></td>
        </tr>
    </tbody>
</table>
         		 
  
                </div>
         <c:if test="${requestScope.flag eq '0' }">
                    <input type="hidden" name="flag" value="1">
                    <input type="button" class="btn btn-light btn-sm me-md-2" value="수정" id="updateSubmit"  style=" margin: 10px;"/>
					</c:if>
					
                  	<c:if test="${requestScope.flag eq '1' }" >
					<input type="button" class="btn btn btn-sm me-md-2 " value="완료" id ="saveSubmit" style=" margin: 10px; "/>
					</c:if>
                <input type="button" class="btn btn-light btn-sm me-md-2" value="뒤로" id="back"  style=" margin : 10px;"/>
           
    	</div>
    	</form>
    	</div>
    	</div>
    </div>
    </div>
     <script type="text/javascript" src="<c:url value ="/resources/js/jquery-3.3.1.min.js"/>"></script>
 <script type="text/javascript" src="<c:url value ="/resources/js/bootstrap.min.js"/>"></script>
   <script type="text/javascript" src="<c:url value ="/resources/js/datatables.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value ="/resources/js/Chart.min.js"/>"></script>
	</div>
</body>
              

        

</html>