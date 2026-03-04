package in.co.customer.feedback.sys.ctl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.customer.feedback.sys.bean.BaseBean;
import in.co.customer.feedback.sys.bean.CourseEndFeedbackBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.exception.DuplicateRecordException;
import in.co.customer.feedback.sys.model.CourseEndFeedbackModel;
import in.co.customer.feedback.sys.util.DataUtility;
import in.co.customer.feedback.sys.util.DataValidator;
import in.co.customer.feedback.sys.util.PropertyReader;
import in.co.customer.feedback.sys.util.ServletUtility;
import in.co.customer.feedback.sys.bean.UserBean;
import in.co.customer.feedback.sys.model.TeacherModel;
import in.co.customer.feedback.sys.bean.TeacherBean;
import in.co.customer.feedback.sys.model.DepartmentModel;
import in.co.customer.feedback.sys.bean.DepartmentBean;
import java.util.List;

@WebServlet(name = "CourseEndFeedbackCtl", urlPatterns = { "/ctl/courseEndFeedback" })
public class CourseEndFeedbackCtl extends BaseCtl {

    private static final long serialVersionUID = 1L;
    private static Logger log = Logger.getLogger(CourseEndFeedbackCtl.class);

    @Override
    protected void preload(HttpServletRequest request) {
        UserBean userBean = (UserBean) request.getSession().getAttribute("user");
        if (userBean != null && userBean.getRoleId() == 2) { // Student
            TeacherModel teacherModel = new TeacherModel();
            try {
                TeacherBean searchBean = new TeacherBean();
                searchBean.setDeptId(userBean.getDeptId());
                searchBean.setSemester(userBean.getSemester());
                List<TeacherBean> list = teacherModel.search(searchBean);
                request.setAttribute("teacherList", list);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected boolean validate(HttpServletRequest request) {
        log.debug("CourseEndFeedbackCtl validate start");
        boolean pass = true;

        if (DataValidator.isNull(request.getParameter("coordinator"))) {
            request.setAttribute("coordinator", PropertyReader.getValue("error.require", "Coordinator"));
            pass = false;
        }
        if (DataValidator.isNull(request.getParameter("sem"))) {
            request.setAttribute("sem", PropertyReader.getValue("error.require", "Semester"));
            pass = false;
        }

        log.debug("CourseEndFeedbackCtl validate end");
        return pass;
    }

    @Override
    protected BaseBean populateBean(HttpServletRequest request) {
        log.debug("CourseEndFeedbackCtl populateBean start");
        CourseEndFeedbackBean bean = new CourseEndFeedbackBean();

        bean.setId(DataUtility.getLong(request.getParameter("id")));
        bean.setCoordinator(DataUtility.getString(request.getParameter("coordinator")));
        bean.setSem(DataUtility.getString(request.getParameter("sem")));
        bean.setSec(DataUtility.getString(request.getParameter("sec")));
        bean.setProgram(DataUtility.getString(request.getParameter("program")));
        bean.setCourseName(DataUtility.getString(request.getParameter("courseName")));
        bean.setCourseCode(DataUtility.getString(request.getParameter("courseCode")));
        bean.setAcademicYear(DataUtility.getString(request.getParameter("academicYear")));
        bean.setRegNo(DataUtility.getString(request.getParameter("regNo")));
        bean.setStudentName(DataUtility.getString(request.getParameter("studentName")));

        bean.setCo1(DataUtility.getInt(request.getParameter("co1")));
        bean.setCo2(DataUtility.getInt(request.getParameter("co2")));
        bean.setCo3(DataUtility.getInt(request.getParameter("co3")));
        bean.setCo4(DataUtility.getInt(request.getParameter("co4")));
        bean.setCo5(DataUtility.getInt(request.getParameter("co5")));
        bean.setCo6(DataUtility.getInt(request.getParameter("co6")));

        populateDTO(bean, request);

        log.debug("CourseEndFeedbackCtl populateBean end");
        return bean;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserBean userBean = (UserBean) request.getSession().getAttribute("user");
        if (userBean != null) {
            CourseEndFeedbackBean bean = new CourseEndFeedbackBean();
            bean.setRegNo(userBean.getUserName());
            bean.setStudentName(userBean.getName());
            bean.setSem(userBean.getSemester());

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
        log.debug("CourseEndFeedbackCtl doPost Start");

        String op = DataUtility.getString(request.getParameter("operation"));
        long id = DataUtility.getLong(request.getParameter("id"));

        CourseEndFeedbackModel model = new CourseEndFeedbackModel();

        if (OP_SAVE.equalsIgnoreCase(op)) {
            CourseEndFeedbackBean bean = (CourseEndFeedbackBean) populateBean(request);

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
            ServletUtility.redirect(CFSView.COURSE_END_FEEDBACK_CTL, request, response);
            return;
        }

        ServletUtility.forward(getView(), request, response);
        log.debug("CourseEndFeedbackCtl doPost End");
    }

    @Override
    protected String getView() {
        return CFSView.COURSE_END_FEEDBACK_VIEW;
    }
}
