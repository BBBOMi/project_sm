<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE HTML>
<html>

<!-- Head -->
<c:import url="../../common/head.jsp"/>

<body class="no-sidebar">
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header-wrapper">
			<div id="header">

				<!-- Menu -->
				<c:import url="../../common/menu.jsp"/>

			</div>
		</div>

		<!-- Main -->
		<div id="main-wrapper">
			<div class="container">

				<!-- Content -->
				<article class="box post">
					<header>
						<h2>설문조사</h2>
					</header>
					<section>
						<div class="row">
							<div class="6u 12u(mobile)">
								<section class="box">
									<a href="#" class="image featured"><img src="../../../res/images/mentor.png" alt="" /></a>
									<header>
										<h3>멘토 설문조사</h3>
									</header>
									<p>한 학기 동안 멘토링 활동에 대한 설문조사입니다.</p>
									<footer>
										<a href="mento-survey-list" class="button alt">멘토 설문조사 바로가기</a>
									</footer>
								</section>
							</div>
							<div class="6u 12u(mobile)">
								<section class="box">
									<a href="#" class="image featured"><img src="../../../res/images/mentee.png" alt="" /></a>
									<header>
										<h3>멘티 설문조사</h3>
									</header>
									<p>한 학기동안 멘토링 활동에 대한 설문조사입니다.</p>
									<footer>
										<a href="mentee-survey-list" class="button alt">멘티 설문조사 바로가기</a>
									</footer>
								</section>
							</div>
						</div>
					</section>
				</article>
			</div>
		</div>

		<!-- Footer -->
		<c:import url="../../common/footer.jsp"/>

	</div>

	<!-- Scripts -->
	<c:import url="../../common/scripts.jsp"/>

</body>

</html>
