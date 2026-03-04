package in.co.customer.feedback.sys.ctl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.co.customer.feedback.sys.bean.BaseBean;
import in.co.customer.feedback.sys.bean.EndSemFeedbackBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.model.EndSemFeedbackModel;
import in.co.customer.feedback.sys.util.DataUtility;
import in.co.customer.feedback.sys.util.ServletUtility;

@WebServlet(name = "EndSemFeedbackCtl", urlPatterns = { "/ctl/endSemFeedback" })
public class EndSemFeedbackCtl extends BaseCtl {

    @Override
    protected BaseBean populateBean(HttpServletRequest request) {
        EndSemFeedbackBean bean = new EndSemFeedbackBean();
        bean.setId(DataUtility.getLong(request.getParameter("id")));
        bean.setRegNo(request.getParameter("regNo"));
        bean.setStudentName(request.getParameter("studentName"));
        bean.setBranch(request.getParameter("branch"));
        bean.setSemester(request.getParameter("semester"));
        bean.setFaculty(request.getParameter("faculty"));
        bean.setSubject(request.getParameter("subject"));

        bean.setA1(DataUtility.getInt(request.getParameter("A1")));
        bean.setA2(DataUtility.getInt(request.getParameter("A2")));
        bean.setA3(DataUtility.getInt(request.getParameter("A3")));
        bean.setA4(DataUtility.getInt(request.getParameter("A4")));
        bean.setA5(DataUtility.getInt(request.getParameter("A5")));
        bean.setA6(DataUtility.getInt(request.getParameter("A6")));
        bean.setA7(DataUtility.getInt(request.getParameter("A7")));

        bean.setB1(DataUtility.getInt(request.getParameter("B1")));
        bean.setB2(DataUtility.getInt(request.getParameter("B2")));
        bean.setB3(DataUtility.getInt(request.getParameter("B3")));
        bean.setB4(DataUtility.getInt(request.getParameter("B4")));
        bean.setB5(DataUtility.getInt(request.getParameter("B5")));
        bean.setB6(DataUtility.getInt(request.getParameter("B6")));
        bean.setB7(DataUtility.getInt(request.getParameter("B7")));
        bean.setB8(DataUtility.getInt(request.getParameter("B8")));
        bean.setB9(DataUtility.getInt(request.getParameter("B9")));

        bean.setC1(DataUtility.getInt(request.getParameter("C1")));
        bean.setC2(DataUtility.getInt(request.getParameter("C2")));
        bean.setC3(DataUtility.getInt(request.getParameter("C3")));
        bean.setC4(DataUtility.getInt(request.getParameter("C4")));
        bean.setC5(DataUtility.getInt(request.getParameter("C5")));
        bean.setC6(DataUtility.getInt(request.getParameter("C6")));

        populateDTO(bean, request);
        return bean;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletUtility.forward(getView(), request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = DataUtility.getString(request.getParameter("operation"));
        EndSemFeedbackModel model = new EndSemFeedbackModel();
        EndSemFeedbackBean bean = (EndSemFeedbackBean) populateBean(request);
        if (OP_SAVE.equalsIgnoreCase(op)) {
            try {
                model.add(bean);
                ServletUtility.setSuccessMessage("End-Sem Feedback submitted successfully!", request);
            } catch (ApplicationException e) {
                ServletUtility.handleException(e, request, response);
                return;
            }
        }
        ServletUtility.forward(getView(), request, response);
    }

    @Override
    protected String getView() {
        return CFSView.END_SEM_FEEDBACK_VIEW;
    }
}
