package in.co.customer.feedback.sys.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import in.co.customer.feedback.sys.bean.EndSemFeedbackBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.exception.DatabaseException;
import in.co.customer.feedback.sys.util.JDBCDataSource;

import java.util.logging.Logger;

public class EndSemFeedbackModel {

    private static Logger log = Logger.getLogger(EndSemFeedbackModel.class.getName());

    public Integer nextPK() throws DatabaseException {
        Connection conn = null;
        int pk = 0;
        try {
            conn = JDBCDataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(ID) FROM st_endsem_feedback");
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

    public long add(EndSemFeedbackBean bean) throws ApplicationException {
        Connection conn = null;
        int pk = 0;
        try {
            conn = JDBCDataSource.getConnection();
            pk = nextPK();
            conn.setAutoCommit(false);
            PreparedStatement pstmt = conn.prepareStatement(
                    "INSERT INTO st_endsem_feedback VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setLong(1, pk);
            pstmt.setString(2, bean.getRegNo());
            pstmt.setString(3, bean.getStudentName());
            pstmt.setString(4, bean.getBranch());
            pstmt.setString(5, bean.getSemester());
            pstmt.setString(6, bean.getFaculty());
            pstmt.setString(7, bean.getSubject());
            pstmt.setInt(8, bean.getA1());
            pstmt.setInt(9, bean.getA2());
            pstmt.setInt(10, bean.getA3());
            pstmt.setInt(11, bean.getA4());
            pstmt.setInt(12, bean.getA5());
            pstmt.setInt(13, bean.getA6());
            pstmt.setInt(14, bean.getA7());
            pstmt.setInt(15, bean.getB1());
            pstmt.setInt(16, bean.getB2());
            pstmt.setInt(17, bean.getB3());
            pstmt.setInt(18, bean.getB4());
            pstmt.setInt(19, bean.getB5());
            pstmt.setInt(20, bean.getB6());
            pstmt.setInt(21, bean.getB7());
            pstmt.setInt(22, bean.getB8());
            pstmt.setInt(23, bean.getB9());
            pstmt.setInt(24, bean.getC1());
            pstmt.setInt(25, bean.getC2());
            pstmt.setInt(26, bean.getC3());
            pstmt.setInt(27, bean.getC4());
            pstmt.setInt(28, bean.getC5());
            pstmt.setInt(29, bean.getC6());
            pstmt.setString(30, bean.getCreatedBy());
            pstmt.setString(31, bean.getModifiedBy());
            pstmt.setTimestamp(32, bean.getCreatedDatetime());
            pstmt.setTimestamp(33, bean.getCreatedDatetime()); // Use created as modified if null

            pstmt.executeUpdate();
            conn.commit();
            pstmt.close();
        } catch (Exception e) {
            try {
                conn.rollback();
            } catch (Exception ex) {
                throw new ApplicationException("Exception : add rollback exception " + ex.getMessage());
            }
            e.printStackTrace();
            throw new ApplicationException("Exception : Exception in add EndSem Feedback");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        return pk;
    }

    public List<EndSemFeedbackBean> list() throws ApplicationException {
        return list(0, 0);
    }

    public List<EndSemFeedbackBean> list(int pageNo, int pageSize) throws ApplicationException {
        return search(null, pageNo, pageSize);
    }

    public List<EndSemFeedbackBean> search(EndSemFeedbackBean bean) throws ApplicationException {
        return search(bean, 0, 0);
    }

    public List<EndSemFeedbackBean> search(EndSemFeedbackBean bean, int pageNo, int pageSize)
            throws ApplicationException {
        log.info("Model search Started");
        StringBuffer sql = new StringBuffer("SELECT * FROM st_endsem_feedback WHERE 1=1");
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
        ArrayList<EndSemFeedbackBean> list = new ArrayList<EndSemFeedbackBean>();
        Connection conn = null;
        try {
            conn = JDBCDataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                EndSemFeedbackBean modelBean = new EndSemFeedbackBean();
                modelBean.setId(rs.getLong(1));
                modelBean.setRegNo(rs.getString(2));
                modelBean.setStudentName(rs.getString(3));
                modelBean.setBranch(rs.getString(4));
                modelBean.setSemester(rs.getString(5));
                modelBean.setFaculty(rs.getString(6));
                modelBean.setSubject(rs.getString(7));
                modelBean.setA1(rs.getInt(8));
                modelBean.setA2(rs.getInt(9));
                modelBean.setA3(rs.getInt(10));
                modelBean.setA4(rs.getInt(11));
                modelBean.setA5(rs.getInt(12));
                modelBean.setA6(rs.getInt(13));
                modelBean.setA7(rs.getInt(14));
                modelBean.setB1(rs.getInt(15));
                modelBean.setB2(rs.getInt(16));
                modelBean.setB3(rs.getInt(17));
                modelBean.setB4(rs.getInt(18));
                modelBean.setB5(rs.getInt(19));
                modelBean.setB6(rs.getInt(20));
                modelBean.setB7(rs.getInt(21));
                modelBean.setB8(rs.getInt(22));
                modelBean.setB9(rs.getInt(23));
                modelBean.setC1(rs.getInt(24));
                modelBean.setC2(rs.getInt(25));
                modelBean.setC3(rs.getInt(26));
                modelBean.setC4(rs.getInt(27));
                modelBean.setC5(rs.getInt(28));
                modelBean.setC6(rs.getInt(29));
                modelBean.setCreatedBy(rs.getString(30));
                modelBean.setModifiedBy(rs.getString(31));
                modelBean.setCreatedDatetime(rs.getTimestamp(32));
                list.add(modelBean);
            }
            rs.close();
        } catch (Exception e) {
            throw new ApplicationException("Exception : Exception in search EndSem Feedback");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        log.info("Model search End");
        return list;
    }
}
