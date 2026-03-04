package in.co.customer.feedback.sys.ctl;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.co.customer.feedback.sys.bean.BaseBean;
import in.co.customer.feedback.sys.bean.UserBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.exception.RecordNotFoundException;
import in.co.customer.feedback.sys.model.UserModel;
import in.co.customer.feedback.sys.util.DataUtility;
import in.co.customer.feedback.sys.util.DataValidator;
import in.co.customer.feedback.sys.util.PropertyReader;
import in.co.customer.feedback.sys.util.ServletUtility;

/**
 * Forget Password Controller.
 * Allows HOD and Principal users to request a password reset email.
 */
@WebServlet(name = "ForgetPasswordCtl", urlPatterns = { "/forgetPassword" })
public class ForgetPasswordCtl extends BaseCtl {

    private static final long serialVersionUID = 1L;

    public static final String OP_SUBMIT = "Submit";

    private static Logger log = Logger.getLogger(ForgetPasswordCtl.class.getName());

    @Override
    protected boolean validate(HttpServletRequest request) {
        log.info("ForgetPasswordCtl validate Started");
        boolean pass = true;

        if (DataValidator.isNull(request.getParameter("userName"))) {
            request.setAttribute("userName", PropertyReader.getValue("error.require", "Username"));
            pass = false;
        }

        log.info("ForgetPasswordCtl validate Ended");
        return pass;
    }

    @Override
    protected BaseBean populateBean(HttpServletRequest request) {
        log.info("ForgetPasswordCtl populateBean Started");
        UserBean bean = new UserBean();
        bean.setUserName(DataUtility.getString(request.getParameter("userName")));
        log.info("ForgetPasswordCtl populateBean Ended");
        return bean;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.info("ForgetPasswordCtl doGet Started");
        ServletUtility.forward(getView(), request, response);
        log.info("ForgetPasswordCtl doGet Ended");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.info("ForgetPasswordCtl doPost Started");

        String op = DataUtility.getString(request.getParameter("operation"));
        UserModel model = new UserModel();

        if (OP_SUBMIT.equalsIgnoreCase(op)) {
            UserBean bean = (UserBean) populateBean(request);
            try {
                String message = model.forgetPassword(bean.getUserName());
                ServletUtility.setSuccessMessage(message, request);
                // Clear the bean so the form is reset
                ServletUtility.setBean(new UserBean(), request);
            } catch (RecordNotFoundException e) {
                ServletUtility.setBean(bean, request);
                ServletUtility.setErrorMessage(e.getMessage(), request);
            } catch (ApplicationException e) {
                ServletUtility.setBean(bean, request);
                ServletUtility.setErrorMessage(e.getMessage(), request);
            }
        }

        ServletUtility.forward(getView(), request, response);
        log.info("ForgetPasswordCtl doPost Ended");
    }

    @Override
    protected String getView() {
        return CFSView.FORGET_PASSWORD_VIEW;
    }
}
