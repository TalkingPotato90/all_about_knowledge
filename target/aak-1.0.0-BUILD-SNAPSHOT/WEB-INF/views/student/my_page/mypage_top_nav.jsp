<!-- 
Desc : 사용자(학생)의 마이페이지 상단 네비게이션
작성자 : 고한별
작성일 : 2024.06.11
수정일 : 2024.06.25
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
    $(function() {
        $("#logout").click(function() {
            var form = document.createElement('form');
            form.method = 'post';
            form.action = '<c:url value="/logout" />';
            
            document.body.appendChild(form);
            form.submit();
        });
        
        $("#mainhome").click(function(){
        	window.location.href = '${pageContext.request.contextPath}/index.do';
        });
        
        $("#openLecture").click(function(){
        	window.location.href = '${pageContext.request.contextPath}/lecture_list.do';
        });
    });
</script>

<nav class="top_nav ui small stackable menu">
  <div class="right menu">
    <a class="item" id="mainhome">사이트 홈</a>
    <a class="item" id="openLecture">개설강좌</a>
    <a class="item" id="logout">로그아웃</a>
  </div>
</nav>