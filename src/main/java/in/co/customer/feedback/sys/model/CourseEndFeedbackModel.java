package in.co.customer.feedback.sys.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import in.co.customer.feedback.sys.bean.CourseEndFeedbackBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.exception.DatabaseException;
import in.co.customer.feedback.sys.exception.DuplicateRecordException;
import in.co.customer.feedback.sys.util.JDBCDataSource;

public class CourseEndFeedbackModel {
    private static Logger log = Logger.getLogger(CourseEndFeedbackModel.class.getName());

    public Integer nextPK() throws DatabaseException {
        log.info("Model nextPK Started");
        Connection conn = null;
        int pk = 0;
        try {
            conn = JDBCDataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(ID) FROM course_end_feedback");
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

    public long add(CourseEndFeedbackBean bean) throws ApplicationException, DuplicateRecordException {
        Connection conn = null;
        int pk = 0;
        try {
            conn = JDBCDataSource.getConnection();
            pk = nextPK();
            conn.setAutoCommit(false);
            PreparedStatement pstmt = conn.prepareStatement(
                    "INSERT INTO course_end_feedback VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setInt(1, pk);
            pstmt.setString(2, bean.getCoordinator());
            pstmt.setString(3, bean.getSem());
            pstmt.setString(4, bean.getSec());
            pstmt.setString(5, bean.getProgram());
            pstmt.setString(6, bean.getCourseName());
            pstmt.setString(7, bean.getCourseCode());
            pstmt.setString(8, bean.getAcademicYear());
            pstmt.setString(9, bean.getRegNo());
            pstmt.setString(10, bean.getStudentName());
            pstmt.setInt(11, bean.getCo1());
            pstmt.setInt(12, bean.getCo2());
            pstmt.setInt(13, bean.getCo3());
            pstmt.setInt(14, bean.getCo4());
            pstmt.setInt(15, bean.getCo5());
            pstmt.setInt(16, bean.getCo6());
            pstmt.setString(17, bean.getCreatedBy());
            pstmt.setString(18, bean.getModifiedBy());
            pstmt.setTimestamp(19, bean.getCreatedDatetime());
            pstmt.setTimestamp(20, bean.getModifiedDatetime());
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
            throw new ApplicationException("Exception : Exception in add CourseEndFeedback");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        return pk;
    }

    public CourseEndFeedbackBean findByPK(long pk) throws ApplicationException {
        log.info("Model findByPK Started");
        StringBuffer sql = new StringBuffer("SELECT * FROM course_end_feedback WHERE ID=?");
        CourseEndFeedbackBean bean = null;
        Connection conn = null;
        try {
            conn = JDBCDataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
            pstmt.setLong(1, pk);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                bean = new CourseEndFeedbackBean();
                bean.setId(rs.getLong(1));
                bean.setCoordinator(rs.getString(2));
                bean.setSem(rs.getString(3));
                bean.setSec(rs.getString(4));
                bean.setProgram(rs.getString(5));
                bean.setCourseName(rs.getString(6));
                bean.setCourseCode(rs.getString(7));
                bean.setAcademicYear(rs.getString(8));
                bean.setRegNo(rs.getString(9));
                bean.setStudentName(rs.getString(10));
                bean.setCo1(rs.getInt(11));
                bean.setCo2(rs.getInt(12));
                bean.setCo3(rs.getInt(13));
                bean.setCo4(rs.getInt(14));
                bean.setCo5(rs.getInt(15));
                bean.setCo6(rs.getInt(16));
                bean.setCreatedBy(rs.getString(17));
                bean.setModifiedBy(rs.getString(18));
                bean.setCreatedDatetime(rs.getTimestamp(19));
                bean.setModifiedDatetime(rs.getTimestamp(20));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw new ApplicationException("Exception : Exception in getting CourseEndFeedback by pk");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        log.info("Model findByPK End");
        return bean;
    }

    public List<CourseEndFeedbackBean> search(CourseEndFeedbackBean bean) throws ApplicationException {
        return search(bean, 0, 0);
    }

    public List<CourseEndFeedbackBean> search(CourseEndFeedbackBean bean, int pageNo, int pageSize)
            throws ApplicationException {
        log.info("Model search Started");
        StringBuffer sql = new StringBuffer("SELECT * FROM course_end_feedback WHERE 1=1");
        if (bean != null) {
            if (bean.getId() > 0) {
                sql.append(" AND id = " + bean.getId());
            }
            if (bean.getStudentName() != null && bean.getStudentName().length() > 0) {
                sql.append(" AND studentName like '" + bean.getStudentName() + "%'");
            }
            if (bean.getCourseName() != null && bean.getCourseName().length() > 0) {
                sql.append(" AND courseName like '" + bean.getCourseName() + "%'");
            }
        }
        if (pageSize > 0) {
            pageNo = (pageNo - 1) * pageSize;
            sql.append(" Limit " + pageNo + ", " + pageSize);
        }
        ArrayList<CourseEndFeedbackBean> list = new ArrayList<CourseEndFeedbackBean>();
        Connection conn = null;
        try {
            conn = JDBCDataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                bean = new CourseEndFeedbackBean();
                bean.setId(rs.getLong(1));
                bean.setCoordinator(rs.getString(2));
                bean.setSem(rs.getString(3));
                bean.setSec(rs.getString(4));
                bean.setProgram(rs.getString(5));
                bean.setCourseName(rs.getString(6));
                bean.setCourseCode(rs.getString(7));
                bean.setAcademicYear(rs.getString(8));
                bean.setRegNo(rs.getString(9));
                bean.setStudentName(rs.getString(10));
                bean.setCo1(rs.getInt(11));
                bean.setCo2(rs.getInt(12));
                bean.setCo3(rs.getInt(13));
                bean.setCo4(rs.getInt(14));
                bean.setCo5(rs.getInt(15));
                bean.setCo6(rs.getInt(16));
                bean.setCreatedBy(rs.getString(17));
                bean.setModifiedBy(rs.getString(18));
                bean.setCreatedDatetime(rs.getTimestamp(19));
                bean.setModifiedDatetime(rs.getTimestamp(20));
                list.add(bean);
            }
            rs.close();
        } catch (Exception e) {
            throw new ApplicationException("Exception : Exception in search CourseEndFeedback");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        log.info("Model search End");
        return list;
    }

    public List<CourseEndFeedbackBean> list() throws ApplicationException {
        return list(0, 0);
    }

    public List<CourseEndFeedbackBean> list(int pageNo, int pageSize) throws ApplicationException {
        log.info("Model list Started");
        ArrayList<CourseEndFeedbackBean> list = new ArrayList<CourseEndFeedbackBean>();
        StringBuffer sql = new StringBuffer("select * from course_end_feedback");
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
                CourseEndFeedbackBean bean = new CourseEndFeedbackBean();
                bean.setId(rs.getLong(1));
                bean.setCoordinator(rs.getString(2));
                bean.setSem(rs.getString(3));
                bean.setSec(rs.getString(4));
                bean.setProgram(rs.getString(5));
                bean.setCourseName(rs.getString(6));
                bean.setCourseCode(rs.getString(7));
                bean.setAcademicYear(rs.getString(8));
                bean.setRegNo(rs.getString(9));
                bean.setStudentName(rs.getString(10));
                bean.setCo1(rs.getInt(11));
                bean.setCo2(rs.getInt(12));
                bean.setCo3(rs.getInt(13));
                bean.setCo4(rs.getInt(14));
                bean.setCo5(rs.getInt(15));
                bean.setCo6(rs.getInt(16));
                bean.setCreatedBy(rs.getString(17));
                bean.setModifiedBy(rs.getString(18));
                bean.setCreatedDatetime(rs.getTimestamp(19));
                bean.setModifiedDatetime(rs.getTimestamp(20));
                list.add(bean);
            }
            rs.close();
        } catch (Exception e) {
            throw new ApplicationException("Exception : Exception in getting list of CourseEndFeedback");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        log.info("Model list End");
        return list;
    }
}
