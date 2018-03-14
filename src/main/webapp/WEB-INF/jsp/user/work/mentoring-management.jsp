<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE HTML>
<html>

<!-- Head -->
<c:import url="../../common/head.jsp"/>

<script type="text/javascript">
    function check() {
        if (document.search.keyWord.value == '') {
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
            <c:import url="../../common/menu.jsp"/>

        </div>
    </div>

    <!-- Main -->
    <div id="main-wrapper">
        <div class="container">

            <div class="row">
                <div class="12u">

                    <!-- Portfolio -->
                    <section>
                        <header class="major">
                            <h2>멘토링 목록</h2>
                        </header>

                        <nav class="navbar navbar-expand-lg navbar-light bg-light">
                            <form class="form-inline my-2 my-lg-0" style="margin: 4px;" name="search" method="get"
                                  action="#" onsubmit="return check()">
                                <button class="btn btn-outline-success my-2 my-sm-0" type="submit"
                                        style="margin: 1px 2px 3px 4px; float:right">Search
                                </button>
                                <input class="form-control mr-sm-6" type="text"
                                       style="margin: 1px 2px 3px 4px; float:right" name="keyWord" placeholder="Search"
                                       aria-label="Search">
                            </form>
                        </nav>
                        <br/>

                        <div class="row">

                            <c:forEach var="mentolist" items="${mentolist}">
                                <div class="4u 12u(mobile)">
                                    <section class="box">
                                        <%--<a href="#" class="image featured"><img src=${mentolist.a_photoUrl}/></a>--%>
                                        <header>
                                            <h3>${mentolist.a_name}</h3>
                                        </header>
                                        <p>${mentolist.a_title}</p>
                                        <p>${mentolist.a_sub}</p>
                                        <p>${mentolist.a_aim}</p>
                                        <p>멘토 : ${mentolist.a_mentoName}</p>
                                        <footer>
                                            <a href="mymentoring?m_id=${mentolist.m_id}" class="button alt">들여다보기</a>
                                        </footer>
                                    </section>
                                </div>
                            </c:forEach>

                        </div>

                    </section>

                </div>
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
