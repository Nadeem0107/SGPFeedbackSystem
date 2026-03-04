package in.co.customer.feedback.sys.ctl;

import java.io.IOException;
import org.apache.log4j.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.co.customer.feedback.sys.bean.BaseBean;
import in.co.customer.feedback.sys.bean.TeacherFeedbackBean;
import in.co.customer.feedback.sys.bean.UserBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.model.TeacherFeedbackModel;
import in.co.customer.feedback.sys.model.UserModel;
import in.co.customer.feedback.sys.util.DataUtility;
import in.co.customer.feedback.sys.util.DataValidator;
import in.co.customer.feedback.sys.util.PropertyReader;
import in.co.customer.feedback.sys.util.ServletUtility;

@WebServlet(name = "TeacherFeedbackCtl", urlPatterns = { "/ctl/teacherFeedback" })
public class TeacherFeedbackCtl extends BaseCtl {
    
    private static final long serialVersionUID = 1L;
    private static Logger log = Logger.getLogger(TeacherFeedbackCtl.class);

    @Override
    protected boolean validate(HttpServletRequest request) {
        log.debug("TeacherFeedbackCtl validate start");
        boolean pass = true;

        if (DataValidator.isNull(request.getParameter("knowledgeRating"))) {
            request.setAttribute("knowledgeRating", PropertyReader.getValue("error.require", "Knowledge Rating"));
            pass = false;
        }
        
        // Basic validation for other fields if needed, but radio buttons usually have a default selected or require one.
        // Assuming frontend validation or default check.
        
        log.debug("TeacherFeedbackCtl validate end");
        return pass;
    }

    @Override
    protected BaseBean populateBean(HttpServletRequest request) {
        log.debug("TeacherFeedbackCtl populateBean start");
        TeacherFeedbackBean bean = new TeacherFeedbackBean();
        
        bean.setId(DataUtility.getLong(request.getParameter("id")));
        bean.setTeacherId(DataUtility.getLong(request.getParameter("teacherId")));
        
        // Get Student ID from Session
        HttpSession session = request.getSession();
        UserBean userBean = (UserBean) session.getAttribute("user");
        if(userBean != null) {
            bean.setStudentId(userBean.getId());
            bean.setStudentName(userBean.getName());
        }

        bean.setKnowledgeRating(DataUtility.getInt(request.getParameter("knowledgeRating")));
        bean.setCommunicationRating(DataUtility.getInt(request.getParameter("communicationRating")));
        bean.setMethodologyRating(DataUtility.getInt(request.getParameter("methodologyRating")));
        bean.setPunctualityRating(DataUtility.getInt(request.getParameter("punctualityRating")));
        bean.setOverallRating(DataUtility.getInt(request.getParameter("overallRating")));
        
        bean.setComments(DataUtility.getString(request.getParameter("comments")));

        log.debug("TeacherFeedbackCtl populateBean end");
        return bean;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        log.debug("TeacherFeedbackCtl doGet Start");
        
        long teacherId = DataUtility.getLong(request.getParameter("tId"));
        if (teacherId > 0) {
            TeacherFeedbackBean bean = new TeacherFeedbackBean();
            bean.setTeacherId(teacherId);
            
            // Fetch Teacher Name (Product Name)
            in.co.customer.feedback.sys.model.TeacherModel model = new in.co.customer.feedback.sys.model.TeacherModel();
            try {
                in.co.customer.feedback.sys.bean.TeacherBean product = model.findByPK(teacherId);
                if (product != null) {
                    request.setAttribute("teacherName", product.getName());
                }
            } catch (Exception e) {
                log.error(e);
            }
            
            ServletUtility.setBean(bean, request);
        }
        
        ServletUtility.forward(getView(), request, response);
        log.debug("TeacherFeedbackCtl doGet End");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        log.debug("TeacherFeedbackCtl doPost Start");
        
        String op = DataUtility.getString(request.getParameter("operation"));
        
        if (OP_SAVE.equalsIgnoreCase(op)) {
            TeacherFeedbackBean bean = (TeacherFeedbackBean) populateBean(request);
            TeacherFeedbackModel model = new TeacherFeedbackModel();
            try {
                model.add(bean);
                ServletUtility.setSuccessMessage("Feedback submitted successfully!", request);
                // Redirect back to list or stay on page?
                // Staying on page with success message.
                ServletUtility.setBean(bean, request);
            } catch (ApplicationException e) {
                log.error(e);
                ServletUtility.handleException(e, request, response);
                return;
            }
        } else if (OP_RESET.equalsIgnoreCase(op)) {
            ServletUtility.redirect(CFSView.TEACHER_LIST_CTL, request, response);
            return;
        }
        
        ServletUtility.forward(getView(), request, response);
        log.debug("TeacherFeedbackCtl doPost End");
    }

    @Override
    protected String getView() {
        return CFSView.TEACHER_FEEDBACK_VIEW;
    }
}
