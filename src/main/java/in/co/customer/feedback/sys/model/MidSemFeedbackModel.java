package in.co.customer.feedback.sys.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import in.co.customer.feedback.sys.bean.MidSemFeedbackBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.exception.DatabaseException;
import in.co.customer.feedback.sys.util.JDBCDataSource;

import java.util.logging.Logger;

public class MidSemFeedbackModel {

    private static Logger log = Logger.getLogger(MidSemFeedbackModel.class.getName());

    public Integer nextPK() throws DatabaseException {
        Connection conn = null;
        int pk = 0;
        try {
            conn = JDBCDataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(ID) FROM st_midsem_feedback");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                pk = rs.getInt(1);
            }
            rs.close();
        } catch (Exception e) {
            throw new DatabaseException("Exception : Exception in getting PK");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        return pk + 1;
    }

    public long add(MidSemFeedbackBean bean) throws ApplicationException {
        Connection conn = null;
        int pk = 0;
        try {
            conn = JDBCDataSource.getConnection();
            pk = nextPK();
            conn.setAutoCommit(false);
            PreparedStatement pstmt = conn.prepareStatement(
                    "INSERT INTO st_midsem_feedback VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setLong(1, pk);
            pstmt.setString(2, bean.getRegNo());
            pstmt.setString(3, bean.getStudentName());
            pstmt.setString(4, bean.getBranch());
            pstmt.setInt(5, bean.getSemester());
            pstmt.setString(6, bean.getFaculty());
            pstmt.setString(7, bean.getSubject());
            pstmt.setInt(8, bean.getQ1());
            pstmt.setInt(9, bean.getQ2());
            pstmt.setInt(10, bean.getQ3());
            pstmt.setInt(11, bean.getQ4());
            pstmt.setInt(12, bean.getQ5());
            pstmt.setInt(13, bean.getQ6());
            pstmt.setInt(14, bean.getQ7());
            pstmt.setInt(15, bean.getQ8());
            pstmt.setInt(16, bean.getQ9());
            pstmt.setInt(17, bean.getQ10());
            pstmt.setInt(18, bean.getQ11());
            pstmt.setInt(19, bean.getQ12());
            pstmt.setString(20, bean.getCreatedBy());
            pstmt.setString(21, bean.getModifiedBy());
            pstmt.setTimestamp(22, bean.getCreatedDatetime());
            pstmt.setTimestamp(23, bean.getModifiedDatetime());

            pstmt.executeUpdate();
            conn.commit();
            pstmt.close();
        } catch (Exception e) {
            try {
                conn.rollback();
            } catch (Exception ex) {
                throw new ApplicationException("Exception : add rollback exception " + ex.getMessage());
            }
            throw new ApplicationException("Exception : Exception in add MidSem Feedback");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        return pk;
    }

    public List<MidSemFeedbackBean> list() throws ApplicationException {
        return list(0, 0);
    }

    public List<MidSemFeedbackBean> list(int pageNo, int pageSize) throws ApplicationException {
        return search(null, pageNo, pageSize);
    }

    public List<MidSemFeedbackBean> search(MidSemFeedbackBean bean) throws ApplicationException {
        return search(bean, 0, 0);
    }

    public List<MidSemFeedbackBean> search(MidSemFeedbackBean bean, int pageNo, int pageSize)
            throws ApplicationException {
        log.info("Model search Started");
        StringBuffer sql = new StringBuffer("SELECT * FROM st_midsem_feedback WHERE 1=1");
        if (bean != null) {
            if (bean.getRegNo() != null && bean.getRegNo().length() > 0) {
                sql.append(" AND REG_NO like '" + bean.getRegNo() + "%'");
            }
            if (bean.getStudentName() != null && bean.getStudentName().length() > 0) {
                sql.append(" AND STUDENT_NAME like '" + bean.getStudentName() + "%'");
            }
        }
        if (pageSize > 0) {
            pageNo = (pageNo - 1) * pageSize;
            sql.append(" Limit " + pageNo + ", " + pageSize);
        }
        ArrayList<MidSemFeedbackBean> list = new ArrayList<MidSemFeedbackBean>();
        Connection conn = null;
        try {
            conn = JDBCDataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                MidSemFeedbackBean modelBean = new MidSemFeedbackBean();
                modelBean.setId(rs.getLong(1));
                modelBean.setRegNo(rs.getString(2));
                modelBean.setStudentName(rs.getString(3));
                modelBean.setBranch(rs.getString(4));
                modelBean.setSemester(rs.getInt(5));
                modelBean.setFaculty(rs.getString(6));
                modelBean.setSubject(rs.getString(7));
                modelBean.setQ1(rs.getInt(8));
                modelBean.setQ2(rs.getInt(9));
                modelBean.setQ3(rs.getInt(10));
                modelBean.setQ4(rs.getInt(11));
                modelBean.setQ5(rs.getInt(12));
                modelBean.setQ6(rs.getInt(13));
                modelBean.setQ7(rs.getInt(14));
                modelBean.setQ8(rs.getInt(15));
                modelBean.setQ9(rs.getInt(16));
                modelBean.setQ10(rs.getInt(17));
                modelBean.setQ11(rs.getInt(18));
                modelBean.setQ12(rs.getInt(19));
                modelBean.setCreatedBy(rs.getString(20));
                modelBean.setModifiedBy(rs.getString(21));
                modelBean.setCreatedDatetime(rs.getTimestamp(22));
                modelBean.setModifiedDatetime(rs.getTimestamp(23));
                list.add(modelBean);
            }
            rs.close();
        } catch (Exception e) {
            throw new ApplicationException("Exception : Exception in search MidSem Feedback");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        log.info("Model search End");
        return list;
    }
}
