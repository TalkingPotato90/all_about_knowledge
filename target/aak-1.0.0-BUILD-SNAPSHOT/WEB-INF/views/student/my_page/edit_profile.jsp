<!-- 
Desc : 사용자(학생)의 정보를 수정하는 페이지
작성자 : 고한별
작성일 : 2024.06.19
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
    info = "" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		
		<title>마이페이지 - 개인정보수정</title>
		
		<link rel="icon" href="/all_about_knowledge/favicon.png">
		<link rel="stylesheet" type="text/css" href="/all_about_knowledge/front/student/css/semantic.css">
		
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"
		  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
		  crossorigin="anonymous"></script>
		<script src="/all_about_knowledge/front/student/js/semantic.js"></script>
		<script type = "text/javascript">
			$(function() {
				$('.ui.form')
				  .form({
				    on: 'blur',
				    fields: {
				      email: {
				        identifier  : 'email',
				        rules: [{
				            type   : 'email',
				            prompt : '이메일 형식 오류'
				          }]
				      },
				      
				      tel: {
				        identifier  : 'tel',
				        rules: [{
				            type   : 'regExp[/^[0-9]{11}$/]',
				            prompt : '전화번호는 숫자만 11자리로 입력가능합니다.'
				          }]
				      },
				      
				      match: {
				          identifier  : 'confirmPass',
				          rules: [
				            {
				              type   : 'match[password]',
				              prompt : '비밀번호 확인 불일치'
				            }
				          ]
				        },
				    }
				  });
				
                <c:if test="${updateSuccess}">
	                alert('수정이 완료되었습니다.');
	                window.location.href = '${pageContext.request.contextPath}/mypage/mypage_home.do';
            	</c:if>
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
			
				<!-- breadcrumb 시작 -->
				<div class="ui small breadcrumb div_margin">
				  <a class="section">개인정보관리</a>
				  <i class="right chevron icon divider"></i>
				  <div class="active section">개인정보수정</div>
				</div>
				<!-- breadcrumb 종료 -->
				
				<div class="ui segment">		
					<form class="ui form" action="/all_about_knowledge/mypage/update_profile.do" method="post">
						<div class="three fields">
					    	<div class="field"></div>
						    <div class="field">
								<label>아이디</label>
								<input name="userId" type="text" placeholder="<sec:authentication property='name'/>" readonly="">
						    </div>
						</div>
						
						<div class="three fields">
					    	<div class="field"></div>
						    <div class="field">
							    <label>이름</label>
							    <input name="name" type="text" placeholder="${studentInfo.name}" readonly="">
							</div>
						</div>
			
					    <div class="three fields">
					    	<div class="field"></div>
					    	<div class="field">
					      		<label>새 비밀번호</label>
					      		<input name="password" type="password">
					    	</div>
					    </div>
					    
					    <div class="three fields">
					    	<div class="field"></div>
						    <div class="field">
						      	<label>비밀번호 확인</label>
						    	<input name="confirmPass" type="password">
						  	</div>
					 	</div>
					  
					    <div class="three fields">
					    	<div class="field"></div>
					    	<div class="field">
					      		<label>휴대전화</label>
					      		<input name="tel" type="text" placeholder="${studentInfo.tel}" value="${studentInfo.tel}">
					    	</div>
					    </div>
					    
						<div class="three fields">
							<div class="field"></div>
							<div class="field">
								<label>이메일</label>
								<input name="email" type="text" placeholder="${studentInfo.email}" value="${studentInfo.email}">
							</div>
						</div>
			
						<div class="text_right">
							<div class="ui cancel basic button">취소</div>
							<button type="submit" class="ui submit basic button">수정</button>
						</div>
			
					  <div class="ui error message"></div>
					</form>
				</div>
			</div>
		</article>
	</body>
</html>