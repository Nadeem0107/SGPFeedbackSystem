<%@page import="java.util.Iterator" %>
	<%@page import="java.util.List" %>
		<%@page import="in.co.customer.feedback.sys.bean.FeedbackBean" %>
			<%@page import="in.co.customer.feedback.sys.bean.TeacherBean" %>
				<%@page import="in.co.customer.feedback.sys.ctl.TeacherDetailCtl" %>
					<%@page import="in.co.customer.feedback.sys.util.ServletUtility" %>
						<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
							%>
							<!DOCTYPE html>
							<html>

							<head>
								<meta charset="UTF-8">
								<title>Teacher Detail</title>
								<style type="text/css">
									.scrollbar-deep-purple::-webkit-scrollbar-track {
										-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
										background-color: #F5F5F5;
										border-radius: 10px;
									}

									.scrollbar-deep-purple::-webkit-scrollbar {
										width: 12px;
										background-color: #F5F5F5;
									}

									.scrollbar-deep-purple::-webkit-scrollbar-thumb {
										border-radius: 10px;
										-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
										background-color: #512da8;
									}

									.scrollbar-deep-purple {
										scrollbar-color: #512da8 #F5F5F5;
									}

									.scrollbar-cyan::-webkit-scrollbar-track {
										-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
										background-color: #F5F5F5;
										border-radius: 10px;
									}

									.scrollbar-cyan::-webkit-scrollbar {
										width: 12px;
										background-color: #F5F5F5;
									}

									.scrollbar-cyan::-webkit-scrollbar-thumb {
										border-radius: 10px;
										-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
										background-color: #00bcd4;
									}

									.scrollbar-cyan {
										scrollbar-color: #00bcd4 #F5F5F5;
									}

									.scrollbar-dusty-grass::-webkit-scrollbar-track {
										-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
										background-color: #F5F5F5;
										border-radius: 10px;
									}

									.scrollbar-dusty-grass::-webkit-scrollbar {
										width: 12px;
										background-color: #F5F5F5;
									}

									.scrollbar-dusty-grass::-webkit-scrollbar-thumb {
										border-radius: 10px;
										-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
										background-image: -webkit-linear-gradient(330deg, #d4fc79 0%, #96e6a1 100%);
										background-image: linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%);
									}

									.scrollbar-ripe-malinka::-webkit-scrollbar-track {
										-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
										background-color: #F5F5F5;
										border-radius: 10px;
									}

									.scrollbar-ripe-malinka::-webkit-scrollbar {
										width: 12px;
										background-color: #F5F5F5;
									}

									.scrollbar-ripe-malinka::-webkit-scrollbar-thumb {
										border-radius: 10px;
										-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
										background-image: -webkit-linear-gradient(330deg, #f093fb 0%, #f5576c 100%);
										background-image: linear-gradient(120deg, #f093fb 0%, #f5576c 100%);
									}

									.bordered-deep-purple::-webkit-scrollbar-track {
										-webkit-box-shadow: none;
										border: 1px solid #512da8;
									}

									.bordered-deep-purple::-webkit-scrollbar-thumb {
										-webkit-box-shadow: none;
									}

									.bordered-cyan::-webkit-scrollbar-track {
										-webkit-box-shadow: none;
										border: 1px solid #00bcd4;
									}

									.bordered-cyan::-webkit-scrollbar-thumb {
										-webkit-box-shadow: none;
									}

									.square::-webkit-scrollbar-track {
										border-radius: 0 !important;
									}

									.square::-webkit-scrollbar-thumb {
										border-radius: 0 !important;
									}

									.thin::-webkit-scrollbar {
										width: 6px;
									}

									.example-1 {
										position: relative;
										overflow-y: scroll;
										height: 200px;
									}
								</style>
							</head>

							<body>
								<%@ include file="header.jsp" %>
									<br>
									<div class="container">
										<nav aria-label="breadcrumb">
											<ol class="breadcrumb">
												<li class="breadcrumb-item linkSize"><i
														class="fas fa-tachometer-alt"></i> <a class="link-dark"
														href="<%=CFSView.WELCOME_CTL%>">Home</a></li>
												<li class="breadcrumb-item linkSize active" aria-current="page">
													<i class="fa fa-arrow-right" aria-hidden="true"></i> Teacher Details
												</li>
											</ol>
										</nav>
									</div>
									<hr>
									<% TeacherBean pBean=(TeacherBean)request.getAttribute("pBean"); %>
										<div class="card">
											<h5 class="card-header" style="background-color: #00061df7; color: white;">
												Teacher
												Detail</h5>
											<br>
											<div class="card mb-3" style="max-width: 100%; margin-left: 20px;">
												<div class="row g-0">
													<div class="col-md-4">
														<img src="<%=CFSView.APP_CONTEXT%>/image/<%=pBean.getImage()%>"
															alt="Trendy Pants and Shoes"
															class="img-fluid rounded-start" />
													</div>
													<div class="col-md-8">
														<div class="card-body">
															<h5 class="card-title">
																<%=pBean.getName()%>
															</h5>
															<p class="card-text">
																<%=pBean.getDescription()%>
															</p>

															<!-- Grid row -->
															<div class="row">
																<div class="col-md-12 mb-6">
																	<div class="card ">
																		<div class="card-header">NegativeFeedbacks</div>
																		<div
																			class="card-body example-1 scrollbar-ripe-malinka">
																			<% FeedbackBean bean=null; List
																				list=ServletUtility.getList(request);
																				Iterator<FeedbackBean> iterator =
																				list.iterator();
																				while (iterator.hasNext()) {
																				bean = iterator.next(); %>
																				<blockquote class="blockquote mb-0">
																					<p>
																						<%=bean.getFeedback()%>
																					</p>
																					<footer class="blockquote-footer">
																						By: <%=bean.getUserName()%>
																							,<cite
																								title="Source Title">Date
																								:
																								<%=bean.getCreatedDatetime()
																									%>
																							</cite>

																							<%if(userBean.getId()==bean.getUserId()){%>
																								<cite
																									title="Source Title">,<a
																										href="<%=CFSView.TEACHER_DETAIL_CTL%>?pId=<%=pBean.getId()%>&fId=<%=bean.getId()%>">Delete</a></cite>
																								<%} %>
																					</footer>
																				</blockquote>
																				<%} %>
																		</div>
																	</div>
																</div>
															</div>


															<div class="row"></div>
															<!-- Grid column -->
															<div class="col-md-12 mb-6">

																<!-- Exaple 1 -->
																<div class="card ">
																	<div class="card-header">Add Complaint</div>
																	<div class="card-body">
																		<form method="post"
																			action="<%=CFSView.TEACHER_DETAIL_CTL%>">

																			<div class="form-outline mb-4">
																				<label class="form-label">Remark</label>
																				<textarea rows="4" cols="4"
																					placeholder="Enter your remark here.."
																					class="form-control bd"
																					name="feedback"></textarea>
																				<font color="red">
																					<%=ServletUtility.getErrorMessage("feedback",
																						request)%>
																				</font>
																			</div>
																			<!-- Submit button -->
																			<input type="submit"
																				class="btn btn-primary  mb-4"
																				name="operation"
																				value="<%=TeacherDetailCtl.OP_SAVE%>">
																		</form>

																	</div>

																</div>
															</div>
														</div>
														<!-- Exaple 1 -->

													</div>
													<!-- Grid column -->
												</div>
											</div>
										</div>

										<%@ include file="footer.jsp" %>
							</body>

							</html>
