<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항</title>
<link rel="stylesheet" type="text/css"
	href="/all_about_knowledge/front/student/css/semantic.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="/all_about_knowledge/front/student/js/semantic.js"></script>

<style type="text/css">
.search-container {
	display: flex;
	justify-content: flex-end;
}
</style>
<script type="text/javascript">
	$(document).ready(function($) {
		$("#btnUpdate").click(function() {
			$("#frm").submit();

		});
	});
</script>
</head>
<body>

	<!-- 헤더 -->
	<jsp:include page="../site/main_header.jsp"></jsp:include>

	<div class="ui main container" style="padding-top: 20px; padding-bottom:300px">
		<h1 class="ui header">문의사항</h1>

		 <!-- 질문 수정 폼 -->
        <!-- <form action="site_qna_update.do" method="POST" class="ui form"> -->
            <%-- <input type="hidden" name="qna_no" value="${uqd.qna_no}"> --%>
            
            <%-- <div class="field">
                <label>제목</label>
                <input type="text" name="title" value="${uqd.title}">
            </div>
            
            <div class="field">
                <label>내용</label>
                <textarea name="content">${uqd.q_content}</textarea>
            </div>  --%>
            
            <div class="ui segment">
			<div>
				<h2>
				<label>제목 :</label>
				<c:out value="${uqd.title}" />
				</h2>
				<h5 style="color: #999;">작성자: <c:out value="${uqd.std_id}" /> 
				| 작성일: <fmt:formatDate pattern="yyyy-MM-dd" value="${uqd.q_date }" /></h5>
			</div>
			<hr>
			<div>
			<c:out value="${uqd.q_content}" />
			</div>
		</div>
        
        <!-- 수정 완료 버튼 -->
	    <input type="button" class="ui button" value="수정"
					id="btnUpdate"/>
        
        
        <!-- </form>  -->
		
		
		<a href="site_qna.do">
			<button class="ui center button">취소</button>
		</a> 
		
		
	</div>

	<!-- 푸터 -->
	<jsp:include page="../site/main_footer.jsp"></jsp:include>

</body>

</html>