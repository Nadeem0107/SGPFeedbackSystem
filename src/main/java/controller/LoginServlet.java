package controller;

import dao.UserDAO;
import model.User;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        UserDAO dao = new UserDAO();
        User user = dao.validateUser(username, password);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);

            if (user.getRole().equals("student"))
                res.sendRedirect("student/feedback.jsp");
            else
                res.sendRedirect("admin/viewFeedback.jsp");
        } else {
            res.sendRedirect("login.jsp?error=1");
        }
    }
}

