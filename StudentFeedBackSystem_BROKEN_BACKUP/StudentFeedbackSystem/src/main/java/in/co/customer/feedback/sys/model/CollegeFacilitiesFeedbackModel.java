package in.co.customer.feedback.sys.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import in.co.customer.feedback.sys.bean.CollegeFacilitiesFeedbackBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.exception.DatabaseException;
import in.co.customer.feedback.sys.exception.DuplicateRecordException;
import in.co.customer.feedback.sys.util.JDBCDataSource;

public class CollegeFacilitiesFeedbackModel {
    private static Logger log = Logger.getLogger(CollegeFacilitiesFeedbackModel.class.getName());

    public Integer nextPK() throws DatabaseException {
        log.info("Model nextPK Started");
        Connection conn = null;
        int pk = 0;
        try {
            conn = JDBCDataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(ID) FROM college_facilities_feedback");
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
        log.info("Model nextPK End");
        return pk + 1;
    }

    public long add(CollegeFacilitiesFeedbackBean bean) throws ApplicationException, DuplicateRecordException {
        Connection conn = null;
        int pk = 0;
        try {
            conn = JDBCDataSource.getConnection();
            pk = nextPK();
            conn.setAutoCommit(false);
            PreparedStatement pstmt = conn.prepareStatement(
                    "INSERT INTO college_facilities_feedback VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setInt(1, pk);
            pstmt.setString(2, bean.getProgram());
            pstmt.setString(3, bean.getAcademicYear());
            pstmt.setString(4, bean.getStudentName());
            pstmt.setInt(5, bean.getQ1());
            pstmt.setInt(6, bean.getQ2());
            pstmt.setInt(7, bean.getQ3());
            pstmt.setInt(8, bean.getQ4());
            pstmt.setInt(9, bean.getQ5());
            pstmt.setInt(10, bean.getQ6());
            pstmt.setInt(11, bean.getQ7());
            pstmt.setInt(12, bean.getQ8());
            pstmt.setInt(13, bean.getQ9());
            pstmt.setInt(14, bean.getQ10());
            pstmt.setInt(15, bean.getQ11());
            pstmt.setInt(16, bean.getQ12());
            pstmt.setInt(17, bean.getQ13());
            pstmt.setInt(18, bean.getQ14());
            pstmt.setString(19, bean.getSignature());
            pstmt.setString(20, bean.getCreatedBy());
            pstmt.setString(21, bean.getModifiedBy());
            pstmt.setTimestamp(22, bean.getCreatedDatetime());
            pstmt.setTimestamp(23, bean.getModifiedDatetime());
            pstmt.executeUpdate();
            conn.commit();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conn.rollback();
            } catch (Exception ex) {
                ex.printStackTrace();
                throw new ApplicationException("Exception : add rollback exception " + ex.getMessage());
            }
            throw new ApplicationException("Exception : Exception in add CollegeFacilitiesFeedback");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        return pk;
    }

    public CollegeFacilitiesFeedbackBean findByPK(long pk) throws ApplicationException {
        log.info("Model findByPK Started");
        StringBuffer sql = new StringBuffer("SELECT * FROM college_facilities_feedback WHERE ID=?");
        CollegeFacilitiesFeedbackBean bean = null;
        Connection conn = null;
        try {
            conn = JDBCDataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
            pstmt.setLong(1, pk);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                bean = new CollegeFacilitiesFeedbackBean();
                bean.setId(rs.getLong(1));
                bean.setProgram(rs.getString(2));
                bean.setAcademicYear(rs.getString(3));
                bean.setStudentName(rs.getString(4));
                bean.setQ1(rs.getInt(5));
                bean.setQ2(rs.getInt(6));
                bean.setQ3(rs.getInt(7));
                bean.setQ4(rs.getInt(8));
                bean.setQ5(rs.getInt(9));
                bean.setQ6(rs.getInt(10));
                bean.setQ7(rs.getInt(11));
                bean.setQ8(rs.getInt(12));
                bean.setQ9(rs.getInt(13));
                bean.setQ10(rs.getInt(14));
                bean.setQ11(rs.getInt(15));
                bean.setQ12(rs.getInt(16));
                bean.setQ13(rs.getInt(17));
                bean.setQ14(rs.getInt(18));
                bean.setSignature(rs.getString(19));
                bean.setCreatedBy(rs.getString(20));
                bean.setModifiedBy(rs.getString(21));
                bean.setCreatedDatetime(rs.getTimestamp(22));
                bean.setModifiedDatetime(rs.getTimestamp(23));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw new ApplicationException("Exception : Exception in getting CollegeFacilitiesFeedback by pk");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        log.info("Model findByPK End");
        return bean;
    }

    public List<CollegeFacilitiesFeedbackBean> search(CollegeFacilitiesFeedbackBean bean) throws ApplicationException {
        return search(bean, 0, 0);
    }

    public List<CollegeFacilitiesFeedbackBean> search(CollegeFacilitiesFeedbackBean bean, int pageNo, int pageSize)
            throws ApplicationException {
        log.info("Model search Started");
        StringBuffer sql = new StringBuffer("SELECT * FROM college_facilities_feedback WHERE 1=1");
        if (bean != null) {
            if (bean.getId() > 0) {
                sql.append(" AND id = " + bean.getId());
            }
            if (bean.getStudentName() != null && bean.getStudentName().length() > 0) {
                sql.append(" AND studentName like '" + bean.getStudentName() + "%'");
            }
        }
        if (pageSize > 0) {
            pageNo = (pageNo - 1) * pageSize;
            sql.append(" Limit " + pageNo + ", " + pageSize);
        }
        ArrayList<CollegeFacilitiesFeedbackBean> list = new ArrayList<CollegeFacilitiesFeedbackBean>();
        Connection conn = null;
        try {
            conn = JDBCDataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                bean = new CollegeFacilitiesFeedbackBean();
                bean.setId(rs.getLong(1));
                bean.setProgram(rs.getString(2));
                bean.setAcademicYear(rs.getString(3));
                bean.setStudentName(rs.getString(4));
                bean.setQ1(rs.getInt(5));
                bean.setQ2(rs.getInt(6));
                bean.setQ3(rs.getInt(7));
                bean.setQ4(rs.getInt(8));
                bean.setQ5(rs.getInt(9));
                bean.setQ6(rs.getInt(10));
                bean.setQ7(rs.getInt(11));
                bean.setQ8(rs.getInt(12));
                bean.setQ9(rs.getInt(13));
                bean.setQ10(rs.getInt(14));
                bean.setQ11(rs.getInt(15));
                bean.setQ12(rs.getInt(16));
                bean.setQ13(rs.getInt(17));
                bean.setQ14(rs.getInt(18));
                bean.setSignature(rs.getString(19));
                bean.setCreatedBy(rs.getString(20));
                bean.setModifiedBy(rs.getString(21));
                bean.setCreatedDatetime(rs.getTimestamp(22));
                bean.setModifiedDatetime(rs.getTimestamp(23));
                list.add(bean);
            }
            rs.close();
        } catch (Exception e) {
            throw new ApplicationException("Exception : Exception in search CollegeFacilitiesFeedback");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        log.info("Model search End");
        return list;
    }

    public List<CollegeFacilitiesFeedbackBean> list() throws ApplicationException {
        return list(0, 0);
    }

    public List<CollegeFacilitiesFeedbackBean> list(int pageNo, int pageSize) throws ApplicationException {
        log.info("Model list Started");
        ArrayList<CollegeFacilitiesFeedbackBean> list = new ArrayList<CollegeFacilitiesFeedbackBean>();
        StringBuffer sql = new StringBuffer("select * from college_facilities_feedback");
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
                CollegeFacilitiesFeedbackBean bean = new CollegeFacilitiesFeedbackBean();
                bean.setId(rs.getLong(1));
                bean.setProgram(rs.getString(2));
                bean.setAcademicYear(rs.getString(3));
                bean.setStudentName(rs.getString(4));
                bean.setQ1(rs.getInt(5));
                bean.setQ2(rs.getInt(6));
                bean.setQ3(rs.getInt(7));
                bean.setQ4(rs.getInt(8));
                bean.setQ5(rs.getInt(9));
                bean.setQ6(rs.getInt(10));
                bean.setQ7(rs.getInt(11));
                bean.setQ8(rs.getInt(12));
                bean.setQ9(rs.getInt(13));
                bean.setQ10(rs.getInt(14));
                bean.setQ11(rs.getInt(15));
                bean.setQ12(rs.getInt(16));
                bean.setQ13(rs.getInt(17));
                bean.setQ14(rs.getInt(18));
                bean.setSignature(rs.getString(19));
                bean.setCreatedBy(rs.getString(20));
                bean.setModifiedBy(rs.getString(21));
                bean.setCreatedDatetime(rs.getTimestamp(22));
                bean.setModifiedDatetime(rs.getTimestamp(23));
                list.add(bean);
            }
            rs.close();
        } catch (Exception e) {
            throw new ApplicationException("Exception : Exception in getting list of CollegeFacilitiesFeedback");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        log.info("Model list End");
        return list;
    }
}
