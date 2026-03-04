package in.co.customer.feedback.sys.ctl;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.co.customer.feedback.sys.bean.EndSemFeedbackBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.model.EndSemFeedbackModel;
import in.co.customer.feedback.sys.util.ServletUtility;

@WebServlet(name = "EndSemFeedbackListCtl", urlPatterns = { "/ctl/endSemFeedbackList" })
public class EndSemFeedbackListCtl extends BaseCtl {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EndSemFeedbackModel model = new EndSemFeedbackModel();
        try {
            List<EndSemFeedbackBean> list = model.list();
            ServletUtility.setList(list, request);
        } catch (ApplicationException e) {
            ServletUtility.handleException(e, request, response);
            return;
        }
        ServletUtility.forward(getView(), request, response);
    }

    @Override
    protected String getView() {
        return CFSView.END_SEM_FEEDBACK_LIST_VIEW;
    }
}
