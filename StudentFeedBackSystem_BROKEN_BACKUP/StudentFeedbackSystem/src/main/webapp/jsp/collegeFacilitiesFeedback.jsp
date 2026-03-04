<%@ page language="java" pageEncoding="UTF-8" %>
    <%@ page import="in.co.customer.feedback.sys.ctl.CFSView" %>
        <%@ page import="in.co.customer.feedback.sys.ctl.CollegeFacilitiesFeedbackCtl" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Feedback on College Facilities</title>

                <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap"
                    rel="stylesheet">
                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Font Awesome -->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
                <!-- MDB UI Kit -->
                <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.0/mdb.min.css" rel="stylesheet">

                <style>
                    * {
                        margin: 0;
                        padding: 0;
                        box-sizing: border-box;
                        font-family: 'Poppins', sans-serif;
                    }

                    body {
                        background: linear-gradient(135deg, #1d2671, #c33764);
                        padding: 40px 0;
                    }

                    .container {
                        width: 95%;
                        max-width: 1100px;
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
                        color: #1d2671;
                        font-weight: 700;
                    }

                    .header p {
                        font-size: 14px;
                        color: #666;
                    }

                    .line {
                        height: 2px;
                        background: linear-gradient(to right, #1d2671, #c33764);
                        margin: 20px 0;
                    }

                    h2.title {
                        text-align: center;
                        margin-bottom: 25px;
                        color: #333;
                    }

                    .form-row {
                        margin-bottom: 20px;
                        display: flex;
                        flex-wrap: wrap;
                        gap: 20px;
                    }

                    label {
                        font-weight: 600;
                    }

                    select,
                    input[type="text"] {
                        padding: 8px 12px;
                        border-radius: 8px;
                        border: 1px solid #ccc;
                        width: 250px;
                        transition: 0.3s;
                    }

                    select:focus,
                    input:focus {
                        border-color: #1d2671;
                        outline: none;
                        box-shadow: 0 0 6px rgba(29, 38, 113, 0.3);
                    }

                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-top: 20px;
                        border-radius: 10px;
                        overflow: hidden;
                    }

                    thead {
                        background: linear-gradient(90deg, #1d2671, #c33764);
                        color: white;
                    }

                    th,
                    td {
                        padding: 10px;
                        text-align: center;
                    }

                    th.description,
                    td.description {
                        text-align: left;
                    }

                    tbody tr {
                        background: #f8f9fc;
                        transition: 0.3s;
                    }

                    tbody tr:nth-child(even) {
                        background: #eef1f7;
                    }

                    tbody tr:hover {
                        background: #e0e7ff;
                    }

                    input[type="radio"] {
                        transform: scale(1.2);
                        cursor: pointer;
                    }

                    .signature {
                        margin-top: 40px;
                        text-align: right;
                    }

                    .buttons {
                        text-align: center;
                        margin-top: 30px;
                    }

                    button {
                        padding: 10px 25px;
                        border: none;
                        border-radius: 25px;
                        font-weight: 600;
                        cursor: pointer;
                        transition: 0.3s;
                        margin: 5px;
                    }

                    .submit-btn {
                        background: linear-gradient(90deg, #1d2671, #c33764);
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

                    @media(max-width:768px) {
                        .form-row {
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
                                        style="margin-right: 8px; color: #6a1b9a;"></i> College Facilities Feedback
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

                        <h2 class="title">FEEDBACK ON COLLEGE FACILITIES</h2>

                        <form action="<%=CFSView.COLLEGE_FACILITIES_FEEDBACK_CTL%>" method="post">
                            <jsp:useBean id="bean"
                                class="in.co.customer.feedback.sys.bean.CollegeFacilitiesFeedbackBean" scope="request">
                            </jsp:useBean>

                            <% if(in.co.customer.feedback.sys.util.ServletUtility.getSuccessMessage(request) !=null &&
                                in.co.customer.feedback.sys.util.ServletUtility.getSuccessMessage(request).length()> 0)
                                { %>
                                <div style="color: green; text-align: center; margin-bottom: 20px;">
                                    <h3>
                                        <%=in.co.customer.feedback.sys.util.ServletUtility.getSuccessMessage(request)%>
                                    </h3>
                                </div>
                                <% } %>

                                    <% if(in.co.customer.feedback.sys.util.ServletUtility.getErrorMessage(request)
                                        !=null &&
                                        in.co.customer.feedback.sys.util.ServletUtility.getErrorMessage(request).length()>
                                        0) { %>
                                        <div style="color: red; text-align: center; margin-bottom: 20px;">
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

                                            <div>
                                                <label>Program</label><br>
                                                <input type="text" name="program" readonly
                                                    value="<%=in.co.customer.feedback.sys.util.DataUtility.getStringData(bean.getProgram())%>">
                                            </div>

                                            <div>
                                                <label>Academic Year</label><br>
                                                <select name="academicYear" required>
                                                    <option value="">-- Select Year --</option>
                                                    <option value="2023-24" <%="2023-24" .equals(bean.getAcademicYear())
                                                        ? "selected" : "" %>>2023-24
                                                    </option>
                                                    <option value="2024-25" <%="2024-25" .equals(bean.getAcademicYear())
                                                        ? "selected" : "" %>>2024-25
                                                    </option>
                                                    <option value="2025-26" <%="2025-26" .equals(bean.getAcademicYear())
                                                        ? "selected" : "" %>>2025-26
                                                    </option>
                                                </select>
                                            </div>

                                            <div>
                                                <label>Name of Student</label><br>
                                                <input type="text" name="studentName" readonly
                                                    value="<%=in.co.customer.feedback.sys.util.DataUtility.getStringData(bean.getStudentName())%>">
                                            </div>
                    </div>

                    <table>
                        <thead>
                            <tr>
                                <th colspan="2" class="description">
                                    Rating: 5-Excellent | 4-Very Good | 3-Good | 2-Satisfactory
                                    |
                                    1-Poor
                                </th>
                                <th>1</th>
                                <th>2</th>
                                <th>3</th>
                                <th>4</th>
                                <th>5</th>
                            </tr>
                        </thead>
                        <tbody>

                            <% String[] questions={ "Book Bank facility" , "Reference Books" , "Newspapers & Magazines"
                                , "Availability of Newspapers & Magazines" , "Availability of Office Staff"
                                , "Behavior of Staff" , "Interaction with Principal" , "Interaction with HODs"
                                , "Extra Curricular Activities" , "Discipline in Campus" , "House Keeping"
                                , "Drinking Water Facility" , "Proctoring System" , "Infrastructure" }; int[]
                                ratings={bean.getQ1(), bean.getQ2(), bean.getQ3(), bean.getQ4(), bean.getQ5(),
                                bean.getQ6(), bean.getQ7(), bean.getQ8(), bean.getQ9(), bean.getQ10(), bean.getQ11(),
                                bean.getQ12(), bean.getQ13(), bean.getQ14()}; for(int i=0; i<questions.length; i++){ %>

                                <tr>
                                    <td>
                                        <%= (i+1) %>
                                    </td>
                                    <td class="description">
                                        <%= questions[i] %>
                                    </td>

                                    <% for(int j=1; j<=5; j++){ String checked=(ratings.length>
                                        i &&
                                        ratings[i] == j) ? "checked" : "";
                                        %>
                                        <td>
                                            <input type="radio" name="q<%=i+1%>" value="<%=j%>" required <%=checked%>>
                                        </td>
                                        <% } %>
                                </tr>

                                <% } %>

                        </tbody>
                    </table>

                    <div class="signature">
                        <label>Signature</label><br>
                        <input type="text" name="signature"
                            value="<%=in.co.customer.feedback.sys.util.DataUtility.getStringData(bean.getSignature())%>">
                    </div>

                    <div class="buttons">
                        <input type="submit" name="operation" value="<%=CollegeFacilitiesFeedbackCtl.OP_SAVE%>"
                            class="submit-btn"
                            style="color: white; border: none; padding: 10px 25px; border-radius: 25px; font-weight: 600; cursor: pointer;">
                        <input type="submit" name="operation" value="<%=CollegeFacilitiesFeedbackCtl.OP_RESET%>"
                            class="reset-btn"
                            style="background: #ddd; border: none; padding: 10px 25px; border-radius: 25px; font-weight: 600; cursor: pointer;">
                    </div>

                    </form>

                    </div>

            </body>

            </html>