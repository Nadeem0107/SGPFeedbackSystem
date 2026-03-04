<%@page import="in.co.customer.feedback.sys.ctl.CFSView" %>
    <%@page import="in.co.customer.feedback.sys.bean.TeacherFeedbackBean" %>
        <%@page import="in.co.customer.feedback.sys.util.ServletUtility" %>
            <%@page import="java.util.Iterator" %>
                <%@page import="java.util.List" %>
                    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
                        <!DOCTYPE html>
                        <html>

                        <head>
                            <meta charset="UTF-8">
                            <title>Teacher Feedback List</title>
                            <!-- Font Awesome -->
                            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
                                rel="stylesheet" />
                            <!-- Google Fonts -->
                            <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
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
                                            <li class="breadcrumb-item"
                                                style="display: inline-flex; align-items: center;">
                                                <i class="fas fa-home" style="color: #333; margin-right: 8px;"></i>
                                                <a href="<%=CFSView.WELCOME_CTL%>"
                                                    style="color: #1a237e; text-decoration: none; font-weight: 600;">Home</a>
                                                <span style="margin: 0 10px; color: #bbb;">/</span>
                                            </li>
                                            <li class="breadcrumb-item active" aria-current="page"
                                                style="color: #6a1b9a; font-weight: 600; display: inline-flex; align-items: center;">
                                                <i class="fas fa-long-arrow-alt-right"
                                                    style="margin-right: 8px; color: #6a1b9a;"></i> Teacher Feedback
                                                List
                                            </li>
                                        </ol>
                                    </nav>
                                </div>
                                <hr>
                                <form method="post" action="<%=CFSView.TEACHER_FEEDBACK_LIST_CTL%>">
                                    <div class="card">
                                        <h5 class="card-header" style="background-color: #00061df7; color: white;">
                                            Feedback List
                                            <% String teacherName=(String) request.getAttribute("teacherName");
                                                if(teacherName !=null) { %>
                                                for <%=teacherName%>
                                                    <% } %>
                                        </h5>
                                        <div class="card-body">
                                            <% String tIdVal=ServletUtility.getParameter("tId", request); String
                                                studentNameVal=ServletUtility.getParameter("studentName", request); %>
                                                <%-- Hidden field to persist teacher Id across searches or pagination
                                                    --%>
                                                    <input type="hidden" name="tId" value="<%=tIdVal%>">

                                                    <div class="row g-3">
                                                        <div class="col">
                                                            <input type="text"
                                                                placeholder="Search By Student Name here..."
                                                                name="studentName" class="form-control"
                                                                value="<%=studentNameVal%>">
                                                        </div>

                                                        <div class="col">
                                                            <input type="submit" class="btn  btn-outline-primary"
                                                                name="operation" value="Search"></input> or <input
                                                                type="submit" class="btn  btn-outline-secondary"
                                                                name="operation" value="Reset">
                                                        </div>
                                                    </div>
                                                    <b>
                                                        <font color="red">
                                                            <%=ServletUtility.getErrorMessage(request)%>
                                                        </font>
                                                    </b> <b>
                                                        <font color="Green">
                                                            <%=ServletUtility.getSuccessMessage(request)%>
                                                        </font>
                                                    </b><br>

                                                    <table class="table table-bordered border-primary">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">#</th>
                                                                <th scope="col">Student Name</th>
                                                                <th scope="col">Knowledge (1-5)</th>
                                                                <th scope="col">Communication (1-5)</th>
                                                                <th scope="col">Methodology (1-5)</th>
                                                                <th scope="col">Punctuality (1-5)</th>
                                                                <th scope="col">Overall (1-5)</th>
                                                                <th scope="col">Comments</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <% int pageNo=ServletUtility.getPageNo(request); int
                                                                pageSize=ServletUtility.getPageSize(request); int
                                                                index=((pageNo - 1) * pageSize) + 1; int
                                                                size=ServletUtility.getSize(request);
                                                                TeacherFeedbackBean bean=null; List
                                                                list=ServletUtility.getList(request);
                                                                Iterator<TeacherFeedbackBean> iterator =
                                                                list.iterator();
                                                                while (iterator.hasNext()) {
                                                                bean = iterator.next();
                                                                %>
                                                                <tr>
                                                                    <td scope="row">
                                                                        <%=index++%>
                                                                    </td>
                                                                    <td scope="row">
                                                                        <%=bean.getStudentName()%>
                                                                    </td>
                                                                    <td scope="row">
                                                                        <%=bean.getKnowledgeRating()%>
                                                                    </td>
                                                                    <td scope="row">
                                                                        <%=bean.getCommunicationRating()%>
                                                                    </td>
                                                                    <td scope="row">
                                                                        <%=bean.getMethodologyRating()%>
                                                                    </td>
                                                                    <td scope="row">
                                                                        <%=bean.getPunctualityRating()%>
                                                                    </td>
                                                                    <td scope="row">
                                                                        <%=bean.getOverallRating()%>
                                                                    </td>
                                                                    <td scope="row">
                                                                        <%=bean.getComments()%>
                                                                    </td>
                                                                </tr>
                                                                <% } %>
                                                        </tbody>
                                                    </table>

                                                    <div class="clearfix">
                                                        <nav aria-label="Page navigation example float-end">
                                                            <ul class="pagination justify-content-end"
                                                                style="font-size: 13px">
                                                                <li class="page-item"><input type="submit"
                                                                        name="operation" class="page-link "
                                                                        <%=(pageNo==1) ? "disabled" : "" %>
                                                                    value="Previous"></li>

                                                                <li class="page-item"><input type="submit"
                                                                        name="operation" class="page-link "
                                                                        <%=((list.size() < pageSize) || size==pageNo *
                                                                        pageSize) ? "disabled" : "" %>
                                                                    value="Next"></li>
                                                            </ul>
                                                        </nav>
                                                    </div>
                                                    <input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
                                                        type="hidden" name="pageSize" value="<%=pageSize%>">

                                        </div>

                                    </div>
                                </form>

                                <%@ include file="footer.jsp" %>
                        </body>

                        </html>
