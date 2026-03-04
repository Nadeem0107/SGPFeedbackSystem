package in.co.customer.feedback.sys.ctl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.customer.feedback.sys.bean.BaseBean;
import in.co.customer.feedback.sys.bean.TeacherBean;
import in.co.customer.feedback.sys.bean.UserBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.model.TeacherModel;
import in.co.customer.feedback.sys.util.DataUtility;
import in.co.customer.feedback.sys.util.PropertyReader;
import in.co.customer.feedback.sys.util.ServletUtility;

@WebServlet(name = "TeachersListCtl", urlPatterns = { "/ctl/teachers" })
public class TeachersListCtl extends BaseCtl {
	private static Logger log = Logger.getLogger(TeachersListCtl.class);

	protected BaseBean populateBean(HttpServletRequest request) {
		log.debug("ProductListCtl populateBean method start");
		TeacherBean bean = new TeacherBean();

		bean.setName(DataUtility.getString(request.getParameter("name")));

		log.debug("ProductListCtl populateBean method end");
		return bean;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.debug("ProductListCtl doGet Start");
		List list = null;

		int pageNo = 1;

		int pageSize = DataUtility.getInt(PropertyReader.getValue("page.size"));

		TeacherBean bean = (TeacherBean) populateBean(request);

		String op = DataUtility.getString(request.getParameter("operation"));

		String[] ids = request.getParameterValues("ids");

		TeacherModel model = new TeacherModel();
		try {
			UserBean userBean = (UserBean) request.getSession().getAttribute("user");
			if (userBean != null && userBean.getRoleId() == 2) { // Student
				bean.setDeptId(userBean.getDeptId());
				bean.setSemester(userBean.getSemester());
			}
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
		log.debug("ProductListCtl doPOst End");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		log.debug("ProductListCtl doPost Start");

		List list = null;
		int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
		int pageSize = DataUtility.getInt(request.getParameter("pageSize"));

		pageNo = (pageNo == 0) ? 1 : pageNo;
		pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader.getValue("page.size")) : pageSize;

		TeacherBean bean = (TeacherBean) populateBean(request);

		String op = DataUtility.getString(request.getParameter("operation"));

		String[] ids = request.getParameterValues("ids");

		TeacherModel model = new TeacherModel();
		try {
			UserBean userBean = (UserBean) request.getSession().getAttribute("user");
			if (userBean != null && userBean.getRoleId() == 2) { // Student
				bean.setDeptId(userBean.getDeptId());
				bean.setSemester(userBean.getSemester());
			}

			if (OP_SEARCH.equalsIgnoreCase(op) || "Next".equalsIgnoreCase(op) || "Previous".equalsIgnoreCase(op)) {

				if (OP_SEARCH.equalsIgnoreCase(op)) {
					pageNo = 1;
				} else if (OP_NEXT.equalsIgnoreCase(op)) {
					pageNo++;
				} else if (OP_PREVIOUS.equalsIgnoreCase(op) && pageNo > 1) {
					pageNo--;
				}

			} else if (OP_RESET.equalsIgnoreCase(op)) {
				ServletUtility.redirect(CFSView.TEACHERS_LIST_CTL, request, response);
				return;

			}
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
		log.debug("ProductListCtl doGet End");

	}

	protected String getView() {
		return CFSView.TEACHERS_LIST_VIEW;
	}
}
