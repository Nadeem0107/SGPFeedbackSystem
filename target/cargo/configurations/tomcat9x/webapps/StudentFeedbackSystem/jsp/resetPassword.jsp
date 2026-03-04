<%@page import="in.co.customer.feedback.sys.ctl.ResetPasswordCtl" %>
    <%@page import="in.co.customer.feedback.sys.ctl.CFSView" %>
        <%@page import="in.co.customer.feedback.sys.util.ServletUtility" %>
            <%@page import="in.co.customer.feedback.sys.util.DataUtility" %>
                <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
                    <!DOCTYPE html>
                    <html>

                    <head>
                        <meta charset="UTF-8">
                        <title>Reset Password - Student Feedback System</title>
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

                            .reset-card {
                                background: #ffffff;
                                border-radius: 24px;
                                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
                                padding: 40px;
                                max-width: 440px;
                                margin: 40px auto;
                                border: 1px solid #f0f0f0;
                            }

                            .reset-icon-container {
                                width: 64px;
                                height: 64px;
                                background: linear-gradient(135deg, #10b981, #059669);
                                border-radius: 50%;
                                display: flex;
                                align-items: center;
                                justify-content: center;
                                margin: 0 auto 20px;
                                box-shadow: 0 4px 10px rgba(16, 185, 129, 0.3);
                            }

                            .reset-icon {
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
                                border-color: #10b981;
                                box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.1);
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

                            .btn-reset {
                                background-color: #10b981;
                                color: white;
                                border-radius: 12px;
                                padding: 12px;
                                font-weight: 600;
                                font-size: 1rem;
                                text-transform: none;
                                box-shadow: 0 4px 6px -1px rgba(16, 185, 129, 0.2);
                                width: 100%;
                                border: none;
                                cursor: pointer;
                                font-family: 'Outfit', sans-serif;
                                transition: background-color 0.2s ease, box-shadow 0.2s ease;
                            }

                            .btn-reset:hover {
                                background-color: #059669;
                                box-shadow: 0 8px 15px -3px rgba(16, 185, 129, 0.3);
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

                            .container-reset {
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

                            .password-requirements {
                                background-color: #f0fdf4;
                                border: 1px solid #bbf7d0;
                                border-radius: 10px;
                                padding: 12px 16px;
                                margin-bottom: 20px;
                                font-size: 0.8rem;
                                color: #166534;
                                line-height: 1.6;
                            }

                            .password-requirements strong {
                                display: block;
                                margin-bottom: 4px;
                                font-size: 0.82rem;
                            }

                            .password-requirements ul {
                                margin: 0;
                                padding-left: 18px;
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

                            /* Toggle password visibility */
                            .password-wrapper {
                                position: relative;
                            }

                            .toggle-password {
                                position: absolute;
                                right: 14px;
                                top: 50%;
                                transform: translateY(-50%);
                                cursor: pointer;
                                color: #94a3b8;
                                font-size: 0.9rem;
                                transition: color 0.2s;
                            }

                            .toggle-password:hover {
                                color: #3b71ca;
                            }
                        </style>
                    </head>

                    <body>
                        <%@ include file="header.jsp" %>

                            <% String resetToken=(String) request.getAttribute("resetToken"); if (resetToken==null)
                                resetToken="" ; %>

                                <div class="container-reset">
                                    <div class="reset-card">
                                        <div class="reset-icon-container">
                                            <i class="fas fa-shield-alt reset-icon"></i>
                                        </div>

                                        <div class="text-center mb-4">
                                            <h3 class="fw-bold" style="color: #1e293b; margin-bottom: 4px;">Set New
                                                Password</h3>
                                            <p class="text-muted" style="font-size: 0.9rem; margin: 0;">Create a strong
                                                password for your account</p>
                                        </div>

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

                                                        <form method="post" action="<%=CFSView.RESET_PASSWORD_CTL%>">
                                                            <input type="hidden" name="token" value="<%=resetToken%>">

                                                            <div class="password-requirements">
                                                                <strong><i class="fas fa-lock"
                                                                        style="margin-right: 4px;"></i> Password
                                                                    Requirements:</strong>
                                                                <ul>
                                                                    <li>At least 6 characters long</li>
                                                                    <li>Both passwords must match</li>
                                                                </ul>
                                                            </div>

                                                            <!-- New Password -->
                                                            <div class="mb-3">
                                                                <label class="form-label">New Password *</label>
                                                                <div class="password-wrapper">
                                                                    <input type="password" id="newPasswordField"
                                                                        name="newPassword" class="form-control"
                                                                        placeholder="Enter new password" />
                                                                    <span class="toggle-password"
                                                                        onclick="togglePassword('newPasswordField', this)">
                                                                        <i class="fas fa-eye"></i>
                                                                    </span>
                                                                </div>
                                                                <div style="min-height: 18px;">
                                                                    <font color="red" size="2">
                                                                        <%=ServletUtility.getErrorMessage("newPassword",
                                                                            request)%>
                                                                    </font>
                                                                </div>
                                                            </div>

                                                            <!-- Confirm Password -->
                                                            <div class="mb-4">
                                                                <label class="form-label">Confirm Password *</label>
                                                                <div class="password-wrapper">
                                                                    <input type="password" id="confirmPasswordField"
                                                                        name="confirmPassword" class="form-control"
                                                                        placeholder="Confirm new password" />
                                                                    <span class="toggle-password"
                                                                        onclick="togglePassword('confirmPasswordField', this)">
                                                                        <i class="fas fa-eye"></i>
                                                                    </span>
                                                                </div>
                                                                <div style="min-height: 18px;">
                                                                    <font color="red" size="2">
                                                                        <%=ServletUtility.getErrorMessage("confirmPassword",
                                                                            request)%>
                                                                    </font>
                                                                </div>
                                                            </div>

                                                            <div class="d-grid gap-2 mb-4">
                                                                <button type="submit" class="btn-reset" name="operation"
                                                                    value="<%=ResetPasswordCtl.OP_RESET%>">
                                                                    <i class="fas fa-check-circle"
                                                                        style="margin-right: 8px;"></i>
                                                                    Reset Password
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

                                    <script>
                                        function togglePassword(fieldId, toggleEl) {
                                            var field = document.getElementById(fieldId);
                                            var icon = toggleEl.querySelector('i');
                                            if (field.type === 'password') {
                                                field.type = 'text';
                                                icon.classList.remove('fa-eye');
                                                icon.classList.add('fa-eye-slash');
                                            } else {
                                                field.type = 'password';
                                                icon.classList.remove('fa-eye-slash');
                                                icon.classList.add('fa-eye');
                                            }
                                        }
                                    </script>
                    </body>

                    </html>