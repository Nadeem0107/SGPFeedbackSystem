<%@page import="in.co.customer.feedback.sys.ctl.CFSView" %>
    <%@page import="in.co.customer.feedback.sys.bean.MidSemFeedbackBean" %>
        <%@page import="in.co.customer.feedback.sys.util.ServletUtility" %>
            <%@page import="java.util.Iterator" %>
                <%@page import="java.util.List" %>
                    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

                        <!DOCTYPE html>
                        <html>

                        <head>
                            <meta charset="UTF-8">
                            <title>Mid-Sem Feedback List</title>

                            <!-- Font Awesome -->
                            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
                                rel="stylesheet" />

                            <!-- MDB -->
                            <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.0/mdb.min.css"
                                rel="stylesheet" />

                            <!-- Custom Styles -->
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
                                                Mid-Sem Feedback List
                                            </li>
                                        </ol>
                                    </nav>
                                </div>

                                <hr>

                                <div class="container">
                                    <div class="card shadow-sm">

                                        <h5 class="card-header" style="background-color: #00061df7; color: white;">
                                            Mid-Sem Feedback List
                                        </h5>

                                        <div class="card-body">

                                            <div class="table-responsive">
                                                <table
                                                    class="table table-hover table-striped table-bordered border-primary align-middle">

                                                    <thead class="bg-light">
                                                        <tr>
                                                            <th>#</th>
                                                            <th>Reg No</th>
                                                            <th>Student</th>
                                                            <th>Branch/Sem</th>
                                                            <th>Faculty/Subject</th>
                                                            <th>Q1-Q12 Ratings</th>
                                                            <th>Total</th>
                                                            <th>Average (%)</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>

                                                        <% int index=1; List list=ServletUtility.getList(request);
                                                            Iterator<MidSemFeedbackBean> it = list.iterator();

                                                            while(it.hasNext()){

                                                            MidSemFeedbackBean bean = it.next();

                                                            /* Ratings */
                                                            int q1 = bean.getQ1();
                                                            int q2 = bean.getQ2();
                                                            int q3 = bean.getQ3();
                                                            int q4 = bean.getQ4();
                                                            int q5 = bean.getQ5();
                                                            int q6 = bean.getQ6();
                                                            int q7 = bean.getQ7();
                                                            int q8 = bean.getQ8();
                                                            int q9 = bean.getQ9();
                                                            int q10 = bean.getQ10();
                                                            int q11 = bean.getQ11();
                                                            int q12 = bean.getQ12();

                                                            /* Given Score */
                                                            int total = q1+q2+q3+q4+q5+q6+q7+q8+q9+q10+q11+q12;

                                                            /* Maximum Score (12 Questions Ã— 5 Marks) */
                                                            int maxScore = 12 * 5;

                                                            /* Percentage */
                                                            double average = (total * 100.0) / maxScore;
                                                            %>

                                                            <tr>

                                                                <td>
                                                                    <%=index++%>
                                                                </td>

                                                                <td>
                                                                    <%=bean.getRegNo()%>
                                                                </td>

                                                                <td>
                                                                    <%=bean.getStudentName()%>
                                                                </td>

                                                                <td>
                                                                    <%=bean.getBranch()%> / <%=bean.getSemester()%>
                                                                </td>

                                                                <td>
                                                                    <%=bean.getFaculty()%> / <%=bean.getSubject()%>
                                                                </td>

                                                                <td>
                                                                    <small>
                                                                        <%=q1%>, <%=q2%>, <%=q3%>, <%=q4%>, <%=q5%>,
                                                                                            <%=q6%>,
                                                                                                <%=q7%>, <%=q8%>,
                                                                                                        <%=q9%>,
                                                                                                            <%=q10%>,
                                                                                                                <%=q11%>
                                                                                                                    ,
                                                                                                                    <%=q12%>
                                                                    </small>
                                                                </td>

                                                                <td><b>
                                                                        <%=total%>
                                                                    </b></td>

                                                                <td><b>
                                                                        <%=String.format("%.2f", average)%> %
                                                                    </b></td>

                                                            </tr>

                                                            <% } %>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%@ include file="footer.jsp" %>

                        </body>

                        </html>
