<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="kr">

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" ><!-- content="IE=edge" -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>AAK</title>

    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="http://localhost/all_about_knowledge/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>


<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
	<jsp:include page="../common/instructor_sidebar.jsp"></jsp:include>
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
			<jsp:include page="../common/instructor_header.jsp"></jsp:include>
                <div class="container-fluid" style="width:70%; background-color:white;">

                                   
            
            <div class="bg-white tm-block" style="width: 70% " >
            	<div class="row" style="padding-left: 20px;">
                        <div class="col-12" >
						
                    <div class="mb-3">
                   <%--  <c:forEach var="qnaDetail" items="${qnaDetail}" varStatus="i"> --%>
                     <input type="hidden" value="${qnd.qna_no}" name="qna_no"/>
                        <span>
						<label class="col-sm-5 col-form-label mr-2"><c:out value="${qnd.subject }"/></label>
   						 <label class="col-sm-5 col-form-label mr-2">
							<c:out value="${qnd.sub_title}" />
   						 </label>
						</span>
  						<label class="col-sm-5 col-form-label mr-2">작성자 
							<c:out value="${qnd.std_id}"/>
						</label>
   						<label class="col-sm-5 col-form-label mr-2">작성일 
							<c:out value="${qnd.q_date}"/>
   						 </label>
					</div>
                    <h2 class="tm-block-title d-inline-block">
                    <c:out value="${qnd.title }"/>
                    </h2>
					<div class="mb-3">
 						 <label  class="form-label">문의 내용</label>
  						<textarea class="form-control h-25" id="content"  readonly  rows="10" name="content"><c:out value="${qnd.content}"/></textarea>
					</div>
					
					<form action="qnaDetailProcess.do" method="post" id="answerFrm">
						 <input type="hidden" value="${qnd.qna_no}" name="qna_no"/>
						 
							<label  class="form-label">문의 답변</label>
	 						<textarea class="form-control h-25" id="ans_content" rows="8" name="ans_content"><c:out value="${qnd.ans_content}"/></textarea>
	 						<br/>
	 						<c:if test="${ not empty qnd.ans_date}">
	 						작성일 : <c:out value="${qnd.ans_date}"/>
		 					</c:if>
  						<div class="text-center">
  						<input type="submit" value="확인"  id="btnAns" class="btn btn-dark btn-sm"/>
  						<input type="button" value="취소" class="btn btn-light btn-sm"/>
  						</div>
  					</form>
					</div>
                    </div>
					
   				 </div>
               </div>
                    </div>
			<jsp:include page="../common/instructor_footer.jsp"></jsp:include>

        </div>
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">Ã</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="http://localhost/all_about_knowledge/resources/vendor/jquery/jquery.min.js"></script>
    <script src="http://localhost/all_about_knowledge/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="http://localhost/all_about_knowledge/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="http://localhost/all_about_knowledge/resources/js/sb-admin-2.min.js"></script>


</body>

</html>