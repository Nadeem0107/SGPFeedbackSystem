package in.co.customer.feedback.sys.ctl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.customer.feedback.sys.bean.BaseBean;
import in.co.customer.feedback.sys.bean.ParentsFeedbackBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.exception.DuplicateRecordException;
import in.co.customer.feedback.sys.model.ParentsFeedbackModel;
import in.co.customer.feedback.sys.util.DataUtility;
import in.co.customer.feedback.sys.util.DataValidator;
import in.co.customer.feedback.sys.util.PropertyReader;
import in.co.customer.feedback.sys.util.ServletUtility;
import in.co.customer.feedback.sys.bean.UserBean;
import in.co.customer.feedback.sys.model.DepartmentModel;
import in.co.customer.feedback.sys.bean.DepartmentBean;

@WebServlet(name = "ParentsFeedbackCtl", urlPatterns = { "/ctl/parentsFeedback" })
public class ParentsFeedbackCtl extends BaseCtl {

    private static final long serialVersionUID = 1L;
    private static Logger log = Logger.getLogger(ParentsFeedbackCtl.class);

    @Override
    protected boolean validate(HttpServletRequest request) {
        log.debug("ParentsFeedbackCtl validate start");
        boolean pass = true;

        if (DataValidator.isNull(request.getParameter("studentName"))) {
            request.setAttribute("studentName", PropertyReader.getValue("error.require", "Student Name"));
            pass = false;
        }

        log.debug("ParentsFeedbackCtl validate end");
        return pass;
    }

    @Override
    protected BaseBean populateBean(HttpServletRequest request) {
        log.debug("ParentsFeedbackCtl populateBean start");
        ParentsFeedbackBean bean = new ParentsFeedbackBean();

        bean.setId(DataUtility.getLong(request.getParameter("id")));
        bean.setStudentName(DataUtility.getString(request.getParameter("studentName")));
        bean.setProgram(DataUtility.getString(request.getParameter("program")));
        bean.setAcademicYear(DataUtility.getString(request.getParameter("academicYear")));

        bean.setQ1(DataUtility.getInt(request.getParameter("q1")));
        bean.setQ2(DataUtility.getInt(request.getParameter("q2")));
        bean.setQ3(DataUtility.getInt(request.getParameter("q3")));
        bean.setQ4(DataUtility.getInt(request.getParameter("q4")));
        bean.setQ5(DataUtility.getInt(request.getParameter("q5")));

        populateDTO(bean, request);

        log.debug("ParentsFeedbackCtl populateBean end");
        return bean;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserBean userBean = (UserBean) request.getSession().getAttribute("user");
        if (userBean != null) {
            ParentsFeedbackBean bean = new ParentsFeedbackBean();
            bean.setStudentName(userBean.getName());

            // Get Department Name as Program
            DepartmentModel deptModel = new DepartmentModel();
            try {
                DepartmentBean deptBean = deptModel.findByPK(userBean.getDeptId());
                if (deptBean != null) {
                    bean.setProgram(deptBean.getName());
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            ServletUtility.setBean(bean, request);
        }
        ServletUtility.forward(getView(), request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.debug("ParentsFeedbackCtl doPost Start");

        String op = DataUtility.getString(request.getParameter("operation"));
        long id = DataUtility.getLong(request.getParameter("id"));

        ParentsFeedbackModel model = new ParentsFeedbackModel();

        if (OP_SAVE.equalsIgnoreCase(op)) {
            ParentsFeedbackBean bean = (ParentsFeedbackBean) populateBean(request);

            try {
                if (id > 0) {
                    // Update logic (if implemented)
                } else {
                    long pk = model.add(bean);
                    bean.setId(pk);
                    ServletUtility.setSuccessMessage("Feedback submitted successfully!", request);
                }
                ServletUtility.setBean(bean, request);
            } catch (ApplicationException e) {
                log.error(e);
                ServletUtility.handleException(e, request, response);
                return;
            } catch (DuplicateRecordException e) {
                ServletUtility.setBean(bean, request);
                ServletUtility.setErrorMessage("Feedback already exists", request);
            }
        } else if (OP_RESET.equalsIgnoreCase(op)) {
            ServletUtility.redirect(CFSView.PARENTS_FEEDBACK_CTL, request, response);
            return;
        }

        ServletUtility.forward(getView(), request, response);
        log.debug("ParentsFeedbackCtl doPost End");
    }

    @Override
    protected String getView() {
        return CFSView.PARENTS_FEEDBACK_VIEW;
    }
}
