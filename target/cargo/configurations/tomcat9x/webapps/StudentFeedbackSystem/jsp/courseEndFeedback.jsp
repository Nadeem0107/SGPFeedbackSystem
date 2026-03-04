<%@ page language="java" pageEncoding="UTF-8" %>
    <%@ page import="in.co.customer.feedback.sys.ctl.CFSView" %>
        <%@ page import="in.co.customer.feedback.sys.ctl.CourseEndFeedbackCtl" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Course End Feedback</title>

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
                        max-width: 1200px;
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
                        gap: 30px;
                    }

                    .form-group {
                        display: flex;
                        flex-direction: column;
                        min-width: 220px;
                        flex: 1;
                    }

                    label {
                        font-weight: 600;
                        margin-bottom: 6px;
                    }

                    select,
                    input[type="text"] {
                        padding: 10px 12px;
                        border-radius: 8px;
                        border: 1px solid #ccc;
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
                        margin-top: 30px;
                        border-radius: 10px;
                        overflow: hidden;
                    }

                    thead {
                        background: linear-gradient(90deg, #1d2671, #c33764);
                        color: white;
                    }

                    th,
                    td {
                        padding: 12px;
                        text-align: center;
                    }

                    th.description,
                    td.description {
                        text-align: left;
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
                                        style="margin-right: 8px; color: #6a1b9a;"></i> Course End Feedback
                                </li>
                            </ol>
                        </nav>
                    </div>

                    <div class="container">

                        <div class="header">
                            <h4>Basavarajeshwari Group of Institution</h4>
                            <h2>SANJAY GANDHI POLYTECHNIC</h2>
                            <p>Ballari - 583104 (Karnataka)</p>
                        </div>

                        <div class="line"></div>

                        <h2 class="title">COURSE END FEEDBACK</h2>

                        <form action="<%=CFSView.COURSE_END_FEEDBACK_CTL%>" method="post">

                            <jsp:useBean id="bean" class="in.co.customer.feedback.sys.bean.CourseEndFeedbackBean"
                                scope="request"></jsp:useBean>

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

                                            <!-- Row 1 -->
                                            <div class="form-row">
                                                <div class="form-group">
                                                    <label>Course Co-ordinator</label>
                                                    <input type="text" name="coordinator" required
                                                        value="<%=in.co.customer.feedback.sys.util.DataUtility.getStringData(bean.getCoordinator())%>">
                                                </div>

                                                <div class="form-group">
                                                    <label>Semester</label>
                                                    <input type="text" name="sem" required
                                                        value="<%=in.co.customer.feedback.sys.util.DataUtility.getStringData(bean.getSem())%>">
                                                </div>

                                                <div class="form-group">
                                                    <label>Section</label>
                                                    <input type="text" name="sec" required
                                                        value="<%=in.co.customer.feedback.sys.util.DataUtility.getStringData(bean.getSec())%>">
                                                </div>

                                                <div class="form-group">
                                                    <label>Program</label>
                                                    <input type="text" name="program" required
                                                        value="<%=in.co.customer.feedback.sys.util.DataUtility.getStringData(bean.getProgram())%>">
                                                </div>
                                            </div>

                                            <!-- Row 2 -->
                                            <div class="form-row">
                                                <div class="form-group">
                                                    <label>Course Name</label>
                                                    <input type="text" name="courseName" required
                                                        value="<%=in.co.customer.feedback.sys.util.DataUtility.getStringData(bean.getCourseName())%>">
                                                </div>

                                                <div class="form-group">
                                                    <label>Course Code</label>
                                                    <input type="text" name="courseCode" required
                                                        value="<%=in.co.customer.feedback.sys.util.DataUtility.getStringData(bean.getCourseCode())%>">
                                                </div>

                                                <div class="form-group">
                                                    <label>Academic Year</label>
                                                    <select name="academicYear" required>
                                                        <option value="">Select Year</option>
                                                        <option value="2023-24" <%="2023-24"
                                                            .equals(bean.getAcademicYear()) ? "selected" : "" %>>2023-24
                                                        </option>
                                                        <option value="2024-25" <%="2024-25"
                                                            .equals(bean.getAcademicYear()) ? "selected" : "" %>>2024-25
                                                        </option>
                                                        <option value="2025-26" <%="2025-26"
                                                            .equals(bean.getAcademicYear()) ? "selected" : "" %>>2025-26
                                                        </option>
                                                    </select>
                                                </div>
                                            </div>

                                            <!-- Row 3 -->
                                            <div class="form-row">
                                                <div class="form-group">
                                                    <label>Reg No</label>
                                                    <input type="text" name="regNo" required
                                                        value="<%=in.co.customer.feedback.sys.util.DataUtility.getStringData(bean.getRegNo())%>">
                                                </div>

                                                <div class="form-group">
                                                    <label>Student Name</label>
                                                    <input type="text" name="studentName" required
                                                        value="<%=in.co.customer.feedback.sys.util.DataUtility.getStringData(bean.getStudentName())%>">
                                                </div>
                                            </div>

                                            <!-- Rating Table -->
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th colspan="2" class="description">
                                                            Rating: 5-Excellent | 4-Very Good | 3-Good | 2-Average |
                                                            1-Below
                                                            Average
                                                        </th>
                                                        <th>1</th>
                                                        <th>2</th>
                                                        <th>3</th>
                                                        <th>4</th>
                                                        <th>5</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <% String[] outcomes={ "Understand career planning concepts"
                                                        , "Relate social and environmental issues"
                                                        , "Improve communication skills"
                                                        , "Develop grammar and writing skills"
                                                        , "Apply practical knowledge"
                                                        , "Enhance overall learning experience" }; int[]
                                                        ratings={bean.getCo1(), bean.getCo2(), bean.getCo3(),
                                                        bean.getCo4(), bean.getCo5(), bean.getCo6()}; for(int i=0;
                                                        i<outcomes.length; i++){ %>

                                                        <tr>
                                                            <td>
                                                                <%= (i+1) %>
                                                            </td>
                                                            <td class="description">
                                                                <%= outcomes[i] %>
                                                            </td>

                                                            <% for(int j=1; j<=5; j++){ String checked=(ratings.length>
                                                                i &&
                                                                ratings[i] == j) ? "checked" : "";
                                                                %>
                                                                <td>
                                                                    <input type="radio" name="co<%=i+1%>" value="<%=j%>"
                                                                        required <%=checked%>>
                                                                </td>
                                                                <% } %>
                                                        </tr>

                                                        <% } %>

                                                </tbody>
                                            </table>

                                            <div class="buttons">
                                                <input type="submit" name="operation"
                                                    value="<%=CourseEndFeedbackCtl.OP_SAVE%>" class="submit-btn"
                                                    style="color: white; border: none; padding: 10px 25px; border-radius: 25px; font-weight: 600; cursor: pointer;">
                                                <input type="submit" name="operation"
                                                    value="<%=CourseEndFeedbackCtl.OP_RESET%>" class="reset-btn"
                                                    style="background: #ddd; border: none; padding: 10px 25px; border-radius: 25px; font-weight: 600; cursor: pointer;">
                                            </div>

                        </form>

                    </div>

            </body>

            </html>
