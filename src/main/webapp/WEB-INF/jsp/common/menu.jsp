<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- Logo -->
<h1><a href="home">SM 사업 시스템</a></h1>

<!-- Nav -->
<sec:authorize access="hasRole('ROLE_USER')">
    <nav id="nav">
        <ul>
            <li>
                <a href="home">Home</a>
                <ul>
                    <li><a href="notice">공지사항</a></li>
                    <li><a href="apply-list">멘토 등록</a></li>
                    <li><a href="mentolist">멘토링 리스트</a></li>
                    <li><a href="survey">설문 조사</a></li>
                </ul>
            </li>
            <li>
                <a href="mentoring-list">Work</a>
            </li>
            <li>
                <a href="email">Email</a>
            </li>
            <li>
                <a href="mypage">myPage</a>
            </li>
            <li>
                <a href="logout">Logout</a>
            </li>
        </ul>
    </nav>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_ADMIN')">
    <nav id="nav">
        <ul>
            <li>
                <a href="home">Home</a>
                <ul>
                    <li><a href="notice">공지사항</a></li>
                    <li><a href="intro">SM 소개</a></li>
                    <li><a href="about">시스템 소개</a></li>
                    <li><a href="email">메일</a></li>
                </ul>
            </li>
            <li>
                <a href="mentoring-management">Work</a>
                <ul>
                    <li><a href="mentoring-management">멘토링 관리</a></li>
                    <li><a href="report-management">보고서 관리</a></li>
                    <li><a href="survey">설문조사 관리</a></li>
                </ul>
            </li>
            <li>
                <a href="mento-list">Mento</a>
                <ul>
                    <li><a href="mento-list">멘토 신청자 관리</a></li>
                    <li><a href="setting">멘토 신청기간 설정</a></li>
                </ul>
            </li>
            <li>
                <a href="all-search">People</a>
                <ul>
                    <li><a href="all-search">회원 검색</a></li>
                    <li><a href="upload">회원 명단 업로드</a></li>
                </ul>
            </li>
            <li><a href="mypage">myPage</a></li>
            <li><a href="logout">Logout</a></li>
        </ul>
    </nav>
</sec:authorize>