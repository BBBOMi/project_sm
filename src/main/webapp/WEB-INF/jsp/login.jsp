<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE HTML>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<html>

<head>
    <title>SM 사업 시스템</title>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="res/login/assets/css/main.css"/>
    <noscript>
        <link rel="stylesheet" href="res/login/assets/css/noscript.css"/>
    </noscript>
</head>

<body>

<!-- Wrapper -->
<div id="wrapper">

    <h1>소프트웨어공학과</h1>

    <!-- Header -->
    <header id="header">
        <div class="content">
            <div class="inner">
                <h1>SM System</h1>


                <p><%=request.getAttribute("error")%></p>
                <p><c:if test="${findError}">비밀번호 초기화 실패</c:if></p>
                <form method="post" action="/login-processing">
                    <label>
                        <input type="text" class="form-control" placeholder="id" name="id" autofocus="autofocus">
                    </label>
                    <label>
                        <input type="password" class="form-control" placeholder="password" name="password">
                    </label>
                    <button type="submit">Login</button>
                </form>

            </div>
        </div>
        <nav>
            <ul>
                <li><a href="#intro">Intro</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#password">Finds</a></li>
            </ul>
        </nav>
    </header>

    <!-- Main -->
    <div id="main">

        <!-- Intro -->
        <article id="intro">
            <h2 class="major">SM System Introduce</h2>
            <span class="image main"><img
                    src="res/login/images/mentoring.jpg" alt=""/></span>
            <p>SM 사업이란?</p>
            <p>소프트웨어공학과 멘토링 사업이라는 말로 성공회대 소프트웨어공학과 내에서 선후배간 지식 공유가 이루어지는 것을
                의미한다.</p>
            <p>장학금 지급 기준</p>
            <p>
                ＊1차 보고서 이후 1차장학금을 지급한다.<br> ＊2차 보고서 이후 활동한 내역, 인증샷 등을 참고하여 2차
                장학금을 지급한다.<br> ＊활동 내역 중 인증샷이 없을 경우 무효 처리한다.<br> ＊이 때,
                인증샷은 조원, 조장 모두 포함되어 있어야 하며 불가피한 사유가 있을 경우 인증샷에 없더라도 인증샷으로 인정한다.
            </p>
            <p>팀 선별 방법</p>
            <p>
                ＊멘토가 팀별 주제를 계획한 것을 계획서에 적어 증명자료와 함께 제출한다.<br> ＊학생회에서 멘토 계획서를
                검토 후 멘토로 선정한다.<br> ＊1학년 과정지도 수업에서 학생회가 참여하여 팀별 주제 발제 후 1학년이
                원하는 팀으로 참여한다. (1학년 필수 참여)<br> ＊2학년의 경우 카톡으로 공지 후 개인적으로 연락한다.
                (2학년 선택 참여)<br> ＊인원 분배의 경우 가위바위보를 통하여 선정한다.
            </p>
            <p>멘토 기준</p>
            <p>
                1) C언어, 이산수학, java, 데이터베이스개론의 경우 해당 과목 성적이 B+ 이상이어야 한다.<br> 2)
                그 외의 주제의 경우 본인이 전문 지식을 가르칠 수준이라는 것을 증빙할 수 있는 자료(활동 자료 등)가 필요하다.
            </p>
            <p>팀별 스터디</p>
            <p>
                ＊1학년 : 이산수학, C프로그래밍, 문서작성(PPT 등), 보안, html<br> ＊2학년 : java,
                데이터베이스개론, html, 보안<br> ＊지정된 주제 외에도 선택할 수 있지만 스터디라는 명목에서 벗어난다고
                판단될 경우 멘토에서 제외한다.<br> ＊1차 보고서 제출 시 팀 별 과제 중간 보고서 함께 제출한다.<br>
                ＊2차 보고서 제출 시 팀 별 과제 최종 보고서 함께 제출한다.<br> ＊중간 보고서 미 제출 시 활동비,
                장학금을 지급하지 않는다.
            </p>
            <p>멘티 선택 항목 (2가지 중 1가지는 반드시 해야 함)</p>
            <p>
                ＊컨퍼런스를 1학기 1회 이상 참여한다.<br> ＊학생회 사업을 2회 이상 참여한다. (개강파티, 해오름제, 과
                MT, 대동제, 종강파티)
            </p>
        </article>

        <!-- About -->
        <article id="about">
            <h2 class="major">시스템 소개</h2>
            <span class="image main"><img src="res/login/images/1.jpg" alt=""/></span>
            <p>
            <h3 style="color: red">사이트는 로그인 후 사용이 가능하다.</h3>
            </p>
            <p>
            <h3>멘토 신청 방법</h3>
            </p>
            <p>
                -멘토를 원하는 학생은 신청 기간 내에 아래의 내용으로 신청한다.<br> A. 팀명<br> B. 주제<br>
                C. 팀 광고(글, 사진, 동영상 링크 가능)<br> D. 자격 증명: 주제와 관련된 포트폴리오, 멘토 자격을
                증명할 수 있는 증명서 이미지 등
            </p>

            <p>
            <h3>멘티 신청 방법</h3>
            - 멘티를 신청할 학생은 신청 기간 내에 원하는 멘토를 지원한다.
            </p>

            <p>
            <h3>메일 발송 방법</h3>
            - 멘토는 일괄적으로 멘티에게 메일을 보낼 수 있다.<br> A. 멘티는 멘토에게 메일을 보낼 수 있다.
            </p>

            <p>
            <h3>보고서 제출 방법</h3>
            - 멘토는 정해진 기간 내에, 정해진 횟수 이상 모임을 가지고, 모임 결과 보고서를 제출한다.<br> A. 모임
            장소, 모임 시간, 모임 주제, 참석자, 모임 증명 자료 (사진)
            </p>

            <p>
            <h3>설문조사 방법</h3>
            - 멘토 & 멘티는 멘토 사업이 끝난 후 설문조사를 한다.<br> A. 멘토 사업이 끝난 후 설문조사 기간 내에
            설문조사를 한다.
            </p>

        </article>

        <!-- Password -->
        <article id="password">
            <h2 class="major">Find out password</h2>
            <form method="post" action="/find">
                <div class="field half first">
                    <label for="name">이름</label>
                    <input type="text" name="name" id="name" placeholder="이름"/>
                </div>
                <div class="field half">
                    <label for="id">학번</label>
                    <input type="text" name="id" id="id" placeholder="학번"/>
                </div>
                <div class="field half first">
                    <label for="email">Email</label>
                    <input type="text" name="email" id="email" placeholder="Email"/>
                </div>
                <div class="field half">
                    <label for="btn"><br></label>
                    <button type="submit" formaction="/find" name="button" id="btn" value="email">Email 인증</button>
                </div>
                <br/> <br/>
                <p>*초기 비밀번호는 s학번 입니다</p>
            </form>
        </article>

    </div>

    <!-- Footer -->
    <footer id="footer">
        <p class="copyright">
            &copy; 소프트웨어공학과 : <a href="http://sw.skhu.ac.kr" style="color: white;">sw.skhu.ac.kr</a>
        </p>
    </footer>
</div>

<!-- BG -->
<div id="bg"></div>

<!-- Scripts -->
<script src="res/login/assets/js/jquery.min.js"></script>
<script src="res/login/assets/js/skel.min.js"></script>
<script src="res/login/assets/js/util.js"></script>
<script src="res/login/assets/js/main.js"></script>

</body>

</html>