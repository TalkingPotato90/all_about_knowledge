<!-- 
Desc : 사용자(학생)의 마이페이지 좌측 네비게이션
작성자 : 고한별
작성일 : 2024.06.11
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <script type = "text/javascript">
	$(function() {
		$('#home').click(function(){
            window.location.href = '${pageContext.request.contextPath}/mypage/mypage_home.do';
        });
		
 		$('#dashBoard').click(function(){
            window.location.href = '${pageContext.request.contextPath}/mypage/mypage_home.do';
        });
        
		$('#myLecture').click(function(){
            window.location.href = '${pageContext.request.contextPath}/mypage/my_lecture.do';
        });
		$('#interest').click(function(){
            window.location.href = '${pageContext.request.contextPath}/mypage/interest_lecture.do';
        });
		$('#question').click(function(){
            window.location.href = '${pageContext.request.contextPath}/mypage/my_question.do';
        });
		$('#myInfo').click(function(){
            window.location.href = '${pageContext.request.contextPath}/mypage/edit_information.do';
        });
		$('#withdraw').click(function(){
            window.location.href = '${pageContext.request.contextPath}/mypage/withdrawal_confirm.do';
        });
	}); // ready
</script>
<aside class="side_nav ui vertical menu no_margin">
  <div class="item">
    <div class="header"><img src="/all_about_knowledge/front/student/icon/title.svg" class="nav_logo_svg" id="home"/></div>
  </div>
  <div class="item">
    <div class="header nav_header_font">나의 강의실</div>
    <div class="menu">
      <a class="item nav_font rem_padding" id="dashBoard"><img src="/all_about_knowledge/front/student/icon/dashboard.svg" class="nav_svg"/>대시보드</a>
      <a class="item nav_font rem_padding" id="myLecture"><img src="/all_about_knowledge/front/student/icon/mylecture.svg" class="nav_svg"/>나의강의</a>
      <a class="item nav_font rem_padding" id="interest"><img src="/all_about_knowledge/front/student/icon/interest.svg" class="nav_svg"/>관심강의</a>
      <a class="item nav_font rem_padding"  id="question"><img src="/all_about_knowledge/front/student/icon/question.svg" class="nav_svg"/>나의문의</a>
    </div>
  </div>
  <div class="item">
    <div class="header nav_header_font">개인정보관리</div>
    <div class="menu">
      <a class="item nav_font rem_padding" id="myInfo"><img src="/all_about_knowledge/front/student/icon/my_info.svg" class="nav_svg"/>개인정보수정</a>
      <a class="item nav_font rem_padding" id="withdraw"><img src="/all_about_knowledge/front/student/icon/exit.svg" class="nav_svg"/>탈퇴</a>
    </div>
  </div>
  
<div class="item ui segment center aligned">
  <div class="header"><sec:authentication property="name"/></div>
  <div class="menu">님 환영합니다.</div>
  </div>
  
</aside>