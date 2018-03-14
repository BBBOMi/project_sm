<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE HTML>
<html>

<!-- Head -->
<c:import url="../../common/head.jsp" />

<body class="no-sidebar">
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header-wrapper">
			<div id="header">

				<!-- Menu -->
				<c:import url="../../common/menu.jsp" />

			</div>
		</div>

		<!-- Main -->
		<div id="main-wrapper">
			<div class="container">

				<!-- Content -->
				<article class="box post">
					<a href="#" class="image featured"><img src="../../../res/images/1.jpg" alt="" /></a>
					<header>
						<h2>시스템 소개</h2>
					</header>
					<p>
						<h3 style="color: #d52349">사이트는 로그인 후 사용이 가능합니다. </h3>
                    </p>
                    <c:forEach var="about" items="${about}">
                        <p>
                            <h3>${about.a_title}</h3>
                        <br/>
                            ${about.a_contents}
                        </p>
                    </c:forEach>
				</article>

				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<center>
						<a href="about-change" class="button">수정하기</a>
					</center>
				</sec:authorize>
			</div>
		</div>

		<!-- Footer -->
		<c:import url="../../common/footer.jsp" />

	</div>

	<!-- Scripts -->
	<c:import url="../../common/scripts.jsp" />

</body>

</html>
