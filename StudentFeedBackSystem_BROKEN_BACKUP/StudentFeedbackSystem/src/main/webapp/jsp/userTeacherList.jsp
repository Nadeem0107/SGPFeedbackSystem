<%@page import="in.co.customer.feedback.sys.bean.TeacherBean" %>
	<%@page import="in.co.customer.feedback.sys.util.ServletUtility" %>
		<%@page import="java.util.Iterator" %>
			<%@page import="java.util.List" %>
				<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
					<!DOCTYPE html>
					<html>

					<head>
						<meta charset="UTF-8">
						<title>Faculty Directory</title>
						<link href="<%=CFSView.APP_CONTEXT%>/css/login.css" rel="stylesheet">
					</head>

					<body>
						<%@ include file="header.jsp" %>
							<br>
							<div class="container">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item linkSize"><i class="fas fa-tachometer-alt"></i> <a
												class="link-dark" href="<%=CFSView.WELCOME_CTL%>">Home</a></li>
										<li class="breadcrumb-item linkSize active" aria-current="page">
											<i class="fa fa-arrow-right" aria-hidden="true"></i>Faculty
										</li>
									</ol>
								</nav>
							</div>
							<hr>
							<form method="post" action="<%=CFSView.TEACHERS_LIST_CTL%>">
								<div class="card">
									<h5 class="card-header" style="background-color: #00061df7; color: white;">Faculty
									</h5>
									<div class="card-body">
										<div class="row g-3">

											<div class="col">
												<input type="text" placeholder="Search By  Name here..." name="name"
													class="form-control" value="<%=ServletUtility.getParameter(" name",
													request)%>">
											</div>

											<div class="col">
												<input type="submit" class="btn  btn-outline-primary" name="operation"
													value="Search"></input> or <input type="submit"
													class="btn  btn-outline-secondary" name="operation" value="Reset">
											</div>
										</div>
										<b>
											<font color="red">
												<%=ServletUtility.getErrorMessage(request)%>
											</font>
										</b> <b>
											<font color="Green">
												<%=ServletUtility.getSuccessMessage(request)%>
											</font>
										</b><br>

										<div class="row row-cols-1 row-cols-md-3 g-4">

											<% int pageNo=ServletUtility.getPageNo(request); int
												pageSize=ServletUtility.getPageSize(request); int index=((pageNo - 1) *
												pageSize) + 1; int size=ServletUtility.getSize(request); TeacherBean
												bean=null; List list=ServletUtility.getList(request);
												Iterator<TeacherBean> iterator = list.iterator();
												while (iterator.hasNext()) {
												bean = iterator.next();
												%>
												<div class="col">
													<div class="card">
														<a href="<%=CFSView.TEACHER_DETAIL_CTL%>?pId=<%=bean.getId()%>"><img
																src="<%=CFSView.APP_CONTEXT%>/image/<%=bean.getImage()%>"
																class="card-img-top"
																alt="Hollywood Sign on The Hill" /></a>
														<div class="card-body">
															<h5 class="card-title">
																<%=bean.getName()%>
															</h5>
															<p class="card-text">
																<%=bean.getDescription()%>
															</p>
															<a href="<%=CFSView.TEACHER_FEEDBACK_CTL%>?tId=<%=bean.getId()%>"
																class="btn btn-success btn-sm">Give Feedback</a>
														</div>
													</div>
												</div>

												<%} %>

										</div>
										<br>
										<div class="clearfix">
											<nav aria-label="Page navigation example float-end">
												<ul class="pagination justify-content-end" style="font-size: 13px">
													<li class="page-item"><input type="submit" name="operation"
															class="page-link " <%=(pageNo==1) ? "disabled" : "" %>
														value="Previous"></li>

													<li class="page-item"><input type="submit" name="operation"
															class="page-link " <%=((list.size() < pageSize) ||
															size==pageNo * pageSize) ? "disabled" : "" %>
														value="Next"></li>
												</ul>
											</nav>
										</div>
										<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input type="hidden"
											name="pageSize" value="<%=pageSize%>">

									</div>

								</div>
							</form>

							<%@ include file="footer.jsp" %>
					</body>

					</html>
