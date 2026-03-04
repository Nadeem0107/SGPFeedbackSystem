<%@page import="in.co.customer.feedback.sys.ctl.CFSView" %>
    <%@page import="in.co.customer.feedback.sys.bean.CourseEndFeedbackBean" %>
        <%@page import="in.co.customer.feedback.sys.util.ServletUtility" %>
            <%@page import="in.co.customer.feedback.sys.util.DataUtility" %>
                <%@page import="java.util.Iterator" %>
                    <%@page import="java.util.List" %>
                        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
                            <!DOCTYPE html>
                            <html>

                            <head>
                                <meta charset="UTF-8">
                                <title>Course End Feedback List</title>
                                <!-- CSS and JS references -->
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

                                    <div class="container mt-4 mb-5">
                                        <nav aria-label="breadcrumb" class="mb-4">
                                            <ol class="breadcrumb bg-white p-3 rounded shadow-sm border">
                                                <li class="breadcrumb-item"><a href="<%=CFSView.WELCOME_CTL%>"><i
                                                            class="fas fa-home me-2"></i>Home</a></li>
                                                <li class="breadcrumb-item active">Course End Feedback List</li>
                                            </ol>
                                        </nav>

                                        <form method="post" action="<%=CFSView.COURSE_END_FEEDBACK_LIST_CTL%>">
                                            <div class="card shadow-lg border-0">
                                                <div class="card-header bg-dark text-white py-3">
                                                    <h5 class="mb-0"><i class="fas fa-list me-2"></i>Course End Feedback
                                                        List</h5>
                                                </div>
                                                <div class="card-body">
                                                    <div class="row g-3 mb-4">
                                                        <div class="col-md-4">
                                                            <input type="text" name="studentName" class="form-control"
                                                                placeholder="Search by Student Name"
                                                                value="<%=ServletUtility.getParameter(" studentName",
                                                                request)%>">
                                                        </div>
                                                        <div class="col-md-4">
                                                            <input type="text" name="courseName" class="form-control"
                                                                placeholder="Search by Course Name"
                                                                value="<%=ServletUtility.getParameter(" courseName",
                                                                request)%>">
                                                        </div>
                                                        <div class="col-md-4">
                                                            <button type="submit" name="operation" value="Search"
                                                                class="btn btn-primary px-4">Search</button>
                                                            <button type="submit" name="operation" value="Reset"
                                                                class="btn btn-outline-secondary px-4">Reset</button>
                                                        </div>
                                                    </div>

                                                    <% if(ServletUtility.getSuccessMessage(request) !=null &&
                                                        !ServletUtility.getSuccessMessage(request).isEmpty()) { %>
                                                        <div class="alert alert-success">
                                                            <%=ServletUtility.getSuccessMessage(request)%>
                                                        </div>
                                                        <% } %>
                                                            <% if(ServletUtility.getErrorMessage(request) !=null &&
                                                                !ServletUtility.getErrorMessage(request).isEmpty()) { %>
                                                                <div class="alert alert-danger">
                                                                    <%=ServletUtility.getErrorMessage(request)%>
                                                                </div>
                                                                <% } %>

                                                                    <div class="table-responsive">
                                                                        <table
                                                                            class="table table-hover align-middle border">
                                                                            <thead class="bg-light">
                                                                                <tr>
                                                                                    <th>#</th>
                                                                                    <th>Reg No</th>
                                                                                    <th>Student Name</th>
                                                                                    <th>Course</th>
                                                                                    <th>Co-ordinator</th>
                                                                                    <th>CO1</th>
                                                                                    <th>CO2</th>
                                                                                    <th>CO3</th>
                                                                                    <th>CO4</th>
                                                                                    <th>CO5</th>
                                                                                    <th>CO6</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <% int
                                                                                    pageNo=ServletUtility.getPageNo(request);
                                                                                    int
                                                                                    pageSize=ServletUtility.getPageSize(request);
                                                                                    int index=((pageNo - 1) * pageSize)
                                                                                    + 1; List
                                                                                    list=ServletUtility.getList(request);
                                                                                    if(list !=null && list.size()> 0) {
                                                                                    Iterator it = list.iterator();
                                                                                    while(it.hasNext()) {
                                                                                    CourseEndFeedbackBean bean =
                                                                                    (CourseEndFeedbackBean) it.next();
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
                                                                                            <%=bean.getCourseName()%> (
                                                                                                <%=bean.getCourseCode()%>
                                                                                                    )
                                                                                        </td>
                                                                                        <td>
                                                                                            <%=bean.getCoordinator()%>
                                                                                        </td>
                                                                                        <td><span class="badge bg-info">
                                                                                                <%=bean.getCo1()%>
                                                                                            </span></td>
                                                                                        <td><span class="badge bg-info">
                                                                                                <%=bean.getCo2()%>
                                                                                            </span></td>
                                                                                        <td><span class="badge bg-info">
                                                                                                <%=bean.getCo3()%>
                                                                                            </span></td>
                                                                                        <td><span class="badge bg-info">
                                                                                                <%=bean.getCo4()%>
                                                                                            </span></td>
                                                                                        <td><span class="badge bg-info">
                                                                                                <%=bean.getCo5()%>
                                                                                            </span></td>
                                                                                        <td><span class="badge bg-info">
                                                                                                <%=bean.getCo6()%>
                                                                                            </span></td>
                                                                                    </tr>
                                                                                    <% } } else { %>
                                                                                        <tr>
                                                                                            <td colspan="11"
                                                                                                class="text-center py-4 text-muted">
                                                                                                No records found.</td>
                                                                                        </tr>
                                                                                        <% } %>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>

                                                                    <div
                                                                        class="d-flex justify-content-between align-items-center mt-3">
                                                                        <input type="hidden" name="pageNo"
                                                                            value="<%=pageNo%>">
                                                                        <input type="hidden" name="pageSize"
                                                                            value="<%=pageSize%>">
                                                                        <button type="submit" name="operation"
                                                                            value="Previous"
                                                                            class="btn btn-sm btn-outline-primary"
                                                                            <%=(pageNo <=1) ? "disabled" : ""
                                                                            %>>Previous</button>
                                                                        <span class="text-muted small">Page <%=pageNo%>
                                                                        </span>
                                                                        <button type="submit" name="operation"
                                                                            value="Next"
                                                                            class="btn btn-sm btn-outline-primary"
                                                                            <%=((list==null || list.size() < pageSize))
                                                                            ? "disabled" : "" %>>Next</button>
                                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                    <%@ include file="footer.jsp" %>
                            </body>

                            </html>