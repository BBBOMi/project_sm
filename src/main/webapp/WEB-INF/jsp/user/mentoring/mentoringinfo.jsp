<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE HTML>
<html>

<!-- Head -->
<c:import url="../../common/head.jsp"/>

<body class="right-sidebar">
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
            <div class="row">
                <div class="8u 12u(mobile)" style="float:right;">

                    <form:form method="get" modelAttribute="mentolist">

                        <!-- Content -->
                        <article class="box post">
                            <%--<a href="#" class="image featured"><img
                                    src=${mentolist.a_photoUrl } alt="사진"/></a>--%>
                            <header>
                                <h3>${mentolist.a_title}/ ${mentolist.a_sub}</h3><br/>
                                <h2>${mentolist.a_name}</h2><br/>
                                <p>${mentolist.u_name}</p>
                            </header>
                            <p>
                                <b>목적</b><br/> ${mentolist.a_aim}
                            </p>
                            <p>
                                <b>내용</b><br/> ${mentolist.a_contents}
                            </p>
                            <p>
                                <b>방법</b><br/> ${mentolist.a_method}
                            </p>

                        </article>

                    </form:form>
                </div>

                <div class="4u 12u(mobile)" style="float:left;">
                    <!-- Sidebar -->
                    <section class="box">
                        <%--<a href="#" class="image featured"><img src=${mentolist.u_photoUrl} alt="안나옴"/></a>--%>
                        <header>
                            <h3>${mentolist.u_name}</h3>
                        </header>
                        <p>학과: ${mentolist.d_id1}</p>
                        <p>${mentolist.u_id} / ${mentolist.u_grade}학년</p>
                        <p>연락처: ${mentolist.u_email}</p>

                        <footer>
                            <form method="POST">
                                <ul class="actions">
                                    <input type="hidden" name="a_id" value="${mentolist.a_id}"/>
                                    <c:if test="${check}">
                                        <center>
                                            <button type="submit" name="button" class="button alt" value="신청하기">신청하기
                                            </button>
                                        </center>
                                    </c:if>
                                </ul>
                            </form>
                        </footer>
                    </section>
                    <section class="box">
                        <header>
                            <h3>신청현황</h3>
                        </header>
                        <div class="progress">
                            <div class="progress-bar progress-bar-danger"
                                 role="progressbar" aria-valuenow="${percent}" aria-valuemin="0"
                                 aria-valuemax="100" style="width: ${percent}%;">${percent}%
                            </div>
                        </div>
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
