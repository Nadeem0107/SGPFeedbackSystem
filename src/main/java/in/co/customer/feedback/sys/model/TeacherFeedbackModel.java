package in.co.customer.feedback.sys.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import in.co.customer.feedback.sys.bean.TeacherFeedbackBean;
import in.co.customer.feedback.sys.bean.UserBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.exception.DatabaseException;
import in.co.customer.feedback.sys.util.JDBCDataSource;

public class TeacherFeedbackModel {

    private static Logger log = Logger.getLogger(TeacherFeedbackModel.class.getName());

    public Integer nextPK() throws DatabaseException {
        log.info("Model nextPK Started");
        Connection conn = null;
        int pk = 0;

        try {
            conn = JDBCDataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(ID) FROM st_feedback");
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

    public long add(TeacherFeedbackBean bean) throws ApplicationException {
        log.info("Model add Started");
        Connection conn = null;
        int pk = 0;

        try {
            conn = JDBCDataSource.getConnection();
            pk = nextPK();
            conn.setAutoCommit(false);
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO st_feedback VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setLong(1, pk);
            pstmt.setLong(2, bean.getTeacherId());
            pstmt.setLong(3, bean.getStudentId());
            pstmt.setString(4, bean.getStudentName());
            pstmt.setInt(5, bean.getKnowledgeRating());
            pstmt.setInt(6, bean.getCommunicationRating());
            pstmt.setInt(7, bean.getMethodologyRating());
            pstmt.setInt(8, bean.getPunctualityRating());
            pstmt.setInt(9, bean.getOverallRating());
            pstmt.setString(10, bean.getComments());
            // created_at is default timestamp, but we map standard bean fields
            pstmt.setTimestamp(11, bean.getCreatedDatetime()); // created_at equivalent often, but purely matching schema placeholders
            pstmt.setString(12, bean.getCreatedBy());
            pstmt.setString(13, bean.getModifiedBy());
            pstmt.setTimestamp(14, bean.getCreatedDatetime());
            pstmt.setTimestamp(15, bean.getModifiedDatetime());
            
            pstmt.executeUpdate();
            conn.commit();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conn.rollback();
            } catch (Exception ex) {
                throw new ApplicationException("Exception : add rollback exception " + ex.getMessage());
            }
            throw new ApplicationException("Exception : Exception in add Feedback");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        log.info("Model add End");
        return pk;
    }

    public List<TeacherFeedbackBean> list() throws ApplicationException {
        return list(0, 0);
    }

    public List<TeacherFeedbackBean> list(int pageNo, int pageSize) throws ApplicationException {
        log.info("Model list Started");
        ArrayList<TeacherFeedbackBean> list = new ArrayList<TeacherFeedbackBean>();
        StringBuffer sql = new StringBuffer("select * from st_feedback");

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
                TeacherFeedbackBean bean = new TeacherFeedbackBean();
                bean.setId(rs.getLong(1));
                bean.setTeacherId(rs.getLong(2));
                bean.setStudentId(rs.getLong(3));
                bean.setStudentName(rs.getString(4));
                bean.setKnowledgeRating(rs.getInt(5));
                bean.setCommunicationRating(rs.getInt(6));
                bean.setMethodologyRating(rs.getInt(7));
                bean.setPunctualityRating(rs.getInt(8));
                bean.setOverallRating(rs.getInt(9));
                bean.setComments(rs.getString(10));
                bean.setCreatedBy(rs.getString(12));
                bean.setModifiedBy(rs.getString(13));
                bean.setCreatedDatetime(rs.getTimestamp(14));
                bean.setModifiedDatetime(rs.getTimestamp(15));
                list.add(bean);
            }
            rs.close();
        } catch (Exception e) {
            throw new ApplicationException("Exception : Exception in getting list of Feedbacks");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }

        log.info("Model list End");
        return list;
    }
    
    /**
     * Search teachers (Users with roleId = 3)
     */
    public List<UserBean> searchTeachers(UserBean bean, int pageNo, int pageSize) throws ApplicationException {
         log.info("Model searchTeachers Started");
        StringBuffer sql = new StringBuffer("SELECT * FROM User WHERE ROLEID = 3"); // 3 for Teacher

        if (bean != null) {
            if (bean.getName() != null && bean.getName().length() > 0) {
                sql.append(" AND NAME like '" + bean.getName() + "%'");
            }
        }

        if (pageSize > 0) {
            pageNo = (pageNo - 1) * pageSize;
            sql.append(" Limit " + pageNo + ", " + pageSize);
        }

        ArrayList<UserBean> list = new ArrayList<UserBean>();
        Connection conn = null;
        try {
            conn = JDBCDataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                UserBean user = new UserBean();
                user.setId(rs.getLong(1));
                user.setName(rs.getString(2));
                user.setUserName(rs.getString(3));
                user.setRoleName(rs.getString(10));
                // Populate other fields if necessary
                list.add(user);
            }
            rs.close();
        } catch (Exception e) {
            throw new ApplicationException("Exception : Exception in search Teachers");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        log.info("Model searchTeachers End");
        return list;
    }

    public List<TeacherFeedbackBean> search(TeacherFeedbackBean bean) throws ApplicationException {
        return search(bean, 0, 0);
    }

    public List<TeacherFeedbackBean> search(TeacherFeedbackBean bean, int pageNo, int pageSize) throws ApplicationException {
        log.info("Model search Started");
        StringBuffer sql = new StringBuffer("SELECT * FROM st_feedback WHERE 1=1");

        if (bean != null) {
            if (bean.getTeacherId() > 0) {
                sql.append(" AND TEACHER_ID = " + bean.getTeacherId());
            }
            if (bean.getStudentName() != null && bean.getStudentName().length() > 0) {
                sql.append(" AND STUDENT_NAME like '" + bean.getStudentName() + "%'");
            }
        }

        if (pageSize > 0) {
            pageNo = (pageNo - 1) * pageSize;
            sql.append(" Limit " + pageNo + ", " + pageSize);
        }

        ArrayList<TeacherFeedbackBean> list = new ArrayList<TeacherFeedbackBean>();
        Connection conn = null;
        try {
            conn = JDBCDataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                TeacherFeedbackBean modelBean = new TeacherFeedbackBean();
                modelBean.setId(rs.getLong(1));
                modelBean.setTeacherId(rs.getLong(2));
                modelBean.setStudentId(rs.getLong(3));
                modelBean.setStudentName(rs.getString(4));
                modelBean.setKnowledgeRating(rs.getInt(5));
                modelBean.setCommunicationRating(rs.getInt(6));
                modelBean.setMethodologyRating(rs.getInt(7));
                modelBean.setPunctualityRating(rs.getInt(8));
                modelBean.setOverallRating(rs.getInt(9));
                modelBean.setComments(rs.getString(10));
                modelBean.setCreatedBy(rs.getString(12));
                modelBean.setModifiedBy(rs.getString(13));
                modelBean.setCreatedDatetime(rs.getTimestamp(14));
                modelBean.setModifiedDatetime(rs.getTimestamp(15));
                list.add(modelBean);
            }
            rs.close();
        } catch (Exception e) {
             e.printStackTrace();
            throw new ApplicationException("Exception : Exception in search Feedback");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }

        log.info("Model search End");
        return list;
    }
}
