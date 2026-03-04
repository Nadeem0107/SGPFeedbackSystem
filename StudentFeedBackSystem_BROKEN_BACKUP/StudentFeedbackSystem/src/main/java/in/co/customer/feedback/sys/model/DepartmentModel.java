package in.co.customer.feedback.sys.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import in.co.customer.feedback.sys.bean.DepartmentBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.exception.DatabaseException;
import in.co.customer.feedback.sys.util.JDBCDataSource;

public class DepartmentModel {
    private static Logger log = Logger.getLogger(DepartmentModel.class.getName());

    public Integer nextPK() throws DatabaseException {
        Connection conn = null;
        int pk = 0;
        try {
            conn = JDBCDataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(ID) FROM department");
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

    public List<DepartmentBean> list() throws ApplicationException {
        ArrayList<DepartmentBean> list = new ArrayList<DepartmentBean>();
        StringBuffer sql = new StringBuffer("SELECT * FROM department");
        Connection conn = null;
        try {
            conn = JDBCDataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                DepartmentBean bean = new DepartmentBean();
                bean.setId(rs.getLong(1));
                bean.setName(rs.getString(2));
                bean.setDescription(rs.getString(3));
                list.add(bean);
            }
            rs.close();
        } catch (Exception e) {
            throw new ApplicationException("Exception : Exception in getting list of Departments");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        return list;
    }

    public DepartmentBean findByPK(long pk) throws ApplicationException {
        StringBuffer sql = new StringBuffer("SELECT * FROM department WHERE ID=?");
        DepartmentBean bean = null;
        Connection conn = null;
        try {
            conn = JDBCDataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
            pstmt.setLong(1, pk);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                bean = new DepartmentBean();
                bean.setId(rs.getLong(1));
                bean.setName(rs.getString(2));
                bean.setDescription(rs.getString(3));
            }
            rs.close();
        } catch (Exception e) {
            throw new ApplicationException("Exception : Exception in getting Department by pk");
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
        return bean;
    }
}
