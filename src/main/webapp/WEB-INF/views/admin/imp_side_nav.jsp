<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <script type = "text/javascript">
	$(function() {
		<%--$('#home').click(function(){--%>
        <%--    window.location.href = '${pageContext.request.contextPath}/mypage/mypage_home.do';--%>
        <%--});--%>
		
 		<%--$('#dashBoard').click(function(){--%>
        <%--    window.location.href = '${pageContext.request.contextPath}/mypage/mypage_home.do';--%>
        <%--});--%>
        
		<%--$('#myLecture').click(function(){--%>
        <%--    window.location.href = '${pageContext.request.contextPath}/mypage/my_lecture.do';--%>
        <%--});--%>
		<%--$('#interest').click(function(){--%>
        <%--    window.location.href = '${pageContext.request.contextPath}/mypage/interest_lecture.do';--%>
        <%--});--%>
		<%--$('#question').click(function(){--%>
        <%--    window.location.href = '${pageContext.request.contextPath}/mypage/my_question.do';--%>
        <%--});--%>
		<%--$('#myInfo').click(function(){--%>
        <%--    window.location.href = '${pageContext.request.contextPath}/mypage/edit_information.do';--%>
        <%--});--%>
		<%--$('#withdraw').click(function(){--%>
        <%--    window.location.href = '${pageContext.request.contextPath}/mypage/withdrawal_confirm.do';--%>
        <%--});--%>
	}); // ready
</script>
<aside class="side_nav ui vertical menu no_margin">
  <div class="item">
    <div class="header"><img src="/all_about_knowledge/front/student/icon/title.svg" class="nav_logo_svg" id="home"/></div>
  </div>
  <div class="item">
    <div class="header nav_header_font">교육과목관리</div>
    <div class="menu">
      <a class="item nav_font rem_padding" id="edu_cat"><i class="folder icon"></i>교육카테고리리스트</a>
      <a class="item nav_font rem_padding" id="sub_apply"><i class="tasks icon"></i>강의신청리스트</a>
    </div>
  </div>
  <div class="item">
    <div class="header nav_header_font">개인정보관리</div>
    <div class="menu">
      <a class="item nav_font rem_padding" id="std_info"><i class="info icon"></i>학생정보관리</a>
      <a class="item nav_font rem_padding" id="inst_info"><i class="address book icon"></i>강사정보관리</a>
    </div>
  </div>
  <div class="item">
    <div class="header nav_header_font">커뮤니티관리</div>
    <div class="menu">
      <a class="item nav_font rem_padding" id="qna_manage"><i class="question icon"></i>문의사항관리</a>
      <a class="item nav_font rem_padding" id="notice_manage"><i class="bullhorn icon"></i>공지사항관리</a>
    </div>
  </div>
  
<%--<div class="item ui segment center aligned">--%>
<%--  <div class="header"><sec:authentication property="name"/></div>--%>
<%--  <div class="menu">님 환영합니다.</div>--%>
<%--  </div>--%>
  
</aside>