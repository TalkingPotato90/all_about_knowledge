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
    <a class="item" id="main_page">메인사이트</a>
    <a class="item" id="inst_page">강사사이트</a>
    <a class="item" id="logout">로그아웃</a>
  </div>
</nav>