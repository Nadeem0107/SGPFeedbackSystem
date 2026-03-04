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
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.model.TeacherModel;
import in.co.customer.feedback.sys.util.DataUtility;
import in.co.customer.feedback.sys.util.PropertyReader;
import in.co.customer.feedback.sys.util.ServletUtility;

@WebServlet(name = "TeacherListCtl", urlPatterns = { "/ctl/teacherList" })
public class TeacherListCtl extends BaseCtl {
    private static final long serialVersionUID = 1L;
    private static Logger log = Logger.getLogger(TeacherListCtl.class);

    @Override
    protected BaseBean populateBean(HttpServletRequest request) {
        TeacherBean bean = new TeacherBean();
        bean.setName(DataUtility.getString(request.getParameter("name")));
        return bean;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int pageNo = 1;
        int pageSize = DataUtility.getInt(PropertyReader.getValue("page.size"));
        TeacherBean bean = (TeacherBean) populateBean(request);
        TeacherModel model = new TeacherModel();
        try {
            List list = model.search(bean, pageNo, pageSize);
            ServletUtility.setList(list, request);
            ServletUtility.setPageNo(pageNo, request);
            ServletUtility.setPageSize(pageSize, request);
            ServletUtility.forward(getView(), request, response);
        } catch (ApplicationException e) {
            ServletUtility.handleException(e, request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = DataUtility.getString(request.getParameter("operation"));
        int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
        int pageSize = DataUtility.getInt(request.getParameter("pageSize"));

        pageNo = (pageNo == 0) ? 1 : pageNo;
        pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader.getValue("page.size")) : pageSize;

        TeacherBean bean = (TeacherBean) populateBean(request);
        TeacherModel model = new TeacherModel();

        try {
            if (OP_SEARCH.equalsIgnoreCase(op)) {
                pageNo = 1;
            }
            List list = model.search(bean, pageNo, pageSize);
            ServletUtility.setList(list, request);
            ServletUtility.setPageNo(pageNo, request);
            ServletUtility.setPageSize(pageSize, request);
            ServletUtility.forward(getView(), request, response);
        } catch (ApplicationException e) {
            ServletUtility.handleException(e, request, response);
        }
    }

    @Override
    protected String getView() {
        return CFSView.TEACHER_LIST_VIEW;
    }
}
