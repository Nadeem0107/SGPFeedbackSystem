<%@page import="in.co.customer.feedback.sys.ctl.TeacherListCtl" %>
    <%@page import="in.co.customer.feedback.sys.util.ServletUtility" %>
        <%@page import="java.util.List" %>
            <%@page import="java.util.Iterator" %>
                <%@page import="in.co.customer.feedback.sys.bean.TeacherBean" %>
                    <%@page import="in.co.customer.feedback.sys.ctl.CFSView" %>
                        <%@page import="in.co.customer.feedback.sys.bean.UserBean" %>
                            <%@ page language="java" contentType="text/html; charset=UTF-8"
                                pageEncoding="UTF-8" %>
                                <!DOCTYPE html>
                                <html>

                                <head>
                                    <meta charset="UTF-8">
                                    <title>Academic Directory | FeedbackHub</title>
                                    <!-- Google Fonts: Inter and Outfit -->
                                    <link
                                        href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&family=Outfit:wght@400;500;600;700&display=swap"
                                        rel="stylesheet">
                                    <style>
                                        :root {
                                            --brand-primary: #3b82f6;
                                            --brand-secondary: #1d4ed8;
                                            --text-dark: #1e293b;
                                            --text-muted: #64748b;
                                            --bg-light: #f8fafc;
                                            --card-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.04), 0 8px 10px -6px rgba(0, 0, 0, 0.04);
                                            --transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
                                        }

                                        body {
                                            background-color: var(--bg-light);
                                            font-family: 'Inter', sans-serif;
                                            color: var(--text-dark);
                                            margin: 0;
                                            padding: 0;
                                            overflow-x: hidden;
                                        }

                                        h1,
                                        h2,
                                        h3,
                                        h4,
                                        h5 {
                                            font-family: 'Outfit', sans-serif;
                                        }

                                        /* Hero Header Section */
                                        .directory-hero {
                                            background: #fff;
                                            padding: 80px 0 60px;
                                            text-align: center;
                                            border-bottom: 1px solid #f1f5f9;
                                        }

                                        .badge-premium {
                                            background-color: #eff6ff;
                                            color: #2563eb;
                                            padding: 8px 18px;
                                            border-radius: 50px;
                                            font-size: 0.75rem;
                                            font-weight: 700;
                                            text-transform: uppercase;
                                            letter-spacing: 1.5px;
                                            display: inline-block;
                                            margin-bottom: 24px;
                                            border: 1px solid #dbeafe;
                                        }

                                        .hero-title {
                                            font-size: 3.5rem;
                                            font-weight: 800;
                                            color: #0f172a;
                                            margin-bottom: 16px;
                                            letter-spacing: -1px;
                                        }

                                        .hero-subtitle {
                                            font-size: 1.2rem;
                                            color: var(--text-muted);
                                            max-width: 650px;
                                            margin: 0 auto;
                                            line-height: 1.6;
                                        }

                                        /* Search Section */
                                        .search-container {
                                            max-width: 900px;
                                            margin: -35px auto 60px;
                                            padding: 0 20px;
                                            position: relative;
                                            z-index: 100;
                                        }

                                        .search-wrapper {
                                            background: #fff;
                                            padding: 10px;
                                            border-radius: 20px;
                                            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.06);
                                            display: flex;
                                            align-items: center;
                                        }

                                        .search-input-group {
                                            flex-grow: 1;
                                            display: flex;
                                            align-items: center;
                                            padding: 0 20px;
                                        }

                                        .search-control {
                                            border: none;
                                            width: 100%;
                                            font-size: 1.1rem;
                                            padding: 15px 0;
                                            font-family: 'Inter', sans-serif;
                                            color: #334155;
                                        }

                                        .search-control:focus {
                                            outline: none;
                                        }

                                        .btn-search-premium {
                                            background: var(--brand-primary);
                                            color: #fff;
                                            border: none;
                                            padding: 15px 40px;
                                            border-radius: 14px;
                                            font-weight: 600;
                                            font-size: 1rem;
                                            transition: var(--transition);
                                            cursor: pointer;
                                        }

                                        /* Card System */
                                        .faculty-card {
                                            background: #fff;
                                            border-radius: 24px;
                                            padding: 40px 30px;
                                            text-align: center;
                                            border: 1px solid #f1f5f9;
                                            transition: var(--transition);
                                            height: 100%;
                                            display: flex;
                                            flex-direction: column;
                                            margin-bottom: 30px;
                                            position: relative;
                                        }

                                        .faculty-card:hover {
                                            transform: translateY(-12px);
                                            box-shadow: 0 30px 60px -12px rgba(0, 0, 0, 0.08);
                                            border-color: #e2e8f0;
                                        }

                                        .faculty-img {
                                            width: 130px;
                                            height: 130px;
                                            border-radius: 50%;
                                            object-fit: cover;
                                            border: 6px solid #f8fafc;
                                            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
                                            margin-bottom: 24px;
                                        }

                                        .faculty-name {
                                            font-size: 1.5rem;
                                            font-weight: 700;
                                            color: #1e293b;
                                            margin-bottom: 8px;
                                        }

                                        .specialty-tag {
                                            background: #f1f5f9;
                                            color: #475569;
                                            padding: 6px 16px;
                                            border-radius: 8px;
                                            font-size: 0.85rem;
                                            font-weight: 600;
                                            display: inline-block;
                                            margin-bottom: 20px;
                                        }

                                        .rating-box {
                                            display: flex;
                                            align-items: center;
                                            justify-content: center;
                                            gap: 6px;
                                            margin-bottom: 24px;
                                        }

                                        .rating-box i {
                                            color: #f59e0b;
                                        }

                                        .expertise-container {
                                            background: #f8fafc;
                                            border-radius: 16px;
                                            padding: 20px;
                                            margin-top: auto;
                                            margin-bottom: 24px;
                                            text-align: left;
                                        }

                                        .btn-action-premium {
                                            background: var(--brand-primary);
                                            color: #fff;
                                            text-decoration: none;
                                            padding: 16px;
                                            border-radius: 14px;
                                            font-weight: 600;
                                            display: flex;
                                            align-items: center;
                                            justify-content: center;
                                            gap: 10px;
                                            transition: var(--transition);
                                        }

                                        .btn-action-premium:hover {
                                            background: var(--brand-secondary);
                                            color: #fff;
                                        }

                                        .admin-controls {
                                            position: absolute;
                                            top: 20px;
                                            right: 20px;
                                            display: flex;
                                            gap: 8px;
                                            opacity: 0;
                                            transition: var(--transition);
                                        }

                                        .faculty-card:hover .admin-controls {
                                            opacity: 1;
                                        }

                                        .btn-admin {
                                            width: 36px;
                                            height: 36px;
                                            border-radius: 10px;
                                            display: flex;
                                            align-items: center;
                                            justify-content: center;
                                            background: #fff;
                                            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                                            color: #64748b;
                                        }
                                    </style>
                                </head>

                                <body>
                                    <%@ include file="header.jsp" %>

                                        <% UserBean currentUser=(UserBean) session.getAttribute("user"); boolean
                                            isAdmin=(currentUser !=null && currentUser.getRoleId()==1); %>

                                            <section class="directory-hero">
                                                <div class="container">
                                                    <span class="badge-premium">Certified Faculty Directory</span>
                                                    <h1 class="hero-title">Academic Directory</h1>
                                                    <p class="hero-subtitle">Browse through our esteemed faculty members
                                                        and their specialties</p>
                                                </div>
                                            </section>

                                            <div class="container">
                                                <div class="search-container">
                                                    <form action="<%=CFSView.TEACHER_LIST_CTL%>" method="get">
                                                        <div class="search-wrapper">
                                                            <div class="search-input-group">
                                                                <i class="fas fa-search"></i>
                                                                <input type="text" name="name" class="search-control"
                                                                    placeholder="Search faculty by name..."
                                                                    value="<%=ServletUtility.getParameter(" name",
                                                                    request)%>">
                                                            </div>
                                                            <button type="submit" name="operation"
                                                                value="<%=TeacherListCtl.OP_SEARCH%>"
                                                                class="btn-search-premium">Search</button>
                                                        </div>
                                                    </form>
                                                </div>

                                                <div class="row">
                                                    <% int pageNo=ServletUtility.getPageNo(request); int
                                                        pageSize=ServletUtility.getPageSize(request); List
                                                        list=ServletUtility.getList(request); if (list !=null &&
                                                        list.size()> 0) {
                                                        Iterator<TeacherBean> it = list.iterator();
                                                            while (it.hasNext()) {
                                                            TeacherBean bean = it.next();
                                                            %>
                                                            <div class="col-lg-4 col-md-6">
                                                                <div class="faculty-card">
                                                                    <% if (isAdmin) { %>
                                                                        <div class="admin-controls">
                                                                            <a href="<%=CFSView.TEACHER_CTL%>?id=<%=bean.getId()%>"
                                                                                class="btn-admin"><i
                                                                                    class="fas fa-edit"></i></a>
                                                                            <a href="<%=CFSView.TEACHER_LIST_CTL%>?operation=Delete&ids=<%=bean.getId()%>"
                                                                                class="btn-admin"><i
                                                                                    class="fas fa-trash"></i></a>
                                                                        </div>
                                                                        <% } %>

                                                                            <div class="image-wrapper">
                                                                                <% if(bean.getImage() !=null &&
                                                                                    !bean.getImage().isEmpty()) { %>
                                                                                    <img src="<%=CFSView.APP_CONTEXT%>/image/<%=bean.getImage()%>"
                                                                                        class="faculty-img">
                                                                                    <% } else { %>
                                                                                        <img src="https://ui-avatars.com/api/?name=<%=bean.getName()%>&background=eff6ff&color=3b82f6&size=200&bold=true"
                                                                                            class="faculty-img">
                                                                                        <% } %>
                                                                            </div>

                                                                            <h5 class="faculty-name">
                                                                                <%=bean.getName()%>
                                                                            </h5>
                                                                            <div class="specialty-tag">
                                                                                <%=bean.getPrice() !=null ?
                                                                                    bean.getPrice() : "Faculty" %>
                                                                            </div>

                                                                            <div class="rating-box">
                                                                                <i class="fas fa-star"></i> <span
                                                                                    class="score">4.8</span> <span
                                                                                    class="label">Rating</span>
                                                                            </div>

                                                                            <div class="expertise-container">
                                                                                <div class="expertise-text"><i
                                                                                        class="fas fa-book-reader"></i>
                                                                                    <%=bean.getDescription()%>
                                                                                </div>
                                                                            </div>

                                                                            <% if (currentUser !=null &&
                                                                                currentUser.getRoleId()==2) { %>
                                                                                <a href="<%=CFSView.TEACHER_FEEDBACK_CTL%>?tId=<%=bean.getId()%>"
                                                                                    class="btn-action-premium">
                                                                                    Give Feedback <i
                                                                                        class="fas fa-arrow-right"></i>
                                                                                </a>
                                                                                <% } else if (isAdmin) { %>
                                                                                    <a href="<%=CFSView.TEACHER_FEEDBACK_LIST_CTL%>?tId=<%=bean.getId()%>"
                                                                                        class="btn-action-premium"
                                                                                        style="background: #10b981; margin-bottom: 10px;">
                                                                                        View Feedback <i
                                                                                            class="fas fa-eye"></i>
                                                                                    </a>
                                                                                    <% } %>
                                                                </div>
                                                            </div>
                                                            <% } } else { %>
                                                                <div class="col-12 text-center py-5">
                                                                    <h3>No Faculty Found</h3>
                                                                </div>
                                                                <% } %>
                                                </div>
                                            </div>
                                            <%@ include file="footer.jsp" %>
                                </body>

                                </html>
