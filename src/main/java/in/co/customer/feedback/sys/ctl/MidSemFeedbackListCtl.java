package in.co.customer.feedback.sys.ctl;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.co.customer.feedback.sys.bean.MidSemFeedbackBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.model.MidSemFeedbackModel;
import in.co.customer.feedback.sys.util.ServletUtility;

@WebServlet(name = "MidSemFeedbackListCtl", urlPatterns = { "/ctl/midSemFeedbackList" })
public class MidSemFeedbackListCtl extends BaseCtl {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MidSemFeedbackModel model = new MidSemFeedbackModel();
        try {
            List<MidSemFeedbackBean> list = model.list();
            ServletUtility.setList(list, request);
        } catch (ApplicationException e) {
            ServletUtility.handleException(e, request, response);
            return;
        }
        ServletUtility.forward(getView(), request, response);
    }

    @Override
    protected String getView() {
        return CFSView.MID_SEM_FEEDBACK_LIST_VIEW;
    }
}
