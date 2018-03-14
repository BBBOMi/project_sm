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

                <form:form method="post" enctype="multipart/form-data" modelAttribute="report">

                    <center>
                        <h2 class="major">${report.r_weeks} 주차 활동 보고서</h2><br/>
                    </center>
                    <br/>

                    <div class="field">
                        <label>확인 상태</label>
                        <c:choose>
                            <c:when test="${report.r_type == 0}">
                                미확인
                            </c:when>
                            <c:when test="${report.r_type == 1}">
                                확인
                            </c:when>
                            <c:when test="${report.r_type == 2}">
                                반려
                            </c:when>
                        </c:choose>
                    </div>
                    <br/>

                    <div class="image">
                        <img src=${report.r_photoUrl} align="center"/>
                    </div>
                    <br/>

                    <div class="field half first">
                        <br/>
                        <a href="mypage?id=${report.r_writer}">멘토 이름 : ${report.r_writerName}(${report.r_writerId})</a>
                    </div>
                    <br/>

                    <div class="field half">
                        <label>멘티 이름</label>
                        <c:forEach var="mentee" items="${mentee}">
                            <a href="mypage?id=${mentee.ID}">${mentee.u_name}(${mentee.u_id})</a>
                            </br>
                        </c:forEach>
                    </div>
                    <br/>


                    <div class="field half first">
                        <label>활동 날짜</label>
                        <label>${report.r_date}</label>
                    </div>
                    <br/>

                    <div class="field half">
                        <label>활동 시간</label>
                        <label>${report.r_time}시간</label>
                    </div>
                    <br/>

                    <div class="field">
                        <label>활동 내용</label>
                            ${report.r_contents}
                    </div>
                    <br/>

                    <div class="field half first">
                        <label>활동 소감</label>
                            ${report.r_review}
                    </div>
                    <br/>

                    <div class="field half">
                        <label>평점</label>
                        <label>${report.r_rank}</label>
                        <br/>
                            <label>'C'이하인 경우 사유 명시</label>
                                ${report.r_reason}
                        <br/>
                    </div>

                    <div class="field">
                        <label>관리자 코멘트 입력</label>
                        <text id="r_comment" name="r_comment">${report.r_comment}</text>
                    </div>
                    <br/>

                    <center>
                        <button type="submit" name="button" class="btn btn-light" value="download">보고서 다운로드</button>
                        <button type="submit" name="button" class="btn btn-light" value="ok">보고서 확인</button>
                        <button type="submit" name="button" class="btn btn-light" value="no">보고서 반려</button>
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
