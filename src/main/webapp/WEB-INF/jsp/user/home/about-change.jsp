<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE HTML>
<html>

<script type="text/javascript">
    <!--
    function add_item() {
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

<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
<script>
    tinymce.init({
        selector: 'text',
        theme_advanced_resizing: false
    });
</script>

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
                <form:form method="post" enctype="multipart/form-data" modelAttribute="about">
                    <!-- Content -->
                    <article class="box post">
                        <a href="#" class="image featured"><img src="../../../res/images/1.jpg" alt="" /></a>
                        <header>
                            <h2>시스템 소개</h2>
                        </header>
                        <p>
                        <h3 style="color: #d52349">사이트는 로그인 후 사용이 가능합니다. </h3>
                        </p>
                        <c:forEach var="about" items="${about}" varStatus="status">
                            <div>
                                <div class="field">
                                    <input type="hidden" value="${about.a_id}" name="aboutList[${status.index}].a_id"/>
                                    <input type="text" value="${about.a_title}" name="aboutList[${status.index}].a_title"/>
                                    <text id="aboutList[${status.index}].a_contents" name="aboutList[${status.index}].a_contents">${about.a_contents}</text>
                                </div>
                                <br/>
                            </div>
                        </c:forEach>

                        <%--<div id="pre_set" style="display:none">
                            <input type="text" value="" name="a_title"/>
                            <text id="a_contents" name="a_contents"></text>
                            <br/>
                            <button type="button" class="btn btn-outline-secondar btn-sm" value="삭제"
                                    onclick="remove_item(this)">삭제
                            </button>
                            <br><br>
                        </div>

                        <div id="field"></div>
                        <input type="button" class="button alt" value="문항 추가 " onclick="add_item()">
                        <br>
                        <br/>--%>
                        <center>
                            <button type="submit" class="btn btn-light">변경</button>
                            <a href="about" class="button alt">목록으로</a>
                        </center>
                        <br/>
                    </article>
                </form:form>
			</div>
		</div>

		<!-- Footer -->
		<c:import url="../../common/footer.jsp"/>

	</div>

	<!-- Scripts -->
	<c:import url="../../common/scripts.jsp"/>

</body>

</html>
