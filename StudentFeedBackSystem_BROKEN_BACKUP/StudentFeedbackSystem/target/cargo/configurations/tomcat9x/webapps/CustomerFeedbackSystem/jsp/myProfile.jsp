<%@page import="in.co.customer.feedback.sys.ctl.MyProfileCtl" %>
    <%@page import="in.co.customer.feedback.sys.util.DataUtility" %>
        <%@page import="in.co.customer.feedback.sys.util.ServletUtility" %>
            <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="UTF-8">
                    <title>My Profile | Student Feedback System</title>
                    <style>
                        .profile-container {
                            max-width: 800px;
                            margin: 50px auto;
                            background: white;
                            padding: 40px;
                            border-radius: 20px;
                            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
                        }

                        .profile-header {
                            text-align: center;
                            margin-bottom: 40px;
                        }

                        .form-label {
                            font-weight: 600;
                            color: #475569;
                        }

                        .form-control:read-only {
                            background-color: #f8fafc;
                            color: #64748b;
                        }
                    </style>
                </head>

                <body class="bg-light">
                    <%@ include file="header.jsp" %>

                        <div class="container">
                            <div class="profile-container">
                                <div class="profile-header">
                                    <h2 class="fw-bold">My Profile</h2>
                                    <p class="text-muted">Manage your personal information</p>
                                </div>

                                <form action="<%=CFSView.MY_PROFILE_CTL%>" method="post">
                                    <jsp:useBean id="bean" class="in.co.customer.feedback.sys.bean.UserBean"
                                        scope="request"></jsp:useBean>

                                    <% if(ServletUtility.getSuccessMessage(request) !=null &&
                                        ServletUtility.getSuccessMessage(request).length()> 0) { %>
                                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                                            <%=ServletUtility.getSuccessMessage(request)%>
                                                <button type="button" class="btn-close" data-mdb-dismiss="alert"
                                                    aria-label="Close"></button>
                                        </div>
                                        <% } %>

                                            <% if(ServletUtility.getErrorMessage(request) !=null &&
                                                ServletUtility.getErrorMessage(request).length()> 0) { %>
                                                <div class="alert alert-danger alert-dismissible fade show"
                                                    role="alert">
                                                    <%=ServletUtility.getErrorMessage(request)%>
                                                        <button type="button" class="btn-close" data-mdb-dismiss="alert"
                                                            aria-label="Close"></button>
                                                </div>
                                                <% } %>

                                                    <input type="hidden" name="id" value="<%=bean.getId()%>">

                                                    <div class="row g-3">
                                                        <div class="col-md-6 mb-3">
                                                            <label class="form-label">Name</label>
                                                            <input type="text" name="name" class="form-control"
                                                                value="<%=DataUtility.getStringData(bean.getName())%>">
                                                            <font color="red" size="2">
                                                                <%=ServletUtility.getErrorMessage("name", request)%>
                                                            </font>
                                                        </div>

                                                        <div class="col-md-6 mb-3">
                                                            <label class="form-label">Username / Reg No
                                                                (Permanent)</label>
                                                            <input type="text" name="userName" class="form-control"
                                                                readonly
                                                                value="<%=DataUtility.getStringData(bean.getUserName())%>">
                                                        </div>

                                                        <div class="col-md-6 mb-3">
                                                            <label class="form-label">Email Address</label>
                                                            <input type="email" name="email" class="form-control"
                                                                value="<%=DataUtility.getStringData(bean.getEmail())%>">
                                                            <font color="red" size="2">
                                                                <%=ServletUtility.getErrorMessage("email", request)%>
                                                            </font>
                                                        </div>

                                                        <div class="col-md-6 mb-3">
                                                            <label class="form-label">Contact Number</label>
                                                            <input type="text" name="contactNo" class="form-control"
                                                                value="<%=DataUtility.getStringData(bean.getContactNo())%>">
                                                            <font color="red" size="2">
                                                                <%=ServletUtility.getErrorMessage("contactNo",
                                                                    request)%>
                                                            </font>
                                                        </div>

                                                        <div class="col-md-6 mb-3">
                                                            <label class="form-label">Gender</label>
                                                            <select name="gender" class="form-select">
                                                                <option value="">--Select--</option>
                                                                <option value="Male" <%="Male" .equals(bean.getGender())
                                                                    ? "selected" : "" %>>Male</option>
                                                                <option value="Female" <%="Female"
                                                                    .equals(bean.getGender()) ? "selected" : "" %>
                                                                    >Female</option>
                                                            </select>
                                                            <font color="red" size="2">
                                                                <%=ServletUtility.getErrorMessage("gender", request)%>
                                                            </font>
                                                        </div>

                                                        <div class="col-md-6 mb-3">
                                                            <label class="form-label">Date of Birth</label>
                                                            <input type="text" name="dob" id="datepicker"
                                                                class="form-control"
                                                                value="<%=DataUtility.getDateString(bean.getDob())%>">
                                                            <font color="red" size="2">
                                                                <%=ServletUtility.getErrorMessage("dob", request)%>
                                                            </font>
                                                        </div>

                                                        <div class="col-md-6 mb-3">
                                                            <label class="form-label">Department</label>
                                                            <input type="text" class="form-control" readonly
                                                                value="<%=DataUtility.getStringData((String)request.getAttribute("
                                                                deptName"))%>">
                                                        </div>

                                                        <div class="col-md-6 mb-3">
                                                            <label class="form-label">Semester</label>
                                                            <input type="text" class="form-control" readonly
                                                                value="<%=DataUtility.getStringData(bean.getSemester())%>">
                                                        </div>
                                                    </div>

                                                    <div class="mt-4 text-center">
                                                        <button type="submit" name="operation"
                                                            value="<%=MyProfileCtl.OP_SAVE%>"
                                                            class="btn btn-primary btn-lg px-5 rounded-pill shadow-sm">
                                                            Update Profile
                                                        </button>
                                                        <a href="<%=CFSView.CHANGE_PASSWORD_CTL%>"
                                                            class="btn btn-outline-warning btn-lg px-4 ms-2 rounded-pill shadow-sm">
                                                            Change Password
                                                        </a>
                                                    </div>
                                </form>
                            </div>
                        </div>

                        <%@ include file="footer.jsp" %>
                </body>

                </html>