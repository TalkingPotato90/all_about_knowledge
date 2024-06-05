<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->
<style type = "text/css">
	
</style>
<script type = "text/javascript">
	$(function() {
		$("#btnLogin").click(function() {
			$("#frmGet")[0].action="login.do";
			$("#frmGet").submit();
		}); // click
		$("#btnSmt").click(function() {
			$("#frmGet")[0].action="test.do";
			$("#frmGet").submit();
		}); // click
	}); // ready
</script>
</head>
<body>
<div>
	<div>
	<form id="frmGet" method="get">
		<input type="button" class="btn btn-sm btn-primary" value="로그인" id="btnLogin"><br>
		<input type="button" class="btn btn-sm btn-info" value="semantic" id="btnSmt"><br>
	</form>
	</div>
</div>
</body>
</html>