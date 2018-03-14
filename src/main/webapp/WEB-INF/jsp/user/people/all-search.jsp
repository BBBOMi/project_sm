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


<style>
    .box_pd {
        display: inline-block;
        width: auto;
        height: auto;
        margin: 8px;
    }

    .box_pd p {
        text-align: center;
        margin-bottom: 0px;
        border-bottom: 1px solid silver;
    }

    ul.cfix {
        display: inline-block;
    }

    ul.cfix li {
        display: inline-block;
    }

    .content {
        margin-left: auto;
        margin-right: auto;
    }

    .cfix {
        margin-left: 45px;
    }

</style>


<body class="left-sidebar">
<div id="page-wrapper">

    <!-- Header -->
    <div id="header-wrapper">
        <div id="header">

            <!-- Menu -->
            <c:import url="../../common/menu.jsp"/>

        </div>
    </div>

    <div id="main-wrapper">
        <div class="container">

            <!-- Content -->
            <article class="box post">

                <center>
                    <section>
                        <header>
                            <h3>이름 검색</h3>
                        </header>
                        <form class="form-inline my-2 my-lg-0" name="search" method="post"
                              action="all-search">
                            <input class="form-control mr-sm-6" type="text" name="keyword" placeholder="이름입력"
                                   aria-label="Search"/>
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
                            </br>
                        </form>
                    </section>
                </center>

                <section>
                    <header>
                        <h3>전체 검색 결과</h3>
                    </header>
                    <table class="table">
                        <tr>
                            <th>학번</th>
                            <th>이름</th>
                            <th>학과</th>
                            <th>학년</th>
                        </tr>
                        <c:forEach var="user" items="${user}">
                            <tr style="cursor: pointer;" data-url="mypage?id=${user.ID}">
                                <td>${user.u_id}</td>
                                <td>${user.u_name}</td>
                                <td>${user.d_name}</td>
                                <td>${user.u_grade}학년</td>
                            </tr>
                        </c:forEach>
                    </table>
                </section>

                <section>
                    <header>
                        <h3>멘토 검색 결과</h3>
                    </header>
                    <table class="table">
                        <tr>
                            <th>학번</th>
                            <th>이름</th>
                            <th>학과</th>
                            <th>학년</th>
                        </tr>
                        <c:forEach var="mento" items="${mento}">
                            <tr style="cursor: pointer;" data-url="mypage?id=${mento.ID}">
                                <td>${mento.u_id}</td>
                                <td>${mento.u_name}</td>
                                <td>${mento.d_name}</td>
                                <td>${mento.u_grade}학년</td>
                            </tr>
                        </c:forEach>
                    </table>
                </section>

                <section>
                    <header>
                        <h3>멘티 검색 결과</h3>
                    </header>
                    <table class="table">
                        <tr>
                            <th>학번</th>
                            <th>이름</th>
                            <th>학과</th>
                            <th>학년</th>
                        </tr>
                        <c:forEach var="mentee" items="${mentee}">
                            <tr style="cursor: pointer;" data-url="mypage?id=${mentee.ID}">
                                <td>${mentee.u_id}</td>
                                <td>${mentee.u_name}</td>
                                <td>${mentee.d_name}</td>
                                <td>${mentee.u_grade}학년</td>
                            </tr>
                        </c:forEach>
                    </table>
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
