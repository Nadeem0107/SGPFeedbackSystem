package in.co.customer.feedback.sys.ctl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.customer.feedback.sys.bean.BaseBean;
import in.co.customer.feedback.sys.bean.TeacherFeedbackBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.model.TeacherFeedbackModel;
import in.co.customer.feedback.sys.util.DataUtility;
import in.co.customer.feedback.sys.util.PropertyReader;
import in.co.customer.feedback.sys.util.ServletUtility;

/**
 * Teacher Feedback List functionality Controller.
 * 
 * @author 
 * @version 1.0
 * @Copyright (c) 
 */
@WebServlet(name = "TeacherFeedbackListCtl", urlPatterns = { "/ctl/teacherFeedbackList" })
public class TeacherFeedbackListCtl extends BaseCtl {
    
    private static Logger log = Logger.getLogger(TeacherFeedbackListCtl.class);

    @Override
    protected BaseBean populateBean(HttpServletRequest request) {
        TeacherFeedbackBean bean = new TeacherFeedbackBean();
        bean.setTeacherId(DataUtility.getLong(request.getParameter("tId")));
        bean.setStudentName(DataUtility.getString(request.getParameter("studentName")));
        return bean;
    }

    /**
     * Contains Display logics
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        log.debug("TeacherFeedbackListCtl doGet Started");
        List list = null;
        int pageNo = 1;
        int pageSize = DataUtility.getInt(PropertyReader.getValue("page.size"));
        
        TeacherFeedbackBean bean = (TeacherFeedbackBean) populateBean(request);
        
        // If tId is passed, we want to filter by it. 
        // We might also want to display the teacher's name.
        if(bean.getTeacherId() > 0) {
             in.co.customer.feedback.sys.model.TeacherModel pModel = new in.co.customer.feedback.sys.model.TeacherModel();
             try {
                in.co.customer.feedback.sys.bean.TeacherBean pBean = pModel.findByPK(bean.getTeacherId());
                if(pBean != null) {
                    request.setAttribute("teacherName", pBean.getName());
                }
            } catch (Exception e) {
                log.error(e);
            }
        }

        TeacherFeedbackModel model = new TeacherFeedbackModel();
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
        log.debug("TeacherFeedbackListCtl doGet End");
    }

    /**
     * Contains Submit logics
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        log.debug("TeacherFeedbackListCtl doPost Started");
        List list = null;
        int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
        int pageSize = DataUtility.getInt(request.getParameter("pageSize"));

        pageNo = (pageNo == 0) ? 1 : pageNo;
        pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader.getValue("page.size")) : pageSize;

        TeacherFeedbackBean bean = (TeacherFeedbackBean) populateBean(request);
        String op = DataUtility.getString(request.getParameter("operation"));
        
        TeacherFeedbackModel model = new TeacherFeedbackModel();

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
                ServletUtility.redirect(CFSView.TEACHER_FEEDBACK_LIST_CTL + "?tId=" + bean.getTeacherId(), request, response);
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
        log.debug("TeacherFeedbackListCtl doPost End");
    }

    @Override
    protected String getView() {
        return CFSView.TEACHER_FEEDBACK_LIST_VIEW;
    }

}
