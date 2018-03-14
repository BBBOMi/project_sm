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

            <!-- Content -->
            <article class="box post">
                <header>
                    <h2>멘토 신청서</h2>
                </header>
                <article id="mento">

                    <form:form method="post" enctype="multipart/form-data" modelAttribute="apply">
                        <div class="row">

                            <div class="col-xs-6" style="left: auto">
                                <label for="a_title">스터디 주제</label>
                                <form:select path="a_title" id="a_title">
                                    <form:option value="프로그래밍" selected="selected"/>
                                    <form:option value="컴퓨터 언어"/>
                                    <form:option value="인문학"/>
                                    <form:option value="어학"/>
                                    <form:option value="교양"/>
                                    <form:option value="시사"/>
                                    <form:option value="공학"/>
                                    <form:option value="수학"/>
                                    <form:option value="과학"/>
                                    <form:option value="예체능"/>
                                    <form:option value="봉사"/>
                                </form:select>
                            </div>

                            <div class="col-xs-6">
                                <label for="a_sub">상세 주제</label>
                                <form:input path="a_sub" id="a_sub"/>
                            </div>

                        </div>
                        <br/>

                        <div class="field half first">
                            <label for="name">이름</label>
                            <input type="text" name="name" id="name" value="${user.u_name}"/>
                        </div>

                        <br/>

                        <div class="field half">
                            <label for="grade">학년</label>
                            <input type="text" name="grade" id="grade" value="${user.u_grade}"/>
                        </div>

                        <br/>

                        <div class="field half first">
                            <label for="u_id">학번</label>
                            <input type="text" name="u_id" id="u_id" value="${user.u_id}"/>
                        </div>

                        <br/>

                        <div class="field half">
                            <label for="address">연락처</label>
                            <input type="text" name="address" id="address" value="${user.u_tel}"/>
                        </div>

                        <br/>

                        <div class="field">
                            <label for="a_name">조 이름</label>
                            <form:input path="a_name" id="a_name"/>
                        </div>

                        <br/>

                        <div class="field">
                            <label>스터디 목적</label>
                            <text id="a_aim" name="a_aim">${apply.a_aim}</text>
                        </div>

                        <br/>

                        <div class="field">
                            <label>스터디 내용(예상 결과물 포함)</label>
                            <text id="a_contents" name="a_contents">${apply.a_contents}</text>
                        </div>

                        <br/>

                        <div class="field">
                            <label>스터디 방법</label>
                            <text id="a_method" name="a_method">${apply.a_method}</text>
                        </div>

                        <br/>
                        <div class="row">
                            <div class="col-xs-6" style="left: auto">
                                <label for="a_hours">가능한 시간대 (한주에 2시간 필수)</label>
                                <form:input path="a_hours" id="a_hours"/>
                            </div>

                            <div class="col-xs-6">
                                <label for="a_num">인원 수</label>
                                <form:select path="a_num" id="a_num">
                                    <form:option value="6" label="6명" selected="selected"/>
                                    <form:option value="5" label="5명"/>
                                    <form:option value="4" label="4명"/>
                                    <form:option value="3" label="3명"/>
                                    <form:option value="2" label="2명"/>
                                    <form:option value="1" label="1명"/>
                                </form:select>
                            </div>
                        </div>

                        <br/>

                        <div class="field">
                            <label for="a_rank">해당과목 성적</label>
                            <form:input path="a_rank" id="a_rank"/>
                        </div>

                        <br/>

                        <div class="field">
                            <label for="a_file">포트폴리오 제출</label>
                            현재 파일 : <a href=${apply.a_fileUrl}>${apply.a_fileUrl}</a>
                            <form:input path="a_file" id="a_file" type="file"/>
                        </div>

                        <br/>

                        <div class="field">
                            <center>
                                <c:choose>
                                    <c:when test="${apply.a_id > 0}">
                                        <form:hidden path="a_id"/>
                                        <div class="field">
                                            <button type="submit" class="btn btn-light">수정하기</button>
                                        </div>
                                        </br>
                                        <a href="apply-drop?a_id=${apply.a_id}">
                                            <button type="button" class="btn btn-light">삭제하기</button>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="field">
                                            <button type="submit" class="btn btn-light">신청</button>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </center>
                        </div>

                    </form:form>

                </article>
                <section>
                    <header>
                        <h3>유의 사항</h3>
                    </header>
                    <p>멘토 기준<br/>
                        1) C언어, 이산수학, java, 데이터베이스개론의 경우 해당 과목 성적이 B+ 이상이어야 한다.<br> 2) 그 외의 주제의 경우 본인이 전문 지식을 가르칠 수준이라는
                        것을 증빙할 수 있는 자료(활동 자료 등)가 필요하다.
                    </p>
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
