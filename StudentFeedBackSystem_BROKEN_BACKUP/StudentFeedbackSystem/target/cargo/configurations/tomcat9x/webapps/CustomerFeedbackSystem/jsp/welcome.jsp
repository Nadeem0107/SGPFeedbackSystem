<%@page import="in.co.customer.feedback.sys.ctl.CFSView" %>
    <%@page import="in.co.customer.feedback.sys.bean.UserBean" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Welcome | Student Feedback System</title>
                <style>
                    .welcome-hero {
                        background: linear-gradient(135deg, #1e293b 0%, #334155 100%);
                        padding: 80px 0;
                        color: white;
                        border-radius: 0 0 50px 50px;
                        margin-bottom: 50px;
                    }

                    .feature-card {
                        border-radius: 15px;
                        border: none;
                        transition: all 0.3s ease;
                        height: 100%;
                        background: #fff;
                    }

                    .feature-card:hover {
                        transform: translateY(-10px);
                        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
                    }

                    .icon-circle {
                        width: 60px;
                        height: 60px;
                        border-radius: 50%;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        margin-bottom: 20px;
                        font-size: 24px;
                    }
                </style>
            </head>

            <body class="d-flex flex-column min-vh-100 bg-light">
                <%@ include file="header.jsp" %>

                    <div class="welcome-hero">
                        <div class="container text-center">
                            <h4 class="text-uppercase mb-3" style="letter-spacing: 2px;">Basavarajeshwari Group of
                                Institution</h4>
                            <h1 class="display-4 fw-bold mb-3">SANJAY GANDHI POLYTECHNIC</h1>
                            <p class="lead opacity-75">Quality Education with Continuous Improvement through Feedback
                            </p>
                        </div>
                    </div>

                    <div class="container mb-5">
                        <div class="text-center mb-5">
                            <h2 class="fw-bold">Welcome to Student Feedback Portal</h2>
                            <p class="text-muted">Your feedback helps us grow and serve you better.</p>
                        </div>

                        <div class="row g-4">
                            <% if (userLoggedIn && userBean.getRoleId()==2) { %>
                                <div class="col-md-4">
                                    <div class="card feature-card p-4">
                                        <div class="icon-circle bg-primary text-white">
                                            <i class="fas fa-chalkboard-teacher"></i>
                                        </div>
                                        <h3>Teacher Feedback</h3>
                                        <p class="text-muted">Rate your subject teachers based on teaching quality and
                                            classroom interaction.</p>
                                        <a href="<%=CFSView.TEACHERS_LIST_CTL%>" class="btn btn-primary mt-auto">Give
                                            Feedback</a>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="card feature-card p-4">
                                        <div class="icon-circle bg-success text-white">
                                            <i class="fas fa-hotel"></i>
                                        </div>
                                        <h3>College Facilities</h3>
                                        <p class="text-muted">Feedback regarding library, canteen, infrastructure, and
                                            other campus facilities.</p>
                                        <a href="<%=CFSView.COLLEGE_FACILITIES_FEEDBACK_CTL%>"
                                            class="btn btn-success mt-auto">Submit Feedback</a>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="card feature-card p-4">
                                        <div class="icon-circle bg-info text-white">
                                            <i class="fas fa-graduation-cap"></i>
                                        </div>
                                        <h3>Course End</h3>
                                        <p class="text-muted">Feedback on course outcomes and overall learning
                                            experience at the end of the semester.</p>
                                        <a href="<%=CFSView.COURSE_END_FEEDBACK_CTL%>"
                                            class="btn btn-info text-white mt-auto">Take Survey</a>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="card feature-card p-4">
                                        <div class="icon-circle bg-warning text-white">
                                            <i class="fas fa-users"></i>
                                        </div>
                                        <h3>Parents Feedback</h3>
                                        <p class="text-muted">Submit feedback on behalf of your parents regarding the
                                            college environment.</p>
                                        <a href="<%=CFSView.PARENTS_FEEDBACK_CTL%>"
                                            class="btn btn-warning text-white mt-auto">Submit</a>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="card feature-card p-4">
                                        <div class="icon-circle bg-danger text-white">
                                            <i class="fas fa-exclamation-circle"></i>
                                        </div>
                                        <h3>Submit Complaint</h3>
                                        <p class="text-muted">File a complaint anonymously regarding any issue in the
                                            college.</p>
                                        <a href="<%=CFSView.COMPLAINT_CTL%>" class="btn btn-danger mt-auto">Report
                                            Issue</a>
                                    </div>
                                </div>
                                <% } else if (userLoggedIn && (userBean.getRoleId()==1 || userBean.getRoleId()==3)) { %>
                                    <div class="col-md-4">
                                        <div class="card feature-card p-4 text-center">
                                            <div class="icon-circle bg-primary text-white mx-auto">
                                                <i class="fas fa-chart-pie"></i>
                                            </div>
                                            <h3>Admin Dashboard</h3>
                                            <p class="text-muted">Monitor feedback trends and manage system entities.
                                            </p>
                                            <a href="<%=CFSView.FEEDBACK_LIST_CTL%>"
                                                class="btn btn-primary mt-auto">View All Feedback</a>
                                        </div>
                                    </div>
                                    <% } else { %>
                                        <div class="col-md-12 text-center py-5">
                                            <div class="card p-5 border-0 shadow-sm rounded-4">
                                                <i class="fas fa-lock mb-4 text-primary display-4"></i>
                                                <h3>Please Login to Continue</h3>
                                                <p class="text-muted mb-4">You need to sign in as a student or staff to
                                                    access the feedback forms.</p>
                                                <div class="d-flex justify-content-center gap-3">
                                                    <a href="<%=CFSView.LOGIN_CTL%>"
                                                        class="btn btn-primary btn-lg px-5">Sign In</a>
                                                    <a href="<%=CFSView.USER_REGISTRATION_CTL%>"
                                                        class="btn btn-outline-primary btn-lg px-5">Register</a>
                                                </div>
                                            </div>
                                        </div>
                                        <% } %>
                        </div>
                    </div>

                    <%@ include file="footer.jsp" %>
            </body>

            </html>