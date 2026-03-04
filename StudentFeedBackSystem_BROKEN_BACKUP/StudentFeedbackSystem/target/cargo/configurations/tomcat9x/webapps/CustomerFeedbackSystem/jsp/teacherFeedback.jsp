<%@page import="in.co.customer.feedback.sys.ctl.TeacherFeedbackCtl" %>
    <%@page import="in.co.customer.feedback.sys.util.DataUtility" %>
        <%@page import="in.co.customer.feedback.sys.util.ServletUtility" %>
            <%@page import="in.co.customer.feedback.sys.ctl.CFSView" %>
                <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
                    <!DOCTYPE html>
                    <html>

                    <head>
                        <meta charset="UTF-8">
                        <title>Teacher Feedback</title>
                    </head>

                    <body>
                        <%@ include file="header.jsp" %>

                            <!-- Breadcrumb Navigation -->
                            <div class="container" style="margin-top: 15px; margin-bottom: 15px;">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb"
                                        style="background-color: white; padding: 10px 25px; border-radius: 8px; box-shadow: 0 2px 15px rgba(0,0,0,0.08); margin-bottom: 0; font-size: 0.9rem; border: 1px solid #eee;">
                                        <li class="breadcrumb-item" style="display: inline-flex; align-items: center;">
                                            <i class="fas fa-home" style="color: #333; margin-right: 8px;"></i>
                                            <a href="<%=CFSView.WELCOME_CTL%>"
                                                style="color: #1a237e; text-decoration: none; font-weight: 600;">Home</a>
                                            <span style="margin: 0 10px; color: #bbb;">/</span>
                                        </li>
                                        <li class="breadcrumb-item" style="display: inline-flex; align-items: center;">
                                            <i class="fas fa-long-arrow-alt-right"
                                                style="margin-right: 8px; color: #6a1b9a;"></i>
                                            <a href="<%=CFSView.TEACHER_LIST_CTL%>"
                                                style="color: #1a237e; text-decoration: none; font-weight: 600;">Faculty</a>
                                            <span style="margin: 0 10px; color: #bbb;">/</span>
                                        </li>
                                        <li class="breadcrumb-item active" aria-current="page"
                                            style="color: #6a1b9a; font-weight: 600; display: inline-flex; align-items: center;">
                                            <i class="fas fa-long-arrow-alt-right"
                                                style="margin-right: 8px; color: #6a1b9a;"></i> Give Feedback
                                        </li>
                                    </ol>
                                </nav>
                            </div>

                            <div class="container">
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="col-md-8">
                                        <div class="card">
                                            <h5 class="card-header" style="background-color: #1266f1; color: white;">
                                                Teacher Feedback Form
                                                <% String teacherName=(String) request.getAttribute("teacherName");
                                                    if(teacherName !=null) { %>
                                                    : <%=teacherName%>
                                                        <% } %>
                                            </h5>
                                            <div class="card-body">
                                                <b>
                                                    <font color="red">
                                                        <%=ServletUtility.getErrorMessage(request)%>
                                                    </font>
                                                </b>
                                                <b>
                                                    <font color="green">
                                                        <%=ServletUtility.getSuccessMessage(request)%>
                                                    </font>
                                                </b>

                                                <form action="<%=CFSView.TEACHER_FEEDBACK_CTL%>" method="post">
                                                    <jsp:useBean id="bean"
                                                        class="in.co.customer.feedback.sys.bean.TeacherFeedbackBean"
                                                        scope="request"></jsp:useBean>
                                                    <input type="hidden" name="teacherId"
                                                        value="<%=bean.getTeacherId()%>">
                                                    <input type="hidden" name="tId" value="<%=bean.getTeacherId()%>">
                                                    <!-- Helper to persist across post if needed -->

                                                    <div class="form-group mb-3">
                                                        <label><strong>1. How is the teacher's subject
                                                                knowledge?</strong></label><br>
                                                        <% for(int i=1; i<=5; i++) { %>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio"
                                                                    name="knowledgeRating" value="<%=i%>"
                                                                    <%=(bean.getKnowledgeRating()==i) ? "checked" : ""
                                                                    %>>
                                                                <label class="form-check-label">
                                                                    <%=i%>
                                                                </label>
                                                            </div>
                                                            <% } %>
                                                                <font color="red">
                                                                    <%=ServletUtility.getErrorMessage("knowledgeRating",
                                                                        request)%>
                                                                </font>
                                                    </div>

                                                    <div class="form-group mb-3">
                                                        <label><strong>2. How is the teacher's communication
                                                                skill?</strong></label><br>
                                                        <% for(int i=1; i<=5; i++) { %>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio"
                                                                    name="communicationRating" value="<%=i%>"
                                                                    <%=(bean.getCommunicationRating()==i) ? "checked"
                                                                    : "" %>>
                                                                <label class="form-check-label">
                                                                    <%=i%>
                                                                </label>
                                                            </div>
                                                            <% } %>
                                                    </div>

                                                    <div class="form-group mb-3">
                                                        <label><strong>3. How is the teaching
                                                                methodology?</strong></label><br>
                                                        <% for(int i=1; i<=5; i++) { %>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio"
                                                                    name="methodologyRating" value="<%=i%>"
                                                                    <%=(bean.getMethodologyRating()==i) ? "checked" : ""
                                                                    %>>
                                                                <label class="form-check-label">
                                                                    <%=i%>
                                                                </label>
                                                            </div>
                                                            <% } %>
                                                    </div>

                                                    <div class="form-group mb-3">
                                                        <label><strong>4. How is punctuality and
                                                                discipline?</strong></label><br>
                                                        <% for(int i=1; i<=5; i++) { %>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio"
                                                                    name="punctualityRating" value="<%=i%>"
                                                                    <%=(bean.getPunctualityRating()==i) ? "checked" : ""
                                                                    %>>
                                                                <label class="form-check-label">
                                                                    <%=i%>
                                                                </label>
                                                            </div>
                                                            <% } %>
                                                    </div>

                                                    <div class="form-group mb-3">
                                                        <label><strong>5. Overall rating of the
                                                                teacher?</strong></label><br>
                                                        <% for(int i=1; i<=5; i++) { %>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio"
                                                                    name="overallRating" value="<%=i%>"
                                                                    <%=(bean.getOverallRating()==i) ? "checked" : "" %>>
                                                                <label class="form-check-label">
                                                                    <%=i%>
                                                                </label>
                                                            </div>
                                                            <% } %>
                                                    </div>

                                                    <div class="form-group mb-3">
                                                        <label><strong>Additional Comments</strong></label>
                                                        <textarea name="comments" class="form-control" rows="3"
                                                            placeholder="Enter any additional comments..."><%=DataUtility.getStringData(bean.getComments())%></textarea>
                                                    </div>

                                                    <input type="submit" name="operation" class="btn btn-primary"
                                                        value="<%=TeacherFeedbackCtl.OP_SAVE%>">
                                                    <input type="submit" name="operation" class="btn btn-secondary"
                                                        value="<%=TeacherFeedbackCtl.OP_RESET%>">
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2"></div>
                                </div>
                            </div>
                            <br>
                            <%@ include file="footer.jsp" %>
                    </body>

                    </html>
