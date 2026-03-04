<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Welcome to Student Feedback System</title>
  </head>

  <body>
    <%@ include file="header.jsp" %>

      <!-- Hero Section -->
      <div class="hero-section">
        <div class="hero-content">
          <h1 class="hero-title">Sanjay Gandhi Polytechnic Feedback System</h1>
          <p class="hero-subtitle">Empowering Education Through Constructive Feedback</p>
          <div class="hero-buttons">
            <% if (!userLoggedIn) { %>
              <a href="<%=CFSView.LOGIN_CTL%>" class="btn btn-primary btn-lg me-3">Get Started</a>
              <a href="<%=CFSView.USER_REGISTRATION_CTL%>" class="btn btn-secondary btn-lg">Sign Up</a>
              <% } else { %>
                <p class="welcome-user">Welcome back, <%=userBean.getName()%>!</p>
                <% } %>
          </div>
        </div>
      </div>

      <% if (userLoggedIn) { boolean isAdmin=userBean.getRoleId()==1 || userBean.getRoleId()==3 || "Admin"
        .equalsIgnoreCase(userBean.getRoleName()) || "Principal" .equalsIgnoreCase(userBean.getRoleName()) || "HOD"
        .equalsIgnoreCase(userBean.getRoleName()); boolean isStudent=userBean.getRoleId()==2 && !isAdmin; %>
        <% if (isStudent) { %>
          <!-- Student Dashboard -->
          <div class="container mt-5">
            <h2 class="text-center mb-4" style="color: #1a237e; font-weight: 700;">Student Dashboard</h2>
            <div class="row">
              <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm">
                  <div class="card-body text-center" style="color: #333 !important;">
                    <i class="fas fa-university fa-3x text-primary mb-3"></i>
                    <h5 class="card-title">College Facilities</h5>
                    <p class="card-text">Provide feedback on college infrastructure and facilities.</p>
                    <a href="<%=CFSView.COLLEGE_FACILITIES_FEEDBACK_CTL%>" class="btn btn-primary">Give
                      Feedback</a>
                  </div>
                </div>
              </div>

              <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm">
                  <div class="card-body text-center" style="color: #333 !important;">
                    <i class="fas fa-graduation-cap fa-3x text-success mb-3"></i>
                    <h5 class="card-title">Course End Feedback</h5>
                    <p class="card-text">Share your learning experience and course outcomes.</p>
                    <a href="<%=CFSView.COURSE_END_FEEDBACK_CTL%>" class="btn btn-success">Give Feedback</a>
                  </div>
                </div>
              </div>

              <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm">
                  <div class="card-body text-center" style="color: #333 !important;">
                    <i class="fas fa-user-friends fa-3x text-warning mb-3"></i>
                    <h5 class="card-title">Parents Feedback</h5>
                    <p class="card-text">Submit feedback on behalf of your parents/guardians.</p>
                    <a href="<%=CFSView.PARENTS_FEEDBACK_CTL%>" class="btn btn-warning">Give Feedback</a>
                  </div>
                </div>
              </div>

              <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm">
                  <div class="card-body text-center" style="color: #333 !important;">
                    <i class="fas fa-chalkboard-teacher fa-3x text-info mb-3"></i>
                    <h5 class="card-title">Teacher Feedback</h5>
                    <p class="card-text">Rate your teachers and their teaching methodology.</p>
                    <a href="<%=CFSView.TEACHER_LIST_CTL%>" class="btn btn-info">View Teachers</a>
                  </div>
                </div>
              </div>

              <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm">
                  <div class="card-body text-center" style="color: #333 !important;">
                    <i class="fas fa-exclamation-circle fa-3x text-danger mb-3"></i>
                    <h5 class="card-title">Submit Complaint</h5>
                    <p class="card-text">Report issues or concerns anonymously to the administration.</p>
                    <a href="<%=CFSView.COMPLAINT_CTL%>" class="btn btn-danger">Submit Complaint</a>
                  </div>
                </div>
              </div>

              <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm">
                  <div class="card-body text-center" style="color: #333 !important;">
                    <i class="fas fa-tasks fa-3x text-secondary mb-3"></i>
                    <h5 class="card-title">My Complaints</h5>
                    <p class="card-text">Track your submitted complaints and view their current status.</p>
                    <a href="<%=CFSView.COMPLAINT_LIST_CTL%>" class="btn btn-secondary">Track Complaints</a>
                  </div>
                </div>
              </div>

              <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm">
                  <div class="card-body text-center" style="color: #333 !important;">
                    <i class="fas fa-file-alt fa-3x text-primary mb-3"></i>
                    <h5 class="card-title">Mid-Sem Feedback</h5>
                    <p class="card-text">Provide feedback for the middle of the semester.</p>
                    <a href="<%=CFSView.MID_SEM_FEEDBACK_CTL%>" class="btn btn-primary">Give Feedback</a>
                  </div>
                </div>
              </div>

              <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm">
                  <div class="card-body text-center" style="color: #333 !important;">
                    <i class="fas fa-file-contract fa-3x text-success mb-3"></i>
                    <h5 class="card-title">End-Sem Feedback</h5>
                    <p class="card-text">Provide feedback for the end of the semester.</p>
                    <a href="<%=CFSView.END_SEM_FEEDBACK_CTL%>" class="btn btn-success">Give Feedback</a>
                  </div>
                </div>
              </div>

              <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm">
                  <div class="card-body text-center" style="color: #333 !important;">
                    <i class="fas fa-user-circle fa-3x text-dark mb-3"></i>
                    <h5 class="card-title">My Profile</h5>
                    <p class="card-text">View and update your personal information and password.</p>
                    <a href="<%=CFSView.MY_PROFILE_CTL%>" class="btn btn-dark">View Profile</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <% } else if (isAdmin) { %>
            <!-- Admin Dashboard -->
            <div class="container mt-5">
              <h2 class="text-center mb-4" style="color: #1a237e; font-weight: 700;">Administrator Dashboard</h2>
              <div class="row">
                <div class="col-md-4 mb-4">
                  <div class="card h-100 shadow-sm">
                    <div class="card-body text-center" style="color: #333 !important;">
                      <i class="fas fa-users fa-3x text-primary mb-3"></i>
                      <h5 class="card-title">Manage Students</h5>
                      <p class="card-text">View and manage all registered students in the system.</p>
                      <a href="<%=CFSView.USER_LIST_CTL%>" class="btn btn-primary">View Students</a>
                    </div>
                  </div>
                </div>

                <div class="col-md-4 mb-4">
                  <div class="card h-100 shadow-sm">
                    <div class="card-body text-center" style="color: #333 !important;">
                      <i class="fas fa-chalkboard-teacher fa-3x text-success mb-3"></i>
                      <h5 class="card-title">Manage Faculty</h5>
                      <p class="card-text">Add, edit, or remove faculty members from the directory.</p>
                      <a href="<%=CFSView.TEACHER_LIST_CTL%>" class="btn btn-success">View Faculty</a>
                    </div>
                  </div>
                </div>

                <div class="col-md-4 mb-4">
                  <div class="card h-100 shadow-sm">
                    <div class="card-body text-center" style="color: #333 !important;">
                      <i class="fas fa-comments fa-3x text-info mb-3"></i>
                      <h5 class="card-title">Teacher Feedback</h5>
                      <p class="card-text">View all teacher feedback submitted by students.</p>
                      <a href="<%=CFSView.TEACHER_FEEDBACK_LIST_CTL%>" class="btn btn-info">View Feedback</a>
                    </div>
                  </div>
                </div>

                <div class="col-md-4 mb-4">
                  <div class="card h-100 shadow-sm">
                    <div class="card-body text-center" style="color: #333 !important;">
                      <i class="fas fa-university fa-3x text-warning mb-3"></i>
                      <h5 class="card-title">Facilities Feedback</h5>
                      <p class="card-text">View feedback on college facilities and infrastructure.</p>
                      <a href="<%=CFSView.COLLEGE_FACILITIES_FEEDBACK_LIST_CTL%>" class="btn btn-warning">View
                        Feedback</a>
                    </div>
                  </div>
                </div>

                <div class="col-md-4 mb-4">
                  <div class="card h-100 shadow-sm">
                    <div class="card-body text-center" style="color: #333 !important;">
                      <i class="fas fa-graduation-cap fa-3x text-danger mb-3"></i>
                      <h5 class="card-title">Course End Feedback</h5>
                      <p class="card-text">View course completion and learning outcome feedback.</p>
                      <a href="<%=CFSView.COURSE_END_FEEDBACK_LIST_CTL%>" class="btn btn-danger">View
                        Feedback</a>
                    </div>
                  </div>
                </div>

                <div class="col-md-4 mb-4">
                  <div class="card h-100 shadow-sm">
                    <div class="card-body text-center" style="color: #333 !important;">
                      <i class="fas fa-user-friends fa-3x text-secondary mb-3"></i>
                      <h5 class="card-title">Parents Feedback</h5>
                      <p class="card-text">View feedback submitted by parents and guardians.</p>
                      <a href="<%=CFSView.PARENTS_FEEDBACK_LIST_CTL%>" class="btn btn-secondary">View
                        Feedback</a>
                    </div>
                  </div>
                </div>

                <div class="col-md-4 mb-4">
                  <div class="card h-100 shadow-sm">
                    <div class="card-body text-center" style="color: #333 !important;">
                      <i class="fas fa-exclamation-triangle fa-3x text-danger mb-3"></i>
                      <h5 class="card-title">Student Complaints</h5>
                      <p class="card-text">View and manage student complaints (anonymous).</p>
                      <a href="<%=CFSView.COMPLAINT_LIST_CTL%>" class="btn btn-danger">View Complaints</a>
                    </div>
                  </div>
                </div>

                <div class="col-md-4 mb-4">
                  <div class="card h-100 shadow-sm">
                    <div class="card-body text-center" style="color: #333 !important;">
                      <i class="fas fa-file-invoice fa-3x text-primary mb-3"></i>
                      <h5 class="card-title">Mid-Sem Feedback</h5>
                      <p class="card-text">View all mid-semester student feedback.</p>
                      <a href="<%=CFSView.MID_SEM_FEEDBACK_LIST_CTL%>" class="btn btn-primary">View Feedback</a>
                    </div>
                  </div>
                </div>

                <div class="col-md-4 mb-4">
                  <div class="card h-100 shadow-sm">
                    <div class="card-body text-center" style="color: #333 !important;">
                      <i class="fas fa-file-signature fa-3x text-success mb-3"></i>
                      <h5 class="card-title">End-Sem Feedback</h5>
                      <p class="card-text">View all end-semester student feedback.</p>
                      <a href="<%=CFSView.END_SEM_FEEDBACK_LIST_CTL%>" class="btn btn-success">View Feedback</a>
                    </div>
                  </div>
                </div>

                <div class="col-md-4 mb-4">
                  <div class="card h-100 shadow-sm">
                    <div class="card-body text-center" style="color: #333 !important;">
                      <i class="fas fa-user-shield fa-3x text-dark mb-3"></i>
                      <h5 class="card-title">My Profile</h5>
                      <p class="card-text">Manage your administrative profile and security settings.</p>
                      <a href="<%=CFSView.MY_PROFILE_CTL%>" class="btn btn-dark">View Profile</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <% } %>
              <% } %>
                </div>
                </div>
                </div>

                <!-- Features Section -->
                <div class="container my-5">
                  <div class="text-center mb-5">
                    <h2 style="color: #1a237e; font-weight: 700;">Key Features</h2>
                    <p style="color: #666; font-size: 1.1rem;">Comprehensive feedback system for better education</p>
                  </div>

                  <div class="row">
                    <div class="col-md-4 mb-4">
                      <div class="feature-card">
                        <div class="feature-icon">
                          <i class="fas fa-star"></i>
                        </div>
                        <h3 class="feature-title">Rate Teachers</h3>
                        <p class="feature-description">
                          Provide detailed ratings on teaching quality, communication, methodology, and punctuality.
                        </p>
                      </div>
                    </div>

                    <div class="col-md-4 mb-4">
                      <div class="feature-card">
                        <div class="feature-icon">
                          <i class="fas fa-comment-dots"></i>
                        </div>
                        <h3 class="feature-title">Submit Feedback</h3>
                        <p class="feature-description">
                          Share your thoughts and suggestions anonymously to help improve teaching standards.
                        </p>
                      </div>
                    </div>

                    <div class="col-md-4 mb-4">
                      <div class="feature-card">
                        <div class="feature-icon">
                          <i class="fas fa-chart-line"></i>
                        </div>
                        <h3 class="feature-title">Track Progress</h3>
                        <p class="feature-description">
                          Administrators can view comprehensive feedback reports and identify areas for improvement.
                        </p>
                      </div>
                    </div>
                  </div>

                  <div class="row mt-4">
                    <div class="col-md-4 mb-4">
                      <div class="feature-card">
                        <div class="feature-icon">
                          <i class="fas fa-user-shield"></i>
                        </div>
                        <h3 class="feature-title">Anonymous & Secure</h3>
                        <p class="feature-description">
                          Your feedback remains confidential, ensuring honest and constructive communication.
                        </p>
                      </div>
                    </div>

                    <div class="col-md-4 mb-4">
                      <div class="feature-card">
                        <div class="feature-icon">
                          <i class="fas fa-users"></i>
                        </div>
                        <h3 class="feature-title">Easy Management</h3>
                        <p class="feature-description">
                          Simple interface for students to submit feedback and admins to manage teacher information.
                        </p>
                      </div>
                    </div>

                    <div class="col-md-4 mb-4">
                      <div class="feature-card">
                        <div class="feature-icon">
                          <i class="fas fa-clipboard-check"></i>
                        </div>
                        <h3 class="feature-title">Comprehensive Reports</h3>
                        <p class="feature-description">
                          Detailed feedback reports help identify strengths and areas needing improvement.
                        </p>
                      </div>
                    </div>
                  </div>
                </div>

                <%@ include file="footer.jsp" %>
  </body>

  </html>