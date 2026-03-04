package in.co.customer.feedback.sys.ctl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.customer.feedback.sys.bean.BaseBean;
import in.co.customer.feedback.sys.bean.ComplaintBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.exception.DuplicateRecordException;
import in.co.customer.feedback.sys.model.ComplaintModel;
import in.co.customer.feedback.sys.util.DataUtility;
import in.co.customer.feedback.sys.util.DataValidator;
import in.co.customer.feedback.sys.util.PropertyReader;
import in.co.customer.feedback.sys.util.ServletUtility;

@WebServlet(name = "ComplaintCtl", urlPatterns = { "/ctl/complaint" })
public class ComplaintCtl extends BaseCtl {

    private static final long serialVersionUID = 1L;
    private static Logger log = Logger.getLogger(ComplaintCtl.class);

    @Override
    protected boolean validate(HttpServletRequest request) {
        log.debug("ComplaintCtl validate start");
        boolean pass = true;

        if (DataValidator.isNull(request.getParameter("program"))) {
            request.setAttribute("program", PropertyReader.getValue("error.require", "Program"));
            pass = false;
        }
        if (DataValidator.isNull(request.getParameter("academicYear"))) {
            request.setAttribute("academicYear", PropertyReader.getValue("error.require", "Academic Year"));
            pass = false;
        }
        if (DataValidator.isNull(request.getParameter("complaintType"))) {
            request.setAttribute("complaintType", PropertyReader.getValue("error.require", "Complaint Type"));
            pass = false;
        }
        if (DataValidator.isNull(request.getParameter("subject"))) {
            request.setAttribute("subject", PropertyReader.getValue("error.require", "Subject"));
            pass = false;
        }
        if (DataValidator.isNull(request.getParameter("description"))) {
            request.setAttribute("description", PropertyReader.getValue("error.require", "Description"));
            pass = false;
        }
        if (DataValidator.isNull(request.getParameter("priority"))) {
            request.setAttribute("priority", PropertyReader.getValue("error.require", "Priority"));
            pass = false;
        }

        log.debug("ComplaintCtl validate end");
        return pass;
    }

    @Override
    protected BaseBean populateBean(HttpServletRequest request) {
        log.debug("ComplaintCtl populateBean start");
        ComplaintBean bean = new ComplaintBean();

        bean.setId(DataUtility.getLong(request.getParameter("id")));
        bean.setProgram(DataUtility.getString(request.getParameter("program")));
        bean.setAcademicYear(DataUtility.getString(request.getParameter("academicYear")));
        bean.setComplaintType(DataUtility.getString(request.getParameter("complaintType")));
        bean.setSubject(DataUtility.getString(request.getParameter("subject")));
        bean.setDescription(DataUtility.getString(request.getParameter("description")));
        bean.setPriority(DataUtility.getString(request.getParameter("priority")));
        bean.setStatus("Pending"); // Default status

        String sendTo = DataUtility.getString(request.getParameter("sendTo"));
        if ("Principal".equalsIgnoreCase(sendTo)) {
            bean.setTargetRole("Principal");
        } else if ("HOD".equalsIgnoreCase(sendTo)) {
            bean.setTargetRole("HOD");
            bean.setTargetDepartment(bean.getProgram());
        } else if ("All".equalsIgnoreCase(sendTo)) {
            bean.setTargetRole("All");
        } else {
            // Legacy/Default fallback logic
            if ("Faculty".equalsIgnoreCase(bean.getComplaintType())) {
                bean.setTargetRole("HOD");
                bean.setTargetDepartment(bean.getProgram());
            } else {
                bean.setTargetRole("Principal");
            }
        }

        populateDTO(bean, request);

        log.debug("ComplaintCtl populateBean end");
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
        log.debug("ComplaintCtl doPost Start");

        String op = DataUtility.getString(request.getParameter("operation"));
        long id = DataUtility.getLong(request.getParameter("id"));

        ComplaintModel model = new ComplaintModel();

        if (OP_SAVE.equalsIgnoreCase(op)) {
            ComplaintBean bean = (ComplaintBean) populateBean(request);

            try {
                if (id > 0) {
                    // Update logic (if needed in future)
                } else {
                    long pk = model.add(bean);
                    bean.setId(pk);
                    ServletUtility.setSuccessMessage("Complaint submitted successfully! We will review it soon.",
                            request);
                }
                ServletUtility.setBean(bean, request);
            } catch (ApplicationException e) {
                log.error(e);
                ServletUtility.handleException(e, request, response);
                return;
            } catch (DuplicateRecordException e) {
                ServletUtility.setBean(bean, request);
                ServletUtility.setErrorMessage("Complaint already exists", request);
            }
        } else if (OP_RESET.equalsIgnoreCase(op)) {
            ServletUtility.redirect(CFSView.COMPLAINT_CTL, request, response);
            return;
        }

        ServletUtility.forward(getView(), request, response);
        log.debug("ComplaintCtl doPost End");
    }

    @Override
    protected String getView() {
        return CFSView.COMPLAINT_VIEW;
    }
}
