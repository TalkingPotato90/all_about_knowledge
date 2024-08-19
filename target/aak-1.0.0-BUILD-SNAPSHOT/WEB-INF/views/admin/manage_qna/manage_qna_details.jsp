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
    <link rel="stylesheet" href="http://localhost/all_about_knowledge/front/admin/css/fullcalendar.min.css">
    <link rel="stylesheet" href="http://localhost/all_about_knowledge/front/admin/css/family.css">
    <link rel="stylesheet" href="http://localhost/all_about_knowledge/front/admin/css/fontawesome.min.css">
    <link rel="stylesheet" href="http://localhost/all_about_knowledge/front/admin/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://localhost/all_about_knowledge/front/admin/css/tooplate.css">
</head>
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
                             <li class="nav-item " >
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
                                
                                <li class="nav-item active">
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
            </div><div class="container" style="padding: 1rem">
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
                
                <div>
                <table class ="table table-hover">
                <tbody id ="preQna">
                
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
                  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex" style=" margin-left :65% ;height:  40px; text-align: right; width: 35%;" > 
             <ol class="breadcrumb"style="width: 95%;background-color: transparent ; padding-top: 0px; " >
             <li class="breadcrumb-item">
             문의 관리
             </li>
             <li class="breadcrumb-item active">
             문의 상세</li></ol>
             </div>
                           
          	 <form action="manage_qna_details.do" method="post" id="frmPost";>
                <h2 class="tm-block-title d-inline-block">문의 제목 : <c:out value="${qnaDomain.title}"/></h2>
                <input type="hidden" name="title" value="${qnaDomain.title}">
                <div class="mb-3">
                    <label for="qna_code" class="col-sm-5 col-form-label">문의 코드 : <c:out value="${qnaDomain.qna_no}"/></label>
                    <input type="hidden" id="qna_code" name="qna_no" value="${qnaDomain.qna_no}">
                    <input type="hidden" name="status" value="${qnaDomain.status}">
                    <input type="hidden" name="id" value="${param.id}">
                    
                    <label for="staticEmail" class="col-sm-5 col-form-label">문의자 : <c:out value="${qnaDomain.std_id}"/></label>
                    
                    <c:if test="${param.status != 'D' and param.delete eq null  }">
                    <button class="btn btn-light btn-sm me-md-2" type="button" id="delete">삭제</button>
                    </c:if>
                    
                </div>
                <div class="mb-3">
                    <div>
                        <label for="content_question" class="form-label">문의 사항 내용</label>
                        <textarea class="form-control h-25" readonly id="content_question" rows="13" style=" resize: none;" name="content_question"><c:out value="${qnaDomain.content_question}"/></textarea>
                    </div>
                    <div>
                     <c:choose>
                    	<c:when test="${param.status eq 'D'}">
                        <label for="content_answer" class="form-label">삭제 사유</label>
                        <textarea class="form-control h-25"  readonly  id="content_answer" rows="13" style= "resize: none;" name="content_answer" maxlength="2000"><c:out value="${qnaDomain.reaseon}"/></textarea>
                    	</c:when>  
                    	<c:otherwise>
                        <label for="content_answer" class="form-label">문의 답변</label>
                        <textarea class="form-control h-25" id="content_answer" rows="13" style= "resize: none;" name="content_answer" maxlength="2000"><c:out value="${qnaDomain.content_answer}"/></textarea>
                        </c:otherwise>	
                     </c:choose>
                        <div class="textCount" id="charCount" >0</div>/2000자
                    </div>
                </div>
                <div class="right">
                    <c:if test="${param.status eq 'N' and param.delete eq null}">
                        <button class="btn btn-light btn-sm me-md-2" type="button" id="checkA">확인</button>
                    </c:if>
                    <c:if test="${param.status eq 'Y' and param.delete eq null}">
                        <button class="btn btn-light btn-sm me-md-2" type="button" id="submitA">수정</button>
                    </c:if>
                    
                    <button class="btn btn-light btn-sm me-md-2" type="button" id="goBack">뒤로</button>
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
		        url: "manage_qna_pre.do",
		        type: "GET",
		        dataType: "json",
		        error: function(xhr, status, error) {
		            console.error('AJAX request failed:', xhr.status, xhr.responseText);
		        },
		        success: function(jsonObj) {
		            console.log('AJAX request succeeded:', jsonObj); // 응답 내용을 로그에 출력
		            $("#preQna").empty();
		            if (jsonObj && jsonObj.n !== undefined && jsonObj.y !== undefined && jsonObj.d !== undefined) { // 응답이 유효한지 확인
		                var output = "<tr><td>미확인 문의 수: "+ jsonObj.n  +"</td></tr>";
		                output += "<tr><td>답한 문의 수: "+ jsonObj.y  +"</td></tr>";
		                output += "<tr><td>삭제 문의 수: "+ jsonObj.d  +"</td></tr>";
		                $("#preQna").html(output);
		            } else {
		                console.error('Invalid JSON response');
		            }
		        }
		    }); 
	 }); 
    
        $('#content_answer').keyup(function (e) {
            let content = $(this).val();
            // 글자수 세기
            if (content.length == 0 || content == '') {
                $('.textCount').text('0자');
            } else {
                $('.textCount').text(content.length + '자');
            }
            
            // 글자수 제한
            if (content.length > 100) {
                // 2000자 부터는 타이핑 되지 않도록
                $(this).val($(this).val().substring(0, 2000));
                // 2000자 넘으면 알림창 뜨도록
                alert('글자수는 2000자까지 입력 가능합니다.');
            }
        });

         $(document).ready(function(){
        	 
        	 $("#delete").click(function(){
        	     openDeletePopup();
        	 });

            /* 답변내용변경 */
            $("#submitA").click(function(){
            	 if (validateForm()){
                if(!confirm("답변내용을 수정 하시겠습니까?")){
                    return;
                } else {
                    $("#frmPost").attr("action", "manage_qna_modyify.do");
                    $("#frmPost").submit();
                }
            }
            });

            /* 답변내용입력 */
            $("#checkA").click(function(){
            	 if (validateForm()){
                if(!confirm("답변내용을 입력 하시겠습니까?")){
                    return;
                } else {
                    $("#frmPost").attr("action", "manage_qna_add.do");
                    $("#frmPost").submit();
                }
            }
            });

            var cnt = "${cnt}";
            if (cnt == 1) {
                alert("수행을 완료 했습니다.");
                location.href="manage_qna.do";
            } else if(cnt == '0'){
                alert("수행 중 오류가 있습니다.");
                location.href="manage_qna.do";
            }

            $("#goBack").click(function(){
                location.href="manage_qna.do";
            });
            
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

        // 삭제 팝업창
        function openDeletePopup() {
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
            var popup = window.open("manage_qna_reason.do?qna_no=${param.qna_no}", "DeletePopup", "width=" + popupWidth + ",height=" + popupHeight + ",left=" + left + ",top=" + top);

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
        
        function validateInput(input) {
            // 허용할 문자의 정규식 패턴 (알파벳, 숫자, 공백, 한글, ?, ., ,, !, ', ")
            const pattern = /^[a-zA-Z0-9\s\u3131-\uD79D?.!,'"-]*$/;
            return pattern.test(input);
        }

        document.getElementById('content_answer').addEventListener('input', function(event) {
            const isValid = validateInput(event.target.value);
            if (!isValid) {
                alert('허용되지 않은 특수 문자가 입력되었습니다.');
                event.target.value = event.target.value.replace(/[^a-zA-Z0-9\s\u3131-\uD79D?.!,'"-]/g, '');
            }
        });
  
        function validateForm() {
            let isValid = true;
            let errorMessage = '';

            const contentAnswer = document.getElementById('content_answer').value.trim();

            if (contentAnswer === '') {
                isValid = false;
                errorMessage += '내용을 입력해주세요.\n';
            }

            if (!isValid) {
                alert(errorMessage);
            }

            return isValid;
        }
        
        
        
        
        
        
        
    </script>
        
   
    
	</div>
</body>
  
</html>

