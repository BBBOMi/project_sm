<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE HTML>
<html>

<!-- Head -->
<c:import url="../../common/head.jsp"/>

<script type="text/javascript">
    <!--
    function add_item(index) {
        // pre_set 에 있는 내용을 읽어와서 처리..
        var div = document.createElement('div');
        div.innerHTML = document.getElementById('pre_set').innerHTML;
        document.getElementById('field').appendChild(div);
    }

    function remove_item(obj) {
        // obj.parentNode 를 이용하여 삭제
        document.getElementById('field').removeChild(obj.parentNode);
    }

    //-->
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

            <!--멘토 설문조사-->
            <article id="mentor_survey">
                <a href="#" class="image featured"><img src="images/mentor.png" alt=""/></a>
                <header>
                    <h2>멘토 설문조사</h2>
                </header>
                <form:form method="post" modelAttribute="mentoSurvey">
                    <c:forEach var="s1" items="${s1}" varStatus="status">
                        <div>
                            <div class="field">
                                <input type="hidden" value="${s1.s1_id}" name="mentoSurveyList[${status.index}].s1_id"/>
                                <label>${s1.s1_id}번 항목</label>
                                <input type="text" value="${s1.s1_title}" name="mentoSurveyList[${status.index}].s1_title"/>
                            </div>
                            <br/>
                        </div>
                    </c:forEach>

                    <div id="pre_set" style="display:none">
                        <input type="text" value="" name="s1_title"/>
                        <br/>
                        <button type="button" class="btn btn-outline-secondar btn-sm" value="삭제"
                                onclick="remove_item(this)">삭제
                        </button>
                        <br><br>
                    </div>

                    <div id="field"></div>
                    <input type="button" class="button alt" value="문항 추가 " onclick="add_item(${index})">
                    <br>
                    <center>
                        <button type="submit" class="btn btn-light">변경</button>
                        <a href="survey" class="button alt">목록으로</a>
                    </center>
                    <br/>
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
