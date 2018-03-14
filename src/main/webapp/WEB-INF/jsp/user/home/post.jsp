<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE HTML>
<html>

<!-- Head -->
<c:import url="../../common/head.jsp" /><!DOCTYPE HTML>

<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
<script>
    tinymce.init({
        selector: 'text'
    });
</script>

<body class="no-sidebar">
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header-wrapper">
			<div id="header">

				<!-- Menu -->
				<c:import url="../../common/menu.jsp" />

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

					<form method="post" action="#">
						<div class="field">
							<label for="demo-subject">제목</label>
							<input type="text" name="demo-subject" id="demo-subject">
						</div>
						<br />
						<div class="field">
							<label for="demo-subject">내용</label>
							<text></text>
						</div>
						<br />
						<div class="field">
							<label class="item item-input">
									<span class="input-label">파일 업로드</span>
									<br />
									<input type="file" fileread="text.file">
							</label>
						</div>
						<br />
						<center>
							<div class="field">
								<button type="submit" class="btn btn-light">작성</button>
							</div>
						</center>
					</form>

				</article>

			</div>
		</div>

		<!-- Footer -->
		<c:import url="../../common/footer.jsp" />

	</div>

	<!-- Scripts -->
	<c:import url="../../common/scripts.jsp" />
</body>

</html>
