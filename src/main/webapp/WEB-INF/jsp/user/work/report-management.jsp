<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!-- Head -->
    <c:import url="../../common/head.jsp"/>

    <style>
        tbody tr:hover {
            background-color: #ffe8ee;
        }

        tbody td:nth-child(2) {
            cursor: pointer;
        }

        tbody td:nth-child(3) {
            cursor: pointer;
        }

        tbody td:nth-child(4) {
            cursor: pointer;
        }

        tbody td:nth-child(5) {
            cursor: pointer;
        }

        a:link {
            text-decoration: none;
        }

        .download a {
            color: white;
            text-decoration: none;
        }
    </style>

    <script type="text/javascript">
        function check() {
            if (document.search.keyWord.value == '') {
                alert('검색어를 입력하세요');
                document.search.keyWord.focus();
                return false;
            }
        }
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            $("#week").change(function() {
                location.href = 'report-management?week=' + $("#week").val() + '&keyWord=' + keyWord;
            });
            $("#year").change(function() {
                location.href = 'report-management?year=' + $("#year").val() + '&keyWord=' + keyWord;
            });
        });
    </script>
</head>
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
            <header class="major">
                <h2>SM 보고서 관리</h2>
            </header>

            <article class="box post">
                <div role="tabpanel">

                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist" id="myTab">
                        <li role="presentation" class="${wholePanel}">
                            <a href="#whole" id="whole-tab" aria-controls="whole" role="tab" data-toggle="tab"
                               aria-expanded="true">전체 보고서</a>
                        </li>
                        <li role="presentation" class="${weeksPanel}">
                            <a href="#weeks" id="weeks-tab" aria-controls="weeks" role="tab" data-toggle="tab"
                               aria-expanded="false">주차별 보고서</a>
                        </li>
                        <li role="presentation" class="${mentorsPanel}">
                            <a href="#mentors" id="mentors-tab" aria-controls="mentors" role="tab" data-toggle="tab"
                               aria-expanded="false">멘토별 보고서</a>
                        </li>
                        <li role="presentation" class="${yearsPanel}"><!-- 방법좀 찾아볼께 -->
                            <a href="#years" id="years-tab" aria-controls="mentos" role="tab" data-toggle="tab"
                               aria-expanded="false">년도별 보고서</a>
                        </li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content" id="myTabContent">

                        <!-- 전체 보고서 -->
                        <c:set var="whole" value="${wholePanel }"/>
                        <c:if test="${whole=='active'}">
                        <div role="tabpanel" class="tab-pane fade active in" id="whole" aria-labelledby="whole-tab">
                            </c:if>
                            <c:if test="${whole!='active' }">
                            <div role="tabpanel" class="tab-pane fade" id="whole" aria-labelledby="whole-tab">

                                </c:if>
                                <header>
                                    <br/>
                                    <h3>전체 보고서</h3>
                                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                                        <form class="form-inline my-2 my-lg-0" style="margin: 4px;" name="search"method="POST" action ="/report-management">
                                            <input type="hidden" name="tab_id" value="wholesPanel"/>
                                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="margin: 1px 2px 3px 4px; float:right">Search</button>
                                            <input class="form-control mr-sm-6" type="text" style="margin: 1px 2px 3px 4px; float:right" name="keyWord" placeholder="Search" aria-label="Search">
                                        </form>
                                    </nav>
                                </header>

                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>no.</th>
                                        <th>contents</th>
                                        <th>writer</th>
                                        <th>date</th>
                                        <th>check</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="report1" items="${report1}">
                                        <tr style="cursor:hand;" data-url="report-view?r_id=${report1.r_id}">
                                            <td>${report1.r_id}</td>
                                            <td>${report1.a_name}팀  ${report1.r_weeks}주차 보고서</td>
                                            <td>${report1.r_writerName}</td>
                                            <td>${report1.r_date}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${report1.r_type == 0}">
                                                        미확인
                                                    </c:when>
                                                    <c:when test="${report1.r_type == 1}">
                                                        확인
                                                    </c:when>
                                                    <c:when test="${report1.r_type == 2}">
                                                        반려
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                    <my:pagination pageSize="${pagination.sz}" recordCount="${pagination.recordCount}"/>
                            </div>


                            <!--주차별 보고서-->
                            <c:set var="weeks" value="${weeksPanel}"/>

                            <c:if test="${weeks=='active'}">
                            <div role="tabpanel" class="tab-pane fade active in" id="weeks" aria-labelledby="weeks-tab">

                                </c:if>
                                <c:if test="${weeks!='active'}">
                                <div role="tabpanel" class="tab-pane fade" id="weeks" aria-labelledby="weeks-tab">
                                    </c:if>
                                    <header>
                                        <br/>
                                        <h3>주차별 보고서</h3>
                                        <nav class="navbar navbar-expand-lg navbar-light bg-light">
                                            <form class="form-inline my-2 my-lg-0" style="margin: 4px;" name="search"
                                                  method="POST" onsubmit="return check()">
                                                <input type="hidden" name="tab_id" value="weeksPanel"/>
                                                <button class="btn btn-outline-success my-2 my-sm-0" type="submit"
                                                        style="margin: 1px 2px 3px 4px; float:right">Search
                                                </button>
                                                <input class="form-control mr-sm-6" type="text"
                                                       style="margin: 1px 2px 3px 4px; float:right" name="keyWord"
                                                       placeholder="Search" aria-label="Search">



                                                <c:set var="weeks" value="${week}"/>
                                                <select id="week" name="week" style="margin: 1px 2px 3px 4px; padding: 0.25em 0.5em; width:200px">
                                                    <option value="0"<c:if test="${weeks=='0'}">selected</c:if>>선택</option>
                                                    <option value="1"<c:if test="${weeks=='1'}">selected</c:if>>1주차</option>
                                                    <option value="2"<c:if test="${weeks=='2'}">selected</c:if>>2주차</option>
                                                    <option value="3"<c:if test="${weeks=='3'}">selected</c:if>>3주차</option>
                                                    <option value="4"<c:if test="${weeks=='4'}">selected</c:if>>4주차</option>
                                                    <option value="5"<c:if test="${weeks=='5'}">selected</c:if>>5주차</option>
                                                    <option value="6"<c:if test="${weeks=='6'}">selected</c:if>>6주차</option>
                                                    <option value="7"<c:if test="${weeks=='7'}">selected</c:if>>7주차</option>
                                                    <option value="8"<c:if test="${weeks=='8'}">selected</c:if>>8주차</option>
                                                </select>
                                            </form>
                                        </nav>
                                    </header>

                                    <!-- selectbox 선택시 request
                                        option value에 맞는 r_weeks List<>변환 후 return
                                     -->
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th>no.</th>
                                            <th>contents</th>
                                            <th>writer</th>
                                            <th>date</th>
                                            <th>check</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="report2" items="${report2}">
                                            <tr style="cursor:hand;" data-url="report-view?r_id=${report2.r_id}">
                                                <td>${report2.r_id}</td>
                                                <td>${report2.a_name}팀 ${report2.r_weeks}주차 보고서</td>
                                                <td>${report2.r_writerName}</td>
                                                <td>${report2.r_date}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${report2.r_type == 0}">
                                                            미확인
                                                        </c:when>
                                                        <c:when test="${report2.r_type == 1}">
                                                            확인
                                                        </c:when>
                                                        <c:when test="${report2.r_type == 2}">
                                                            반려
                                                        </c:when>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                        <my:pagination pageSize="${pagination.sz}" recordCount="${pagination.recordCount}"/>
                                </div>


                                <!--멘토별 보고서-->
                                <c:set var="mentors" value="${mentorsPanel }"/>
                                <c:if test="${mentors=='active' }">
                                <div role="tabpanel" class="tab-pane fade active in" id="mentors" aria-labelledby="mentors-tab">
                                    </c:if>
                                    <c:if test="${mentors!='active' }">
                                    <div role="tabpanel" class="tab-pane fade" id="mentors" aria-labelledby="mentors-tab">
                                        </c:if>
                                        <header>
                                            <br/>
                                            <h3>멘토별 보고서</h3>
                                            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                                                <form class="form-inline my-2 my-lg-0" style="margin: 4px;" name="search"
                                                      method="POST" onsubmit="return check()">
                                                    <input type="hidden" name="tab_id" value="mentorsPanel"/>
                                                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit"
                                                            style="margin: 1px 2px 3px 4px; float:right">Search
                                                    </button>
                                                    <input class="form-control mr-sm-6" type="text"
                                                           style="margin: 1px 2px 3px 4px; float:right" name="keyWord"
                                                           placeholder="Search" aria-label="Search">
                                                </form>
                                            </nav>
                                        </header>
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>no.</th>
                                                <th>contents</th>
                                                <th>writer</th>
                                                <th>date</th>
                                                <th>check</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="report3" items="${report3}">
                                                <tr style="cursor:hand;" data-url="report-view?r_id=${report3.r_id}">
                                                    <td>${report3.r_id}</td>
                                                    <td>${report3.a_name}팀 ${report3.r_weeks}주차 보고서</td>
                                                    <td>${report3.r_writerName}</td>
                                                    <td>${report3.r_date}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${report3.r_type == 0}">
                                                                미확인
                                                            </c:when>
                                                            <c:when test="${report3.r_type == 1}">
                                                                확인
                                                            </c:when>
                                                            <c:when test="${report3.r_type == 2}">
                                                                반려
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                            <my:pagination pageSize="${pagination.sz}" recordCount="${pagination.recordCount}"/>
                                    </div>

                                    <!-- 년도별 보고서 -->
                                    <c:set var="years" value="${yearsPanel }"/>
                                    <c:if test="${years=='active' }">
                                    <div role="tabpanel" class="tab-pane fade active in" id="years" aria-labelledby="years-tab">
                                        </c:if>
                                        <c:if test="${years!='active' }">
                                        <div role="tabpanel" class="tab-pane" id="years" aria-labelledby="years-tab">
                                            </c:if>
                                            <header>
                                                <br/>
                                                <h3>년도별 보고서</h3>
                                                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                                                    <form class="form-inline my-2 my-lg-0" style="margin: 4px;" name="search"
                                                          method="POST" onsubmit="return check()">
                                                        <input type="hidden" name="tab_id" value="yearsPanel"/>
                                                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit"
                                                                style="margin: 1px 2px 3px 4px; float:right">Search
                                                        </button>
                                                        <%--<input class="form-control mr-sm-6" type="text"
                                                               style="margin: 1px 2px 3px 4px; float:right" name="keyWord"
                                                               placeholder="Search" aria-label="Search">--%>

                                                        <c:set var="year" value="${years}"/>
                                                        <select id="years" name="years" style="margin: 1px 2px 3px 4px; padding: 0.25em 0.5em; width:200px">
                                                            <option value="0" <c:if test="${year == '0'}">selected</c:if>>선택</option>
                                                            <option value="2018-07-01" <c:if test="${year == '2018-07-01'}">selected</c:if>>2018-2학기</option>
                                                            <option value="2018-01-01" <c:if test="${year == '2018-01-01'}">selected</c:if>>2018-1학기</option>
                                                            <option value="2017-07-01" <c:if test="${year == '2017-07-01'}">selected</c:if>>2017-2학기</option>
                                                            <option value="2017-01-01" <c:if test="${year == '2017-01-01'}">selected</c:if>>2017-1학기</option>
                                                            <option value="2016-07-01" <c:if test="${year == '2016-07-01'}">selected</c:if>>2016-2학기</option>
                                                            <option value="2016-01-01" <c:if test="${year == '2016-01-01'}">selected</c:if>>2016-1학기</option>
                                                            <option value="2015-07-01" <c:if test="${year == '2015-07-01'}">selected</c:if>>2015-2학기</option>
                                                            <option value="2015-01-01" <c:if test="${year == '2015-01-01'}">selected</c:if>>2015-1학기</option>
                                                        </select>

                                                    </form>
                                                </nav>
                                            </header>

                                            <table class="table">
                                                <thead>
                                                <tr>
                                                    <th>no.</th>
                                                    <th>contents</th>
                                                    <th>writer</th>
                                                    <th>date</th>
                                                    <th>check</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="report4" items="${report4}">
                                                    <tr style="cursor:hand;" data-url="report-view?r_id=${report4.r_id}">
                                                        <td>${report4.r_id}</td>
                                                        <td>${report4.a_name}팀 ${report4.r_weeks}주차 보고서</td>
                                                        <td>${report4.r_writerName}</td>
                                                        <td>${report4.r_date}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${report4.r_type == 0}">
                                                                    미확인
                                                                </c:when>
                                                                <c:when test="${report4.r_type == 1}">
                                                                    확인
                                                                </c:when>
                                                                <c:when test="${report4.r_type == 2}">
                                                                    반려
                                                                </c:when>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                                <my:pagination pageSize="${pagination.sz}" recordCount="${pagination.recordCount}"/>
                                        </div>

                                    </div>
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
