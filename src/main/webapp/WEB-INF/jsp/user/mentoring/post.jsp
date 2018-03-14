<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML>
<html>

<!-- Head -->
<c:import url="../../common/head.jsp"/><!DOCTYPE HTML>

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
                    <h2>글 작성</h2>
                </header>

                <form:form method="post" enctype="multipart/form-data" modelAttribute="board">
                    <div class="field">
                        <label for="b_title">제목</label>
                        <form:input path="b_title" id="b_title"/>
                    </div>
                    <br/>
                    <div class="field">
                        <label>내용</label>
                        <text id="b_contents" name = "b_contents">${board.b_contents}</text>
                    </div>
                    <br/>
                    <div class="field">
                        <label class="item item-input">
                            <span class="input-label">파일 업로드</span>
                            <br/>
                            <form:hidden path="b_fileUrl"/>
                            <form:input path="b_file" id="b_file" type="file"/>
                        </label>
                    </div>
                    <br/>
                    <center>
                        <c:choose>
                            <c:when test="${board.b_id > 0}">
                              <%--  <c:if test="${mento}">

                            </c:if>--%>
                                <form:hidden path="b_id"/>
                                <div class="field">
                                    <button type="submit" class="btn btn-light">수정하기</button>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="field">
                                    <button type="submit" class="btn btn-light">작성</button>
                                </div>
                            </c:otherwise>
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
</body>

</html>
