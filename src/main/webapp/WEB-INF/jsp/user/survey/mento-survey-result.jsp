<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
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

            <!--멘토 설문조사-->
            <article id="mentor_survey">
                <a href="#" class="image featured">
                    <img src="../../../res/images/mentor.png" alt=""/>
                </a>
                <header>
                    <h2>멘토 설문조사 결과</h2>
                </header>
                <h3>멘토 설문조사 진행률</h3>
                <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-valuenow="${percent}" aria-valuemin="0"
                         aria-valuemax="100" style="width: ${percent}%;">${percent}%
                    </div>
                </div>
                <br>

                <c:forEach var="result" items="${result}">
                    <div>
                        <br>
                        <table class="table">
                            <tbody>
                            <tr>
                                <td>${result.s1_title}</td>
                                <td>응답</td>
                                <td>비율</td>
                            </tr>
                            <tr>
                                <td>매우만족</td>
                                <td>${result.s1_value_5_count}</td>
                                <td>${result.s1_value_5_count / result.s1_value_all_count * 100}%</td>
                            </tr>
                            <tr>
                                <td>만족</td>
                                <td>${result.s1_value_4_count}</td>
                                <td>${result.s1_value_4_count / result.s1_value_all_count * 100}%</td>
                            </tr>
                            <tr>
                                <td>보통</td>
                                <td>${result.s1_value_3_count}</td>
                                <td>${result.s1_value_3_count / result.s1_value_all_count * 100}%</td>
                            </tr>
                            <tr>
                                <td>만족하지않음</td>
                                <td>${result.s1_value_2_count}</td>
                                <td>${result.s1_value_2_count / result.s1_value_all_count * 100}%</td>
                            </tr>
                            <tr>
                                <td>매우만족하지않음</td>
                                <td>${result.s1_value_1_count}</td>
                                <td>${result.s1_value_1_count / result.s1_value_all_count * 100}%</td>
                            </tr>
                            </tbody>
                        </table>
                        <br>
                    </div>
                </c:forEach>

                <br>

                <center>
                    <a href="survey" class="button alt">목록으로</a>
                </center>

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
