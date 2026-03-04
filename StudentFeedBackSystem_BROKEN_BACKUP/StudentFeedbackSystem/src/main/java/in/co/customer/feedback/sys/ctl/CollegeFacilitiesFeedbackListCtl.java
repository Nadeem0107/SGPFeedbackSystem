package in.co.customer.feedback.sys.ctl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.customer.feedback.sys.bean.BaseBean;
import in.co.customer.feedback.sys.bean.CollegeFacilitiesFeedbackBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.model.CollegeFacilitiesFeedbackModel;
import in.co.customer.feedback.sys.util.DataUtility;
import in.co.customer.feedback.sys.util.PropertyReader;
import in.co.customer.feedback.sys.util.ServletUtility;

/**
 * College Facilities Feedback List functionality Controller.
 * 
 * @author
 * @version 1.0
 * @Copyright (c)
 */
@WebServlet(name = "CollegeFacilitiesFeedbackListCtl", urlPatterns = { "/ctl/collegeFacilitiesFeedbackList" })
public class CollegeFacilitiesFeedbackListCtl extends BaseCtl {

    private static Logger log = Logger.getLogger(CollegeFacilitiesFeedbackListCtl.class);

    @Override
    protected BaseBean populateBean(HttpServletRequest request) {
        CollegeFacilitiesFeedbackBean bean = new CollegeFacilitiesFeedbackBean();
        bean.setStudentName(DataUtility.getString(request.getParameter("studentName")));
        return bean;
    }

    /**
     * Contains Display logics
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.debug("CollegeFacilitiesFeedbackListCtl doGet Started");
        List list = null;
        int pageNo = 1;
        int pageSize = DataUtility.getInt(PropertyReader.getValue("page.size"));

        CollegeFacilitiesFeedbackBean bean = (CollegeFacilitiesFeedbackBean) populateBean(request);

        CollegeFacilitiesFeedbackModel model = new CollegeFacilitiesFeedbackModel();
        try {
            list = model.search(bean, pageNo, pageSize);
            if (list == null || list.size() == 0) {
                ServletUtility.setErrorMessage("No record found ", request);
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
        log.debug("CollegeFacilitiesFeedbackListCtl doGet End");
    }

    /**
     * Contains Submit logics
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.debug("CollegeFacilitiesFeedbackListCtl doPost Started");
        List list = null;
        int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
        int pageSize = DataUtility.getInt(request.getParameter("pageSize"));

        pageNo = (pageNo == 0) ? 1 : pageNo;
        pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader.getValue("page.size")) : pageSize;

        CollegeFacilitiesFeedbackBean bean = (CollegeFacilitiesFeedbackBean) populateBean(request);
        String op = DataUtility.getString(request.getParameter("operation"));

        CollegeFacilitiesFeedbackModel model = new CollegeFacilitiesFeedbackModel();

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
                ServletUtility.redirect(CFSView.COLLEGE_FACILITIES_FEEDBACK_LIST_CTL, request, response);
                return;
            }

            list = model.search(bean, pageNo, pageSize);
            if (list == null || list.size() == 0) {
                ServletUtility.setErrorMessage("No record found ", request);
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
        log.debug("CollegeFacilitiesFeedbackListCtl doPost End");
    }

    @Override
    protected String getView() {
        return CFSView.COLLEGE_FACILITIES_FEEDBACK_LIST_VIEW;
    }

}
