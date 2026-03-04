package in.co.customer.feedback.sys.ctl;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import in.co.customer.feedback.sys.util.ServletUtility;
import in.co.customer.feedback.sys.bean.UserBean;
import java.util.Arrays;
import java.util.List;
import java.util.ArrayList;

/**
 * Servlet Filter implementation class FrontController
 */
/**
 * Main Controller performs session checking and logging operations before
 * calling any application controller.It prevents any user to access
 * application without login.
 * 
 */
@WebFilter(filterName = "FrontCtl", urlPatterns = { "/ctl/*", "/doc/*" })
public class FrontController implements Filter {

	private static Logger log = Logger.getLogger(FrontController.class);

	public void destroy() {

	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		log.debug("FrontController doFilter method start");

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		HttpSession session = request.getSession(true);

		if (session.getAttribute("user") == null) {

			ServletUtility.setErrorMessage("Your session has been expired. Please re-Login.", request);

			String hitUri = request.getRequestURI();

			req.setAttribute("uri", hitUri);

			ServletUtility.forward("/login", request, response);

		} else {
			UserBean userBean = (UserBean) session.getAttribute("user");
			String uri = request.getServletPath();
			long roleId = userBean.getRoleId();

			boolean allowed = false;
			if (roleId == 1) { // Principal
				allowed = true;
			} else if (roleId == 2) { // Student
				List<String> studentUris = Arrays.asList("/welcome", "/ctl/teachers", "/ctl/teacherDetail",
						"/ctl/teacherFeedback",
						"/ctl/midSemFeedback", "/ctl/endSemFeedback", "/ctl/courseEndFeedback",
						"/ctl/collegeFacilitiesFeedback", "/ctl/parentsFeedback", "/ctl/complaint", "/ctl/myProfile",
						"/ctl/changePassword");
				if (studentUris.contains(uri)) {
					allowed = true;
				}
			} else if (roleId == 3) { // HOD
				List<String> hodUris = Arrays.asList("/welcome", "/ctl/userList", "/ctl/teacherList",
						"/ctl/teacherFeedbackList",
						"/ctl/midSemFeedbackList", "/ctl/endSemFeedbackList", "/ctl/courseEndFeedbackList",
						"/ctl/collegeFacilitiesFeedbackList", "/ctl/parentsFeedbackList", "/ctl/complaintList",
						"/ctl/myProfile", "/ctl/changePassword", "/ctl/user");
				if (hodUris.contains(uri)) {
					allowed = true;
				}
			} else if (roleId == 4) { // Faculty
				List<String> facultyUris = Arrays.asList("/welcome", "/ctl/teacherFeedbackList", "/ctl/myProfile",
						"/ctl/changePassword");
				if (facultyUris.contains(uri)) {
					allowed = true;
				}
			}

			if (allowed) {
				chain.doFilter(req, resp);
			} else {
				ServletUtility.setErrorMessage("Access Denied: You do not have permission to access " + uri, request);
				ServletUtility.forward("/welcome", request, response);
			}
		}
		log.debug("FrontController doFilter method end");
	}

	public void init(FilterConfig conf) throws ServletException {
		// TODO Auto-generated method stub

	}

}
