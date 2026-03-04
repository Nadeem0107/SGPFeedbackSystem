<%@page import="in.co.customer.feedback.sys.ctl.CFSView" %>
    <%@page import="in.co.customer.feedback.sys.bean.CourseEndFeedbackBean" %>
        <%@page import="in.co.customer.feedback.sys.util.ServletUtility" %>
            <%@page import="java.util.Iterator" %>
                <%@page import="java.util.List" %>
                    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

                        <!DOCTYPE html>
                        <html>

                        <head>
                            <meta charset="UTF-8">
                            <title>Course End Feedback List</title>

                            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
                                rel="stylesheet" />
                            <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
                                rel="stylesheet" />
                            <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.0/mdb.min.css"
                                rel="stylesheet" />
                            <link rel="stylesheet" href="<%=CFSView.APP_CONTEXT%>/css/custom_styles.css">

                        </head>

                        <body>

                            <%@ include file="header.jsp" %>

                                <br>

                                <div class="container" style="margin-top: 15px; margin-bottom: 15px;">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb"
                                            style="background-color: white; padding: 10px 25px; border-radius: 8px; box-shadow: 0 2px 15px rgba(0,0,0,0.08); margin-bottom: 0; font-size: 0.9rem; border: 1px solid #eee;">
                                            <li class="breadcrumb-item">
                                                <a href="<%=CFSView.WELCOME_CTL%>"
                                                    style="color: #1a237e; text-decoration: none; font-weight: 600;">Home</a>
                                            </li>
                                            <li class="breadcrumb-item active"
                                                style="color: #6a1b9a; font-weight: 600;">
                                                Course End Feedback List
                                            </li>
                                        </ol>
                                    </nav>
                                </div>

                                <hr>

                                <div class="container">
                                    <form method="post" action="<%=CFSView.COURSE_END_FEEDBACK_LIST_CTL%>">

                                        <div class="card shadow-sm">
                                            <h5 class="card-header" style="background-color: #00061df7; color: white;">
                                                Feedback List
                                            </h5>

                                            <div class="card-body">

                                                <div class="table-responsive">
                                                    <table
                                                        class="table table-hover table-striped table-bordered border-primary align-middle">

                                                        <thead class="bg-light">
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Student Name</th>
                                                                <th>Course Name</th>
                                                                <th>Course Code</th>
                                                                <th>CO1</th>
                                                                <th>CO2</th>
                                                                <th>CO3</th>
                                                                <th>CO4</th>
                                                                <th>CO5</th>
                                                                <th>CO6</th>
                                                                <th>Total</th>
                                                                <th>Average (%)</th>
                                                            </tr>
                                                        </thead>

                                                        <tbody>

                                                            <% int pageNo=ServletUtility.getPageNo(request); int
                                                                pageSize=ServletUtility.getPageSize(request); int
                                                                index=((pageNo - 1) * pageSize) + 1; List
                                                                list=ServletUtility.getList(request); if(list !=null){
                                                                Iterator<CourseEndFeedbackBean> iterator =
                                                                list.iterator();

                                                                while(iterator.hasNext()){

                                                                CourseEndFeedbackBean bean = iterator.next();

                                                                /* CO Values */
                                                                int co1 = bean.getCo1();
                                                                int co2 = bean.getCo2();
                                                                int co3 = bean.getCo3();
                                                                int co4 = bean.getCo4();
                                                                int co5 = bean.getCo5();
                                                                int co6 = bean.getCo6();

                                                                /* Total */
                                                                int total = co1 + co2 + co3 + co4 + co5 + co6;

                                                                /* Max Score (6 Ã— 5) */
                                                                int maxScore = 6 * 5;

                                                                /* Percentage */
                                                                double average = (total * 100.0) / maxScore;
                                                                %>

                                                                <tr>

                                                                    <td>
                                                                        <%=index++%>
                                                                    </td>
                                                                    <td>
                                                                        <%=bean.getStudentName()%>
                                                                    </td>
                                                                    <td>
                                                                        <%=bean.getCourseName()%>
                                                                    </td>
                                                                    <td>
                                                                        <%=bean.getCourseCode()%>
                                                                    </td>

                                                                    <td>
                                                                        <%=co1%>
                                                                    </td>
                                                                    <td>
                                                                        <%=co2%>
                                                                    </td>
                                                                    <td>
                                                                        <%=co3%>
                                                                    </td>
                                                                    <td>
                                                                        <%=co4%>
                                                                    </td>
                                                                    <td>
                                                                        <%=co5%>
                                                                    </td>
                                                                    <td>
                                                                        <%=co6%>
                                                                    </td>

                                                                    <td><b>
                                                                            <%=total%>
                                                                        </b></td>
                                                                    <td><b>
                                                                            <%=String.format("%.2f", average)%> %
                                                                        </b></td>

                                                                </tr>

                                                                <% } } %>

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>

                                    </form>
                                </div>

                                <%@ include file="footer.jsp" %>

                        </body>

                        </html>
