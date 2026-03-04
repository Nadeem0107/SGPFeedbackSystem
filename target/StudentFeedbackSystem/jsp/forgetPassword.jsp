<%@page import="in.co.customer.feedback.sys.ctl.ForgetPasswordCtl" %>
    <%@page import="in.co.customer.feedback.sys.ctl.CFSView" %>
        <%@page import="in.co.customer.feedback.sys.util.ServletUtility" %>
            <%@page import="in.co.customer.feedback.sys.util.DataUtility" %>
                <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
                    <!DOCTYPE html>
                    <html>

                    <head>
                        <meta charset="UTF-8">
                        <title>Forgot Password - Student Feedback System</title>
                        <link
                            href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap"
                            rel="stylesheet" />

                        <style>
                            body {
                                background-color: #f5f7fa;
                                font-family: 'Outfit', sans-serif;
                                margin: 0;
                                padding: 0;
                            }

                            .forgot-card {
                                background: #ffffff;
                                border-radius: 24px;
                                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
                                padding: 40px;
                                max-width: 440px;
                                margin: 40px auto;
                                border: 1px solid #f0f0f0;
                            }

                            .forgot-icon-container {
                                width: 64px;
                                height: 64px;
                                background: linear-gradient(135deg, #f59e0b, #f97316);
                                border-radius: 50%;
                                display: flex;
                                align-items: center;
                                justify-content: center;
                                margin: 0 auto 20px;
                                box-shadow: 0 4px 10px rgba(245, 158, 11, 0.3);
                            }

                            .forgot-icon {
                                color: white;
                                font-size: 24px;
                            }

                            .form-control {
                                border-radius: 12px;
                                padding: 12px 16px;
                                border: 1px solid #e2e8f0;
                                background-color: #f8fafc;
                                font-size: 0.95rem;
                                width: 100%;
                                box-sizing: border-box;
                                font-family: 'Outfit', sans-serif;
                            }

                            .form-control:focus {
                                outline: none;
                                background-color: #fff;
                                border-color: #3b71ca;
                                box-shadow: 0 0 0 3px rgba(59, 113, 202, 0.1);
                            }

                            .form-label {
                                font-weight: 500;
                                color: #64748b;
                                margin-bottom: 6px;
                                font-size: 0.85rem;
                                display: block;
                            }

                            .mb-3 {
                                margin-bottom: 1rem;
                            }

                            .mb-4 {
                                margin-bottom: 1.5rem;
                            }

                            .btn-submit {
                                background-color: #f59e0b;
                                color: white;
                                border-radius: 12px;
                                padding: 12px;
                                font-weight: 600;
                                font-size: 1rem;
                                text-transform: none;
                                box-shadow: 0 4px 6px -1px rgba(245, 158, 11, 0.2);
                                width: 100%;
                                border: none;
                                cursor: pointer;
                                font-family: 'Outfit', sans-serif;
                                transition: background-color 0.2s ease, box-shadow 0.2s ease;
                            }

                            .btn-submit:hover {
                                background-color: #d97706;
                                box-shadow: 0 8px 15px -3px rgba(245, 158, 11, 0.3);
                            }

                            .error-msg {
                                background-color: #fee2e2;
                                color: #ef4444;
                                padding: 10px;
                                border-radius: 8px;
                                border: 1px solid #fecaca;
                                display: flex;
                                align-items: center;
                                gap: 10px;
                                font-size: 0.85rem;
                                margin-bottom: 20px;
                            }

                            .success-msg {
                                background-color: #dcfce7;
                                color: #166534;
                                padding: 12px;
                                border-radius: 8px;
                                border: 1px solid #bbf7d0;
                                font-size: 0.85rem;
                                margin-bottom: 20px;
                                text-align: center;
                                line-height: 1.4;
                            }

                            .info-box {
                                background-color: #eff6ff;
                                border: 1px solid #bfdbfe;
                                border-radius: 10px;
                                padding: 12px 16px;
                                margin-bottom: 20px;
                                font-size: 0.82rem;
                                color: #1e40af;
                                line-height: 1.5;
                            }

                            .info-box i {
                                margin-right: 8px;
                                color: #3b82f6;
                            }

                            .text-center {
                                text-align: center;
                            }

                            .text-muted {
                                color: #94a3b8;
                            }

                            .fw-bold {
                                font-weight: 700;
                            }

                            a {
                                color: #3b71ca;
                                text-decoration: none;
                            }

                            a:hover {
                                text-decoration: underline;
                            }

                            .container-forgot {
                                display: flex;
                                align-items: center;
                                justify-content: center;
                                min-height: 80vh;
                            }

                            .d-grid {
                                display: grid;
                            }

                            .gap-2 {
                                gap: 0.5rem;
                            }

                            .back-link {
                                display: inline-flex;
                                align-items: center;
                                gap: 6px;
                                font-size: 0.9rem;
                                font-weight: 500;
                                color: #64748b;
                                transition: color 0.2s ease;
                            }

                            .back-link:hover {
                                color: #3b71ca;
                                text-decoration: none;
                            }
                        </style>
                    </head>

                    <body>
                        <%@ include file="header.jsp" %>

                            <div class="container-forgot">
                                <div class="forgot-card">
                                    <div class="forgot-icon-container">
                                        <i class="fas fa-key forgot-icon"></i>
                                    </div>

                                    <div class="text-center mb-4">
                                        <h3 class="fw-bold" style="color: #1e293b; margin-bottom: 4px;">Forgot Password?
                                        </h3>
                                        <p class="text-muted" style="font-size: 0.9rem; margin: 0;">Enter your username
                                            and we'll send a reset link to your email</p>
                                    </div>

                                    <div class="info-box">
                                        <i class="fas fa-info-circle"></i>
                                        This feature is available only for <strong>HOD</strong> and
                                        <strong>Principal</strong> accounts. A password reset email will be sent to the
                                        registered email address.
                                    </div>

                                    <form method="post" action="<%=CFSView.FORGET_PASSWORD_CTL%>">
                                        <jsp:useBean id="bean" class="in.co.customer.feedback.sys.bean.UserBean"
                                            scope="request"></jsp:useBean>

                                        <% String errorMsg=ServletUtility.getErrorMessage(request); String
                                            successMsg=ServletUtility.getSuccessMessage(request); if (errorMsg !=null &&
                                            errorMsg.length()> 0) { %>
                                            <div class="error-msg">
                                                <i class="fas fa-exclamation-circle"></i>
                                                <span>
                                                    <%=errorMsg%>
                                                </span>
                                            </div>
                                            <% } %>

                                                <% if (successMsg !=null && successMsg.length()> 0) { %>
                                                    <div class="success-msg">
                                                        <i class="fas fa-check-circle" style="margin-right: 6px;"></i>
                                                        <%=successMsg%>
                                                    </div>
                                                    <% } %>

                                                        <!-- Username Input -->
                                                        <div class="mb-4">
                                                            <label class="form-label">Username / Employee ID *</label>
                                                            <input type="text" name="userName" class="form-control"
                                                                placeholder="Enter your Username or Employee ID"
                                                                value="<%=DataUtility.getStringData(bean.getUserName())%>" />
                                                            <div style="min-height: 18px;">
                                                                <font color="red" size="2">
                                                                    <%=ServletUtility.getErrorMessage("userName",
                                                                        request)%>
                                                                </font>
                                                            </div>
                                                        </div>

                                                        <div class="d-grid gap-2 mb-4">
                                                            <button type="submit" class="btn-submit" name="operation"
                                                                value="<%=ForgetPasswordCtl.OP_SUBMIT%>">
                                                                <i class="fas fa-paper-plane"
                                                                    style="margin-right: 8px;"></i>
                                                                Send Reset Link
                                                            </button>
                                                        </div>

                                                        <div class="text-center">
                                                            <a href="<%=CFSView.LOGIN_CTL%>" class="back-link">
                                                                <i class="fas fa-arrow-left"></i>
                                                                Back to Login
                                                            </a>
                                                        </div>
                                    </form>
                                </div>
                            </div>

                            <%@ include file="footer.jsp" %>
                    </body>

                    </html>