<%@page import="in.co.customer.feedback.sys.bean.FeedbackBean" %>
	<%@page import="in.co.customer.feedback.sys.util.ServletUtility" %>
		<%@page import="java.util.Iterator" %>
			<%@page import="java.util.List" %>
				<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
					<!DOCTYPE html>
					<html>

					<head>
						<meta charset="UTF-8">
						<title>FeedBack List</title>
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
											<i class="fa fa-arrow-right" aria-hidden="true"></i> FeedBack List
										</li>
									</ol>
								</nav>
							</div>
							<hr>
							<form method="post" action="<%=CFSView.FEEDBACK_LIST_CTL%>">
								<div class="card">
									<h5 class="card-header" style="background-color: #00061df7; color: white;">FeedBack
										List</h5>
									<div class="card-body">
										<div class="row g-3">

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

										<table class="table table-bordered border-primary">
											<thead>
												<tr>

													<th scope="col"><input type="checkbox" id="selectall">Select
														All</th>
													<th scope="col">#</th>
													<th scope="col">Faculty</th>
													<th scope="col">Date</th>
													<th scope="col">FeedBack</th>
												</tr>
											</thead>
											<tbody>
												<% int pageNo=ServletUtility.getPageNo(request); int
													pageSize=ServletUtility.getPageSize(request); int index=((pageNo -
													1) * pageSize) + 1; int size=ServletUtility.getSize(request);
													FeedbackBean bean=null; List list=ServletUtility.getList(request);
													Iterator<FeedbackBean> iterator = list.iterator();
													while (iterator.hasNext()) {
													bean = iterator.next();
													%>
													<tr>
														<td><input type="checkbox" class="case" name="ids"
																value="<%=bean.getId()%>"></td>
														<td scope="row">
															<%=index++%>
														</td>
														<td scope="row">
															<%=bean.getProductName()%>
														</td>
														<td scope="row">
															<%=bean.getDate()%>
														</td>
														<td scope="row">
															<%=bean.getFeedback()%>
														</td>

													</tr>
													<% } %>
											</tbody>
										</table>

										<div class="clearfix">
											<input type="submit" name="operation"
												class="btn btn-sm btn-danger float-start" <%=(list.size()==0)
												? "disabled" : "" %>
											value="Delete">
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
