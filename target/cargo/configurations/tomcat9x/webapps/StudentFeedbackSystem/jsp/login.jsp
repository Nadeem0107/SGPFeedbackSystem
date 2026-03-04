<%@page import="in.co.customer.feedback.sys.ctl.LoginCtl" %>
	<%@page import="in.co.customer.feedback.sys.ctl.CFSView" %>
		<%@page import="in.co.customer.feedback.sys.util.ServletUtility" %>
			<%@page import="in.co.customer.feedback.sys.util.DataUtility" %>
				<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
					<!DOCTYPE html>
					<html>

					<head>
						<meta charset="UTF-8">
						<title>Login - Student Feedback System</title>
						<!-- Google Fonts -->
						<link
							href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap"
							rel="stylesheet" />

						<style>
							body {
								background-color: #f5f7fa;
								font-family: 'Outfit', sans-serif;
							}

							.login-card {
								background: #ffffff;
								border-radius: 24px;
								box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
								padding: 40px;
								max-width: 440px;
								margin: 40px auto;
								border: 1px solid #f0f0f0;
							}

							.login-icon-container {
								width: 64px;
								height: 64px;
								background-color: #3b71ca;
								border-radius: 50%;
								display: flex;
								align-items: center;
								justify-content: center;
								margin: 0 auto 20px;
								box-shadow: 0 4px 10px rgba(59, 113, 202, 0.3);
							}

							.login-icon {
								color: white;
								font-size: 24px;
							}

							.role-selector {
								background-color: #f1f5f9;
								border-radius: 50px;
								padding: 4px;
								display: flex;
								justify-content: space-between;
								margin-bottom: 24px;
								gap: 2px;
							}

							.role-btn {
								flex: 1;
								text-align: center;
								padding: 8px 8px;
								border-radius: 50px;
								cursor: pointer;
								font-weight: 600;
								font-size: 0.8rem;
								color: #64748b;
								transition: all 0.3s ease;
								border: none;
								background: transparent;
								font-family: 'Outfit', sans-serif;
								outline: none;
							}

							.role-btn:hover {
								color: #3b71ca;
							}

							.role-btn.active {
								background-color: #3b71ca;
								color: white !important;
								box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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

							.btn-login {
								background-color: #3b71ca;
								color: white;
								border-radius: 12px;
								padding: 12px;
								font-weight: 600;
								font-size: 1rem;
								text-transform: none;
								box-shadow: 0 4px 6px -1px rgba(59, 113, 202, 0.2);
								width: 100%;
								border: none;
								cursor: pointer;
								font-family: 'Outfit', sans-serif;
								transition: background-color 0.2s ease, box-shadow 0.2s ease;
							}

							.btn-login:hover {
								background-color: #3061af;
								box-shadow: 0 8px 15px -3px rgba(59, 113, 202, 0.3);
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
								padding: 10px;
								border-radius: 8px;
								border: 1px solid #bbf7d0;
								font-size: 0.85rem;
								margin-bottom: 20px;
								text-align: center;
							}

							.text-center {
								text-align: center;
							}

							.text-primary {
								color: #3b71ca;
							}

							.fw-bold {
								font-weight: 700;
							}

							.fw-medium {
								font-weight: 500;
							}

							.text-muted {
								color: #94a3b8;
							}

							.d-grid {
								display: grid;
							}

							.gap-2 {
								gap: 0.5rem;
							}

							a {
								color: #3b71ca;
								text-decoration: none;
							}

							a:hover {
								text-decoration: underline;
							}

							.container-login {
								display: flex;
								align-items: center;
								justify-content: center;
								min-height: 80vh;
							}
						</style>
						<script>
							function selectRole(roleId, roleName) {
								// Update hidden inputs
								document.getElementById('roleIdInput').value = roleId;
								document.getElementById('roleNameInput').value = roleName;

								// Update visual state — remove active from all, add to clicked
								var buttons = document.querySelectorAll('.role-btn');
								buttons.forEach(function (btn) {
									btn.classList.remove('active');
									if (parseInt(btn.getAttribute('data-role-id')) === roleId &&
										btn.getAttribute('data-role-name') === roleName) {
										btn.classList.add('active');
									}
								});

								// Update label and placeholder
								var usernameLabel = document.getElementById('usernameLabel');
								var usernameInput = document.getElementById('usernameField');

								if (roleId === 2) {
									usernameLabel.textContent = 'Register Number *';
									usernameInput.placeholder = 'Enter Register Number';
								} else if (roleName === 'Admin') {
									usernameLabel.textContent = 'Principal Username *';
									usernameInput.placeholder = 'Enter Username';
								} else if (roleId === 3) {
									usernameLabel.textContent = 'Employee ID / Username *';
									usernameInput.placeholder = 'Enter Employee ID';
								}
							}

							window.addEventListener('DOMContentLoaded', function () {
								var roleId = parseInt(document.getElementById('roleIdInput').value);
								var roleName = document.getElementById('roleNameInput').value;

								// Mark the correct button as active on page load
								var buttons = document.querySelectorAll('.role-btn');
								buttons.forEach(function (btn) {
									if (parseInt(btn.getAttribute('data-role-id')) === roleId &&
										btn.getAttribute('data-role-name') === roleName) {
										btn.classList.add('active');
									} else {
										btn.classList.remove('active');
									}
								});

								// Set label/placeholder correctly
								var usernameLabel = document.getElementById('usernameLabel');
								var usernameInput = document.getElementById('usernameField');
								if (roleId === 2) {
									usernameLabel.textContent = 'Register Number *';
									usernameInput.placeholder = 'Enter Register Number';
								} else if (roleName === 'Admin') {
									usernameLabel.textContent = 'Principal Username *';
									usernameInput.placeholder = 'Enter Username';
								} else if (roleId === 3) {
									usernameLabel.textContent = 'Employee ID / Username *';
									usernameInput.placeholder = 'Enter Employee ID';
								}
							});
						</script>
					</head>

					<body>
						<%@ include file="header.jsp" %>

							<div class="container-login">
								<div class="login-card w-100">
									<div class="login-icon-container">
										<i class="fas fa-lock login-icon"></i>
									</div>

									<div class="text-center mb-4">
										<h3 class="fw-bold mb-1" style="color: #1e293b; margin-bottom: 4px;">Welcome
											Back</h3>
										<p class="text-muted" style="font-size: 0.9rem; margin: 0;">Please select your
											role to continue</p>
									</div>

									<form method="post" action="<%=CFSView.LOGIN_CTL%>">
										<jsp:useBean id="bean" class="in.co.customer.feedback.sys.bean.UserBean"
											scope="request"></jsp:useBean>

										<% String uri=(String) request.getAttribute("uri"); long
											currentRoleId=(bean.getRoleId()> 0) ? bean.getRoleId() : 2;
											String currentRoleName = (bean.getRoleName() != null &&
											!bean.getRoleName().isEmpty()) ? bean.getRoleName() : "Student";
											%>

											<input type="hidden" name="uri" value="<%=uri%>">
											<input type="hidden" name="id" value="<%=bean.getId()%>">
											<input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
											<input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
											<input type="hidden" name="createdDatetime"
												value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
											<input type="hidden" name="modifiedDatetime"
												value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">

											<!-- Hidden Role Inputs -->
											<input type="hidden" id="roleIdInput" name="roleId"
												value="<%=currentRoleId%>">
											<input type="hidden" id="roleNameInput" name="roleName"
												value="<%=currentRoleName%>">

											<!-- Role Selector Buttons -->
											<div class="role-selector">
												<button type="button" class="role-btn" data-role-id="2"
													data-role-name="Student"
													onclick="selectRole(2, 'Student')">Student</button>
												<button type="button" class="role-btn" data-role-id="3"
													data-role-name="HOD" onclick="selectRole(3, 'HOD')">HOD</button>
												<button type="button" class="role-btn" data-role-id="1"
													data-role-name="Admin"
													onclick="selectRole(1, 'Admin')">Admin</button>
											</div>

											<% String errorMsg=ServletUtility.getErrorMessage(request); String
												successMsg=ServletUtility.getSuccessMessage(request); if (errorMsg
												!=null && errorMsg.length()> 0) { %>
												<div class="error-msg">
													<i class="fas fa-exclamation-circle"></i>
													<span>
														<%=errorMsg%>
													</span>
												</div>
												<% } %>

													<% if (successMsg !=null && successMsg.length()> 0) { %>
														<div class="success-msg">
															<%=successMsg%>
														</div>
														<% } %>

															<!-- Username Input -->
															<div class="mb-3">
																<label class="form-label" id="usernameLabel">Register
																	Number *</label>
																<input type="text" id="usernameField" name="userName"
																	class="form-control"
																	placeholder="Enter Register Number"
																	value="<%=DataUtility.getStringData(bean.getUserName())%>" />
																<div style="min-height: 18px;">
																	<font color="red" size="2">
																		<%=ServletUtility.getErrorMessage("userName",
																			request)%>
																	</font>
																</div>
															</div>

															<!-- Password Input -->
															<div class="mb-4">
																<label class="form-label">Password *</label>
																<input type="password" id="passwordField"
																	name="password" class="form-control"
																	placeholder="Enter Password"
																	value="<%=DataUtility.getStringData(bean.getPassword())%>" />
																<div style="min-height: 18px;">
																	<font color="red" size="2">
																		<%=ServletUtility.getErrorMessage("password",
																			request)%>
																	</font>
																</div>
															</div>

															<div class="d-grid gap-2 mb-4">
																<button type="submit" class="btn-login" name="operation"
																	value="<%=LoginCtl.OP_SIGN_IN%>">
																	Sign In
																</button>
															</div>

															<div class="text-center" style="margin-bottom: 12px;">
																<a href="<%=CFSView.FORGET_PASSWORD_CTL%>"
																	style="font-size: 0.85rem; color: #64748b; font-weight: 500;"
																	onmouseover="this.style.color='#3b71ca'"
																	onmouseout="this.style.color='#64748b'">
																	<i class="fas fa-key" style="margin-right: 4px; font-size: 0.8rem;"></i>
																	Forgot Password?
																</a>
															</div>

															<div class="text-center">
																<a href="<%=CFSView.USER_REGISTRATION_CTL%>"
																	class="text-primary fw-medium"
																	style="font-size: 0.9rem;">New student? Create an
																	account</a>
															</div>

									</form>
								</div>
							</div>

							<%@ include file="footer.jsp" %>
					</body>

					</html>