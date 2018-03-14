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
                    <h2>공지사항 작성</h2>
                </header>

                <form:form method="post" enctype="multipart/form-data" modelAttribute="notice">
                    <div class="field">
                        <label for="n_title">제목</label>
                        <form:input path="n_title" id="n_title"/>
                    </div>
                    <br/>
                    <div class="field">
                        <label>내용</label>
                        <text id="n_contents" name = "n_contents">${notice.n_contents}</text>
                    </div>
                    <br/>
                    <div class="field">
                        <label for="n_file">파일 업로드</label>
                        현재 파일 : <a href=${notice.n_fileUrl}>${notice.n_fileUrl}</a>
                        <form:input path="n_file" id="n_file" type="file"/>
                    </div>
                    <br/>
                    <center>
                        <c:choose>
                            <c:when test="${notice.n_id > 0}">
                                <form:hidden path="n_id"/>
                                <div class="field">
                                    <button type="submit" class="btn btn-light">수정</button>
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
