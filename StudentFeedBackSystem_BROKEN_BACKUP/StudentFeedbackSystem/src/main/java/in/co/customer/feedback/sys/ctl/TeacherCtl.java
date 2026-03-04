package in.co.customer.feedback.sys.ctl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.customer.feedback.sys.bean.BaseBean;
import in.co.customer.feedback.sys.bean.TeacherBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.exception.DuplicateRecordException;
import in.co.customer.feedback.sys.model.TeacherModel;
import in.co.customer.feedback.sys.util.DataUtility;
import in.co.customer.feedback.sys.util.DataValidator;
import in.co.customer.feedback.sys.util.PropertyReader;
import in.co.customer.feedback.sys.util.ServletUtility;

@WebServlet(name = "TeacherCtl", urlPatterns = { "/ctl/teacher" })
@MultipartConfig(maxFileSize = 16177216)
public class TeacherCtl extends BaseCtl {
	private static final long serialVersionUID = 1L;
	private static Logger log = Logger.getLogger(TeacherCtl.class);

	@Override
	protected boolean validate(HttpServletRequest request) {
		log.debug("ProductCtl validate method start");
		boolean pass = true;

		if (DataValidator.isNull(request.getParameter("name"))) {
			request.setAttribute("name", PropertyReader.getValue("error.require", "Name"));
			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("price"))) {
			request.setAttribute("price", PropertyReader.getValue("error.require", "Price"));
			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("description"))) {
			request.setAttribute("description", PropertyReader.getValue("error.require", "Description"));
			pass = false;
		}

		log.debug("ProductCtl validate method end");
		return pass;
	}

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
	protected BaseBean populateBean(HttpServletRequest request) {
		log.debug("ProductCtl populateBean method start");
		TeacherBean bean = new TeacherBean();
		bean.setId(DataUtility.getLong(request.getParameter("id")));
		bean.setName(DataUtility.getString(request.getParameter("name")));
		bean.setPrice(DataUtility.getString(request.getParameter("price")));
		bean.setDescription(DataUtility.getString(request.getParameter("description")));
		bean.setDeptId(DataUtility.getLong(request.getParameter("deptId")));
		bean.setSemester(DataUtility.getString(request.getParameter("semester")));
		populateDTO(bean, request);
		log.debug("ProductCtl populateBean method end");
		return bean;
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ProductCtl doGet started");
		log.debug("ProductCtl doGet method start");
		String op = DataUtility.getString(request.getParameter("operation"));
		TeacherModel model = new TeacherModel();
		long id = DataUtility.getLong(request.getParameter("id"));
		System.out.println("ID is: " + id);
		ServletUtility.setOpration("Add", request);
		if (id > 0) {
			TeacherBean bean;
			try {
				bean = model.findByPK(id);
				ServletUtility.setOpration("Edit", request);
				ServletUtility.setBean(bean, request);
			} catch (ApplicationException e) {
				System.out.println("Error in doGet findByPK: " + e.getMessage());
				ServletUtility.handleException(e, request, response);
				return;
			}
		}
		System.out.println("Forwarding to view: " + getView());
		ServletUtility.forward(getView(), request, response);
		log.debug("ProductCtl doGet method end");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.debug("ProductCtl doPost method start");
		String op = DataUtility.getString(request.getParameter("operation"));
		TeacherModel model = new TeacherModel();
		long id = DataUtility.getLong(request.getParameter("id"));

		TeacherBean bean = (TeacherBean) populateBean(request);

		try {
			if (OP_SAVE.equalsIgnoreCase(op)) {
				String imagePath = ServletUtility.subImage(request, response, bean.getName());
				if (imagePath != null && !imagePath.isEmpty()) {
					bean.setImage(imagePath);
				}

				if (id > 0) {
					model.update(bean);
					ServletUtility.setSuccessMessage("Data is successfully Updated", request);
				} else {
					long pk = model.add(bean);
					ServletUtility.setSuccessMessage("Data is successfully Saved", request);
				}
				ServletUtility.setBean(bean, request);
			} else if (OP_DELETE.equalsIgnoreCase(op)) {
				model.delete(bean);
				ServletUtility.redirect(CFSView.TEACHER_LIST_CTL, request, response);
				return;
			} else if (OP_CANCEL.equalsIgnoreCase(op)) {
				ServletUtility.redirect(CFSView.TEACHER_LIST_CTL, request, response);
				return;
			} else if (OP_RESET.equalsIgnoreCase(op)) {
				ServletUtility.redirect(CFSView.TEACHER_CTL, request, response);
				return;
			}
		} catch (DuplicateRecordException e) {
			ServletUtility.setBean(bean, request);
			ServletUtility.setErrorMessage(e.getMessage(), request);
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
			ServletUtility.handleException(e, request, response);
			return;
		}

		ServletUtility.forward(getView(), request, response);
		log.debug("ProductCtl doPost method end");
	}

	@Override
	protected String getView() {
		return CFSView.TEACHER_VIEW;
	}
}
