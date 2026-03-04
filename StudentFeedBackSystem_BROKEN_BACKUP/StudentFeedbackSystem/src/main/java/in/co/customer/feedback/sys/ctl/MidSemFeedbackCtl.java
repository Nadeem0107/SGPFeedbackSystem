package in.co.customer.feedback.sys.ctl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.co.customer.feedback.sys.bean.BaseBean;
import in.co.customer.feedback.sys.bean.MidSemFeedbackBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.model.MidSemFeedbackModel;
import in.co.customer.feedback.sys.util.DataUtility;
import in.co.customer.feedback.sys.util.ServletUtility;
import in.co.customer.feedback.sys.bean.UserBean;
import in.co.customer.feedback.sys.model.TeacherModel;
import in.co.customer.feedback.sys.bean.TeacherBean;
import in.co.customer.feedback.sys.model.DepartmentModel;
import in.co.customer.feedback.sys.bean.DepartmentBean;
import java.util.List;

@WebServlet(name = "MidSemFeedbackCtl", urlPatterns = { "/ctl/midSemFeedback" })
public class MidSemFeedbackCtl extends BaseCtl {

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
    protected BaseBean populateBean(HttpServletRequest request) {
        MidSemFeedbackBean bean = new MidSemFeedbackBean();
        bean.setId(DataUtility.getLong(request.getParameter("id")));
        bean.setRegNo(request.getParameter("regNo"));
        bean.setStudentName(request.getParameter("studentName"));
        bean.setBranch(request.getParameter("branch"));
        bean.setSemester(DataUtility.getInt(request.getParameter("semester")));
        bean.setFaculty(request.getParameter("faculty"));
        bean.setSubject(request.getParameter("subject"));
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
        populateDTO(bean, request);
        return bean;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserBean userBean = (UserBean) request.getSession().getAttribute("user");
        if (userBean != null) {
            MidSemFeedbackBean bean = new MidSemFeedbackBean();
            bean.setRegNo(userBean.getUserName());
            bean.setStudentName(userBean.getName());
            bean.setSemester(DataUtility.getInt(userBean.getSemester()));

            // Get Department Name
            DepartmentModel deptModel = new DepartmentModel();
            try {
                DepartmentBean deptBean = deptModel.findByPK(userBean.getDeptId());
                if (deptBean != null) {
                    bean.setBranch(deptBean.getName());
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
        String op = DataUtility.getString(request.getParameter("operation"));
        MidSemFeedbackModel model = new MidSemFeedbackModel();
        MidSemFeedbackBean bean = (MidSemFeedbackBean) populateBean(request);
        if (OP_SAVE.equalsIgnoreCase(op)) {
            try {
                model.add(bean);
                ServletUtility.setSuccessMessage("Mid-Sem Feedback submitted successfully!", request);
            } catch (ApplicationException e) {
                ServletUtility.handleException(e, request, response);
                return;
            }
        }
        ServletUtility.forward(getView(), request, response);
    }

    @Override
    protected String getView() {
        return CFSView.MID_SEM_FEEDBACK_VIEW;
    }
}
