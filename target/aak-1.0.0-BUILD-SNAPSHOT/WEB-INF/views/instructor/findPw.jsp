<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon"
	href="http://211.63.98.143/spring_mvc/common/favicon.ico" />
<!--bootstrap 시작-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<link rel="stylesheet"
	href="http://211.63.98.143/spring_mvc/common/css/main.css"
	type="text/css" media="all" />
<link rel="stylesheet"
	href="http://211.63.98.143/spring_mvc/common/css/board.css"
	type="text/css" media="all" />

<!--jQuery CDN 시작-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->
<script type="text/javascript">
	$(function() {
		$("#searchBtn").click(function(){
			
			var inputId = $("#inputId").val();
			var inputEmail = $("#inputEmail").val();
			var inputName = $("#inputName").val();
			
			if( inputId == ""){
				alert("아이디는 필수 입력");
				$("#inputId").focus();
				return;
			}
			if( inputEmail == ""){
				alert("이메일은 필수 입력");
				$("#inputEmail").focus();
				return;
			}
			if( inputName == ""){
				alert("이름은 필수 입력");
				$("#inputName").focus();
				return;
			}
			
			$("#findPwFrm").submit()
		});
	});//ready
</script>

<form action="http://localhost/all_about_knowledge/instructor/findPw.do" method="post" id="findPwFrm" class="text-center">
  <!-- 아이디 -->
  <div data-mdb-input-init class="form-outline mb-4 mx-auto" style="max-width: 400px; padding-top:20px">
    <input type="text" id="inputId" class="form-control" placeholder="아이디를 입력해주세요" />
    <label class="form-label"></label>
  </div>
  
  <!-- 이메일 -->
  <div data-mdb-input-init class="form-outline mb-4 mx-auto" style="max-width: 400px;">
    <input type="text" id="inputEmail" class="form-control" placeholder="이메일을 입력해주세요" />
    <label class="form-label"></label>
  </div>

  <!-- 이름 -->
  <div data-mdb-input-init class="form-outline mb-4 mx-auto" style="max-width: 400px;">
    <input type="text" id="inputName" class="form-control" placeholder="이름을 입력해주세요"/>
    <label class="form-label"></label>
  </div>

  <!-- Submit button -->
    <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-block mb-4" id="searchBtn">
  인증하기</button>
  </form>
