<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE HTML>
<html>

<!-- Head -->
<c:import url="../../common/head.jsp"/>

<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
<script>
    tinymce.init({
        selector: 'text',
        theme_advanced_resizing : false
    });
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
            <header class="major">
                <h2>Report</h2>
            </header>
            <!-- Content -->
            <article class="box post">
                <a href="#" class="image featured"><img src="../../../res/images/report.jpg" alt="" width="280px"
                                                        height="500px"/></a>
                <br/>
                <center>
                    <h2 class="major">멘토 도우미 활동 보고서</h2><br/>
                </center>

                <form:form method="post" enctype="multipart/form-data" modelAttribute="report">
                    <div class="field half first">
                        <label>멘토 이름 : ${user.u_name}(${user.u_id})</label>
                    </div>
                    <br/>

                    <div class="field half">
                        <label>멘티 이름</label>
                        <c:forEach var="mentee" items="${mentee}">
                            <td>${mentee.u_name}(${mentee.u_id})</td>
                            </br>
                        </c:forEach>
                    </div>
                    <br/>

                    <div class="field">
                        <label for="r_weeks">주차</label>
                        <form:select path="r_weeks" id="r_weeks">
                            <form:option value="0" label="" selected="selected"/>
                            <form:option value="1" label="1주차"/>
                            <form:option value="2" label="2주차"/>
                            <form:option value="3" label="3주차"/>
                            <form:option value="4" label="4주차"/>
                            <form:option value="5" label="5주차"/>
                            <form:option value="6" label="6주차"/>
                            <form:option value="7" label="7주차"/>
                            <form:option value="8" label="8주차"/>
                            <form:option value="9" label="9주차"/>
                            <form:option value="10" label="10주차"/>
                            <form:option value="11" label="11주차"/>
                            <form:option value="12" label="12주차"/>
                            <form:option value="13" label="13주차"/>
                            <form:option value="14" label="14주차"/>
                            <form:option value="15" label="15주차"/>
                            <form:option value="16" label="16주차"/>
                        </form:select>
                        <br/>
                    </div>

                    <div class="field half first">
                        <label for="r_date">활동 날짜</label>
                        <input id="r_date" type="date">
                    </div>
                    <br/>

                    <div class="field half">
                        <label for="r_time">활동 시간</label>
                        <form:input path="r_time" id="r_time"/>
                    </div>
                    <br/>

                    <div class="field">
                        <label>활동 내용</label>
                        <text id="r_contents" name="r_contents">${report.r_contents}</text>
                    </div>
                    <br/>

                    <div class="field half first">
                        <label>활동 소감</label>
                        <text id="r_review" name="r_review">${report.r_review}</text>
                    </div>
                    <br/>

                    <div class="field half">
                        <label for="r_rank">평점</label>
                        <form:select path="r_rank" id="r_rank">
                            <form:option value="5" label="A" selected="selected"/>
                            <form:option value="4" label="B"/>
                            <form:option value="3" label="C"/>
                            <form:option value="2" label="D"/>
                            <form:option value="1" label="E"/>
                        </form:select>
                        <br/>
                            <label>'C'이하인 경우 사유 명시</label>
                            <text id="r_reason" name="r_reason">${report.r_reason}</text>
                        <br/>
                    </div>

                    <div class="field">
                        <label class="item item-input">
                            <span class="input-label">활동 증명 사진 업로드</span>
                            <br/>
                            현재 파일 : <a href=${report.r_photoUrl}>${report.r_photoUrl}</a>
                            <br/>
                            <form:input path="r_photo" id="r_photo" type="file"/>
                        </label>
                    </div>

                    <center>
                        <button type="submit" class="btn btn-light">저장</button>
                        <c:choose>
                            <c:when test="${report.r_id > 0}">
                                <form:hidden path="m_id"/>
                                <button type="submit" name="button" class="btn btn-light" value="delete">삭제</button>
                            </c:when>
                        </c:choose>
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
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"></script>

</body>

</html>
