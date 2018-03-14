<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags"
           prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<!DOCTYPE HTML>
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

            <div class="row">
                <div class="12u">

                    <!-- Blog -->
                    <section>
                        <!-- /.col-lg-6 -->
                        <header class="major">
                            <h2>멘토 신청자 리스트</h2>
                        </header>


                        <div class="box">
                            <div class="row">

                                <div class="panel-group" id="accordion" role="tablist"
                                     aria-multiselectable="true">

                                    <c:forEach var="mentolist" items="${apply}"
                                               varStatus="status">
                                        <form:form method="post" action="/mento-list">

                                            <div class="panel panel-default">

                                                <div class="panel-heading" role="tab" id="headingOne">
                                                    <h4 class="panel-title">

                                                        <a class="collapsed" data-toggle="collapse"
                                                           data-parent="#accordion"
                                                           href="#collapse${status.index }" aria-expanded="flase"
                                                           aria-controls="collapseOne"> ${mentolist.u_name}의
                                                            멘토신청서
                                                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                                        </a>
                                                    </h4>
                                                </div>

                                                <div id="collapse${status.index }"
                                                     class="panel-collapse collapse" role="tabpanel"
                                                     aria-labelledby="headingOne">
                                                    <div class="panel-body">
                                                        <!-- 보고서 양식 내용 -->
                                                        <section class="box">
                                                            <header>
                                                                <center>
                                                                    <h3>멘토 신청서</h3>
                                                                </center>
                                                            </header>
                                                            <br/> <label for="a_title">스터디 주제 : ${mentolist.a_title} / ${mentolist.a_sub}</label><br/>
                                                            <br/> <label for="name">이름
                                                            : ${mentolist.u_name}</label><br/>
                                                            <br/> <label for="grade">학년
                                                            : ${mentolist.u_grade}</label><br/>
                                                            <br/> <label for="no">학번 : ${mentolist.u_id}</label><br/>
                                                            <br/> <label for="phone no">연락처 : ${mentolist.u_tel}</label><br/>
                                                            <br/> <label for="group">조 이름
                                                            : ${mentolist.a_name}</label><br/>
                                                            <br/> <label for="purpose">스터디목적
                                                            : ${mentolist.a_aim}</label><br/>
                                                            <br/> <label for="contents">스터디내용(예상 결과물 포함)
                                                            : ${mentolist.a_contents}</label><br/>
                                                            <br/> <label for="method">스터디 방법
                                                            : ${mentolist.a_method}</label><br/>
                                                            <br/> <label for="time">가능한 시간대(한주에 2시간 필수)
                                                            : ${mentolist.a_hours}</label><br/>
                                                            <br/> <label for="num">인원 수
                                                            : ${mentolist.a_num}</label><br/>
                                                            <br/> <label for="level">해당과목 성적
                                                            : ${mentolist.a_rank}</label><br/>
                                                            <br/>

                                                            <footer>
                                                                <ul class="actions">
                                                                    <li>
                                                                        <a href="${mentolist.a_fileUrl}" class="button icon fa-file-text btn-sm" style="font-size: 15px; float: left">포트폴리오보기</a>
                                                                    </li>
                                                                    <input type="hidden" name="a_id" value="${mentolist.a_id }"/>
                                                                    <input type="hidden" name="id" value="${mentolist.ID}"/>
                                                                    <input type="submit" name="button" class="btn-sm" value="거절" style="font-size: 15px; margin: 1px 2px 3px 4px; float: right"/>
                                                                    <input type="submit" name="button" class="btn-sm" value="승인" style="font-size: 15px; margin: 1px 2px 3px 4px; float: right"/>
                                                                </ul>
                                                            </footer>

                                                        </section>
                                                    </div>
                                                </div>
                                            </div>

                                        </form:form>
                                    </c:forEach>
                                </div>
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
