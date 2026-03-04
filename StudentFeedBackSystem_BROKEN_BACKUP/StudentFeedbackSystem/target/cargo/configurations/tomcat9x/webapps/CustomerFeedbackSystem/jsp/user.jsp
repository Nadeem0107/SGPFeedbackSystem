<%@page import="in.co.customer.feedback.sys.ctl.UserCtl" %>
    <%@page import="in.co.customer.feedback.sys.util.HTMLUtility" %>
        <%@page import="in.co.customer.feedback.sys.util.DataUtility" %>
            <%@page import="in.co.customer.feedback.sys.util.ServletUtility" %>
                <%@page import="java.util.HashMap" %>
                    <%@page import="java.util.List" %>
                        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
                            <!DOCTYPE html>
                            <html>

                            <head>
                                <meta charset="UTF-8">
                                <title>User Management</title>
                            </head>

                            <body>
                                <%@ include file="header.jsp" %>
                                    <div class="container">
                                        <br />
                                        <nav class="navbar navbar-expand-lg navbar-light"
                                            style="background-color: #1266f1;">
                                            <div class="container-fluid">
                                                <nav aria-label="breadcrumb">
                                                    <ol class="breadcrumb">
                                                        <li class="breadcrumb-item"><a class="text-white"
                                                                href="<%=CFSView.WELCOME_CTL%>">Home</a></li>
                                                        <li class="breadcrumb-item active text-white"
                                                            aria-current="page">User Management</li>
                                                    </ol>
                                                </nav>
                                            </div>
                                        </nav>
                                        <hr>

                                        <div class="row justify-content-center">
                                            <div class="col-md-8">
                                                <div class="card shadow">
                                                    <div class="card-header bg-primary text-white text-center">
                                                        <% String
                                                            title=(DataUtility.getLong(request.getParameter("id"))> 0) ?
                                                            "Edit User Details" : "Add New User"; %>
                                                            <h3>
                                                                <%=title%>
                                                            </h3>
                                                    </div>
                                                    <div class="card-body">
                                                        <b>
                                                            <font color="red">
                                                                <%=ServletUtility.getErrorMessage(request)%>
                                                            </font>
                                                        </b>
                                                        <b>
                                                            <font color="green">
                                                                <%=ServletUtility.getSuccessMessage(request)%>
                                                            </font>
                                                        </b>

                                                        <form method="post" action="<%=CFSView.USER_CTL%>">
                                                            <jsp:useBean id="bean"
                                                                class="in.co.customer.feedback.sys.bean.UserBean"
                                                                scope="request"></jsp:useBean>

                                                            <input type="hidden" name="id" value="<%=bean.getId()%>">
                                                            <input type="hidden" name="createdBy"
                                                                value="<%=bean.getCreatedBy()%>">
                                                            <input type="hidden" name="modifiedBy"
                                                                value="<%=bean.getModifiedBy()%>">
                                                            <input type="hidden" name="createdDatetime"
                                                                value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
                                                            <input type="hidden" name="modifiedDatetime"
                                                                value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">
                                                            <input type="hidden" name="roleId"
                                                                value="<%=bean.getRoleId()%>">
                                                            <input type="hidden" name="roleName"
                                                                value="<%=bean.getRoleName()%>">

                                                            <div class="row mb-3">
                                                                <div class="col-md-6">
                                                                    <label class="form-label">Full Name</label>
                                                                    <input type="text" class="form-control" name="name"
                                                                        value="<%=DataUtility.getStringData(bean.getName())%>">
                                                                    <font color="red">
                                                                        <%=ServletUtility.getErrorMessage("name",
                                                                            request)%>
                                                                    </font>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label class="form-label">User Name / Reg No</label>
                                                                    <input type="text" class="form-control"
                                                                        name="userName"
                                                                        value="<%=DataUtility.getStringData(bean.getUserName())%>">
                                                                    <font color="red">
                                                                        <%=ServletUtility.getErrorMessage("userName",
                                                                            request)%>
                                                                    </font>
                                                                </div>
                                                            </div>

                                                            <div class="row mb-3">
                                                                <div class="col-md-6">
                                                                    <label class="form-label">Email Id</label>
                                                                    <input type="text" class="form-control" name="email"
                                                                        value="<%=DataUtility.getStringData(bean.getEmail())%>">
                                                                    <font color="red">
                                                                        <%=ServletUtility.getErrorMessage("email",
                                                                            request)%>
                                                                    </font>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label class="form-label">Contact No</label>
                                                                    <input type="text" class="form-control"
                                                                        name="contactNo"
                                                                        value="<%=DataUtility.getStringData(bean.getContactNo())%>">
                                                                    <font color="red">
                                                                        <%=ServletUtility.getErrorMessage("contactNo",
                                                                            request)%>
                                                                    </font>
                                                                </div>
                                                            </div>

                                                            <div class="row mb-3">
                                                                <div class="col-md-6">
                                                                    <label class="form-label">Department</label>
                                                                    <% List deptList=(List)
                                                                        request.getAttribute("deptList"); %>
                                                                        <%=HTMLUtility.getList("deptId",
                                                                            String.valueOf(bean.getDeptId()),
                                                                            deptList)%>
                                                                            <font color="red">
                                                                                <%=ServletUtility.getErrorMessage("deptId",
                                                                                    request)%>
                                                                            </font>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label class="form-label">Semester</label>
                                                                    <% HashMap<String, String> semMap = new HashMap
                                                                        <String, String>();
                                                                            semMap.put("1", "1st Semester");
                                                                            semMap.put("2", "2nd Semester");
                                                                            semMap.put("3", "3rd Semester");
                                                                            semMap.put("4", "4th Semester");
                                                                            semMap.put("5", "5th Semester");
                                                                            semMap.put("6", "6th Semester");
                                                                            %>
                                                                            <%=HTMLUtility.getList("semester",
                                                                                bean.getSemester(), semMap)%>
                                                                                <font color="red">
                                                                                    <%=ServletUtility.getErrorMessage("semester",
                                                                                        request)%>
                                                                                </font>
                                                                </div>
                                                            </div>

                                                            <div class="row mb-3">
                                                                <div class="col-md-6">
                                                                    <label class="form-label">DOB</label>
                                                                    <input type="text" class="form-control" name="dob"
                                                                        id="datepicker"
                                                                        value="<%=DataUtility.getDateString(bean.getDob())%>">
                                                                    <font color="red">
                                                                        <%=ServletUtility.getErrorMessage("dob",
                                                                            request)%>
                                                                    </font>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label class="form-label">Gender</label>
                                                                    <% HashMap<String, String> genderMap = new HashMap
                                                                        <String, String>();
                                                                            genderMap.put("Male", "Male");
                                                                            genderMap.put("Female", "Female");
                                                                            %>
                                                                            <%=HTMLUtility.getList("gender",
                                                                                bean.getGender(), genderMap)%>
                                                                                <font color="red">
                                                                                    <%=ServletUtility.getErrorMessage("gender",
                                                                                        request)%>
                                                                                </font>
                                                                </div>
                                                            </div>

                                                            <div class="text-center">
                                                                <button type="submit" class="btn btn-success"
                                                                    name="operation" value="<%=UserCtl.OP_SAVE%>">Save
                                                                    User</button>
                                                                <button type="submit" class="btn btn-secondary"
                                                                    name="operation"
                                                                    value="<%=UserCtl.OP_CANCEL%>">Cancel</button>
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