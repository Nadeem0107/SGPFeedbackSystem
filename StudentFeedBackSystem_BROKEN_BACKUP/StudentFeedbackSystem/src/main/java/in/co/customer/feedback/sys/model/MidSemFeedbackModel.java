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

public class MidSemFeedbackModel {

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
        ArrayList<MidSemFeedbackBean> list = new ArrayList<MidSemFeedbackBean>();
        StringBuffer sql = new StringBuffer("select * from st_midsem_feedback");
        if (pageSize > 0) {
            pageNo = (pageNo - 1) * pageSize;
            sql.append(" limit " + pageNo + "," + pageSize);
        }
        Connection conn = null;
        try {
            conn = JDBCDataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                MidSemFeedbackBean bean = new MidSemFeedbackBean();
                bean.setId(rs.getLong(1));
                bean.setRegNo(rs.getString(2));
                bean.setStudentName(rs.getString(3));
                bean.setBranch(rs.getString(4));
                bean.setSemester(rs.getInt(5));
                bean.setFaculty(rs.getString(6));
                bean.setSubject(rs.getString(7));
                bean.setQ1(rs.getInt(8));
                bean.setQ2(rs.getInt(9));
                bean.setQ3(rs.getInt(10));
                bean.setQ4(rs.getInt(11));
                bean.setQ5(rs.getInt(12));
                bean.setQ6(rs.getInt(13));
                bean.setQ7(rs.getInt(14));
                bean.setQ8(rs.getInt(15));
                bean.setQ9(rs.getInt(16));
                bean.setQ10(rs.getInt(17));
                bean.setQ11(rs.getInt(18));
                bean.setQ12(rs.getInt(19));
                bean.setCreatedBy(rs.getString(20));
                bean.setModifiedBy(rs.getString(21));
                bean.setCreatedDatetime(rs.getTimestamp(22));
                bean.setModifiedDatetime(rs.getTimestamp(23));
                list.add(bean);
            }
            rs.close();
        } catch (Exception e) {
            throw new ApplicationException("Exception : Exception in getting list of MidSem Feedbacks");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        return list;
    }
}
