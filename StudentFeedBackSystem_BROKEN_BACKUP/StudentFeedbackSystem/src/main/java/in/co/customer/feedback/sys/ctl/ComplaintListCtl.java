package in.co.customer.feedback.sys.ctl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.customer.feedback.sys.bean.BaseBean;
import in.co.customer.feedback.sys.bean.UserBean;
import in.co.customer.feedback.sys.bean.ComplaintBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.model.ComplaintModel;
import in.co.customer.feedback.sys.util.DataUtility;
import in.co.customer.feedback.sys.util.PropertyReader;
import in.co.customer.feedback.sys.util.ServletUtility;

/**
 * Complaint List functionality Controller.
 */
@WebServlet(name = "ComplaintListCtl", urlPatterns = { "/ctl/complaintList" })
public class ComplaintListCtl extends BaseCtl {

    private static Logger log = Logger.getLogger(ComplaintListCtl.class);

    @Override
    protected BaseBean populateBean(HttpServletRequest request) {
        ComplaintBean bean = new ComplaintBean();
        bean.setSubject(DataUtility.getString(request.getParameter("subject")));
        bean.setComplaintType(DataUtility.getString(request.getParameter("complaintType")));
        bean.setStatus(DataUtility.getString(request.getParameter("status")));
        return bean;
    }

    /**
     * Contains Display logics
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.debug("ComplaintListCtl doGet Started");
        List<ComplaintBean> list = null;
        int pageNo = 1;
        int pageSize = DataUtility.getInt(PropertyReader.getValue("page.size"));

        ComplaintBean bean = (ComplaintBean) populateBean(request);

        // Role-based filtering
        UserBean user = (UserBean) request.getSession().getAttribute("user");
        if (user != null) {
            String roleName = user.getRoleName();
            if (user.getRoleId() == 2 || "Student".equalsIgnoreCase(roleName)) {
                bean.setCreatedBy(user.getUserName());
            } else if (user.getRoleId() == 3 || "HOD".equalsIgnoreCase(roleName)) {
                bean.setTargetRole("HOD");
            } else if (user.getRoleId() == 1 || "Admin".equalsIgnoreCase(roleName)
                    || "Principal".equalsIgnoreCase(roleName)) {
                bean.setTargetRole("Principal");
            }
        }

        ComplaintModel model = new ComplaintModel();
        try {
            list = model.search(bean, pageNo, pageSize);
            if (list == null || list.size() == 0) {
                ServletUtility.setErrorMessage("No complaints found", request);
            }
            ServletUtility.setList(list, request);
            ServletUtility.setSize(model.search(bean).size(), request);
            ServletUtility.setPageNo(pageNo, request);
            ServletUtility.setPageSize(pageSize, request);
            ServletUtility.forward(getView(), request, response);
        } catch (ApplicationException e) {
            log.error(e);
            ServletUtility.handleException(e, request, response);
            return;
        }
        log.debug("ComplaintListCtl doGet End");
    }

    /**
     * Contains Submit logics
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.debug("ComplaintListCtl doPost Started");
        List<ComplaintBean> list = null;
        int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
        int pageSize = DataUtility.getInt(request.getParameter("pageSize"));

        pageNo = (pageNo == 0) ? 1 : pageNo;
        pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader.getValue("page.size")) : pageSize;

        ComplaintBean bean = (ComplaintBean) populateBean(request);

        // Role-based filtering
        UserBean user = (UserBean) request.getSession().getAttribute("user");
        if (user != null) {
            String roleName = user.getRoleName();
            if (user.getRoleId() == 2 || "Student".equalsIgnoreCase(roleName)) {
                bean.setCreatedBy(user.getUserName());
            } else if (user.getRoleId() == 3 || "HOD".equalsIgnoreCase(roleName)) {
                bean.setTargetRole("HOD");
            } else if (user.getRoleId() == 1 || "Admin".equalsIgnoreCase(roleName)
                    || "Principal".equalsIgnoreCase(roleName)) {
                bean.setTargetRole("Principal");
            }
        }

        String op = DataUtility.getString(request.getParameter("operation"));

        ComplaintModel model = new ComplaintModel();

        try {
            if (OP_SEARCH.equalsIgnoreCase(op) || "Next".equalsIgnoreCase(op) || "Previous".equalsIgnoreCase(op)) {

                if (OP_SEARCH.equalsIgnoreCase(op)) {
                    pageNo = 1;
                } else if (OP_NEXT.equalsIgnoreCase(op)) {
                    pageNo++;
                } else if (OP_PREVIOUS.equalsIgnoreCase(op) && pageNo > 1) {
                    pageNo--;
                }

            } else if (OP_RESET.equalsIgnoreCase(op)) {
                ServletUtility.redirect(CFSView.COMPLAINT_LIST_CTL, request, response);
                return;
            } else if ("UpdateStatus".equalsIgnoreCase(op)) {
                long id = DataUtility.getLong(request.getParameter("id"));
                String status = DataUtility.getString(request.getParameter("newStatus"));
                model.updateStatus(id, status);
                ServletUtility.setSuccessMessage("Complaint status updated successfully", request);
            }

            list = model.search(bean, pageNo, pageSize);
            if (list == null || list.size() == 0) {
                ServletUtility.setErrorMessage("No complaints found", request);
            }
            ServletUtility.setList(list, request);
            ServletUtility.setPageNo(pageNo, request);
            ServletUtility.setPageSize(pageSize, request);
            ServletUtility.forward(getView(), request, response);
        } catch (ApplicationException e) {
            log.error(e);
            ServletUtility.handleException(e, request, response);
            return;
        }
        log.debug("ComplaintListCtl doPost End");
    }

    @Override
    protected String getView() {
        return CFSView.COMPLAINT_LIST_VIEW;
    }

}
