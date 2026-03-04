<%@page import="in.co.customer.feedback.sys.ctl.MidSemFeedbackCtl" %>
    <%@page import="in.co.customer.feedback.sys.util.DataUtility" %>
        <%@page import="in.co.customer.feedback.sys.util.ServletUtility" %>
            <%@page import="in.co.customer.feedback.sys.ctl.CFSView" %>
                <%@page import="java.util.List" %>
                    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
                        <!DOCTYPE html>
                        <html>

                        <head>
                            <meta charset="UTF-8">
                            <title>Student Mid-Sem Feedback</title>

                            <link
                                href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap"
                                rel="stylesheet">
                            <!-- Font Awesome -->
                            <link rel="stylesheet"
                                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

                            <style>
                                * {
                                    margin: 0;
                                    padding: 0;
                                    box-sizing: border-box;
                                    font-family: 'Poppins', sans-serif;
                                }

                                body {
                                    background: linear-gradient(135deg, #1d2671, #c33764);
                                    padding-bottom: 40px;
                                }

                                .container-form {
                                    width: 95%;
                                    max-width: 1200px;
                                    margin: auto;
                                    background: #ffffff;
                                    padding: 45px;
                                    border-radius: 15px;
                                    box-shadow: 0 25px 50px rgba(0, 0, 0, 0.2);
                                }

                                .header-form {
                                    text-align: center;
                                    margin-bottom: 25px;
                                }

                                .header-form h2 {
                                    color: #1d2671;
                                    font-weight: 700;
                                }

                                .header-form p {
                                    font-size: 14px;
                                    color: #666;
                                }

                                .line {
                                    height: 2px;
                                    background: linear-gradient(to right, #1d2671, #c33764);
                                    margin: 25px 0;
                                }

                                h2.title {
                                    text-align: center;
                                    margin-bottom: 30px;
                                    color: #333;
                                    font-weight: 600;
                                }

                                .form-row {
                                    margin-bottom: 25px;
                                    display: flex;
                                    flex-wrap: wrap;
                                    gap: 25px;
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

                                input,
                                select {
                                    padding: 10px 12px;
                                    border-radius: 8px;
                                    border: 1px solid #ccc;
                                    transition: 0.3s;
                                }

                                input:focus,
                                select:focus {
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
                                    font-size: 14px;
                                }

                                th.question,
                                td.question {
                                    text-align: left;
                                }

                                tbody tr:nth-child(even) {
                                    background: #f4f6fb;
                                }

                                tbody tr:hover {
                                    background: #e0e7ff;
                                    transition: 0.3s;
                                }

                                input[type="radio"] {
                                    transform: scale(1.2);
                                    cursor: pointer;
                                }

                                .rating-info {
                                    background: linear-gradient(90deg, #1d2671, #c33764);
                                    color: white;
                                    text-align: center;
                                    padding: 10px;
                                    font-weight: 600;
                                    border-radius: 8px;
                                }

                                .buttons {
                                    text-align: center;
                                    margin-top: 35px;
                                }

                                .btn {
                                    padding: 12px 28px;
                                    border: none;
                                    border-radius: 30px;
                                    font-weight: 600;
                                    cursor: pointer;
                                    transition: 0.3s;
                                    margin: 8px;
                                    font-size: 14px;
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

                                /* Breadcrumb Styles */
                                .breadcrumb-container {
                                    width: 95%;
                                    max-width: 1200px;
                                    margin: 20px auto;
                                }

                                .breadcrumb {
                                    background-color: white;
                                    padding: 10px 25px;
                                    border-radius: 8px;
                                    box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
                                    list-style: none;
                                    display: flex;
                                    font-size: 0.9rem;
                                }

                                .breadcrumb-item+.breadcrumb-item::before {
                                    content: "/";
                                    padding: 0 10px;
                                    color: #bbb;
                                }

                                .breadcrumb-item a {
                                    color: #1d2671;
                                    text-decoration: none;
                                    font-weight: 600;
                                }

                                .breadcrumb-item.active {
                                    color: #c33764;
                                    font-weight: 600;
                                }
                            </style>
                        </head>

                        <body>
                            <%@ include file="header.jsp" %>

                                <div class="breadcrumb-container">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="<%=CFSView.WELCOME_CTL%>"><i
                                                        class="fas fa-home"></i> Home</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Mid-Sem Feedback</li>
                                        </ol>
                                    </nav>
                                </div>

                                <div class="container-form">

                                    <div class="header-form">
                                        <h4>Basavarajeshwari Group of Institution</h4>
                                        <h2>SANJAY GANDHI POLYTECHNIC</h2>
                                        <p>Ballari - 583104 (Karnataka)</p>
                                    </div>

                                    <div class="line"></div>

                                    <h2 class="title">STUDENT MID-SEM FEEDBACK FORM</h2>

                                    <div style="text-align: center; margin-bottom: 20px;">
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
                                    </div>

                                    <form action="<%=CFSView.MID_SEM_FEEDBACK_CTL%>" method="post">

                                        <!-- Student Details -->
                                        <!-- Student Details -->
                                        <div class="form-row">
                                            <jsp:useBean id="bean"
                                                class="in.co.customer.feedback.sys.bean.MidSemFeedbackBean"
                                                scope="request"></jsp:useBean>

                                            <div class="form-group">
                                                <label>Reg No</label>
                                                <input type="text" name="regNo" readonly
                                                    value="<%=DataUtility.getStringData(bean.getRegNo())%>" required>
                                            </div>

                                            <div class="form-group">
                                                <label>Student Name</label>
                                                <input type="text" name="studentName" readonly
                                                    value="<%=DataUtility.getStringData(bean.getStudentName())%>"
                                                    required>
                                            </div>

                                            <div class="form-group">
                                                <label>Branch</label>
                                                <input type="text" name="branch" readonly
                                                    value="<%=DataUtility.getStringData(bean.getBranch())%>" required>
                                            </div>

                                            <div class="form-group">
                                                <label>Semester</label>
                                                <input type="text" name="semester" readonly
                                                    value="<%=bean.getSemester() > 0 ? String.valueOf(bean.getSemester()) : ""%>"
                                                    required>
                                            </div>
                                        </div>

                                        <div class="form-row">
                                            <div class="form-group">
                                                <label>Faculty Name</label>
                                                <% List tList=(List) request.getAttribute("teacherList"); %>
                                                    <select name="faculty" required>
                                                        <option value="">-- Select Faculty --</option>
                                                        <% if (tList !=null) { for (Object o : tList) {
                                                            in.co.customer.feedback.sys.bean.TeacherBean
                                                            tBean=(in.co.customer.feedback.sys.bean.TeacherBean) o; %>
                                                            <option value="<%=tBean.getName()%>">
                                                                <%=tBean.getName()%>
                                                            </option>
                                                            <% } } %>
                                                    </select>
                                            </div>

                                            <div class="form-group">
                                                <label>Select Subject</label>
                                                <select name="subject" required>
                                                    <option value="">-- Select Subject --</option>
                                                    <option value="Java">Java</option>
                                                    <option value="DBMS">DBMS</option>
                                                    <option value="CN">Computer Networks</option>
                                                    <option value="OS">Operating Systems</option>
                                                </select>
                                            </div>
                                        </div>

                                        <!-- Rating Table -->

                                        <div class="rating-info">
                                            Rating: 5-Excellent | 4-Very Good | 3-Good | 2-Satisfactory | 1-Poor
                                        </div>

                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th class="question">Question</th>
                                                    <th>1</th>
                                                    <th>2</th>
                                                    <th>3</th>
                                                    <th>4</th>
                                                    <th>5</th>
                                                </tr>
                                            </thead>

                                            <tbody>

                                                <% String[] questions={ "Effectiveness of course content delivery"
                                                    , "Relevancy of course contents in attaining course outcomes"
                                                    , "Availability of text books / study materials"
                                                    , "Delivery of lecture by teacher"
                                                    , "Use of innovative teaching methods"
                                                    , "Linking subject to practical situations"
                                                    , "Conduct of classroom discussions" , "Accessibility of teacher"
                                                    , "Guidance in experiments/workshop practices"
                                                    , "Coverage of course outcomes in IA tests"
                                                    , "Attention towards weak students"
                                                    , "Regular assessment of lab/workshop records" }; for(int i=0;
                                                    i<questions.length; i++){ %>

                                                    <tr>
                                                        <td>
                                                            <%= (i+1) %>
                                                        </td>
                                                        <td class="question">
                                                            <%= questions[i] %>
                                                        </td>

                                                        <% for(int j=1; j<=5; j++){ %>
                                                            <td>
                                                                <input type="radio" name="q<%=i+1%>" value="<%=j%>"
                                                                    required>
                                                            </td>
                                                            <% } %>

                                                    </tr>

                                                    <% } %>

                                            </tbody>
                                        </table>

                                        <div class="buttons">
                                            <input type="submit" name="operation" class="btn submit-btn"
                                                value="<%=MidSemFeedbackCtl.OP_SAVE%>">
                                            <input type="submit" name="operation" class="btn reset-btn"
                                                value="<%=MidSemFeedbackCtl.OP_RESET%>">
                                        </div>

                                    </form>

                                </div>
                                <%@ include file="footer.jsp" %>
                        </body>

                        </html>