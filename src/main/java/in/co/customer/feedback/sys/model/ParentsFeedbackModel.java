package in.co.customer.feedback.sys.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import in.co.customer.feedback.sys.bean.ParentsFeedbackBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.exception.DatabaseException;
import in.co.customer.feedback.sys.exception.DuplicateRecordException;
import in.co.customer.feedback.sys.util.JDBCDataSource;

public class ParentsFeedbackModel {
    private static Logger log = Logger.getLogger(ParentsFeedbackModel.class.getName());

    public Integer nextPK() throws DatabaseException {
        log.info("Model nextPK Started");
        Connection conn = null;
        int pk = 0;
        try {
            conn = JDBCDataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(ID) FROM parents_feedback");
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

    public long add(ParentsFeedbackBean bean) throws ApplicationException, DuplicateRecordException {
        Connection conn = null;
        int pk = 0;
        try {
            conn = JDBCDataSource.getConnection();
            pk = nextPK();
            conn.setAutoCommit(false);
            PreparedStatement pstmt = conn
                    .prepareStatement("INSERT INTO parents_feedback VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setInt(1, pk);
            pstmt.setString(2, bean.getStudentName());
            pstmt.setString(3, bean.getProgram());
            pstmt.setString(4, bean.getAcademicYear());
            pstmt.setInt(5, bean.getQ1());
            pstmt.setInt(6, bean.getQ2());
            pstmt.setInt(7, bean.getQ3());
            pstmt.setInt(8, bean.getQ4());
            pstmt.setInt(9, bean.getQ5());
            pstmt.setString(10, bean.getCreatedBy());
            pstmt.setString(11, bean.getModifiedBy());
            pstmt.setTimestamp(12, bean.getCreatedDatetime());
            pstmt.setTimestamp(13, bean.getModifiedDatetime());
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
            throw new ApplicationException("Exception : Exception in add ParentsFeedback");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        return pk;
    }

    public ParentsFeedbackBean findByPK(long pk) throws ApplicationException {
        log.info("Model findByPK Started");
        StringBuffer sql = new StringBuffer("SELECT * FROM parents_feedback WHERE ID=?");
        ParentsFeedbackBean bean = null;
        Connection conn = null;
        try {
            conn = JDBCDataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
            pstmt.setLong(1, pk);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                bean = new ParentsFeedbackBean();
                bean.setId(rs.getLong(1));
                bean.setStudentName(rs.getString(2));
                bean.setProgram(rs.getString(3));
                bean.setAcademicYear(rs.getString(4));
                bean.setQ1(rs.getInt(5));
                bean.setQ2(rs.getInt(6));
                bean.setQ3(rs.getInt(7));
                bean.setQ4(rs.getInt(8));
                bean.setQ5(rs.getInt(9));
                bean.setCreatedBy(rs.getString(10));
                bean.setModifiedBy(rs.getString(11));
                bean.setCreatedDatetime(rs.getTimestamp(12));
                bean.setModifiedDatetime(rs.getTimestamp(13));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw new ApplicationException("Exception : Exception in getting ParentsFeedback by pk");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        log.info("Model findByPK End");
        return bean;
    }

    public List<ParentsFeedbackBean> search(ParentsFeedbackBean bean) throws ApplicationException {
        return search(bean, 0, 0);
    }

    public List<ParentsFeedbackBean> search(ParentsFeedbackBean bean, int pageNo, int pageSize)
            throws ApplicationException {
        log.info("Model search Started");
        StringBuffer sql = new StringBuffer("SELECT * FROM parents_feedback WHERE 1=1");
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
        ArrayList<ParentsFeedbackBean> list = new ArrayList<ParentsFeedbackBean>();
        Connection conn = null;
        try {
            conn = JDBCDataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                bean = new ParentsFeedbackBean();
                bean.setId(rs.getLong(1));
                bean.setStudentName(rs.getString(2));
                bean.setProgram(rs.getString(3));
                bean.setAcademicYear(rs.getString(4));
                bean.setQ1(rs.getInt(5));
                bean.setQ2(rs.getInt(6));
                bean.setQ3(rs.getInt(7));
                bean.setQ4(rs.getInt(8));
                bean.setQ5(rs.getInt(9));
                bean.setCreatedBy(rs.getString(10));
                bean.setModifiedBy(rs.getString(11));
                bean.setCreatedDatetime(rs.getTimestamp(12));
                bean.setModifiedDatetime(rs.getTimestamp(13));
                list.add(bean);
            }
            rs.close();
        } catch (Exception e) {
            throw new ApplicationException("Exception : Exception in search ParentsFeedback");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        log.info("Model search End");
        return list;
    }

    public List<ParentsFeedbackBean> list() throws ApplicationException {
        return list(0, 0);
    }

    public List<ParentsFeedbackBean> list(int pageNo, int pageSize) throws ApplicationException {
        log.info("Model list Started");
        ArrayList<ParentsFeedbackBean> list = new ArrayList<ParentsFeedbackBean>();
        StringBuffer sql = new StringBuffer("select * from parents_feedback");
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
                ParentsFeedbackBean bean = new ParentsFeedbackBean();
                bean.setId(rs.getLong(1));
                bean.setStudentName(rs.getString(2));
                bean.setProgram(rs.getString(3));
                bean.setAcademicYear(rs.getString(4));
                bean.setQ1(rs.getInt(5));
                bean.setQ2(rs.getInt(6));
                bean.setQ3(rs.getInt(7));
                bean.setQ4(rs.getInt(8));
                bean.setQ5(rs.getInt(9));
                bean.setCreatedBy(rs.getString(10));
                bean.setModifiedBy(rs.getString(11));
                bean.setCreatedDatetime(rs.getTimestamp(12));
                bean.setModifiedDatetime(rs.getTimestamp(13));
                list.add(bean);
            }
            rs.close();
        } catch (Exception e) {
            throw new ApplicationException("Exception : Exception in getting list of ParentsFeedback");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        log.info("Model list End");
        return list;
    }
}
