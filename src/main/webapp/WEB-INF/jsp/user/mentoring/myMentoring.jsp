<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE HTML>
<html>

<!-- Head -->
<c:import url="../../common/head.jsp"/>

<body class="no-sidebar">

    <c:forEach var="report" items="${report}" varStatus="status">
        <div class="container">
            <!-- 모달 팝업 -->
            <div class="modal fade" id="${status.count}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <c:choose>
                                <c:when test="${report.r_type == 0}">
                                    <span class="label label-warning" style="float:right;">미확인</span>
                                </c:when>
                                <c:when test="${report.r_type == 1}">
                                    <span class="label label-success" style="float:right;">확인</span>
                                </c:when>
                                <c:when test="${report.r_type == 2}">
                                    <span class="label label-danger" style="float:right;">반려</span>
                                </c:when>
                            </c:choose>
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                                    class="sr-only">Close</span></button>
                            <h4 class="modal-title" id="myModalLabel">${report.r_weeks}주차 보고서</h4>
                        </div>
                        <div class="modal-body">

                            <!--모달 팝업 페이지 내용 -->
                            <article class="box post">
                                <img src=${report.r_photoUrl} alt="" width="500px" height="300px"/>
                                <br/>
                                <br/>
                                <center>
                                    <h2 class="major">멘토 도우미 활동 보고서</h2><br/></center>
                                <form method="post" action="#">

                                    <div class="field half first">
                                        <label>멘토</label>
                                        <label>${report.r_writerName}(${report.r_writerUid})</label>
                                    </div>
                                    <br/>

                                    <div class="field half">
                                        <label>멘티 명단</label>
                                        <c:forEach var="mentee" items="${mentee}">
                                            <td>${mentee.u_name}(${mentee.u_id})</td>
                                            </br>
                                        </c:forEach>
                                    </div>
                                    <br/>

                                    <div class="field half first">
                                        <label>활동 날짜</label>
                                            ${report.r_date}
                                    </div>
                                    <br/>

                                    <div class="field half">
                                        <label>활동 시간</label>
                                            ${report.r_time}시간
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
                                            ${report.r_rank}
                                        <br/>
                                        <label>C 이하인 경우 사유</label>
                                            ${report.r_reason}
                                        <br/>
                                    </div>

                                    <div class="field half">
                                        <label>관리자 코멘트</label>
                                            ${report.r_comment}
                                        <br/>
                                    </div>

                                </form>
                            </article>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="button alt" data-dismiss="modal">닫기</button>
                            <c:if test="${mento}">
                                <a href="report?r_id=${report.r_id}" class="button alt">수정</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>

<!-- 모달부분은 코드 맨위에 있어야해서 먼저 뒀고, 아래로 페이지 내용 -->

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

            <!-- Portfolio -->
            <section>
                <header class="major">
                    <h2>나의 멘토방</h2>
                </header>

                <!-- Content -->
                <article class="box post">

                    <header>
                        <h2>자료실</h2>
                    </header>

                    <table class="table">
                        <thead>
                            <tr>
                                <th>no.</th>
                                <th>contents</th>
                                <th>writer</th>
                                <th>date</th>
                            </tr>
                        </thead>
                        <c:forEach var="board" items="${board}">
                            <tr style="cursor:hand;" data-url="view?b_id=${board.b_id}">
                                <td>${board.b_id}</td>
                                <td>${board.b_title}</td>
                                <td>${board.b_writerName}</td>
                                <td>${board.b_date}</td>
                            </tr>
                        </c:forEach>
                    </table>

                    <center>
                        <a href="post?m_id=${mentoring}">
                            <button type="button" class="button alt">글쓰기</button>
                        </a>
                    </center>

                </article>

                <div class="row">

                    <c:forEach var="report" items="${report}" varStatus="status">
                        <div class="4u 12u(mobile)">
                            <section class="box">
                                <a href="#" class="image featured"><img src=${report.r_photoUrl} /></a>
                                <center>
                                    <!-- 모달버튼 -->
                                    <c:choose>
                                <c:when test="${report.r_type == 0}">
                                    <span class="label label-warning" style="float:right;">미확인</span>
                                </c:when>
                                <c:when test="${report.r_type == 1}">
                                    <span class="label label-success" style="float:right;">확인</span>
                                </c:when>
                                <c:when test="${report.r_type == 2}">
                                    <span class="label label-danger" style="float:right;">반려</span>
                                </c:when>
                            </c:choose>
                                    <button type="button" class="button alt" data-toggle="modal" data-target="#${status.count}">
                                        ${report.r_weeks}주차 멘토링 보고서
                                    </button>
                                </center>
                            </section>
                        </div>
                    </c:forEach>

                </div>

            </section>

            <c:if test="${mento}">
            <div>
                <center>
                    <a href="report?m_id=${mentoring}">
                        <button type="button" class="button">작성하기</button>
                    </a>
                </center>
                <br/>
            </div>
            </c:if>

        </div>
    </div>

    <!-- Footer -->
    <c:import url="../../common/footer.jsp"/>

</div>
<!-- Scripts -->
<c:import url="../../common/scripts.jsp"/>

<!-- 모달뷰 띄우기 위한 스크립트 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script>

</body>

</html>
