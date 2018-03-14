<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE HTML>
<html>
<!-- Head -->
<c:import url="../../common/head.jsp"/>

<body class="left-sidebar">
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
                <h2>My Page</h2>
            </header>
            <div class="row">
                <div class="4u 12u(mobile)">

                    <section class="box">
                        <header>
                            <h3>연결 사이트</h3>
                        </header>
                        <p>클릭하면 해당 페이지로 이동합니다</p>
                        <ul class="divided">
                            <li><a href="http://report.skhu.net/">과제 제출 시스템</a></li>
                            <li><a href="http://www.skhu.ac.kr/main.aspx">성공회 대학교 페이지</a></li>
                            <li><a href="http://sw.skhu.ac.kr/">소프트웨어공학과 홈페이지</a></li>
                            <li><a href="http://cafe.naver.com/skhusoft">소프트웨어공학과 네이버 카페</a></li>
                        </ul>
                    </section>

                    <sec:authorize access="hasRole('ROLE_USER')">
                        <section class="box">
                            <center><a href="exit" class="button alt">회원 탈퇴</a></center>
                        </section>
                    </sec:authorize>

                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <section class="box">
                            <center><a href="exit?id=${user.ID}" class="button alt">해당 회원 탈퇴</a></center>
                        </section>
                    </sec:authorize>


                </div>
                <div class="8u 12u(mobile) important(mobile)">

                    <!-- Content -->
                    <article class="box post">

                        <form:form method="post" enctype="multipart/form-data" modelAttribute="user">
                            <div class="image">
                                <img src=${user.u_photoUrl} align="center"/>
                            </div>

                            <div class="field">
                                <label for="u_photo">사진 업로드</label>
                                <form:input path="u_photo" id="u_photo" type="file"/>
                            </div>

                            <br/><br/>
                            <div class="field">
                                <label>이름 : ${user.u_name}</label>
                            </div>
                            <br/>

                            <div class="field">
                                <label>학번 : ${user.u_id}</label>
                            </div>
                            <br/>

                            <div class="field">
                                <label for="u_password">비밀번호</label>
                                <form:input path="u_password1" id="u_password" placeholder="변경할 비밀번호"/>
                                </br>
                                <form:input path="u_password2" id="u_password" placeholder="비밀번호 확인"/>
                            </div>
                            <br/>

                            <sec:authorize access="hasRole('ROLE_USER')">

                                <div class="field" style="left: auto">
                                    <label for="d_id1">학과</label>
                                        <form:select path="d_id1" id="d_id1">
                                            <form:option value="1" label="신학과" selected="selected"/>
                                            <form:option value="2" label="영어학과"/>
                                            <form:option value="3" label="일어일본학과"/>
                                            <form:option value="4" label="중어중국학과"/>
                                            <form:option value="5" label="사회복지학과"/>
                                            <form:option value="6" label="사회과학부"/>
                                            <form:option value="7" label="신문방송학과"/>
                                            <form:option value="8" label="경영학부"/>
                                            <form:option value="9" label="디지털컨텐츠학과"/>
                                            <form:option value="10" label="컴퓨터공학과"/>
                                            <form:option value="11" label="소프트웨어공학과"/>
                                            <form:option value="12" label="정보통신공학과"/>
                                            <form:option value="13" label="글로컬IT학과"/>
                                        </form:select>
                                </div>

                                <br/>

                                <div class="field">
                                    <label for="d_id2">복수전공</label>
                                    <form:select path="d_id2" id="d_id2">
                                        <form:option value="0" label="없음" selected="selected"/>
                                        <form:option value="1" label="신학과"/>
                                        <form:option value="2" label="영어학과"/>
                                        <form:option value="3" label="일어일본학과"/>
                                        <form:option value="4" label="중어중국학과"/>
                                        <form:option value="5" label="사회복지학과"/>
                                        <form:option value="6" label="사회과학부"/>
                                        <form:option value="7" label="신문방송학과"/>
                                        <form:option value="8" label="경영학부"/>
                                        <form:option value="9" label="디지털컨텐츠학과"/>
                                        <form:option value="10" label="컴퓨터공학과"/>
                                        <form:option value="11" label="소프트웨어공학과"/>
                                        <form:option value="12" label="정보통신공학과"/>
                                        <form:option value="13" label="글로컬IT학과"/>
                                    </form:select>
                                </div>
                                <br/>

                                <div class="field">
                                    <label for="d_id3">부전공</label>
                                    <form:select path="d_id3" id="d_id3">
                                        <form:option value="0" label="없음" selected="selected"/>
                                        <form:option value="1" label="신학과"/>
                                        <form:option value="2" label="영어학과"/>
                                        <form:option value="3" label="일어일본학과"/>
                                        <form:option value="4" label="중어중국학과"/>
                                        <form:option value="5" label="사회복지학과"/>
                                        <form:option value="6" label="사회과학부"/>
                                        <form:option value="7" label="신문방송학과"/>
                                        <form:option value="8" label="경영학부"/>
                                        <form:option value="9" label="디지털컨텐츠학과"/>
                                        <form:option value="10" label="컴퓨터공학과"/>
                                        <form:option value="11" label="소프트웨어공학과"/>
                                        <form:option value="12" label="정보통신공학과"/>
                                        <form:option value="13" label="글로컬IT학과"/>
                                    </form:select>
                                </div>
                                <br/>

                                <div class="field">
                                    <label>학년</label>
                                    <form:radiobutton path="u_grade" value="1"/>1학년
                                    <form:radiobutton path="u_grade" value="2"/>2학년
                                    <form:radiobutton path="u_grade" value="3"/>3학년
                                    <form:radiobutton path="u_grade" value="4"/>4학년
                                </div>

                                <br/>
                            </sec:authorize>
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                                <div class="field">
                                    <label for="d_id1">소속</label>
                                    <form:select path="d_id1" id="d_id1">
                                        <form:option value="0" label="없음" selected="selected"/>
                                        <form:option value="1" label="신학과"/>
                                        <form:option value="2" label="영어학과"/>
                                        <form:option value="3" label="일어일본학과"/>
                                        <form:option value="4" label="중어중국학과"/>
                                        <form:option value="5" label="사회복지학과"/>
                                        <form:option value="6" label="사회과학부"/>
                                        <form:option value="7" label="신문방송학과"/>
                                        <form:option value="8" label="경영학부"/>
                                        <form:option value="9" label="디지털컨텐츠학과"/>
                                        <form:option value="10" label="컴퓨터공학과"/>
                                        <form:option value="11" label="소프트웨어공학과"/>
                                        <form:option value="12" label="정보통신공학과"/>
                                        <form:option value="13" label="글로컬IT학과"/>
                                    </form:select>
                                </div>
                                <br/>
                            </sec:authorize>


                            <div class="field">
                                <label for="u_email">e-mail</label>
                                <form:input path="u_email" id="u_email"/>
                            </div>
                            <br/>

                            <div class="field">
                                <label for="u_tel">전화번호</label>
                                <form:input path="u_tel" id="u_tel"/>
                            </div>
                            <br/>

                            <center>
                                <button type="submit" class="btn btn-light">수정</button>
                            </center>

                        </form:form>

                    </article>
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
