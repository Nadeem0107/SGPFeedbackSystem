<%@page import="in.co.customer.feedback.sys.ctl.CFSView" %>
    <%@page import="in.co.customer.feedback.sys.bean.ComplaintBean" %>
        <%@page import="in.co.customer.feedback.sys.util.ServletUtility" %>
            <%@page import="in.co.customer.feedback.sys.util.DataUtility" %>
                <%@page import="java.util.Iterator" %>
                    <%@page import="java.util.List" %>
                        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
                            <!DOCTYPE html>
                            <html>

                            <head>
                                <meta charset="UTF-8">
                                <title>Student Complaints List</title>
                                <!-- CSS and JS references -->
                                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
                                    rel="stylesheet" />
                                <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
                                    rel="stylesheet" />
                                <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.0/mdb.min.css"
                                    rel="stylesheet" />
                                <link rel="stylesheet" href="<%=CFSView.APP_CONTEXT%>/css/custom_styles.css">
                                <style>
                                    .priority-high {
                                        color: #dc3545;
                                        font-weight: bold;
                                    }

                                    .priority-medium {
                                        color: #fd7e14;
                                        font-weight: bold;
                                    }

                                    .priority-low {
                                        color: #198754;
                                        font-weight: bold;
                                    }

                                    .status-badge {
                                        border-radius: 20px;
                                        padding: 5px 15px;
                                        font-size: 0.75rem;
                                    }
                                </style>
                            </head>

                            <body>
                                <%@ include file="header.jsp" %>

                                    <div class="container mt-4 mb-5">
                                        <nav aria-label="breadcrumb" class="mb-4">
                                            <ol class="breadcrumb bg-white p-3 rounded shadow-sm border">
                                                <li class="breadcrumb-item"><a href="<%=CFSView.WELCOME_CTL%>"><i
                                                            class="fas fa-home me-2"></i>Home</a></li>
                                                <li class="breadcrumb-item active">Student Complaints</li>
                                            </ol>
                                        </nav>

                                        <form method="post" action="<%=CFSView.COMPLAINT_LIST_CTL%>">
                                            <div class="card shadow-lg border-0">
                                                <div class="card-header bg-danger text-white py-3">
                                                    <h5 class="mb-0"><i
                                                            class="fas fa-exclamation-triangle me-2"></i>Student
                                                        Complaints Dashboard</h5>
                                                </div>
                                                <div class="card-body">
                                                    <div class="row g-3 mb-4">
                                                        <div class="col-md-3">
                                                            <input type="text" name="subject" class="form-control"
                                                                placeholder="Search by Subject"
                                                                value="<%=ServletUtility.getParameter(" subject",
                                                                request)%>">
                                                        </div>
                                                        <div class="col-md-3">
                                                            <select name="complaintType" class="form-select">
                                                                <option value="">-- All Types --</option>
                                                                <option value="Academic">Academic</option>
                                                                <option value="Facility">Facility</option>
                                                                <option value="Staff">Staff</option>
                                                                <option value="Harassment">Harassment</option>
                                                                <option value="Other">Other</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <select name="status" class="form-select">
                                                                <option value="">-- All Status --</option>
                                                                <option value="Pending">Pending</option>
                                                                <option value="In-Progress">In-Progress</option>
                                                                <option value="Resolved">Resolved</option>
                                                                <option value="Closed">Closed</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-3 d-flex gap-2">
                                                            <button type="submit" name="operation" value="Search"
                                                                class="btn btn-primary flex-grow-1">Search</button>
                                                            <button type="submit" name="operation" value="Reset"
                                                                class="btn btn-outline-secondary">Reset</button>
                                                        </div>
                                                    </div>

                                                    <% if(ServletUtility.getSuccessMessage(request) !=null &&
                                                        !ServletUtility.getSuccessMessage(request).isEmpty()) { %>
                                                        <div class="alert alert-success">
                                                            <%=ServletUtility.getSuccessMessage(request)%>
                                                        </div>
                                                        <% } %>
                                                            <% if(ServletUtility.getErrorMessage(request) !=null &&
                                                                !ServletUtility.getErrorMessage(request).isEmpty()) { %>
                                                                <div class="alert alert-danger">
                                                                    <%=ServletUtility.getErrorMessage(request)%>
                                                                </div>
                                                                <% } %>

                                                                    <div class="table-responsive">
                                                                        <table
                                                                            class="table table-hover align-middle border">
                                                                            <thead class="bg-light text-uppercase"
                                                                                style="font-size: 0.8rem;">
                                                                                <tr>
                                                                                    <th>#</th>
                                                                                    <th>Type</th>
                                                                                    <th>Subject</th>
                                                                                    <th>Priority</th>
                                                                                    <th>Target Dept</th>
                                                                                    <th>Status</th>
                                                                                    <th>Created</th>
                                                                                    <th>Action</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <% int
                                                                                    pageNo=ServletUtility.getPageNo(request);
                                                                                    int
                                                                                    pageSize=ServletUtility.getPageSize(request);
                                                                                    int index=((pageNo - 1) * pageSize)
                                                                                    + 1; List
                                                                                    list=ServletUtility.getList(request);
                                                                                    if(list !=null && list.size()> 0) {
                                                                                    Iterator it = list.iterator();
                                                                                    while(it.hasNext()) {
                                                                                    ComplaintBean bean = (ComplaintBean)
                                                                                    it.next();
                                                                                    String priorityClass =
                                                                                    "priority-low";
                                                                                    if("High".equalsIgnoreCase(bean.getPriority()))
                                                                                    priorityClass = "priority-high";
                                                                                    else
                                                                                    if("Medium".equalsIgnoreCase(bean.getPriority()))
                                                                                    priorityClass = "priority-medium";

                                                                                    String statusClass = "bg-warning";
                                                                                    if("Resolved".equalsIgnoreCase(bean.getStatus()))
                                                                                    statusClass = "bg-success";
                                                                                    else
                                                                                    if("Closed".equalsIgnoreCase(bean.getStatus()))
                                                                                    statusClass = "bg-secondary";
                                                                                    %>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <%=index++%>
                                                                                        </td>
                                                                                        <td><span
                                                                                                class="badge bg-light text-dark">
                                                                                                <%=bean.getComplaintType()%>
                                                                                            </span></td>
                                                                                        <td>
                                                                                            <div class="fw-bold">
                                                                                                <%=bean.getSubject()%>
                                                                                            </div>
                                                                                            <div class="small text-muted text-truncate"
                                                                                                style="max-width: 250px;">
                                                                                                <%=bean.getDescription()%>
                                                                                            </div>
                                                                                        </td>
                                                                                        <td><span
                                                                                                class="<%=priorityClass%>">
                                                                                                <%=bean.getPriority()%>
                                                                                            </span></td>
                                                                                        <td>
                                                                                            <%=bean.getTargetDepartment()%>
                                                                                        </td>
                                                                                        <td><span
                                                                                                class="badge <%=statusClass%> status-badge">
                                                                                                <%=bean.getStatus()%>
                                                                                            </span></td>
                                                                                        <td>
                                                                                            <%=DataUtility.getDateString(bean.getCreatedDatetime())%>
                                                                                        </td>
                                                                                        <td>
                                                                                            <a href="<%=CFSView.COMPLAINT_CTL%>?id=<%=bean.getId()%>"
                                                                                                class="btn btn-sm btn-outline-info rounded-pill">View</a>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <% } } else { %>
                                                                                        <tr>
                                                                                            <td colspan="8"
                                                                                                class="text-center py-5 text-muted">
                                                                                                <i
                                                                                                    class="fas fa-folder-open fa-3x mb-3 d-block"></i>
                                                                                                No complaints found
                                                                                                matching your criteria.
                                                                                            </td>
                                                                                        </tr>
                                                                                        <% } %>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>

                                                                    <div
                                                                        class="d-flex justify-content-between align-items-center mt-4">
                                                                        <input type="hidden" name="pageNo"
                                                                            value="<%=pageNo%>">
                                                                        <input type="hidden" name="pageSize"
                                                                            value="<%=pageSize%>">
                                                                        <button type="submit" name="operation"
                                                                            value="Previous"
                                                                            class="btn btn-sm btn-outline-danger"
                                                                            <%=(pageNo <=1) ? "disabled" : ""
                                                                            %>>Previous Page</button>
                                                                        <span
                                                                            class="badge bg-light text-dark px-3 py-2 border">Page
                                                                            <%=pageNo%>
                                                                        </span>
                                                                        <button type="submit" name="operation"
                                                                            value="Next"
                                                                            class="btn btn-sm btn-outline-danger"
                                                                            <%=((list==null || list.size() < pageSize))
                                                                            ? "disabled" : "" %>>Next Page</button>
                                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                    <%@ include file="footer.jsp" %>
                            </body>

                            </html>