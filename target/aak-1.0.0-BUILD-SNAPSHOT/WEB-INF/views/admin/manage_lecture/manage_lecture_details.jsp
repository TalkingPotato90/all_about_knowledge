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




.content-wrapper {
            display: flex;
            justify-content: space-between;
            width: 100%;
            margin-bottom: 20px;
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
<style>
        /* 모달 효과를 위한 스타일 추가 */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
            display: none;
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

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
                                <li class="nav-item dropdown  active">
                                    <a class="nav-link dropdown-toggle" href="#void" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">교육과목관리
                                        
                                    </a>
                                     <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="manage_edu_cat.do">교육카테고리리스트</a>
                                        <a class="dropdown-item active" href="manage_lecture.do">강의신청리스트</a>
                                    </div>
                                </li>
                                </c:if>
                                	<c:if test="${sessionScope.adminPermission.member_management == 'Y'}">
                             <li class="nav-item " >
                                    <a class="nav-link " href="manage_memberlist.do">회원 관리
                                        </a>
                                        
                                </li>
                                </c:if>
                                <c:if test="${sessionScope.adminPermission.instructor_management == 'Y'}">
                                <li class="nav-item" >
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
                <tbody id ="preSubject">
                
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
             신청강의 관리
             </li>
             <li class="breadcrumb-item active">
             신청강의 상세</li></ol>
             </div>
                           
          	<form action="manage_member_details.do" method="get" id ="frmGet" style="margin-inline: auto;">
                    
         		<div class="container_sub">
        <div class="content-wrapper">
            <div class="content-section">
            
                <img src="http://localhost/all_about_knowledge/upload/<c:out value="${smDomain.inst_image }"/>">
            </div>
                <div class="text-section">
                    <h3 class="tm-block-title"><c:out value="${smDomain.sub_title }"/></h3>
                    <label>카테고리 : <c:out value="${smDomain.cat_name }"/></label>
                </div>
            <div class="content-section">
            
                <img src="http://localhost/all_about_knowledge/upload/<c:out value="${smDomain.inst_image }"/>">
                
                <%-- <c:out value="${smDomain.sub_image }"/> --%>
                
            </div>
                <div class="text-section">
                    <h3 class="tm-block-title">강사명 : <c:out value="${smDomain.name }"/></h3>
                    <label >강사 소개 : <c:out value="${smDomain.introduction }"/> </label>
                </div>
        </div>

        <div class="content-section">
            <div class="text-section">
                <label for="overview" class="form-label">학습 개요</label>
                <textarea class="form-control h-25" id="overview" readonly rows="2"><c:out value="${smDomain.intro }"/></textarea>

                <label for="goal" class="form-label">학습 목표</label>
                <textarea class="form-control h-25" id="goal" readonly rows="2"><c:out value="${smDomain.goal }"/></textarea>
            </div>
        </div>

        <div class="table-container">
            <h2 class="tm-block-title">강의 목차</h2>
            <div style="height: 200px; overflow-y: auto">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>차시</th>
                            <th>제목</th>
                            <th>강의목표</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="lmd" items="${requestScope.lecList }" varStatus="i">
                    <tr onclick="videoUrl('${lmd.f_name}&title=${lmd.title}')">
                    <td>${i.index + 1}차시</td>
                    
                    <td><c:out value="${lmd.title}"/></td>
                    <td><c:out value="${lmd.lec_explain}"/></td>
                    </tr>
					</c:forEach>
                    </tbody> 
                </table>
            </div>
        </div>

        <div class="buttons">
        	<input type="hidden" name="sub_code" value="${smDomain.sub_code }">
            <button class="btn btn-light btn-sm" type="button" id="approve">승인</button>
            <button class="btn btn-light btn-sm" type="button" id="nop">반려</button>
            <button class="btn btn-light btn-sm" type="button" id="goBack">취소</button>
        </div>
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
	<script type="text/javascript">
		 <!-- -----알람 메소드------ -->
		 $(document).ready(function() {
			var adminId = '<%= session.getAttribute("adminid") %>';
             
             if (adminId == '' || adminId == 'null') {
                 location.href = 'http://localhost/all_about_knowledge/admin_index.do';
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
			        url: "manage_lecture_pre.do",
			        type: "GET",
			        dataType: "json",
			        error: function(xhr, status, error) {
			            console.error('AJAX request failed:', xhr.status, xhr.responseText);
			        },
			        success: function(jsonObj) {
			            console.log('AJAX request succeeded:', jsonObj); // 응답 내용을 로그에 출력
			            $("#preSubject").empty();
			            if (jsonObj && jsonObj.n !== undefined && jsonObj.y !== undefined && jsonObj.d !== undefined) { // 응답이 유효한지 확인
			                var output = "<tr><td>대기 강의 수: "+ jsonObj.n  +"</td></tr>";
			                output += "<tr><td>개설 강의 수: "+ jsonObj.y  +"</td></tr>";
			                output += "<tr><td>반려 강의 수: "+ jsonObj.d  +"</td></tr>";
			                $("#preSubject").html(output);
			            } else {
			                console.error('Invalid JSON response');
			            }
			        }
			    }); 
		 });
	
	
	$(document).ready(function() {
	    $("#nop").click(function() {
	        openNopPopup();
	    });

	    /* 답변내용변경 */
	    $("#approve").click(function() {
	        if (!confirm("승인 하시겠습니까?")) {
	            return;
	        } else {
	            $("#frmGet").attr("action", "manage_lecture_modify.do");
	            $("#frmGet").submit();
	        }
	    });

	    var cnt = "${cnt}";
	    if (cnt == 1) {
	        alert("수행을 완료 했습니다.");
	        location.href = "manage_lecture.do";
	    } else if (cnt == '0') {
	        alert("수행 중 오류가 있습니다.");
	        location.href = "manage_lecture.do";
	    }

	    $("#goBack").click(function() {
	        location.href = "manage_lecture.do";
	    });
	});

	// 반려 팝업창
	function openNopPopup() {
	    // 팝업창 크기
	    var popupWidth = 450;
	    var popupHeight = 400;

	    // 부모창 크기
	    var screenWidth = window.innerWidth;
	    var screenHeight = window.innerHeight;

	    // 부모창의 중간 위치 계산
	    var left = (screenWidth - popupWidth) / 2;
	    var top = (screenHeight - popupHeight) / 2;

	    // 부모창 밖으로 나가지 않도록 조정
	    left = Math.max(0, left);
	    top = Math.max(0, top);

	    // 팝업창 열기
	    var popup = window.open("manage_lecture_reason.do?sub_code=${param.sub_code}", "NopPopup", "width=" + popupWidth + ",height=" + popupHeight + ",left=" + left + ",top=" + top);

	    // 모달 오버레이 추가
	    var modalOverlay = document.createElement('div');
	    modalOverlay.className = 'modal-overlay';
	    document.body.appendChild(modalOverlay);
	    modalOverlay.style.display = 'block';

	    // 팝업창이 부모창 위에 있는지 확인하고 위치를 유지
	    var interval = setInterval(function() {
	        if (popup.closed) {
	            clearInterval(interval);
	            modalOverlay.style.display = 'none';
	            document.body.removeChild(modalOverlay);
	        } else {
	            // 팝업창이 부모창 위에 있는지 확인
	            popup.focus();
	        }
	    }, 100);
	}

	function videoUrl(url) {
	    var popupWidth = 600;
	    var popupHeight = 450;
	    var left = (screen.width - popupWidth) / 2;
	    var top = (screen.height - popupHeight) / 2;
	    var popup = window.open('manage_lecture_video.do?f_name=' + url, "VideoPopup", "width=" + popupWidth + ",height=" + popupHeight + ",left=" + left + ",top=" + top);
	}
	
	
	</script>
	</div>



</body>