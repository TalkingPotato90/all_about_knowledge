<!-- 
Desc : 사용자(학생)의 마이페이지 회원탈퇴 화면
작성자 : 고한별
작성일 : 2024.06.12
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
    info = "" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<<<<<<< HEAD
<head>
    <meta charset="UTF-8">
    
    <title>마이페이지 - 회원탈퇴</title>
    
    <link rel="icon" href="/all_about_knowledge/favicon.png">
    <link rel="stylesheet" type="text/css" href="/all_about_knowledge/front/student/css/semantic.css">
    
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"
      integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
      crossorigin="anonymous"></script>
    <script src="/all_about_knowledge/front/student/js/semantic.js"></script>
    
    <script type = "text/javascript">
        $(function() {
            $('.special.modal')
              .modal({
                centered: true,
                blurring: true
              })
              .modal('show');
            
            $('#cancel').click(function(){
                history.back();
            });

            $('#exitConfirm').click(function(event) {
                event.preventDefault();
                var reason = $('#exitReason').val();
                
                $.ajax({
                    type: 'POST',
                    url: '/all_about_knowledge/mypage/withdrawal_form.do',
                    data: {
                        reason: reason
                    },
                    success: function(response) {
                        alert('탈퇴 처리가 완료되었습니다.');
                        
                        var form = document.createElement('form');
                        form.method = 'post';
                        form.action = '<c:url value="/logout" />';
                        
                        document.body.appendChild(form);
                        form.submit();
                    },
                    error: function(xhr, status, error) {
                        alert('탈퇴 처리 중 오류가 발생했습니다.');
                    }
                });
            });
        });
    </script>
</head>

<body class="mypage">
    <!-- 사이드 네비게이션 바 -->
    <jsp:include page="mypage_side_nav.jsp"></jsp:include>
    
    <!-- 탑 네비게이션 바 -->
    <jsp:include page="mypage_top_nav.jsp"></jsp:include>
    
    <!-- 컨텐츠 영역 -->
    <article class="my_article">
        <div class="mypage_content_div">
            
            <!-- breadcrumb 표시 -->
            <div class="ui small breadcrumb div_margin">
                <a class="section">개인정보관리</a>
                <i class="right chevron icon divider"></i>
                <div class="active section">탈퇴</div>
            </div>
            
            <!-- 탈퇴 모달 창 -->
            <div class="ui special mini modal">
                <div class="ui icon header">
                    <i class="frown icon"></i> 회원탈퇴
                </div>
                <div class="content">
                    <div class="ui form">
                        <div class="required field">
                          <label>탈퇴 사유</label>
                          <input type="text" id="exitReason" placeholder="탈퇴사유를 입력해주세요">
                        </div>
                    </div>
                </div>
                <div class="actions">
                    <button class="ui red cancel inverted button" id="cancel">
                        <i class="remove icon"></i> 취소
                    </button>
                    <button class="ui green ok inverted button" id="exitConfirm">
                        <i class="checkmark icon"></i> 탈퇴
                    </button>
                </div>
            </div>
        </div>
    </article>
</body>
</html>
=======
	<head>
		<meta charset="UTF-8">
		
		<title>마이페이지 - 회원탈퇴</title>
		
		<link rel="icon" href="/all_about_knowledge/favicon.png">
		<link rel="stylesheet" type="text/css" href="/all_about_knowledge/front/student/css/semantic.css">
		
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"
		  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
		  crossorigin="anonymous"></script>
		<script src="/all_about_knowledge/front/student/js/semantic.js"></script>
		
		<script type = "text/javascript">
			$(function() {
				
				$('.special.modal')
				  .modal({
				    centered: true,
				    blurring: true
				  })
				  .modal('show');
				
		        $('#cancel').click(function(){
		        	history.back();
		        });      
			
			}); // ready
		</script>
	</head>
	
	<body class="mypage">
		<!-- 사이드 네비게이션 바 -->
		<jsp:include page="mypage_side_nav.jsp"></jsp:include>
		
		<!-- 탑 네비게이션 바 -->
		<jsp:include page="mypage_top_nav.jsp"></jsp:include>
		
		<!-- 컨텐츠 영역 -->
		<article class="my_article">
			<div class="mypage_content_div">
				
				<!-- breadcrumb 표시 -->
				<div class="ui small breadcrumb div_margin">
					<a class="section">개인정보관리</a>
					<i class="right chevron icon divider"></i>
					<div class="active section">탈퇴</div>
				</div>
				
				<!-- 탙퇴 모달 창 -->
				<div class="ui special mini modal">
					<div class="ui icon header">
						<i class="frown icon"></i> 회원탈퇴
					</div>
					<div class="content">
						<div class="ui form">
						    <div class="required field">
						      <label>탈퇴 사유</label>
						      <input type="text" placeholder="탈퇴사유를 입력해주세요">
						    </div>
						</div>
					</div>
					<div class="actions">
						<div class="ui red cancel inverted button" id="cancel">
							<i class="remove icon"></i> 취소
						</div>
						<div class="ui green ok inverted button">
							<i class="checkmark icon" id="confirm"></i> 탈퇴
						</div>
					</div>
				</div>
			</div>
		</article>
	</body>
</html>
>>>>>>> a113aeb8adf4cf8d1cf6550a307d5d3de9a75c3e
