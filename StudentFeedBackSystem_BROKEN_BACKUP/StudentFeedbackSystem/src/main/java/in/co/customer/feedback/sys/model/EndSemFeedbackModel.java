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

public class EndSemFeedbackModel {

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
        ArrayList<EndSemFeedbackBean> list = new ArrayList<EndSemFeedbackBean>();
        StringBuffer sql = new StringBuffer("select * from st_endsem_feedback");
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
                EndSemFeedbackBean bean = new EndSemFeedbackBean();
                bean.setId(rs.getLong(1));
                bean.setRegNo(rs.getString(2));
                bean.setStudentName(rs.getString(3));
                bean.setBranch(rs.getString(4));
                bean.setSemester(rs.getString(5));
                bean.setFaculty(rs.getString(6));
                bean.setSubject(rs.getString(7));
                bean.setA1(rs.getInt(8));
                bean.setA2(rs.getInt(9));
                bean.setA3(rs.getInt(10));
                bean.setA4(rs.getInt(11));
                bean.setA5(rs.getInt(12));
                bean.setA6(rs.getInt(13));
                bean.setA7(rs.getInt(14));
                bean.setB1(rs.getInt(15));
                bean.setB2(rs.getInt(16));
                bean.setB3(rs.getInt(17));
                bean.setB4(rs.getInt(18));
                bean.setB5(rs.getInt(19));
                bean.setB6(rs.getInt(20));
                bean.setB7(rs.getInt(21));
                bean.setB8(rs.getInt(22));
                bean.setB9(rs.getInt(23));
                bean.setC1(rs.getInt(24));
                bean.setC2(rs.getInt(25));
                bean.setC3(rs.getInt(26));
                bean.setC4(rs.getInt(27));
                bean.setC5(rs.getInt(28));
                bean.setC6(rs.getInt(29));
                bean.setCreatedBy(rs.getString(30));
                bean.setModifiedBy(rs.getString(31));
                bean.setCreatedDatetime(rs.getTimestamp(32));
                list.add(bean);
            }
            rs.close();
        } catch (Exception e) {
            throw new ApplicationException("Exception : Exception in getting list of EndSem Feedbacks");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        return list;
    }
}
