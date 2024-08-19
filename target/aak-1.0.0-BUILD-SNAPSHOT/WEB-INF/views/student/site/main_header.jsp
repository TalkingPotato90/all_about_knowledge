<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<script type = "text/javascript">
	$(function() {
        $("#logout").click(function() {
            var form = document.createElement('form');
            form.method = 'post';
            form.action = '<c:url value="/logout" />';
            
            document.body.appendChild(form);
            form.submit();
        });
	}); // ready
	</script>
	<style>
    .nav_logo_svg {
        height: 65px;
        width: auto; /* 가로 비율 유지 */
        object-fit: contain; /* 이미지 비율 유지하며 크기 조절 */
    }
    .ui.stackable.menu {
        height: 65px; 
        margin-top: 0px;
    }
</style>
<nav class="ui stackable menu" style="height:65px; margin-top:0px">
<div class="header item">
    <img src="/all_about_knowledge/front/student/icon/title.svg" class="nav_logo_svg" id="home"/>
</div>
  <div class="right menu">
    <a class="item" id="btnHome" href="http://localhost/all_about_knowledge/mypage/mypage_home.do">마이페이지</a>
    <a class="item" id="btnLecture" href="http://localhost/all_about_knowledge/lecture_list.do">개설강좌</a>
    <sec:authorize access="isAnonymous()">
        <a class="item" id="login" href="http://localhost/all_about_knowledge/student/login.do">로그인</a>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
        <div class="item">
            <div class="header"><sec:authentication property="name" /></div>
            <div class="menu">님 환영합니다.</div>
        </div>
        <a class="item" id="logout">로그아웃</a>
    </sec:authorize>
    <%-- <sec:authorize access="isAuthenticated()"> --%>
    <%-- </sec:authorize> --%>
</div>
  
</nav>