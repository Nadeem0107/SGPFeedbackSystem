<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@page import="in.co.customer.feedback.sys.util.ServletUtility" %>
        <%@page import="in.co.customer.feedback.sys.ctl.CFSView" %>
            <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Error Page</title>
            </head>

            <body>
                <%@include file="header.jsp" %>
                    <div align="center">
                        <h1>Application Error</h1>
                        <h2 style="color: red">
                            <%=ServletUtility.getErrorMessage(request)%>
                        </h2>
                        <p>
                            <a href="<%=CFSView.LOGIN_VIEW%>">Back to Login</a>
                        </p>
                    </div>
                    <%@include file="footer.jsp" %>
            </body>

            </html>