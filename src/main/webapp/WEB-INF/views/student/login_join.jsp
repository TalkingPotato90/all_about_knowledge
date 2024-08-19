<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AAK - All About Knowledge</title>

<link rel="icon" type="image/png" sizes="32x32" href="/all_about_knowledge/favicon.png">
        
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="http://localhost/all_about_knowledge/front/student/css/login_join.css" rel="stylesheet">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="http://localhost/all_about_knowledge/front/student/js/login.js"></script>

<script>
	document.addEventListener("DOMContentLoaded", function () {
		const birthInput = document.getElementById('birth');
		const telInput = document.getElementById('tel');

		birthInput.addEventListener('input', function (event) {
			let value = this.value.replace(/\D/g, '');
			if (value.length > 8) {
				value = value.substring(0, 8);
			}
			const formattedValue = formatDateString(value);
			this.value = formattedValue;
		});
		
		telInput.addEventListener('input', function (event) {
			let value = this.value.replace(/\D/g, '');
			if (value.length > 11) {
				value = value.substring(0, 11);
			}
			const formattedValue = formatTelString(value);
			this.value = formattedValue;
		});

		function formatDateString(value) {
			const year = value.substring(0, 4);
			const month = value.substring(4, 6);
			const day = value.substring(6, 8);

			let formatted = '';
			if (year) {
				formatted += year;
			}
			if (month) {
				formatted += '-' + month;
			}
			if (day) {
				formatted += '-' + day;
			}
			return formatted;
		}
		
		function formatTelString(value) {
			const first = value.substring(0, 3);
			const middle = value.substring(3, 7);
			const last = value.substring(7, 11);

			let formatted = '';
			if (first) {
				formatted += first;
			}
			if (middle) {
				formatted += '-' + middle;
			}
			if (last) {
				formatted += '-' + last;
			}
			return formatted;
		}
	});

	function openPopup(url, title, w, h) {
	    var left = (screen.width / 2) - (w / 2);
	    var top = (screen.height / 2) - (h / 2);
	    return window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
	}
</script>

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
            </div>

            <div class="success-msg">
               <p> 회원 가입이 성공적으로 완료되었습니다 </p>
               <a href="#" class="profile">로그인</a>
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
                     <a href="#" class="switch">회원가입</a>
                     <a href="javascript:void(0);" class="switch-a" onclick="openPopup('/all_about_knowledge/find_id_popup.do', '아이디 찾기', 600, 400);">ID찾기</a>
                     <a href="javascript:void(0);" class="switch-a" onclick="openPopup('/all_about_knowledge/find_password_popup.do', '비밀번호 찾기', 600, 400);">비밀번호찾기</a>
                  </div>
					<c:if test="${loginError}">
						<script type="text/javascript">
                         alert("아이디와 비밀번호를 확인하세요");
                        </script>
					</c:if>
                  
               </form>
            </div><!-- End Login Form -->


            <!-- Signup Form -->
            <div class="signup form-peice switched">
               <form class="signup-form" id="signup-form" action="/all_about_knowledge/join.do" method="post">

                  <div class="form-group">
                     <label for="userId">아이디</label>
                     <input type="text" name="stdId" id="stdId" class="userId">
                     <span class="error"></span>
                  </div>
                  
                  <div class="form-group">
                     <label for="name">이름</label>
                     <input type="text" name="name" id="name" class="name">
                     <span class="error"></span>
                  </div>
                  
                  <div class="form-group">
                     <label for="birth">생년월일(yyyy-mm-dd)</label>
                     <input type=text name="birth" id="birth" class="birth">
                     <span class="error"></span>
                  </div>

                  <div class="form-group">
                     <label for="password">비밀번호</label>
                     <input type="password" name="password" id="password" class="pass">
                     <span class="error"></span>
                  </div>

                  <div class="form-group">
                     <label for="passwordCon">비밀번호 확인</label>
                     <input type="password" name="passwordCon" id="passwordCon" class="passConfirm">
                     <span class="error"></span>
                  </div>
                  
                  <div class="form-group">
                     <label for="phone">휴대전화</label>
                     <input type="tel" name="tel" id="tel">
                  </div>
                  
                  <div class="form-group">
                     <label for="email">이메일</label>
                     <input type="email" name="email" id="email" class="email">
                     <span class="error"></span>
                  </div>

                  <div class="CTA">
                     <input type="submit" value="회원가입" id="joinBtn">
                     <a href="#" class="switch">로그인</a>
                  </div>
               </form>
            </div><!-- End Signup Form -->
         </div>
      </div>
   </section>
</div>
</body>
</html>
