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
						<!-- Font Awesome -->
						<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
							rel="stylesheet" />
						<!-- Google Fonts -->
						<link
							href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap"
							rel="stylesheet" />
						<!-- MDB -->
						<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css"
							rel="stylesheet" />

						<style>
							body {
								background-color: #f5f7fa;
								font-family: 'Outfit', sans-serif;
							}

							.login-ignore-header {
								/* If we want to hide the main header on login page, we could keys this, but keeping it for navigation */
							}

							.login-card {
								background: #ffffff;
								border-radius: 24px;
								box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
								padding: 40px;
								max-width: 420px;
								margin: 40px auto;
								border: 1px solid #f0f0f0;
							}

							.login-icon-container {
								width: 64px;
								height: 64px;
								background-color: #3b71ca;
								/* Primary Blue from MDB */
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
								/* Pill shape container */
								padding: 4px;
								display: flex;
								justify-content: space-between;
								margin-bottom: 24px;
							}

							.role-btn {
								flex: 1;
								text-align: center;
								padding: 8px 12px;
								border-radius: 50px;
								/* Pill buttons */
								cursor: pointer;
								font-weight: 600;
								font-size: 0.85rem;
								color: #64748b;
								transition: all 0.3s ease;
								border: none;
								background: transparent;
							}

							.role-btn.active {
								background-color: #3b71ca;
								color: white;
								box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
							}

							.form-control {
								border-radius: 12px;
								padding: 12px 16px;
								border: 1px solid #e2e8f0;
								background-color: #f8fafc;
								font-size: 0.95rem;
							}

							.form-control:focus {
								background-color: #fff;
								border-color: #3b71ca;
								box-shadow: 0 0 0 3px rgba(59, 113, 202, 0.1);
							}

							.form-label {
								font-weight: 500;
								color: #64748b;
								margin-bottom: 6px;
								font-size: 0.85rem;
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

							.divider {
								display: flex;
								align-items: center;
								text-align: center;
								margin: 20px 0;
							}

							.divider::before,
							.divider::after {
								content: '';
								flex: 1;
								border-bottom: 1px solid #e2e8f0;
							}

							.divider span {
								padding: 0 10px;
								color: #94a3b8;
								font-size: 0.8rem;
							}
						</style>
						<script>
							function selectRole(roleId, roleName, element) {
								// Update Hidden Input
								document.getElementById('roleIdInput').value = roleId;
								document.getElementById('roleNameInput').value = roleName;

								// Update Visuals
								document.querySelectorAll('.role-btn').forEach(btn => {
									btn.classList.remove('active');
								});
								element.classList.add('active');

								// Update Labels/Placeholders based on role
								const usernameLabel = document.getElementById('usernameLabel');
								const usernameInput = document.getElementById('usernameField');

								if (roleId === 2) { // Student
									usernameLabel.innerText = "Register Number *";
									usernameInput.placeholder = "Enter Register Number";
								} else if (roleId === 1) { // Principal
									usernameLabel.innerText = "Username *";
									usernameInput.placeholder = "Enter Username";
								} else if (roleId === 3) { // HOD
									usernameLabel.innerText = "Employee ID / Username *";
									usernameInput.placeholder = "Enter Employee ID / Username";
								} else if (roleId === 4) { // Faculty
									usernameLabel.innerText = "Faculty ID / Username *";
									usernameInput.placeholder = "Enter Faculty ID / Username";
								}
							}

							// Initialize label state on load
							window.onload = function () {
								const roleIdInput = document.getElementById('roleIdInput');
								if (roleIdInput) {
									const roleId = parseInt(roleIdInput.value);
									// Just update Label/Placeholder, visual state is already set by invalidating jsp logic
									const usernameLabel = document.getElementById('usernameLabel');
									const usernameInput = document.getElementById('usernameField');

									if (roleId === 2) { // Student
										usernameLabel.innerText = "Register Number *";
										usernameInput.placeholder = "Enter Register Number";
									} else if (roleId === 1) { // Principal
										usernameLabel.innerText = "Username *";
										usernameInput.placeholder = "Enter Username";
									} else if (roleId === 3) { // HOD
										usernameLabel.innerText = "Employee ID / Username *";
										usernameInput.placeholder = "Enter Employee ID / Username";
									} else if (roleId === 4) { // Faculty
										usernameLabel.innerText = "Faculty ID / Username *";
										usernameInput.placeholder = "Enter Faculty ID / Username";
									}
								}
							}
						</script>
					</head>

					<body>
						<%@ include file="header.jsp" %>

							<div class="container d-flex align-items-center justify-content-center"
								style="min-height: 80vh;">
								<div class="login-card w-100">
									<div class="login-icon-container">
										<i class="fas fa-lock login-icon"></i>
									</div>

									<div class="text-center mb-4">
										<h3 class="fw-bold mb-1" style="color: #1e293b;">Welcome Back</h3>
										<p class="text-muted" style="font-size: 0.9rem;">Please select your role to
											continue</p>
									</div>

									<form method="post" action="<%=CFSView.LOGIN_CTL%>">
										<jsp:useBean id="bean" class="in.co.customer.feedback.sys.bean.UserBean"
											scope="request"></jsp:useBean>

										<% String uri=(String) request.getAttribute("uri"); long
											currentRoleId=(bean.getRoleId()> 0) ? bean.getRoleId() : 2;
											String currentRoleName = (bean.getRoleName() != null) ? bean.getRoleName() :
											"Student";
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

											<!-- Role Selector -->
											<div class="role-selector">
												<div class="role-btn <%= currentRoleId == 2 ? " active" : "" %>"
													onclick="selectRole(2, 'Student', this)">Student</div>
												<div class="role-btn <%= currentRoleId == 4 ? " active" : "" %>"
													onclick="selectRole(4, 'Faculty', this)">Faculty</div>
												<div class="role-btn <%= currentRoleId == 3 ? " active" : "" %>"
													onclick="selectRole(3, 'HOD', this)">HOD</div>
												<div class="role-btn <%= currentRoleId == 1 ? " active" : "" %>"
													onclick="selectRole(1, 'Admin', this)">Principal</div>
											</div>

											<% String errorMsg=ServletUtility.getErrorMessage(request); String
												successMsg=ServletUtility.getSuccessMessage(request); if(errorMsg !=null
												&& errorMsg.length()> 0){
												%>
												<div class="error-msg">
													<i class="fas fa-exclamation-circle"></i>
													<span>
														<%=errorMsg%>
													</span>
												</div>
												<% } %>

													<% if(successMsg !=null && successMsg.length()> 0){ %>
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
																<div style="min-height: 20px;">
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
																<div style="min-height: 20px;">
																	<font color="red" size="2">
																		<%=ServletUtility.getErrorMessage("password",
																			request)%>
																	</font>
																</div>
															</div>

															<div class="d-grid gap-2 mb-4">
																<button type="submit" class="btn btn-login"
																	name="operation" value="<%=LoginCtl.OP_SIGN_IN%>">
																	Sign In
																</button>
															</div>

															<div class="text-center">
																<a href="<%=CFSView.USER_REGISTRATION_CTL%>"
																	class="text-primary fw-medium"
																	style="font-size: 0.9rem; text-decoration: none;">New
																	student? Create an account</a>
															</div>

									</form>
								</div>
							</div>

							<%@ include file="footer.jsp" %>
					</body>

					</html>