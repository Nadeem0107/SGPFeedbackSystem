<%@page import="in.co.customer.feedback.sys.ctl.CFSView" %>
    <%@page import="in.co.customer.feedback.sys.bean.EndSemFeedbackBean" %>
        <%@page import="in.co.customer.feedback.sys.util.ServletUtility" %>
            <%@page import="java.util.Iterator" %>
                <%@page import="java.util.List" %>
                    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

                        <!DOCTYPE html>
                        <html>

                        <head>
                            <meta charset="UTF-8">
                            <title>End-Sem Feedback List</title>

                            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
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
                                                End-Sem Feedback List
                                            </li>
                                        </ol>
                                    </nav>
                                </div>

                                <hr>

                                <div class="container">
                                    <div class="card shadow-sm">

                                        <h5 class="card-header" style="background-color: #00061df7; color: white;">
                                            End-Sem Feedback List
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
                                                            <th>Summary A, B, C</th>
                                                            <th>Total</th>
                                                            <th>Average (%)</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>

                                                        <% int index=1; List list=ServletUtility.getList(request);
                                                            Iterator<EndSemFeedbackBean> it = list.iterator();

                                                            while(it.hasNext()){

                                                            EndSemFeedbackBean bean = it.next();

                                                            /* A Section */
                                                            int totalA =
                                                            bean.getA1()+bean.getA2()+bean.getA3()+bean.getA4()+
                                                            bean.getA5()+bean.getA6()+bean.getA7();

                                                            /* B Section */
                                                            int totalB =
                                                            bean.getB1()+bean.getB2()+bean.getB3()+bean.getB4()+
                                                            bean.getB5()+bean.getB6()+bean.getB7()+bean.getB8()+bean.getB9();

                                                            /* C Section */
                                                            int totalC =
                                                            bean.getC1()+bean.getC2()+bean.getC3()+
                                                            bean.getC4()+bean.getC5()+bean.getC6();

                                                            /* Total Score */
                                                            int total = totalA + totalB + totalC;

                                                            /* Max Score (22 Questions Ã— 5) */
                                                            int maxScore = 22 * 5;

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
                                                                        <b>A:</b>
                                                                        <%=bean.getA1()%>,<%=bean.getA2()%>,
                                                                                <%=bean.getA3()%>,
                                                                                    <%=bean.getA4()%>,<%=bean.getA5()%>,
                                                                                            <%=bean.getA6()%>,
                                                                                                <%=bean.getA7()%>

                                                                                                    <br>

                                                                                                    <b>B:</b>
                                                                                                    <%=bean.getB1()%>,
                                                                                                        <%=bean.getB2()%>
                                                                                                            ,
                                                                                                            <%=bean.getB3()%>
                                                                                                                ,
                                                                                                                <%=bean.getB4()%>
                                                                                                                    ,
                                                                                                                    <%=bean.getB5()%>
                                                                                                                        ,
                                                                                                                        <%=bean.getB6()%>
                                                                                                                            ,
                                                                                                                            <%=bean.getB7()%>
                                                                                                                                ,
                                                                                                                                <%=bean.getB8()%>
                                                                                                                                    ,
                                                                                                                                    <%=bean.getB9()%>

                                                                                                                                        <br>

                                                                                                                                        <b>C:</b>
                                                                                                                                        <%=bean.getC1()%>
                                                                                                                                            ,
                                                                                                                                            <%=bean.getC2()%>
                                                                                                                                                ,
                                                                                                                                                <%=bean.getC3()%>
                                                                                                                                                    ,
                                                                                                                                                    <%=bean.getC4()%>
                                                                                                                                                        ,
                                                                                                                                                        <%=bean.getC5()%>
                                                                                                                                                            ,
                                                                                                                                                            <%=bean.getC6()%>
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
