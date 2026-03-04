package in.co.customer.feedback.sys.ctl;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.log4j.Logger;

import in.co.customer.feedback.sys.bean.BaseBean;
import in.co.customer.feedback.sys.bean.FeedbackBean;
import in.co.customer.feedback.sys.bean.TeacherBean;
import in.co.customer.feedback.sys.bean.UserBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.exception.DuplicateRecordException;
import in.co.customer.feedback.sys.model.FeedbackModel;
import in.co.customer.feedback.sys.model.TeacherModel;
import in.co.customer.feedback.sys.util.DataUtility;
import in.co.customer.feedback.sys.util.DataValidator;
import in.co.customer.feedback.sys.util.PropertyReader;
import in.co.customer.feedback.sys.util.ServletUtility;

/**
 * Servlet implementation class TeacherDetailCtl
 */
@WebServlet(name = "TeacherDetailCtl", urlPatterns = { "/ctl/teacherDetail" })
public class TeacherDetailCtl extends BaseCtl {
	private static final long serialVersionUID = 1L;

	private static Logger log = Logger.getLogger(TeacherDetailCtl.class);

	/**
	 * Validate input Data Entered By User
	 * 
	 * @param request
	 * @return
	 */
	@Override
	protected boolean validate(HttpServletRequest request) {
		log.debug("ProductCtl validate method start");
		boolean pass = true;

		log.debug("ProductCtl validate method end");
		return pass;
	}

	@Override
	protected void preload(HttpServletRequest request) {

	}

	@Override
	protected BaseBean populateBean(HttpServletRequest request) {
		log.debug("ProductCtl populateBean method start");
		TeacherBean bean = new TeacherBean();
		bean.setId(DataUtility.getLong(request.getParameter("id")));
		bean.setDescription(DataUtility.getString(request.getParameter("description")));
		populateDTO(bean, request);
		log.debug("ProductCtl populateBean method end");
		return bean;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.debug("ProductCtl doGet method start");
		String op = DataUtility.getString(request.getParameter("operation"));
		HttpSession session = request.getSession();

		TeacherModel model = new TeacherModel();
		FeedbackModel fModel = new FeedbackModel();
		long pId = DataUtility.getLong(request.getParameter("pId"));
		long fId = DataUtility.getLong(request.getParameter("fId"));
		try {

			if (pId > 0) {
				TeacherBean pBean = model.findByPK(pId);
				session.setAttribute("pId", pId);
				request.setAttribute("pBean", pBean);
				if (fId > 0) {
					FeedbackBean fdBean = new FeedbackBean();
					fdBean.setId(fId);
					fModel.delete(fdBean);
				}
				FeedbackBean bean = new FeedbackBean();
				bean.setProductId(pId);
				ServletUtility.setList(fModel.search(bean), request);
			} else {
				ServletUtility.redirect(CFSView.TEACHERS_LIST_CTL, request, response);
				return;
			}

		} catch (ApplicationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ServletUtility.forward(getView(), request, response);
		log.debug("ProductCtl doGet method end");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.debug("ProductCtl doPost method start");
		String op = DataUtility.getString(request.getParameter("operation"));
		TeacherModel model = new TeacherModel();
		FeedbackModel fModel = new FeedbackModel();
		long id = DataUtility.getLong(request.getParameter("id"));
		HttpSession session = request.getSession();
		if (OP_SAVE.equalsIgnoreCase(op)) {
			TeacherBean bean = (TeacherBean) populateBean(request);
			try {
				UserBean uBean = (UserBean) session.getAttribute("user");
				long pId = DataUtility.getLong(String.valueOf(request.getSession().getAttribute("pId")));
				FeedbackBean fBean = new FeedbackBean();
				TeacherBean pBean = model.findByPK(pId);
				fBean.setProductId(pId);
				fBean.setProductName(pBean.getName());
				fBean.setUserId(uBean.getId());
				fBean.setUserName(uBean.getName());
				fBean.setFeedback(DataUtility.getString(request.getParameter("feedback")));
				fBean.setDate(new Date());
				long pk = fModel.add((FeedbackBean) populateDTO(fBean, request));
				ServletUtility.redirect(CFSView.TEACHER_DETAIL_CTL + "?pId=" + pId, request, response);
				return;
			} catch (ApplicationException e) {
				e.printStackTrace();
				ServletUtility.forward(CFSView.ERROR_VIEW, request, response);
				return;

			} catch (DuplicateRecordException e) {
				ServletUtility.setBean(bean, request);
				ServletUtility.setErrorMessage(e.getMessage(), request);
			}

		} else if (OP_DELETE.equalsIgnoreCase(op)) {
			TeacherBean bean = (TeacherBean) populateBean(request);
			try {
				model.delete(bean);
				ServletUtility.redirect(CFSView.TEACHER_LIST_CTL, request, response);
			} catch (ApplicationException e) {
				ServletUtility.handleException(e, request, response);
				e.printStackTrace();
			}
		} else if (OP_CANCEL.equalsIgnoreCase(op)) {
			ServletUtility.redirect(CFSView.TEACHER_LIST_CTL, request, response);
			return;
		} else if (OP_RESET.equalsIgnoreCase(op)) {
			ServletUtility.redirect(CFSView.TEACHER_CTL, request, response);
			return;
		}

		ServletUtility.forward(getView(), request, response);
		log.debug("ProductCtl doPost method end");
	}

	@Override
	protected String getView() {
		// TODO Auto-generated method stub
		return CFSView.TEACHER_DETAIL_VIEW;
	}

}
