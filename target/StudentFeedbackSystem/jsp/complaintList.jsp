<%@page import="in.co.customer.feedback.sys.ctl.CFSView" %>
    <%@page import="in.co.customer.feedback.sys.bean.ComplaintBean" %>
        <%@page import="in.co.customer.feedback.sys.util.ServletUtility" %>
            <%@page import="java.util.Iterator" %>
                <%@page import="java.util.List" %>
                    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
                        <!DOCTYPE html>
                        <html>

                        <head>
                            <meta charset="UTF-8">
                            <title>Student Complaints List</title>
                            <!-- Font Awesome -->
                            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
                                rel="stylesheet" />
                            <!-- Google Fonts -->
                            <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
                                rel="stylesheet" />
                            <!-- MDB -->
                            <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.0/mdb.min.css"
                                rel="stylesheet" />
                            <!-- Custom Styles -->
                            <link rel="stylesheet" href="<%=CFSView.APP_CONTEXT%>/css/custom_styles.css">
                            <style>
                                .badge-priority-low {
                                    background-color: #28a745;
                                    color: white;
                                    padding: 4px 12px;
                                    border-radius: 12px;
                                    font-size: 0.85rem;
                                }

                                .badge-priority-medium {
                                    background-color: #ffc107;
                                    color: #333;
                                    padding: 4px 12px;
                                    border-radius: 12px;
                                    font-size: 0.85rem;
                                }

                                .badge-priority-high {
                                    background-color: #fd7e14;
                                    color: white;
                                    padding: 4px 12px;
                                    border-radius: 12px;
                                    font-size: 0.85rem;
                                }

                                .badge-priority-urgent {
                                    background-color: #dc3545;
                                    color: white;
                                    padding: 4px 12px;
                                    border-radius: 12px;
                                    font-size: 0.85rem;
                                }

                                .badge-status-pending {
                                    background-color: #6c757d;
                                    color: white;
                                    padding: 4px 12px;
                                    border-radius: 12px;
                                    font-size: 0.85rem;
                                }

                                .badge-status-in-progress {
                                    background-color: #17a2b8;
                                    color: white;
                                    padding: 4px 12px;
                                    border-radius: 12px;
                                    font-size: 0.85rem;
                                }

                                .badge-status-resolved {
                                    background-color: #28a745;
                                    color: white;
                                    padding: 4px 12px;
                                    border-radius: 12px;
                                    font-size: 0.85rem;
                                }

                                .badge-status-closed {
                                    background-color: #343a40;
                                    color: white;
                                    padding: 4px 12px;
                                    border-radius: 12px;
                                    font-size: 0.85rem;
                                }

                                .complaint-description {
                                    max-width: 300px;
                                    overflow: hidden;
                                    text-overflow: ellipsis;
                                    white-space: nowrap;
                                }

                                .anonymous-badge {
                                    background-color: #e9ecef;
                                    color: #495057;
                                    padding: 4px 12px;
                                    border-radius: 12px;
                                    font-size: 0.85rem;
                                    font-style: italic;
                                }
                            </style>
                        </head>

                        <body>
                            <%@ include file="header.jsp" %>
                                <br>
                                <div class="container" style="margin-top: 15px; margin-bottom: 15px;">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb"
                                            style="background-color: white; padding: 10px 25px; border-radius: 8px; box-shadow: 0 2px 15px rgba(0,0,0,0.08); margin-bottom: 0; font-size: 0.9rem; border: 1px solid #eee;">
                                            <li class="breadcrumb-item"
                                                style="display: inline-flex; align-items: center;">
                                                <i class="fas fa-home" style="color: #333; margin-right: 8px;"></i>
                                                <a href="<%=CFSView.WELCOME_CTL%>"
                                                    style="color: #1a237e; text-decoration: none; font-weight: 600;">Home</a>
                                                <span style="margin: 0 10px; color: #bbb;">/</span>
                                            </li>
                                            <li class="breadcrumb-item active" aria-current="page"
                                                style="color: #6a1b9a; font-weight: 600; display: inline-flex; align-items: center;">
                                                <i class="fas fa-long-arrow-alt-right"
                                                    style="margin-right: 8px; color: #6a1b9a;"></i> Student Complaints
                                            </li>
                                        </ol>
                                    </nav>
                                </div>
                                <hr>
                                <form method="post" action="<%=CFSView.COMPLAINT_LIST_CTL%>">
                                    <div class="card">
                                        <h5 class="card-header" style="background-color: #00061df7; color: white;">
                                            <i class="fas fa-exclamation-circle"></i> Student Complaints (Anonymous)
                                        </h5>
                                        <div class="card-body">
                                            <% String subjectVal=ServletUtility.getParameter("subject", request); String
                                                typeVal=ServletUtility.getParameter("complaintType", request); String
                                                statusVal=ServletUtility.getParameter("status", request); %>
                                                <div class="row g-3">
                                                    <div class="col-md-3">
                                                        <input type="text" placeholder="Search by subject..."
                                                            name="subject" class="form-control" value="<%=subjectVal%>">
                                                    </div>
                                                    <div class="col-md-3">
                                                        <select name="complaintType" class="form-control">
                                                            <option value="">All Types</option>
                                                            <option value="Academic" <%="Academic" .equals(typeVal)
                                                                ? "selected" : "" %>>Academic</option>
                                                            <option value="Infrastructure" <%="Infrastructure"
                                                                .equals(typeVal) ? "selected" : "" %>>Infrastructure
                                                            </option>
                                                            <option value="Faculty" <%="Faculty" .equals(typeVal)
                                                                ? "selected" : "" %>>Faculty</option>
                                                            <option value="Administration" <%="Administration"
                                                                .equals(typeVal) ? "selected" : "" %>>Administration
                                                            </option>
                                                            <option value="Hostel" <%="Hostel" .equals(typeVal)
                                                                ? "selected" : "" %>>Hostel</option>
                                                            <option value="Library" <%="Library" .equals(typeVal)
                                                                ? "selected" : "" %>>Library</option>
                                                            <option value="Canteen" <%="Canteen" .equals(typeVal)
                                                                ? "selected" : "" %>>Canteen</option>
                                                            <option value="Transport" <%="Transport" .equals(typeVal)
                                                                ? "selected" : "" %>>Transport</option>
                                                            <option value="Other" <%="Other" .equals(typeVal)
                                                                ? "selected" : "" %>>Other</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <select name="status" class="form-control">
                                                            <option value="">All Status</option>
                                                            <option value="Pending" <%="Pending" .equals(statusVal)
                                                                ? "selected" : "" %>>Pending</option>
                                                            <option value="In Progress" <%="In Progress"
                                                                .equals(statusVal) ? "selected" : "" %>>In Progress
                                                            </option>
                                                            <option value="Resolved" <%="Resolved" .equals(statusVal)
                                                                ? "selected" : "" %>>Resolved</option>
                                                            <option value="Closed" <%="Closed" .equals(statusVal)
                                                                ? "selected" : "" %>>Closed</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <input type="submit" class="btn btn-outline-primary"
                                                            name="operation" value="Search"></input> or <input
                                                            type="submit" class="btn btn-outline-secondary"
                                                            name="operation" value="Reset">
                                                    </div>
                                                </div>
                                                <b>
                                                    <font color="red">
                                                        <%=ServletUtility.getErrorMessage(request)%>
                                                    </font>
                                                </b>
                                                <b>
                                                    <font color="Green">
                                                        <%=ServletUtility.getSuccessMessage(request)%>
                                                    </font>
                                                </b><br>

                                                <div
                                                    style="background: #fff3cd; padding: 12px; border-radius: 8px; margin-bottom: 15px; border-left: 4px solid #ffc107;">
                                                    <p style="margin: 0; font-size: 0.9rem; color: #856404;">
                                                        <i class="fas fa-info-circle"></i>
                                                        <strong>Privacy Notice:</strong> All complaints are displayed
                                                        anonymously to protect student privacy. Student identities are
                                                        not shown.
                                                    </p>
                                                </div>

                                                <table class="table table-bordered border-primary">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">#</th>
                                                            <th scope="col">Date</th>
                                                            <th scope="col">Program</th>
                                                            <th scope="col">Type</th>
                                                            <th scope="col">Subject</th>
                                                            <th scope="col">Description</th>
                                                            <th scope="col">Priority</th>
                                                            <th scope="col">Status</th>
                                                            <% if (userBean.getRoleId() !=2) { %>
                                                                <th scope="col">Sent To</th>
                                                                <th scope="col">Action</th>
                                                                <% } %>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <% int pageNo=ServletUtility.getPageNo(request); int
                                                            pageSize=ServletUtility.getPageSize(request); int
                                                            index=((pageNo - 1) * pageSize) + 1; int
                                                            size=ServletUtility.getSize(request); ComplaintBean
                                                            bean=null; List list=ServletUtility.getList(request);
                                                            if(list !=null){ Iterator<ComplaintBean> iterator =
                                                            list.iterator();
                                                            while (iterator.hasNext()) {
                                                            bean = iterator.next();

                                                            String priorityClass = "";
                                                            if ("Low".equals(bean.getPriority())) priorityClass =
                                                            "badge-priority-low";
                                                            else if ("Medium".equals(bean.getPriority())) priorityClass
                                                            = "badge-priority-medium";
                                                            else if ("High".equals(bean.getPriority())) priorityClass =
                                                            "badge-priority-high";
                                                            else if ("Urgent".equals(bean.getPriority())) priorityClass
                                                            = "badge-priority-urgent";

                                                            String statusClass = "";
                                                            if ("Pending".equals(bean.getStatus())) statusClass =
                                                            "badge-status-pending";
                                                            else if ("In Progress".equals(bean.getStatus())) statusClass
                                                            = "badge-status-in-progress";
                                                            else if ("Resolved".equals(bean.getStatus())) statusClass =
                                                            "badge-status-resolved";
                                                            else if ("Closed".equals(bean.getStatus())) statusClass =
                                                            "badge-status-closed";
                                                            %>
                                                            <tr>
                                                                <td scope="row">
                                                                    <%=index++%>
                                                                </td>
                                                                <td scope="row">
                                                                    <%=new
                                                                        java.text.SimpleDateFormat("dd-MMM-yyyy").format(bean.getCreatedDatetime())%>
                                                                </td>
                                                                <td scope="row">
                                                                    <%=bean.getProgram()%> (<%=bean.getAcademicYear()%>)
                                                                </td>
                                                                <td scope="row">
                                                                    <%=bean.getComplaintType()%>
                                                                </td>
                                                                <td scope="row">
                                                                    <strong>
                                                                        <%=bean.getSubject()%>
                                                                    </strong>
                                                                </td>
                                                                <td scope="row">
                                                                    <div class="complaint-description"
                                                                        title="<%=bean.getDescription()%>">
                                                                        <%=bean.getDescription()%>
                                                                    </div>
                                                                </td>
                                                                <td scope="row">
                                                                    <span class="<%=priorityClass%>">
                                                                        <%=bean.getPriority()%>
                                                                    </span>
                                                                </td>
                                                                <td scope="row">
                                                                    <span class="<%=statusClass%>">
                                                                        <%=bean.getStatus()%>
                                                                    </span>
                                                                </td>
                                                                <% if (userBean.getRoleId() !=2) { %>
                                                                    <td scope="row">
                                                                        <span
                                                                            class="badge rounded-pill bg-info text-dark">
                                                                            <%=bean.getTargetRole()%>
                                                                                <% if (bean.getTargetDepartment() !=null
                                                                                    &&
                                                                                    bean.getTargetDepartment().length()>
                                                                                    0) { %>
                                                                                    - <%=bean.getTargetDepartment()%>
                                                                                        <% } %>
                                                                        </span>
                                                                    </td>
                                                                    <td scope="row">
                                                                        <select class="form-select form-select-sm"
                                                                            onchange="updateStatus('<%=bean.getId()%>', this.value)">
                                                                            <option value="">Update Status</option>
                                                                            <option value="Pending" <%="Pending"
                                                                                .equals(bean.getStatus()) ? "selected"
                                                                                : "" %>>Pending</option>
                                                                            <option value="In Progress" <%="In Progress"
                                                                                .equals(bean.getStatus()) ? "selected"
                                                                                : "" %>>In Progress</option>
                                                                            <option value="Resolved" <%="Resolved"
                                                                                .equals(bean.getStatus()) ? "selected"
                                                                                : "" %>>Resolved</option>
                                                                            <option value="Closed" <%="Closed"
                                                                                .equals(bean.getStatus()) ? "selected"
                                                                                : "" %>>Closed</option>
                                                                        </select>
                                                                    </td>
                                                                    <% } %>
                                                            </tr>
                                                            <% }} %>
                                                    </tbody>
                                                </table>
                                                <div class="clearfix">
                                                    <nav aria-label="Page navigation example float-end">
                                                        <ul class="pagination justify-content-end"
                                                            style="font-size: 13px">
                                                            <li class="page-item"><input type="submit" name="operation"
                                                                    class="page-link " <%=(pageNo==1) ? "disabled" : ""
                                                                    %>
                                                                value="Previous"></li>
                                                            <li class="page-item"><input type="submit" name="operation"
                                                                    class="page-link " <%=((list==null || list.size() <
                                                                    pageSize) || size==pageNo * pageSize) ? "disabled"
                                                                    : "" %>
                                                                value="Next"></li>
                                                        </ul>
                                                    </nav>
                                                </div>
                                                <input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
                                                    type="hidden" name="pageSize" value="<%=pageSize%>">
                                        </div>
                                    </div>
                                </form>

                                <script>
                                    function updateStatus(id, status) {
                                        if (status && confirm('Are you sure you want to update the complaint status?')) {
                                            const form = document.createElement('form');
                                            form.method = 'POST';
                                            form.action = '<%=CFSView.COMPLAINT_LIST_CTL%>';

                                            const idInput = document.createElement('input');
                                            idInput.type = 'hidden';
                                            idInput.name = 'id';
                                            idInput.value = id;

                                            const statusInput = document.createElement('input');
                                            statusInput.type = 'hidden';
                                            statusInput.name = 'newStatus';
                                            statusInput.value = status;

                                            const opInput = document.createElement('input');
                                            opInput.type = 'hidden';
                                            opInput.name = 'operation';
                                            opInput.value = 'UpdateStatus';

                                            form.appendChild(idInput);
                                            form.appendChild(statusInput);
                                            form.appendChild(opInput);

                                            document.body.appendChild(form);
                                            form.submit();
                                        }
                                    }
                                </script>

                                <%@ include file="footer.jsp" %>
                        </body>

                        </html>