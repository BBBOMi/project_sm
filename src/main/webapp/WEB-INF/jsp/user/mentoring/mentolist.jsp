<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE HTML>
<html>

<!-- Head -->
<c:import url="../../common/head.jsp" />

<script type="text/javascript">
    function check(){
        if(document.search.keyWord.value==''){
            alert('검색어를 입력하세요');
            document.search.keyWord.focus();
            return false;
        }
    }
</script>

<body class="homepage">
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

				<div class="row">
					<div class="12u">

						<!-- Blog -->
						<section>
							<!-- /.col-lg-6 -->
							<header class="major">
								<h2>멘토 리스트</h2>
							</header>
                            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                                <form class="form-inline my-2 my-lg-0" style="margin: 4px;"
                                      name="search" method="get" action="#" onsubmit="return check()">
                                    <button class="btn btn-outline-success my-2 my-sm-0"
                                            type="submit" style="margin: 1px 2px 3px 4px; float: right">검색</button>
                                    <input class="form-control mr-sm-6" type="text"
                                           style="margin: 1px 2px 3px 4px; float: right" name="keyWord"
                                           placeholder="멘토링검색" aria-label="Search">
                                </form>
                            </nav>

                            <c:forEach var="apply" items="${apply}" varStatus="status">

                                <c:if test="${status.index%2==0}">
                                    <div class="row">
                                </c:if>
                                <div class="6u 12u(mobile)">
                                    <form method="post" action="/mentolist" >
                                        <section class="box">
                                            <%--<a href="#" class="image featured"><img
                                                    src=${apply.a_photoUrl} alt="사진" /></a>--%>
                                            <header>
                                                <h3>[${apply.a_title}] ${apply.a_name}</h3>
                                                <p>${apply.u_name}</p>
                                            </header>
                                            <p>${apply.a_aim}</p>
                                            <footer>
                                                <ul class="actions">
                                                    <input type="hidden" name="a_id" value="${apply.a_id}"/>
                                                    <!--<a href="mentoringinfo"
                                                        class="button icon fa-file-text">멘토링 신청</a>-->
                                                    <button type="submit" name="button" class="button icon fa-file-text" value="자세히보기">자세히보기</button>
                                                </ul>
                                            </footer>
                                        </section>
                                    </form>
                                </div>


                                <c:if test="${status.index%2==1}">
                                    </div>
                                </c:if>
                            </c:forEach>

						</section>

					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<c:import url="../../common/footer.jsp"/>

	</div>

	<!-- Scripts -->
	<c:import url="../../common/scripts.jsp"/>

</body>

</html>
