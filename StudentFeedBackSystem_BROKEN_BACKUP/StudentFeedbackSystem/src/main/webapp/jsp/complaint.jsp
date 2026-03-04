<%@ page language="java" pageEncoding="UTF-8" %>
    <%@ page import="in.co.customer.feedback.sys.ctl.CFSView" %>
        <%@ page import="in.co.customer.feedback.sys.ctl.ComplaintCtl" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Submit Complaint</title>

                <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap"
                    rel="stylesheet">
                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Font Awesome -->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

                <style>
                    * {
                        margin: 0;
                        padding: 0;
                        box-sizing: border-box;
                        font-family: 'Poppins', sans-serif;
                    }

                    body {
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        padding: 40px 0;
                    }

                    .container {
                        width: 95%;
                        max-width: 900px;
                        margin: auto;
                        background: #ffffff;
                        padding: 40px;
                        border-radius: 15px;
                        box-shadow: 0 25px 50px rgba(0, 0, 0, 0.2);
                    }

                    .header {
                        text-align: center;
                        margin-bottom: 25px;
                    }

                    .header h2 {
                        color: #667eea;
                        font-weight: 700;
                    }

                    .header p {
                        font-size: 14px;
                        color: #666;
                    }

                    .line {
                        height: 2px;
                        background: linear-gradient(to right, #667eea, #764ba2);
                        margin: 20px 0;
                    }

                    h2.title {
                        text-align: center;
                        margin-bottom: 25px;
                        color: #333;
                    }

                    .form-group {
                        margin-bottom: 20px;
                    }

                    label {
                        font-weight: 600;
                        color: #333;
                        margin-bottom: 8px;
                        display: block;
                    }

                    select,
                    input[type="text"],
                    textarea {
                        padding: 12px 15px;
                        border-radius: 8px;
                        border: 1px solid #ccc;
                        width: 100%;
                        transition: 0.3s;
                        font-family: 'Poppins', sans-serif;
                    }

                    select:focus,
                    input:focus,
                    textarea:focus {
                        border-color: #667eea;
                        outline: none;
                        box-shadow: 0 0 6px rgba(102, 126, 234, 0.3);
                    }

                    textarea {
                        resize: vertical;
                        min-height: 120px;
                    }

                    .buttons {
                        text-align: center;
                        margin-top: 30px;
                    }

                    button {
                        padding: 12px 30px;
                        border: none;
                        border-radius: 25px;
                        font-weight: 600;
                        cursor: pointer;
                        transition: 0.3s;
                        margin: 5px;
                    }

                    .submit-btn {
                        background: linear-gradient(90deg, #667eea, #764ba2);
                        color: white;
                    }

                    .submit-btn:hover {
                        transform: scale(1.05);
                        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
                    }

                    .reset-btn {
                        background: #ddd;
                    }

                    .reset-btn:hover {
                        background: #bbb;
                    }

                    .error-message {
                        color: red;
                        font-size: 0.85rem;
                        margin-top: 5px;
                    }

                    .success-message {
                        color: green;
                        text-align: center;
                        margin-bottom: 20px;
                        font-size: 1.1rem;
                        font-weight: 600;
                    }

                    .error-banner {
                        color: red;
                        text-align: center;
                        margin-bottom: 20px;
                        font-size: 1.1rem;
                        font-weight: 600;
                    }

                    .row {
                        display: flex;
                        gap: 20px;
                        flex-wrap: wrap;
                    }

                    .col-half {
                        flex: 1;
                        min-width: 250px;
                    }

                    @media(max-width:768px) {
                        .row {
                            flex-direction: column;
                        }
                    }
                </style>
            </head>

            <body>
                <%@ include file="header.jsp" %>

                    <!-- Breadcrumb Navigation -->
                    <div class="container" style="margin-top: 15px; margin-bottom: 15px;">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb"
                                style="background-color: white; padding: 10px 25px; border-radius: 8px; box-shadow: 0 2px 15px rgba(0,0,0,0.08); margin-bottom: 0; font-size: 0.9rem; border: 1px solid #eee;">
                                <li class="breadcrumb-item" style="display: inline-flex; align-items: center;">
                                    <i class="fas fa-home" style="color: #333; margin-right: 8px;"></i>
                                    <a href="<%=CFSView.WELCOME_CTL%>"
                                        style="color: #1a237e; text-decoration: none; font-weight: 600;">Home</a>
                                    <span style="margin: 0 10px; color: #bbb;">/</span>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page"
                                    style="color: #6a1b9a; font-weight: 600; display: inline-flex; align-items: center;">
                                    <i class="fas fa-long-arrow-alt-right"
                                        style="margin-right: 8px; color: #6a1b9a;"></i> Submit Complaint
                                </li>
                            </ol>
                        </nav>
                    </div>

                    <div class="container">

                        <div class="header">
                            <h4>Basavarajeshwari Group of Institution</h4>
                            <h2>SANJAY GANDHI POLYTECHNIC</h2>
                            <p>"Vidya Soudha", Sanjay Gandhi Nagar, Ballari - 583104 (Karnataka)</p>
                            <p>Ph: 08392 - 266331 / 267833</p>
                        </div>

                        <div class="line"></div>

                        <h2 class="title">STUDENT COMPLAINT FORM</h2>

                        <form action="<%=CFSView.COMPLAINT_CTL%>" method="post">
                            <jsp:useBean id="bean" class="in.co.customer.feedback.sys.bean.ComplaintBean"
                                scope="request">
                            </jsp:useBean>

                            <% if(in.co.customer.feedback.sys.util.ServletUtility.getSuccessMessage(request) !=null &&
                                in.co.customer.feedback.sys.util.ServletUtility.getSuccessMessage(request).length()> 0)
                                { %>
                                <div class="success-message">
                                    <h3>
                                        <%=in.co.customer.feedback.sys.util.ServletUtility.getSuccessMessage(request)%>
                                    </h3>
                                </div>
                                <% } %>

                                    <% if(in.co.customer.feedback.sys.util.ServletUtility.getErrorMessage(request)
                                        !=null &&
                                        in.co.customer.feedback.sys.util.ServletUtility.getErrorMessage(request).length()>
                                        0) { %>
                                        <div class="error-banner">
                                            <h3>
                                                <%=in.co.customer.feedback.sys.util.ServletUtility.getErrorMessage(request)%>
                                            </h3>
                                        </div>
                                        <% } %>

                                            <input type="hidden" name="id" value="<%=bean.getId()%>">
                                            <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
                                            <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
                                            <input type="hidden" name="createdDatetime"
                                                value="<%=in.co.customer.feedback.sys.util.DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
                                            <input type="hidden" name="modifiedDatetime"
                                                value="<%=in.co.customer.feedback.sys.util.DataUtility.getTimestamp(bean.getModifiedDatetime())%>">

                                            <div class="row">
                                                <div class="col-half">
                                                    <div class="form-group">
                                                        <label>Program <span style="color: red;">*</span></label>
                                                        <input type="text" name="program" readonly
                                                            value="<%=in.co.customer.feedback.sys.util.DataUtility.getStringData(bean.getProgram())%>">
                                                    </div>
                                                </div>

                                                <div class="col-half">
                                                    <div class="form-group">
                                                        <label>Academic Year <span style="color: red;">*</span></label>
                                                        <select name="academicYear" required>
                                                            <option value="">-- Select Year --</option>
                                                            <option value="2023-24" <%="2023-24"
                                                                .equals(bean.getAcademicYear()) ? "selected" : "" %>
                                                                >2023-24
                                                            </option>
                                                            <option value="2024-25" <%="2024-25"
                                                                .equals(bean.getAcademicYear()) ? "selected" : "" %>
                                                                >2024-25
                                                            </option>
                                                            <option value="2025-26" <%="2025-26"
                                                                .equals(bean.getAcademicYear()) ? "selected" : "" %>
                                                                >2025-26
                                                            </option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-half">
                                                    <div class="form-group">
                                                        <label>Complaint Type <span style="color: red;">*</span></label>
                                                        <select name="complaintType" required>
                                                            <option value="">-- Select Type --</option>
                                                            <option value="Academic" <%="Academic"
                                                                .equals(bean.getComplaintType()) ? "selected" : "" %>
                                                                >Academic</option>
                                                            <option value="Infrastructure" <%="Infrastructure"
                                                                .equals(bean.getComplaintType()) ? "selected" : "" %>
                                                                >Infrastructure</option>
                                                            <option value="Faculty" <%="Faculty"
                                                                .equals(bean.getComplaintType()) ? "selected" : "" %>
                                                                >Faculty</option>
                                                            <option value="Administration" <%="Administration"
                                                                .equals(bean.getComplaintType()) ? "selected" : "" %>
                                                                >Administration</option>
                                                            <option value="Hostel" <%="Hostel"
                                                                .equals(bean.getComplaintType()) ? "selected" : "" %>
                                                                >Hostel</option>
                                                            <option value="Library" <%="Library"
                                                                .equals(bean.getComplaintType()) ? "selected" : "" %>
                                                                >Library</option>
                                                            <option value="Canteen" <%="Canteen"
                                                                .equals(bean.getComplaintType()) ? "selected" : "" %>
                                                                >Canteen</option>
                                                            <option value="Transport" <%="Transport"
                                                                .equals(bean.getComplaintType()) ? "selected" : "" %>
                                                                >Transport</option>
                                                            <option value="Other" <%="Other"
                                                                .equals(bean.getComplaintType()) ? "selected" : "" %>
                                                                >Other</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-half">
                                                        <div class="form-group">
                                                            <label>Send To <span style="color: red;">*</span></label>
                                                            <select name="sendTo" required>
                                                                <option value="">-- Select Recipient --</option>
                                                                <option value="Principal">Principal</option>
                                                                <option value="HOD">HOD of My Department</option>
                                                                <option value="All">All Staff (Admin & HODs)</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-half">
                                                        <div class="form-group">
                                                            <label>Priority <span style="color: red;">*</span></label>
                                                            <select name="priority" required>
                                                                <option value="">-- Select Priority --</option>
                                                                <option value="Low" <%="Low" .equals(bean.getPriority())
                                                                    ? "selected" : "" %>>Low</option>
                                                                <option value="Medium" <%="Medium"
                                                                    .equals(bean.getPriority()) ? "selected" : "" %>
                                                                    >Medium
                                                                </option>
                                                                <option value="High" <%="High"
                                                                    .equals(bean.getPriority()) ? "selected" : "" %>
                                                                    >High</option>
                                                                <option value="Urgent" <%="Urgent"
                                                                    .equals(bean.getPriority()) ? "selected" : "" %>
                                                                    >Urgent
                                                                </option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Subject <span style="color: red;">*</span></label>
                                                    <input type="text" name="subject" required
                                                        placeholder="Brief subject of your complaint"
                                                        value="<%=in.co.customer.feedback.sys.util.DataUtility.getStringData(bean.getSubject())%>">
                                                </div>

                                                <div class="form-group">
                                                    <label>Description <span style="color: red;">*</span></label>
                                                    <textarea name="description" required
                                                        placeholder="Please provide detailed information about your complaint"><%=in.co.customer.feedback.sys.util.DataUtility.getStringData(bean.getDescription())%></textarea>
                                                </div>

                                                <div
                                                    style="background: #f8f9fa; padding: 15px; border-radius: 8px; margin-bottom: 20px;">
                                                    <p style="margin: 0; font-size: 0.9rem; color: #666;">
                                                        <i class="fas fa-info-circle" style="color: #667eea;"></i>
                                                        <strong>Note:</strong> Your complaint will be submitted
                                                        anonymously.
                                                        Your identity will not be disclosed to anyone.
                                                    </p>
                                                </div>

                                                <div class="buttons">
                                                    <input type="submit" name="operation"
                                                        value="<%=ComplaintCtl.OP_SAVE%>" class="submit-btn"
                                                        style="color: white; border: none; padding: 12px 30px; border-radius: 25px; font-weight: 600; cursor: pointer;">
                                                    <input type="submit" name="operation"
                                                        value="<%=ComplaintCtl.OP_RESET%>" class="reset-btn"
                                                        style="background: #ddd; border: none; padding: 12px 30px; border-radius: 25px; font-weight: 600; cursor: pointer;">
                                                </div>

                        </form>

                    </div>

            </body>

            </html>