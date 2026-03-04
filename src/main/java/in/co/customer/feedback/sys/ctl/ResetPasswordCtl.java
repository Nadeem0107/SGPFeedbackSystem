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
import in.co.customer.feedback.sys.model.UserModel;
import in.co.customer.feedback.sys.util.DataUtility;
import in.co.customer.feedback.sys.util.DataValidator;
import in.co.customer.feedback.sys.util.PropertyReader;
import in.co.customer.feedback.sys.util.ServletUtility;

/**
 * Reset Password Controller.
 * Handles the actual password reset after user clicks the link in the email.
 * Validates the reset token and allows setting a new password.
 */
@WebServlet(name = "ResetPasswordCtl", urlPatterns = { "/resetPassword" })
public class ResetPasswordCtl extends BaseCtl {

    private static final long serialVersionUID = 1L;

    public static final String OP_RESET = "ResetPassword";

    private static Logger log = Logger.getLogger(ResetPasswordCtl.class.getName());

    @Override
    protected boolean validate(HttpServletRequest request) {
        log.info("ResetPasswordCtl validate Started");
        boolean pass = true;
        String op = request.getParameter("operation");

        // Only validate on form submission
        if (OP_RESET.equalsIgnoreCase(op)) {
            if (DataValidator.isNull(request.getParameter("newPassword"))) {
                request.setAttribute("newPassword", PropertyReader.getValue("error.require", "New Password"));
                pass = false;
            }
            if (DataValidator.isNull(request.getParameter("confirmPassword"))) {
                request.setAttribute("confirmPassword", PropertyReader.getValue("error.require", "Confirm Password"));
                pass = false;
            }
            String newPwd = request.getParameter("newPassword");
            String confirmPwd = request.getParameter("confirmPassword");
            if (newPwd != null && confirmPwd != null && !newPwd.equals(confirmPwd)) {
                ServletUtility.setErrorMessage("New password and confirm password do not match", request);
                pass = false;
            }
            if (newPwd != null && newPwd.length() < 6) {
                request.setAttribute("newPassword", "Password must be at least 6 characters long");
                pass = false;
            }
        }

        log.info("ResetPasswordCtl validate Ended");
        return pass;
    }

    @Override
    protected BaseBean populateBean(HttpServletRequest request) {
        UserBean bean = new UserBean();
        bean.setPassword(DataUtility.getString(request.getParameter("newPassword")));
        bean.setConfirmPassword(DataUtility.getString(request.getParameter("confirmPassword")));
        return bean;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.info("ResetPasswordCtl doGet Started");

        String token = request.getParameter("token");

        if (token == null || token.trim().isEmpty()) {
            ServletUtility.setErrorMessage("Invalid password reset link.", request);
            ServletUtility.forward(CFSView.LOGIN_VIEW, request, response);
            return;
        }

        // Validate token
        long userId = UserModel.validateResetToken(token);
        if (userId < 0) {
            ServletUtility.setErrorMessage(
                    "This password reset link has expired or is invalid. Please request a new one.", request);
            ServletUtility.forward(CFSView.LOGIN_VIEW, request, response);
            return;
        }

        // Token is valid, show reset form
        request.setAttribute("resetToken", token);
        ServletUtility.forward(CFSView.RESET_PASSWORD_VIEW, request, response);

        log.info("ResetPasswordCtl doGet Ended");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.info("ResetPasswordCtl doPost Started");

        String op = DataUtility.getString(request.getParameter("operation"));
        String token = DataUtility.getString(request.getParameter("token"));

        if (OP_RESET.equalsIgnoreCase(op)) {
            // Validate token again
            long userId = UserModel.validateResetToken(token);
            if (userId < 0) {
                ServletUtility.setErrorMessage(
                        "This password reset link has expired or is invalid. Please request a new one.", request);
                ServletUtility.forward(CFSView.LOGIN_VIEW, request, response);
                return;
            }

            String newPassword = request.getParameter("newPassword");
            UserModel model = new UserModel();

            try {
                boolean success = model.resetPasswordDirect(userId, newPassword);
                if (success) {
                    // Invalidate the token so it can't be reused
                    UserModel.invalidateResetToken(token);
                    ServletUtility.setSuccessMessage(
                            "Your password has been reset successfully! You can now login with your new password.",
                            request);
                    ServletUtility.forward(CFSView.LOGIN_VIEW, request, response);
                    return;
                } else {
                    request.setAttribute("resetToken", token);
                    ServletUtility.setErrorMessage("Failed to reset password. Please try again.", request);
                }
            } catch (ApplicationException e) {
                request.setAttribute("resetToken", token);
                ServletUtility.setErrorMessage(e.getMessage(), request);
            }
        }

        request.setAttribute("resetToken", token);
        ServletUtility.forward(CFSView.RESET_PASSWORD_VIEW, request, response);
        log.info("ResetPasswordCtl doPost Ended");
    }

    @Override
    protected String getView() {
        return CFSView.RESET_PASSWORD_VIEW;
    }
}
