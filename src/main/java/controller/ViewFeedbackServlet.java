package controller;

import dao.FeedbackDAO;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class ViewFeedbackServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        FeedbackDAO dao = new FeedbackDAO();
        req.setAttribute("feedbackList", dao.getAllFeedback());
        RequestDispatcher rd = req.getRequestDispatcher("admin/viewFeedback.jsp");
        rd.forward(req, res);
    }
}

