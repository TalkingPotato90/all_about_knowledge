<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>All_About_Knowledge</title>
    <!--

    Template 2108 Dashboard

	http://www.tooplate.com/view/2108-dashboard

    -->
    <link rel="stylesheet" href="http://localhost/all_about_knowledge/front/admin/css/fullcalendar.min.css">
    <!-- https://fullcalendar.io/ -->
      <link rel="stylesheet" href="http://localhost/all_about_knowledge/front/admin/css/family.css">
    <!-- https://fonts.google.com/specimen/Open+Sans -->
    <link rel="stylesheet" href="http://localhost/all_about_knowledge/front/admin/css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="http://localhost/all_about_knowledge/front/admin/css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="http://localhost/all_about_knowledge/front/admin/css/tooplate.css">
</head>

<body id="reportsPage">
    <div class="" id="home">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="navbar navbar-expand-xl navbar-light bg-light">
                        <a class="navbar-brand" href="admin_main.do">
                            <h2 class="tm-site-title mb-0">All About Knowledge</h2>
                        </a>
                        <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mx-auto">
                               <c:if test="${sessionScope.adminPermission.category_management == 'Y'}">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#void" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">교육과목관리
                                        
                                    </a>
                                     <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="manage_edu_cat.do">교육카테고리리스트</a>
                                        <a class="dropdown-item" href="manage_lecture.do">강의신청리스트</a>
                                    </div>
                                </li>
                                </c:if>
                                	<c:if test="${sessionScope.adminPermission.member_management == 'Y'}">
                             <li class="nav-item " >
                                    <a class="nav-link " href="manage_memberlist.do">회원 관리
                                        </a>
                                        
                                </li>
                                </c:if>
                                <c:if test="${sessionScope.adminPermission.instructor_management == 'Y'}">
                                <li class="nav-item " >
                                    <a class="nav-link " href="manage_instructor.do">강사 관리
                                        </a>
                                </li>
								</c:if>
								<c:if test="${sessionScope.adminPermission.qna_management == 'Y'}">
                                
                                <li class="nav-item">
                                    <a class="nav-link " href="manage_qna.do" >문의 관리
                                    </a>
                                    
                                </li>
                                </c:if>
                                <c:if test="${sessionScope.adminPermission.notice_management == 'Y'}">
                                
                                <li class="nav-item ">
                                    <a class="nav-link " href="manage_notification.do">
                                        공지사항 관리
                                    </a>
                                </li>
                                </c:if>
                                <c:if test="${sessionScope.auth == 'SUPER'}">
                                <li class="nav-item">
                                    <a class="nav-link " href="manage_admin.do">
                                        관리자 관리
                                    </a>
                                </li>
                                </c:if>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link d-flex" href="admin_index_logout.do">
                                        <i class="far fa-user mr-2 tm-logout-icon"></i>
                                        <span>Logout</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            <!-- row -->
            
             <div class="row">
                <div class="col-12">
            
            <div class="row tm-content-row tm-mt-big" style="margin-left: 0vw; float:left; fixed;height: 70%; position: fixed; width: 25%">
            
            <div class="bg-white tm-block col-12" >
            
              <div >
          	
          	  <h2 class="tm-block-title">오늘 회원 수치</h2>
         	   <div>
         	   
         	   <div style="margin-top: 10px;">
      		  <p style="float:left; margin: auto;">전체 회원 수 : </p>
      		  <p class="display-5" id="counterAllMember" style="float:left; margin: auto;">0</p>
      		  <p style=" margin: auto;">명</p>
         	   </div>
         	   
         	   <div style="margin-top: 10px;">
      		  <p style="float:left; margin: auto;">신규 회원 수 : </p>
      		  <p class="display-5" id="counterNewMember" style="float:left; margin: auto;">0</p>
      		  <p style=" margin: auto;">명</p>
      		  </div>
      		  
      		  <div style="margin-top: 10px;">
      		  
      		  <p style="float:left; margin: auto;">탈퇴 회원 수 : </p>
      		  <p class="display-5" id="counterOutMember" style="float:left; margin: auto;">0</p>
      		  <p style=" margin: auto;">명</p>
      		  
      		  
      		  </div>
  			  </div>
  			  
  			  <hr>
            	
              </div>
                    <div style="margin:auto;">
                        <h2 class="tm-block-title">일별 신규회원</h2>
                       <canvas id="lineChart" class="chartjs-render-monitor"></canvas>
                    </div>
           </div>
              
            
           </div>
           
   
              
           <div class="row tm-content-row tm-mt-big" style="margin-left: 29.2vw; float:left; fixed;height: 70%; position: fixed; width: 25%">
            <div class="bg-white tm-block col-12" > 
            
            <h2 class="tm-block-title">강사 및 강의</h2>
         	   <div class="allMemberCount">
           
              <div style="margin-top: 10px;">
      		  <p style="float:left; margin: auto;">총 강사 수 : </p>
      		  <p class="display-5" id="counterAllInstructor" style="float:left; margin: auto;">0</p>
      		  <p style=" margin: auto;">명</p>
      		  </div>  
                 
                
                
                
              <div style="margin-top: 10px;">
      		  <p style="float:left; margin: auto;">총 강의 수 : </p>
      		  <p class="display-5" id="counterAllSubject" style="float:left; margin: auto;">0</p>
      		  <p style=" margin: auto;">개</p>
      		  </div> 
      		  
      		  <div style="margin-top: 10px;">
      		  <p style="float:left; margin: auto;">개설 신청 강의 : </p>
      		  <p class="display-5" id="counterNeedChkSubject" style="float:left; margin: auto;">0</p>
      		  <p style=" margin: auto;">건</p>
      		  </div> 
          	  
       	 <hr>
        
              <div>
                    <div style="margin:auto;">
                        <h2 class="tm-block-title">월별 신규 강의 수</h2>
                        <canvas id="barChart"></canvas>
                    </div>
                </div>
              </div>
			</div>
        </div>       
          
          
                <div class="row tm-content-row tm-mt-big" style="margin-left: 58.4vw; float:left; fixed;height: 70%; position: fixed; width: 25%">
            <div class="bg-white tm-block col-12" > 
            <div >
          	
          	  <h2 class="tm-block-title">문의 사항</h2>
         	   <div>
         	   
         	   <div style="margin-top: 10px;">
      		  <p style="float:left; margin: auto;">미확인 문의 사항 : </p>
      		  <p class="display-5" id="needChkQuestionCount" style="float:left; margin: auto;">0</p>
      		  <p style=" margin: auto;">건</p>
         	   </div>
         	   
         	   
  			  </div>
  			  
  			  <hr>
  			  
            	<div >
            	<h2 class="tm-block-title">오늘 들어온 문의 사항</h2>
            	<c:choose>
                <c:when test="${not empty requestScope.qnaList}">
            	<table class ="table table-hover"style="overflow: auto;">
                    <thead>
                    <tr>
                  	<th>no</th>
                    <th>문의 제목</th>
                    
                    </tr>
                    </thead>
                    <tbody>
                 
                    <c:forEach var="qmd" items="${requestScope.qnaList }" varStatus="i">
					<tr>
					<td><c:out value="${i.index + 1}"/></td>
                    <td><c:out value="${qmd.title }"/></td>
					</tr>
                    </c:forEach>
                    </tbody>
				
            	</table>
                    </c:when>
                    <c:otherwise>
                    <p style="float:left; margin: auto;">문의가 없습니다.</p>
                    </c:otherwise>
                    
                    
            	</c:choose>
            	
            	</div>
            	
            	
              </div>
           
       

			
        
       
   		 
   		 
   		 
   		 </div>
   		</div> 
	</div>
</div>

    </div>
    <script type="text/javascript" src="<c:url value ="/resources/js/jquery-3.3.1.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value ="/resources/js/moment.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value ="/resources/js/Chart.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value ="/resources/js/fullcalendar.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value ="/resources/js/bootstrap.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value ="/resources/js/tooplate-scripts.js"/>"></script>
    <script type="text/javascript" src="<c:url value ="/resources/js/utils.js"/>"></script>
    <script>
    

    
   	 	var line_dates = [];
   	 	var line_datas = [];
   	    <c:forEach var="ddm" items="${requestScope.singup_list }" varStatus="i">
   	 	
   	 		line_dates.push(<c:out value="${ddm.day}"/>+"일");
   			line_datas.push(<c:out value="${ddm.count}"/>);
   	 	
		</c:forEach>
		
		var bar_dates = [""];
	    var bar_datas = [0];

	    <c:forEach var="ddm" items="${requestScope.sub_List }" varStatus="i">
	        <c:if test="${ddm.count != 0}">
	            bar_dates.push("<c:out value='${ddm.day}'/>월");
	            bar_datas.push(<c:out value="${ddm.count}"/>);
	        </c:if>
	    </c:forEach>

	    bar_dates.push("");
	    bar_datas.push(0);

		

        var allMemberCount = <c:out value="${dbDomain.allMember_count}" />;
        var newMemberCount = <c:out value="${dbDomain.newMember_count}" />;
        var allInstructorCount = <c:out value="${dbDomain.allInstructor_count}" />;
        var exitMemberCount = <c:out value="${dbDomain.exitMember_count}" />;
        var allSubjectCount = <c:out value="${dbDomain.allSubject_count}" />;
        
        var needChkQuestionCount = <c:out value="${dbDomain.needChkQuestion_count}" />;
        var needChkSubjectCount = <c:out value="${dbDomain.needChkSubject_count}" />;
        
        
    	
    
    $(document).ready(function() {
    	
    	var adminId = '<%= session.getAttribute("adminid") %>';
        
        if (adminId == '' || adminId == 'null') {
            location.href = 'http://localhost/all_about_knowledge/admin_index.do';
        }
    	
        function animateCounter(element, start, end, duration) {
            let range = end - start;
            let current = start;
            let increment = end > start ? 1 : 0;
            let stepTime = Math.abs(Math.floor(duration / range));
            let timer = setInterval(function() {
                current += increment;
                $(element).text(current);
                if (current == end) {
                    clearInterval(timer);
                }
            }, stepTime);
        }
        // 카운트
        animateCounter("#counterAllMember", 0, allMemberCount, 1000); 	 //전체 회원 수
        animateCounter("#counterNewMember", 0, newMemberCount, 1500); 	//신규 회원 수
        animateCounter("#counterOutMember", 0, exitMemberCount, 1000); 		//탈퇴 회원 수
        animateCounter("#counterAllInstructor", 0, allInstructorCount, 1500); 	//총 강사 수
        animateCounter("#counterAllSubject", 0, allSubjectCount, 1500); 			//총 강의 수
        animateCounter("#counterNeedChkSubject", 0, needChkSubjectCount, 1500); 	//개설 신청 강의 수
        animateCounter("#needChkQuestionCount", 0, needChkQuestionCount, 1500);	//확인이 필요한 문의 수 

    });
    
    
    let ctxLine,
        ctxBar,
        ctxPie,
        optionsLine,
        optionsBar,
        optionsPie,
        configLine,
        configBar,
        configPie,
        lineChart,
        barChart,
        pieChart;

    // DOM이 준비되었을 때 실행할 함수
    $(function () {
        updateChartOptions();
        drawLineChart(); // Line Chart
        drawBarChart(); // Bar Chart


        $(window).resize(function () {
            updateChartOptions();
            updateLineChart();
            updateBarChart();
            reloadPage();
        });
    });

    // 차트 옵션 업데이트 함수
    function updateChartOptions() {
        optionsLine = { scales: { y: { beginAtZero: true } } };
        optionsBar = { scales: { y: { beginAtZero: true } } };

    }

    // Line 차트 그리기 함수
    function drawLineChart() {
        ctxLine = document.getElementById('lineChart').getContext('2d');
        configLine = {
            type: 'line',
            data: {
            	  labels: line_dates,
                  datasets: [{
                      label: '회원 추이',
                      data: line_datas,
                      backgroundColor: 'rgba(75, 192, 192, 0.2)',
                      borderColor: 'rgba(75, 192, 192, 1)',
                      borderWidth: 1
                }]
            },
            options: optionsLine
        };
        lineChart = new Chart(ctxLine, configLine);
    }

    // Bar 차트 그리기 함수
    function drawBarChart() {
        ctxBar = document.getElementById('barChart').getContext('2d');
        configBar = {
            type: 'bar',
            data: {
                labels: bar_dates,
                datasets: [{
                    label: '개설 강의',
                    data: bar_datas,
                    backgroundColor: 'rgba(153, 102, 255, 0.2)',
                    borderColor: 'rgba(153, 102, 255, 1)',
                    borderWidth: 1
                }]
            },
            options: optionsBar
        };
        barChart = new Chart(ctxBar, configBar);
    }

   

    // Line 차트 업데이트 함수
    function updateLineChart() {
        lineChart.options = optionsLine;
        lineChart.update();
    }

    // Bar 차트 업데이트 함수
    function updateBarChart() {
        barChart.options = optionsBar;
        barChart.update();
    }

    // 페이지 새로고침 함수
    function reloadPage() {
        location.reload();
    }


</script>
</body>
</html>