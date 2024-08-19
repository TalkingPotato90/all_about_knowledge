<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[Admin] AAK - All About Knowledge</title>

<link rel="icon" type="image/png" sizes="32x32" href="/all_about_knowledge/favicon.png">
        
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="http://localhost/all_about_knowledge/front/student/css/login_join.css" rel="stylesheet">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="http://localhost/all_about_knowledge/front/student/js/login.js"></script>

</head>
<body>
<div class="container">
   <section id="formHolder">

      <div class="row">

         <!-- Brand Box -->
         <div class="col-sm-6 brand">
            <img src="/all_about_knowledge/favicon.png" class="logo" alt="">
            <img src="http://localhost/all_about_knowledge/front/student/icon/title.svg" class="logo-title" alt="">
            
            <div class="heading">
               <h2>AAK</h2>
               <p>All About Knowledge</p>
               <p>관리자 로그인</p>
            </div>
         </div>

         <!-- Form Box -->
         <div class="col-sm-6 form">

            <!-- Login Form -->
            <div class="login form-peice">
               <form class="login-form" action="/all_about_knowledge/login" method="post">
                  <div class="form-group">
                     <label for="userId">아이디</label>
                     <input type="text" name="username" id="userId" class="userId" required>
                  </div>

                  <div class="form-group">
                     <label for="loginPassword">비밀번호</label>
                     <input type="password" name="password" id="loginPassword" required>
                  </div>

                  <div class="CTA">
                     <input type="submit" value="로그인">
                  </div>
					<c:if test="${loginError}">
						<script type="text/javascript">
                         alert("아이디와 비밀번호를 확인하세요");
                        </script>
					</c:if>
                  
               </form>
            </div><!-- End Login Form -->

         </div>
      </div>
   </section>
</div>
</body>
</html>
