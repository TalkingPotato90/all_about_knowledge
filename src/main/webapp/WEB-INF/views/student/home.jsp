<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AAK</title>
<link rel="icon" href="/all_about_knowledge/favicon.png">
<link rel="stylesheet" type="text/css"
	href="/all_about_knowledge/front/student/css/semantic.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="/all_about_knowledge/front/student/js/semantic.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">

<style type="text/css">
.hidden.menu {
	display: none;
}

.masthead.segment {
	min-height: 350px; /* 고정된 높이 설정 */
	padding: 1em 0em;
	display: flex; /* 중앙 정렬을 위한 flexbox 설정 */
	align-items: center; /* 세로 중앙 정렬 */
}

.masthead .logo.item img {
	margin-right: 1em;
}

.masthead .ui.menu .ui.button {
	margin-left: 0.5em;
}

.masthead h1.ui.header {
	margin-top: 3em;
	margin-bottom: 0em;
	font-size: 4em;
	font-weight: normal;
}

.masthead h2 {
	font-size: 1.7em;
	font-weight: normal;
}

.ui.vertical.stripe {
	padding: 4em 0em;
}

.ui.vertical.stripe h3 {
	font-size: 2em;
}

.ui.vertical.stripe .button+h3, .ui.vertical.stripe p+h3 {
	margin-top: 3em;
}

.ui.vertical.stripe .floated.image {
	clear: both;
}

.ui.vertical.stripe p {
	font-size: 1.33em;
}

.ui.vertical.stripe .horizontal.divider {
	margin: 3em 0em;
}

.quote.stripe.segment {
	padding: 0em;
}

.quote.stripe.segment .grid .column {
	padding-top: 5em;
	padding-bottom: 5em;
}

/* .footer.segment {
	padding: 5em 0em;
} */
.secondary.pointing.menu .toc.item {
	display: none;
}

@media only screen and (max-width: 700px) {
	.ui.fixed.menu {
		display: none !important;
	}
	.secondary.pointing.menu .item, .secondary.pointing.menu .menu {
		display: none;
	}
	.secondary.pointing.menu .toc.item {
		display: block;
	}
	.masthead.segment {
		min-height: 350px;
		display: flex;
		align-items: center;
	}
	.masthead.segment .column {
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.masthead.segment .column img {
		height: 100%;
	}
	.masthead h1.ui.header {
		font-size: 2em;
		margin-top: 1.5em;
	}
	.masthead h2 {
		margin-top: 0.5em;
		font-size: 1.5em;
	}
}

.masthead .column img {
	max-height: 300px; /* 이미지의 최대 높이 설정 */
	height: 100%; /* 부모 요소에 맞춰서 높이 조정 */
	object-fit: cover; /* 비율을 유지하며 크기 조정 */
}
</style>
<script src="assets/library/jquery.min.js"></script>
<script src="../dist/components/visibility.js"></script>
<script src="../dist/components/sidebar.js"></script>
<script src="../dist/components/transition.js"></script>
<script type="text/javascript">
	$(function() {

	}); // ready

	$(document).ready(function() {

		$('.masthead').visibility({
			once : false,
			onBottomPassed : function() {
				$('.fixed.menu').transition('fade in');
			},
			onBottomPassedReverse : function() {
				$('.fixed.menu').transition('fade out');
			}
		});

		$('.ui.sidebar').sidebar('attach events', '.toc.item');

		$('.ui.rating').rating({
			initialRating : 0,
			maxRating : 1
		});
	});
</script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="site/main_header.jsp"></jsp:include>

	<!-- 컨텐츠 영역 -->
	<!-- Page Contents -->
	<div class="pusher">
		<div class="ui inverted vertical masthead segment"
			style="background-color: black;">
			<div class="ui container">
				<div class="ui stackable two column grid"
					style="padding: 20px; height: 100%;">
					<div class="column"
						style="text-align: left; display: flex; flex-direction: column; justify-content: center;">
						<h2 class="ui inverted header"
							style="margin-top: 10px; margin-bottom: 10px; color: white;">
							<div class="ui red button"
								style="pointer-events: none; cursor: default;">전부무료</div>
							<div style="margin-top: 20px; color: white;">
								<span>
									<p>
										누구나 쉬운 입문 강의<br /> 지금 찾아보세요!
									</p>
									<p>
									<h4>모든 강의를 무료로 제공합니다</h4>
									</p>
								</span>
							</div>
							<div></div>
						</h2>
					</div>
					<div class="column"
						style="display: flex; justify-content: center; align-items: center;">
						<img
							src="${pageContext.request.contextPath}/front/student/images/banner_image2.png"
							style="max-width: 100%; height: 100%;">
					</div>
				</div>
			</div>
		</div>

		<div class="ui vertical stripe segment">
			<div class="ui center aligned stackable container">
				<h3>
					수강을 원하는<br> 강의를 검색하세요
				</h3>
				<div class="ui massive icon input"
					style="margin-top: 1em; width: 700px">
					<input type="text" placeholder="강의명으로 검색하세요.."> <i
						class="search icon"></i>
				</div>
			</div>
		</div>


		<div class="ui vertical stripe segment">
			<div class="ui container">
				<h3 class="ui header"
					style="text-align: center; margin-bottom: 1.5em;">인기강좌</h3>

				<!-- 카테고리 별 인기강좌 -->
				<div class="ui secondary pointing menu">
					<a class="active item"> 컴퓨터 공학 </a> <a class="item"> 프로그래밍 언어 </a>
				</div> 
				<!-- 인기강좌 카드 -->
				<div class="ui three stackable link cards" id="lectureCards">
			<c:forEach var="listLecture" items="${requestScope.listLecture }"
				varStatus="i">
				<div class="card" id="card">
				<a class="ui red right corner label"> <i
							class="thumbs up outline icon"></i>
						</a>
					<a href="user_lecture_detail.do?sub_code=${listLecture.sub_code}"
						class="image"> <img
						src="${pageContext.request.contextPath}/front/student/images/java.png">
					</a>
					<div class="content">
						<div class="header">
							<c:out value="${listLecture.sub_title}" />
						</div>
						<div class="meta">
							<a><c:out value="${listLecture.inst_id}" /></a>
						</div>
					</div>
					<div class="extra content">
						<span class="right floated">
							<div class="ui heart rating"></div> 17 likes
						</span> <span> <i class="user icon"></i> +<c:out value="${listLecture.cnt}" />명
						</span>
					</div>
				</div>
			</c:forEach>
		</div>
		
				<%-- <div class="ui three stackable link cards">
					<div class="card">
						<a class="ui red right corner label"> <i
							class="thumbs up outline icon"></i>
						</a> <a href="user_lecture_detail.do" class="image"> <img
							src="${pageContext.request.contextPath}/front/student/images/java.png">
						</a>
						<div class="content">
							<div class="header">이것이 C인가?</div>
							<div class="meta">
								<a>곽우신</a>
							</div>
						</div>
						<div class="extra content">
							<span class="right floated"> <!-- <i class="heart outline like icon"></i> -->
								<div class="ui heart rating"></div> 17 likes
							</span> <span> <i class="user icon"></i> +100명
							</span>
						</div>
					</div>
				</div> --%> 
			</div>
		</div>
		<div class="ui vertical stripe segment">
			<div class="ui container">
				<h3 class="ui header"
					style="text-align: center; margin-bottom: 1.5em;">신규강좌</h3>

				<!-- 카테고리 별 인기강좌 -->
				<div class="ui secondary pointing menu">
					<a class="active item"> 컴퓨터 공학 </a> <a class="item"> 프로그래밍 언어 </a>
				</div>
				<div class="ui three stackable link cards" id="lectureCards">
			<c:forEach var="listLecture2" items="${requestScope.listLecture2 }"
				varStatus="i">
				<div class="card" id="card">
					<a href="user_lecture_detail.do?sub_code=${listLecture2.sub_code}"
						class="image"> <img
						src="${pageContext.request.contextPath}/front/student/images/java.png">
					</a>
					<div class="content">
						<div class="header">
							<c:out value="${listLecture2.sub_title}" />
						</div>
						<div class="meta">
							<a><c:out value="${listLecture2.inst_id}" /></a>
						</div>
					</div>
					<div class="extra content">
						<span class="right floated">
							<div class="ui heart rating"></div> 17 likes
						</span> <span> <i class="user icon"></i> +<c:out value="${listLecture2.cnt}" />명
						</span>
					</div>
				</div>
			</c:forEach>
		</div>
			</div>

		</div>


		<!-- 푸터 -->
		<jsp:include page="site/main_footer.jsp"></jsp:include>
</body>
</html>