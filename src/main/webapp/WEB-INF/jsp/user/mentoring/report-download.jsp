<%@ page import="com.skhu.sm.dto.Report" %>
<%@ page language="java" contentType="application/vnd.word;charset=euc-kr" pageEncoding="euc-kr" %>
<%
    Report report = (Report) request.getAttribute("report");
    String fileName = new String(report.getA_name().getBytes("euc-kr"),"8859_1");
    String temp = new String("주차".getBytes("euc-kr"),"8859_1");
    String name = fileName + "_" + report.getR_weeks() + temp + "_report";

    response.setHeader("Content-Disposition", "attachment;filename=" + name + ".doc");
    //response.setHeader("Content-Disposition", "attachment;filename=" + name + ".xls");
    response.setHeader("Content-Description", "JSP Generated Data");
    //response.setContentType("application/vnd.ms-excel");
    response.setContentType("application/vnd.ms-word");

%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h3>${report.r_weeks} 주차 활동 보고서</h3>
    <center>
    <table board="1">
        <tbody>
            <tr>
                <td>이미지</td>
                <td><img src=${report.r_photoUrl} style="width: 100px; height: 100px;"/></td>
            </tr>
            <tr>
                <td>확인 상태</td>
                <td>
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
                </td>
            </tr>
            <tr>
                <td>멘토 이름</td>
                <td>${report.r_writerName}(${report.r_writerId})</td>
            </tr>
            <tr>
                <td>멘토 이름</td>
                <td>멘토 학번</td>
            </tr>
            <c:forEach var="mentee" items="${mentee}">
            <tr>
                <td>${mentee.u_name}</td>
                <td>${mentee.u_id}</td>
            </tr>
            </c:forEach>
            <tr>
                <td>활동 날짜</td>
                <td>${report.r_date}</td>
            </tr>
            <tr>
                <td>활동 시간</td>
                <td>${report.r_time}시간</td>
            </tr>
            <tr>
                <td>활동 내용</td>
                <td>${report.r_contents}</td>
            </tr>
            <tr>
                <td>활동 소감</td>
                <td>${report.r_review}</td>
            </tr>
            <tr>
                <td>평점</td>
                <td>${report.r_rank}</td>
            </tr>
            <tr>
                <td>'C'이하인 경우 사유 명시</td>
                <td>${report.r_reason}</td>
            </tr>
            <tr>
                <td>관리자 코멘트</td>
                <td>${report.r_comment}</td>
            </tr>
        </tbody>
    </table>
    </center>