<%@page import="in.co.customer.feedback.sys.ctl.TeacherCtl" %>
	<%@page import="in.co.customer.feedback.sys.util.DataUtility" %>
		<%@page import="in.co.customer.feedback.sys.util.ServletUtility" %>
			<%@page import="java.util.HashMap" %>
				<%@page import="in.co.customer.feedback.sys.ctl.CFSView" %>
					<%@page import="java.util.List" %>
						<%@page import="in.co.customer.feedback.sys.util.HTMLUtility" %>
							<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
								<!DOCTYPE html>
								<html>

								<head>
									<meta charset="UTF-8">
									<title>Faculty Management | Add Member</title>
									<link
										href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap"
										rel="stylesheet">
									<style>
										:root {
											--primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
											--card-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
										}

										body {
											background-color: #f8f9fc;
											font-family: 'Outfit', sans-serif;
										}

										.form-card {
											background: #fff;
											border: none;
											border-radius: 20px;
											box-shadow: var(--card-shadow);
											overflow: hidden;
											margin-top: 40px;
											margin-bottom: 60px;
										}

										.form-header {
											background: var(--primary-gradient);
											padding: 40px;
											color: #fff;
											text-align: center;
										}

										.form-header h2 {
											font-weight: 700;
											margin-bottom: 10px;
										}

										.form-body {
											padding: 40px;
										}

										.form-label {
											font-weight: 600;
											color: #4a5568;
											margin-bottom: 8px;
											font-size: 0.9rem;
										}

										.form-control-custom {
											border: 1px solid #e2e8f0;
											border-radius: 12px;
											padding: 12px 18px;
											transition: all 0.3s;
										}

										.form-control-custom:focus {
											border-color: #667eea;
											box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
											outline: none;
										}

										.btn-save {
											background: var(--primary-gradient);
											border: none;
											border-radius: 12px;
											padding: 14px 40px;
											font-weight: 700;
											color: #fff;
											transition: all 0.3s;
											margin-right: 15px;
										}

										.btn-save:hover {
											transform: translateY(-2px);
											box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
											opacity: 0.95;
										}

										.btn-reset {
											background: #f1f5f9;
											border: none;
											border-radius: 12px;
											padding: 14px 40px;
											font-weight: 700;
											color: #475569;
											transition: all 0.3s;
										}

										.btn-reset:hover {
											background: #e2e8f0;
										}

										.error-msg {
											font-size: 0.8rem;
											color: #e53e3e;
											margin-top: 5px;
										}

										.breadcrumb-item a {
											color: rgba(255, 255, 255, 0.8);
											text-decoration: none;
										}
									</style>
								</head>

								<body>
									<%@ include file="header.jsp" %>

										<div class="container">
											<div class="row justify-content-center">
												<div class="col-lg-8">
													<div class="form-card">
														<div class="form-header">
															<nav aria-label="breadcrumb">
																<ol class="breadcrumb justify-content-center mb-3">
																	<li class="breadcrumb-item"><a
																			href="<%=CFSView.WELCOME_CTL%>">Home</a>
																	</li>
																	<li class="breadcrumb-item active text-white"
																		aria-current="page">Faculty Management</li>
																</ol>
															</nav>
															<% String
																title=(DataUtility.getLong(request.getParameter("id"))>
																0)
																? "Edit Faculty Profile" : "Register New Faculty";
																%>
																<h2>
																	<%=title%>
																</h2>
																<p class="mb-0 opacity-75">Fill in the details to update
																	the
																	academic directory</p>
														</div>

														<div class="form-body">
															<% if (ServletUtility.getErrorMessage(request) !=null &&
																!ServletUtility.getErrorMessage(request).isEmpty()) { %>
																<div
																	class="alert alert-danger rounded-pill text-center mb-4">
																	<%=ServletUtility.getErrorMessage(request)%>
																</div>
																<% } %>
																	<% if (ServletUtility.getSuccessMessage(request)
																		!=null &&
																		!ServletUtility.getSuccessMessage(request).isEmpty())
																		{ %>
																		<div
																			class="alert alert-success rounded-pill text-center mb-4">
																			<%=ServletUtility.getSuccessMessage(request)%>
																		</div>
																		<% } %>

																			<form method="post"
																				action="<%=CFSView.TEACHER_CTL%>"
																				enctype="multipart/form-data">
																				<jsp:useBean id="bean"
																					class="in.co.customer.feedback.sys.bean.TeacherBean"
																					scope="request"></jsp:useBean>

																				<input type="hidden" name="id"
																					value="<%=bean.getId()%>">
																				<input type="hidden" name="createdBy"
																					value="<%=bean.getCreatedBy()%>">
																				<input type="hidden" name="modifiedBy"
																					value="<%=bean.getModifiedBy()%>">
																				<input type="hidden"
																					name="createdDatetime"
																					value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
																				<input type="hidden"
																					name="modifiedDatetime"
																					value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">

																				<div class="row">
																					<div class="col-md-6 mb-4">
																						<label class="form-label">Full
																							Name</label>
																						<input type="text"
																							placeholder="e.g. Dr. Sarah Smith"
																							class="form-control form-control-custom w-100"
																							name="name"
																							value="<%=DataUtility.getStringData(bean.getName())%>">
																						<div class="error-msg">
																							<%=ServletUtility.getErrorMessage("name",
																								request)%>
																						</div>
																					</div>

																					<div class="col-md-6 mb-4">
																						<label
																							class="form-label">Specialty
																							/
																							Subject</label>
																						<input type="text"
																							placeholder="e.g. Computer Science"
																							class="form-control form-control-custom w-100"
																							name="price"
																							value="<%=DataUtility.getStringData(bean.getPrice())%>">
																						<div class="error-msg">
																							<%=ServletUtility.getErrorMessage("price",
																								request)%>
																						</div>
																					</div>
																				</div>

																				<div class="row">
																					<div class="col-md-6 mb-4">
																						<label
																							class="form-label">Department</label>
																						<% List deptList=(List)
																							request.getAttribute("deptList");
																							%>
																							<%=HTMLUtility.getList("deptId",
																								String.valueOf(bean.getDeptId()),
																								deptList)%>
																								<div class="error-msg">
																									<%=ServletUtility.getErrorMessage("deptId",
																										request)%>
																								</div>
																					</div>

																					<div class="col-md-6 mb-4">
																						<label
																							class="form-label">Semester</label>
																						<% HashMap<String, String>
																							semMap = new
																							HashMap<String, String>();
																								semMap.put("1", "1st
																								Semester");
																								semMap.put("2", "2nd
																								Semester");
																								semMap.put("3", "3rd
																								Semester");
																								semMap.put("4", "4th
																								Semester");
																								semMap.put("5", "5th
																								Semester");
																								semMap.put("6", "6th
																								Semester");
																								%>
																								<%=HTMLUtility.getList("semester",
																									bean.getSemester(),
																									semMap)%>
																									<div
																										class="error-msg">
																										<%=ServletUtility.getErrorMessage("semester",
																											request)%>
																									</div>
																					</div>
																				</div>

																				<div class="mb-4">
																					<label class="form-label">Profile
																						Image</label>
																					<input type="file"
																						class="form-control form-control-custom w-100"
																						name="image" <%=bean.getId()==0
																						? "required" : "" %>>
																					<div class="text-muted mt-2"
																						style="font-size: 0.8rem;">
																						Upload a
																						professional headshot (JPG, PNG)
																					</div>
																				</div>

																				<div class="mb-4">
																					<label class="form-label">Faculty
																						Expertise
																						/ Description</label>
																					<textarea rows="4"
																						placeholder="Briefly describe the faculty's expertise, research areas, or achievements..."
																						class="form-control form-control-custom w-100"
																						name="description"><%=DataUtility.getStringData(bean.getDescription())%></textarea>
																					<div class="error-msg">
																						<%=ServletUtility.getErrorMessage("description",
																							request)%>
																					</div>
																				</div>

																				<div class="text-center mt-5">
																					<button type="submit"
																						class="btn btn-save"
																						name="operation"
																						value="<%=TeacherCtl.OP_SAVE%>">
																						<i class="fas fa-save me-2"></i>
																						Save
																						Faculty Member
																					</button>
																					<button type="submit"
																						class="btn btn-reset"
																						name="operation"
																						value="<%=TeacherCtl.OP_RESET%>">
																						<i class="fas fa-undo me-2"></i>
																						Reset
																						Form
																					</button>
																				</div>
																			</form>
														</div>
													</div>
												</div>
											</div>
										</div>

										<%@ include file="footer.jsp" %>
								</body>

								</html>