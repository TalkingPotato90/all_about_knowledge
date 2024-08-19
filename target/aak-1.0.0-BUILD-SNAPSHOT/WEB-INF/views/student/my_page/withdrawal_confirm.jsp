<!-- 
Desc : 사용자(학생)의 회원 탈퇴 시 비밀번호 검증 화면
작성자 : 고한별
작성일 : 2024.07.01
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
    info = "" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
	        
		        $('#confirm').click(function(){
		            var password = $('input[type="password"]').val();
		            $.ajax({
		                type: "POST",
		                url: "${pageContext.request.contextPath}/mypage/verify_password.do",
		                data: { password: password },
		                success: function(response) {
		                    if (response === "success") {
		                        window.location.href = '${pageContext.request.contextPath}/mypage/withdrawal.do';
		                    }
		                },
		                error: function() {
		                    alert("비밀번호를 확인하세요");
		                    window.location.href = '${pageContext.request.contextPath}/mypage/withdrawal_confirm.do'
		                }
		            });
		        });
		        
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
					<div class="active section">회원탈퇴</div>
				</div>
			
				<!-- 사용자 검증 모달 창 -->
				<div class="ui special mini modal">
					<div class="ui icon header">
						<i class="frown icon"></i> 회원탈퇴
					</div>
					
					<div class="content">
						<p>현재 비밀번호를 입력하세요</p>
						<div class="field">
							<label>비밀번호 : </label>
							<input type="password">
						</div>
					</div>
					
					<div class="actions">
						<div class="ui red cancel inverted button" id="cancel">
							<i class="remove icon"></i> 취소
						</div>
						<div class="ui green ok inverted button" id="confirm">
							<i class="checkmark icon"></i> 확인
						</div>
					</div>
				</div>
			</div>
		</article>
	</body>
</html>