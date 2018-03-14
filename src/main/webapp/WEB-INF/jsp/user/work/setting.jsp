<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE HTML>
<html>

<!-- Head -->
<c:import url="../../common/head.jsp"/>

<style>
    .form-control {
        margin: 5px
    }
</style>
<script>
    function submit01_click() {
        alert('신청기간이 변경되었습니다.');
    }
</script>

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
                <form:form method="post" modelAttribute="setting">
                    <header>
                        <h2>신청 기간 설정</h2>
                        <br/>

                    </header>

                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>시작 날짜</th>
                            <th>종료 날짜</th>
                            <th>설정</th>
                        </tr>
                        </thead>
                        <tbody>

                        <tr>
                            <td>멘토 신청 기간</td>
                            <td><form:input type="date" path="mento_start_string" id="mento_start_string"
                                            value="${setting.mento_start_string}"/></td>
                            <td><form:input type="date" path="mento_end_string" id="mento_end_string"
                                            value="${setting.mento_end_string}"/></td>
                            <td>
                                <label class="radio-inline">
                                    <input type="radio" name="mento_type" value="1"
                                    <c:choose>
                                    <c:when test="${setting.mento_type == 1}">
                                           checked
                                    </c:when>
                                    </c:choose>
                                    > 활성화
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="mento_type" value="0"
                                    <c:choose>
                                    <c:when test="${setting.mento_type == 0}">
                                           checked
                                    </c:when>
                                    </c:choose>
                                    >
                                    비활성화
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>멘티 신청 기간</td>
                            <td><form:input type="date" path="mentee_start_string" id="mentee_start_string"
                                            value="${setting.mentee_start_string}"/></td>
                            <td><form:input type="date" path="mentee_end_string" id="mentee_end_string"
                                            value="${setting.mentee_end_string}"/></td>
                            <td>
                                <label class="radio-inline">
                                    <input type="radio" name="mentee_type" value="1"
                                    <c:choose>
                                    <c:when test="${setting.mentee_type == 1}">
                                           checked
                                    </c:when>
                                    </c:choose>
                                    >
                                    활성화
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="mentee_type" value="0"
                                    <c:choose>
                                    <c:when test="${setting.mentee_type == 0}">
                                           checked
                                    </c:when>
                                    </c:choose>
                                    > 비활성화
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>설문 조사 기간</td>
                            <td><form:input type="date" path="survey_start_string" id="survey_start_string"
                                            value="${setting.survey_start_string}"/></td>
                            <td><form:input type="date" path="survey_end_string" id="survey_end_string"
                                            value="${setting.survey_end_string}"/></td>
                            <td>
                                <label class="radio-inline">
                                    <input type="radio" name="survey_type" value="1"
                                    <c:choose>
                                    <c:when test="${setting.survey_type == 1}">
                                           checked
                                    </c:when>
                                    </c:choose>
                                    >
                                    활성화
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="survey_type" value="0"
                                    <c:choose>
                                    <c:when test="${setting.survey_type == 0}">
                                           checked
                                    </c:when>
                                    </c:choose>
                                    >
                                    비활성화
                                </label>
                            </td>
                        </tr>

                        </tbody>
                    </table>

                    <center>
                        <button type="submit" class="btn btn-light">변경</button>
                    </center>
                </form:form>
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
