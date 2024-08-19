<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="http://localhost/all_about_knowledge/front/student/css/login_join.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <h2>비밀번호 찾기</h2>
            <form class="password-finding-form" action="/all_about_knowledge/findPassword.do" method="post">
                <div class="form-group">
                    <label for="email">이메일</label>
                    <input type="email" name="email" id="email" required>
                </div>
                <div class="CTA">
                    <input type="submit" value="비밀번호 찾기">
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
