package in.co.customer.feedback.sys.ctl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.customer.feedback.sys.bean.BaseBean;
import in.co.customer.feedback.sys.bean.CollegeFacilitiesFeedbackBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.exception.DuplicateRecordException;
import in.co.customer.feedback.sys.model.CollegeFacilitiesFeedbackModel;
import in.co.customer.feedback.sys.util.DataUtility;
import in.co.customer.feedback.sys.util.DataValidator;
import in.co.customer.feedback.sys.util.PropertyReader;
import in.co.customer.feedback.sys.util.ServletUtility;
import in.co.customer.feedback.sys.bean.UserBean;
import in.co.customer.feedback.sys.model.DepartmentModel;
import in.co.customer.feedback.sys.bean.DepartmentBean;

@WebServlet(name = "CollegeFacilitiesFeedbackCtl", urlPatterns = { "/ctl/collegeFacilitiesFeedback" })
public class CollegeFacilitiesFeedbackCtl extends BaseCtl {

    private static final long serialVersionUID = 1L;
    private static Logger log = Logger.getLogger(CollegeFacilitiesFeedbackCtl.class);

    @Override
    protected boolean validate(HttpServletRequest request) {
        log.debug("CollegeFacilitiesFeedbackCtl validate start");
        boolean pass = true;

        if (DataValidator.isNull(request.getParameter("program"))) {
            request.setAttribute("program", PropertyReader.getValue("error.require", "Program"));
            pass = false;
        }
        if (DataValidator.isNull(request.getParameter("academicYear"))) {
            request.setAttribute("academicYear", PropertyReader.getValue("error.require", "Academic Year"));
            pass = false;
        }
        if (DataValidator.isNull(request.getParameter("studentName"))) {
            request.setAttribute("studentName", PropertyReader.getValue("error.require", "Student Name"));
            pass = false;
        }

        log.debug("CollegeFacilitiesFeedbackCtl validate end");
        return pass;
    }

    @Override
    protected BaseBean populateBean(HttpServletRequest request) {
        log.debug("CollegeFacilitiesFeedbackCtl populateBean start");
        CollegeFacilitiesFeedbackBean bean = new CollegeFacilitiesFeedbackBean();

        bean.setId(DataUtility.getLong(request.getParameter("id")));
        bean.setProgram(DataUtility.getString(request.getParameter("program")));
        bean.setAcademicYear(DataUtility.getString(request.getParameter("academicYear")));
        bean.setStudentName(DataUtility.getString(request.getParameter("studentName")));

        bean.setQ1(DataUtility.getInt(request.getParameter("q1")));
        bean.setQ2(DataUtility.getInt(request.getParameter("q2")));
        bean.setQ3(DataUtility.getInt(request.getParameter("q3")));
        bean.setQ4(DataUtility.getInt(request.getParameter("q4")));
        bean.setQ5(DataUtility.getInt(request.getParameter("q5")));
        bean.setQ6(DataUtility.getInt(request.getParameter("q6")));
        bean.setQ7(DataUtility.getInt(request.getParameter("q7")));
        bean.setQ8(DataUtility.getInt(request.getParameter("q8")));
        bean.setQ9(DataUtility.getInt(request.getParameter("q9")));
        bean.setQ10(DataUtility.getInt(request.getParameter("q10")));
        bean.setQ11(DataUtility.getInt(request.getParameter("q11")));
        bean.setQ12(DataUtility.getInt(request.getParameter("q12")));
        bean.setQ13(DataUtility.getInt(request.getParameter("q13")));
        bean.setQ14(DataUtility.getInt(request.getParameter("q14")));

        bean.setSignature(DataUtility.getString(request.getParameter("signature")));

        populateDTO(bean, request);

        log.debug("CollegeFacilitiesFeedbackCtl populateBean end");
        return bean;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserBean userBean = (UserBean) request.getSession().getAttribute("user");
        if (userBean != null) {
            CollegeFacilitiesFeedbackBean bean = new CollegeFacilitiesFeedbackBean();
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
        log.debug("CollegeFacilitiesFeedbackCtl doPost Start");

        String op = DataUtility.getString(request.getParameter("operation"));
        long id = DataUtility.getLong(request.getParameter("id"));

        CollegeFacilitiesFeedbackModel model = new CollegeFacilitiesFeedbackModel();

        if (OP_SAVE.equalsIgnoreCase(op)) {
            CollegeFacilitiesFeedbackBean bean = (CollegeFacilitiesFeedbackBean) populateBean(request);

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
            ServletUtility.redirect(CFSView.COLLEGE_FACILITIES_FEEDBACK_CTL, request, response);
            return;
        }

        ServletUtility.forward(getView(), request, response);
        log.debug("CollegeFacilitiesFeedbackCtl doPost End");
    }

    @Override
    protected String getView() {
        return CFSView.COLLEGE_FACILITIES_FEEDBACK_VIEW;
    }
}
