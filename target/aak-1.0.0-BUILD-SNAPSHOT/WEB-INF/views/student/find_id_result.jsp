<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="http://localhost/all_about_knowledge/front/student/css/login_join.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <h2>아이디 찾기 결과</h2>
            <p>${message}</p>
            <c:if test="${not empty error}">
                <p style="color: red;">${error}</p>
            </c:if>
            <div class="CTA">
                <button onclick="window.close()">닫기</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
