package in.co.customer.feedback.sys.ctl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.customer.feedback.sys.bean.BaseBean;
import in.co.customer.feedback.sys.bean.UserBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.exception.DuplicateRecordException;
import in.co.customer.feedback.sys.model.UserModel;
import in.co.customer.feedback.sys.util.DataUtility;
import in.co.customer.feedback.sys.util.DataValidator;
import in.co.customer.feedback.sys.util.PropertyReader;
import in.co.customer.feedback.sys.util.ServletUtility;

@WebServlet(name = "UserCtl", urlPatterns = { "/ctl/user" })
public class UserCtl extends BaseCtl {

    private static Logger log = Logger.getLogger(UserCtl.class);

    @Override
    protected void preload(HttpServletRequest request) {
        in.co.customer.feedback.sys.model.DepartmentModel model = new in.co.customer.feedback.sys.model.DepartmentModel();
        try {
            request.setAttribute("deptList", model.list());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected boolean validate(HttpServletRequest request) {
        log.debug("UserCtl Method validate Started");
        boolean pass = true;

        if (DataValidator.isNull(request.getParameter("name"))) {
            request.setAttribute("name", PropertyReader.getValue("error.require", "Name"));
            pass = false;
        }
        if (DataValidator.isNull(request.getParameter("userName"))) {
            request.setAttribute("userName", PropertyReader.getValue("error.require", "User Name"));
            pass = false;
        }
        if (DataValidator.isNull(request.getParameter("email"))) {
            request.setAttribute("email", PropertyReader.getValue("error.require", "Email"));
            pass = false;
        } else if (!DataValidator.isEmail(request.getParameter("email"))) {
            request.setAttribute("email", PropertyReader.getValue("error.email", "Email"));
            pass = false;
        }
        if (DataValidator.isNull(request.getParameter("contactNo"))) {
            request.setAttribute("contactNo", PropertyReader.getValue("error.require", "Contact No"));
            pass = false;
        }
        if (DataValidator.isNull(request.getParameter("deptId")) || "0".equals(request.getParameter("deptId"))) {
            request.setAttribute("deptId", PropertyReader.getValue("error.require", "Department"));
            pass = false;
        }
        if (DataValidator.isNull(request.getParameter("semester"))) {
            request.setAttribute("semester", PropertyReader.getValue("error.require", "Semester"));
            pass = false;
        }

        log.debug("UserCtl Method validate Ended");
        return pass;
    }

    @Override
    protected BaseBean populateBean(HttpServletRequest request) {
        UserBean bean = new UserBean();
        bean.setId(DataUtility.getLong(request.getParameter("id")));
        bean.setName(DataUtility.getString(request.getParameter("name")));
        bean.setUserName(DataUtility.getString(request.getParameter("userName")));
        bean.setEmail(DataUtility.getString(request.getParameter("email")));
        bean.setContactNo(DataUtility.getString(request.getParameter("contactNo")));
        bean.setGender(DataUtility.getString(request.getParameter("gender")));
        bean.setDob(DataUtility.getDate(request.getParameter("dob")));
        bean.setDeptId(DataUtility.getLong(request.getParameter("deptId")));
        bean.setSemester(DataUtility.getString(request.getParameter("semester")));
        bean.setRoleId(DataUtility.getLong(request.getParameter("roleId")));
        bean.setRoleName(DataUtility.getString(request.getParameter("roleName")));
        populateDTO(bean, request);
        return bean;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.debug("UserCtl Method doGet Started");
        String op = DataUtility.getString(request.getParameter("operation"));
        long id = DataUtility.getLong(request.getParameter("id"));
        UserModel model = new UserModel();
        if (id > 0) {
            UserBean bean;
            try {
                bean = model.findByPK(id);
                ServletUtility.setBean(bean, request);
            } catch (ApplicationException e) {
                log.error(e);
                ServletUtility.handleException(e, request, response);
                return;
            }
        }
        ServletUtility.forward(getView(), request, response);
        log.debug("UserCtl Method doGet Ended");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.debug("UserCtl Method doPost Started");
        String op = DataUtility.getString(request.getParameter("operation"));
        long id = DataUtility.getLong(request.getParameter("id"));
        UserModel model = new UserModel();

        if (OP_SAVE.equalsIgnoreCase(op)) {
            UserBean bean = (UserBean) populateBean(request);
            try {
                if (id > 0) {
                    model.update(bean);
                    ServletUtility.setSuccessMessage("Data is successfully updated", request);
                } else {
                    model.add(bean);
                    ServletUtility.setSuccessMessage("Data is successfully saved", request);
                }
                ServletUtility.setBean(bean, request);
            } catch (ApplicationException e) {
                log.error(e);
                ServletUtility.handleException(e, request, response);
                return;
            } catch (DuplicateRecordException e) {
                ServletUtility.setBean(bean, request);
                ServletUtility.setErrorMessage("User already exists", request);
            }
        } else if (OP_DELETE.equalsIgnoreCase(op)) {
            UserBean bean = (UserBean) populateBean(request);
            try {
                model.delete(bean);
                ServletUtility.redirect(CFSView.USER_LIST_CTL, request, response);
                return;
            } catch (ApplicationException e) {
                log.error(e);
                ServletUtility.handleException(e, request, response);
                return;
            }
        } else if (OP_CANCEL.equalsIgnoreCase(op)) {
            ServletUtility.redirect(CFSView.USER_LIST_CTL, request, response);
            return;
        }

        ServletUtility.forward(getView(), request, response);
        log.debug("UserCtl Method doPost Ended");
    }

    @Override
    protected String getView() {
        return CFSView.USER_VIEW;
    }
}
