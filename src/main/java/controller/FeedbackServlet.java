package controller;

import dao.FeedbackDAO;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class FeedbackServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int rating = Integer.parseInt(req.getParameter("rating"));
        String comments = req.getParameter("comments");
        String faculty = req.getParameter("faculty");

        FeedbackDAO dao = new FeedbackDAO();
        dao.saveFeedback(rating, comments, faculty);

        res.sendRedirect("student/feedback.jsp?success=1");
    }
}

