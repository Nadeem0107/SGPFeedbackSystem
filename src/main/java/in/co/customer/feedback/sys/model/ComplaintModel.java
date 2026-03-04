package in.co.customer.feedback.sys.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import in.co.customer.feedback.sys.bean.ComplaintBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.exception.DatabaseException;
import in.co.customer.feedback.sys.exception.DuplicateRecordException;
import in.co.customer.feedback.sys.util.JDBCDataSource;

public class ComplaintModel {
    private static Logger log = Logger.getLogger(ComplaintModel.class.getName());

    public Integer nextPK() throws DatabaseException {
        log.info("Model nextPK Started");
        Connection conn = null;
        int pk = 0;
        try {
            conn = JDBCDataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(ID) FROM complaint");
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

    public long add(ComplaintBean bean) throws ApplicationException, DuplicateRecordException {
        Connection conn = null;
        int pk = 0;
        try {
            conn = JDBCDataSource.getConnection();
            pk = nextPK();
            conn.setAutoCommit(false);
            PreparedStatement pstmt = conn.prepareStatement(
                    "INSERT INTO complaint VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setInt(1, pk);
            pstmt.setString(2, bean.getProgram());
            pstmt.setString(3, bean.getAcademicYear());
            pstmt.setString(4, bean.getComplaintType());
            pstmt.setString(5, bean.getSubject());
            pstmt.setString(6, bean.getDescription());
            pstmt.setString(7, bean.getPriority());
            pstmt.setString(8, bean.getStatus());
            pstmt.setString(9, bean.getTargetRole());
            pstmt.setString(10, bean.getTargetDepartment());
            pstmt.setString(11, bean.getCreatedBy());
            pstmt.setString(12, bean.getModifiedBy());
            pstmt.setTimestamp(13, bean.getCreatedDatetime());
            pstmt.setTimestamp(14, bean.getModifiedDatetime());
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
            throw new ApplicationException("Exception : Exception in add Complaint");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        return pk;
    }

    public ComplaintBean findByPK(long pk) throws ApplicationException {
        log.info("Model findByPK Started");
        StringBuffer sql = new StringBuffer("SELECT * FROM complaint WHERE ID=?");
        ComplaintBean bean = null;
        Connection conn = null;
        try {
            conn = JDBCDataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
            pstmt.setLong(1, pk);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                bean = new ComplaintBean();
                bean.setId(rs.getLong(1));
                bean.setProgram(rs.getString(2));
                bean.setAcademicYear(rs.getString(3));
                bean.setComplaintType(rs.getString(4));
                bean.setSubject(rs.getString(5));
                bean.setDescription(rs.getString(6));
                bean.setPriority(rs.getString(7));
                bean.setStatus(rs.getString(8));
                bean.setTargetRole(rs.getString(9));
                bean.setTargetDepartment(rs.getString(10));
                bean.setCreatedBy(rs.getString(11));
                bean.setModifiedBy(rs.getString(12));
                bean.setCreatedDatetime(rs.getTimestamp(13));
                bean.setModifiedDatetime(rs.getTimestamp(14));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw new ApplicationException("Exception : Exception in getting Complaint by pk");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        log.info("Model findByPK End");
        return bean;
    }

    public List<ComplaintBean> search(ComplaintBean bean) throws ApplicationException {
        return search(bean, 0, 0);
    }

    public List<ComplaintBean> search(ComplaintBean bean, int pageNo, int pageSize)
            throws ApplicationException {
        log.info("Model search Started");
        StringBuffer sql = new StringBuffer("SELECT * FROM complaint WHERE 1=1");
        if (bean != null) {
            if (bean.getId() > 0) {
                sql.append(" AND id = " + bean.getId());
            }
            if (bean.getSubject() != null && bean.getSubject().length() > 0) {
                sql.append(" AND subject like '" + bean.getSubject() + "%'");
            }
            if (bean.getComplaintType() != null && bean.getComplaintType().length() > 0) {
                sql.append(" AND complaintType = '" + bean.getComplaintType() + "'");
            }
            if (bean.getStatus() != null && bean.getStatus().length() > 0) {
                sql.append(" AND status = '" + bean.getStatus() + "'");
            }
            if (bean.getTargetRole() != null && bean.getTargetRole().length() > 0) {
                // Modified logic: If searching for a specific role, also include 'All' and
                // legacy complaints (NULL)
                if ("Principal".equalsIgnoreCase(bean.getTargetRole())
                        || "HOD".equalsIgnoreCase(bean.getTargetRole())) {
                    sql.append(" AND (targetRole = '" + bean.getTargetRole()
                            + "' OR targetRole = 'All' OR targetRole IS NULL OR targetRole = '')");
                } else {
                    sql.append(" AND targetRole = '" + bean.getTargetRole() + "'");
                }
            }
            if (bean.getTargetDepartment() != null && bean.getTargetDepartment().length() > 0) {
                sql.append(" AND targetDepartment = '" + bean.getTargetDepartment() + "'");
            }
            if (bean.getCreatedBy() != null && bean.getCreatedBy().length() > 0) {
                sql.append(" AND createdBy = '" + bean.getCreatedBy() + "'");
            }
        }
        sql.append(" ORDER BY createdDatetime DESC");
        if (pageSize > 0) {
            pageNo = (pageNo - 1) * pageSize;
            sql.append(" Limit " + pageNo + ", " + pageSize);
        }
        ArrayList<ComplaintBean> list = new ArrayList<ComplaintBean>();
        Connection conn = null;
        try {
            conn = JDBCDataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                bean = new ComplaintBean();
                bean.setId(rs.getLong(1));
                bean.setProgram(rs.getString(2));
                bean.setAcademicYear(rs.getString(3));
                bean.setComplaintType(rs.getString(4));
                bean.setSubject(rs.getString(5));
                bean.setDescription(rs.getString(6));
                bean.setPriority(rs.getString(7));
                bean.setStatus(rs.getString(8));
                bean.setTargetRole(rs.getString(9));
                bean.setTargetDepartment(rs.getString(10));
                bean.setCreatedBy(rs.getString(11));
                bean.setModifiedBy(rs.getString(12));
                bean.setCreatedDatetime(rs.getTimestamp(13));
                bean.setModifiedDatetime(rs.getTimestamp(14));
                list.add(bean);
            }
            rs.close();
        } catch (Exception e) {
            throw new ApplicationException("Exception : Exception in search Complaint");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        log.info("Model search End");
        return list;
    }

    public List<ComplaintBean> list() throws ApplicationException {
        return list(0, 0);
    }

    public List<ComplaintBean> list(int pageNo, int pageSize) throws ApplicationException {
        log.info("Model list Started");
        ArrayList<ComplaintBean> list = new ArrayList<ComplaintBean>();
        StringBuffer sql = new StringBuffer("select * from complaint ORDER BY createdDatetime DESC");
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
                ComplaintBean bean = new ComplaintBean();
                bean.setId(rs.getLong(1));
                bean.setProgram(rs.getString(2));
                bean.setAcademicYear(rs.getString(3));
                bean.setComplaintType(rs.getString(4));
                bean.setSubject(rs.getString(5));
                bean.setDescription(rs.getString(6));
                bean.setPriority(rs.getString(7));
                bean.setStatus(rs.getString(8));
                bean.setTargetRole(rs.getString(9));
                bean.setTargetDepartment(rs.getString(10));
                bean.setCreatedBy(rs.getString(11));
                bean.setModifiedBy(rs.getString(12));
                bean.setCreatedDatetime(rs.getTimestamp(13));
                bean.setModifiedDatetime(rs.getTimestamp(14));
                list.add(bean);
            }
            rs.close();
        } catch (Exception e) {
            throw new ApplicationException("Exception : Exception in getting list of Complaint");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        log.info("Model list End");
        return list;
    }

    public void updateStatus(long id, String status) throws ApplicationException {
        log.info("Model updateStatus Started");
        Connection conn = null;
        try {
            conn = JDBCDataSource.getConnection();
            conn.setAutoCommit(false);
            PreparedStatement pstmt = conn.prepareStatement("UPDATE complaint SET status=? WHERE id=?");
            pstmt.setString(1, status);
            pstmt.setLong(2, id);
            pstmt.executeUpdate();
            conn.commit();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conn.rollback();
            } catch (Exception ex) {
                ex.printStackTrace();
                throw new ApplicationException("Exception : update status rollback exception " + ex.getMessage());
            }
            throw new ApplicationException("Exception : Exception in updating complaint status");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        log.info("Model updateStatus End");
    }
}
