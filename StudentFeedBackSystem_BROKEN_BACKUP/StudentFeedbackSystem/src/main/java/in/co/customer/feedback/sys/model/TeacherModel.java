package in.co.customer.feedback.sys.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;

import in.co.customer.feedback.sys.bean.TeacherBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.exception.DatabaseException;
import in.co.customer.feedback.sys.exception.DuplicateRecordException;
import in.co.customer.feedback.sys.util.JDBCDataSource;

public class TeacherModel {
	private static Logger log = Logger.getLogger(TeacherModel.class);

	public Integer nextPK() throws DatabaseException {
		log.info("Model nextPK Started");
		Connection conn = null;
		int pk = 0;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(ID) FROM teachers");
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

	public long add(TeacherBean bean) throws ApplicationException, DuplicateRecordException {

		Connection conn = null;
		int pk = 0;

		TeacherBean existbean = findByName(bean.getName());

		if (existbean != null) {
			throw new DuplicateRecordException("Name is already exists");
		}

		try {
			conn = JDBCDataSource.getConnection();
			pk = nextPK();
			conn.setAutoCommit(false);
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO teachers VALUES(?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setInt(1, pk);
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPrice());
			pstmt.setString(4, bean.getDescription());
			pstmt.setString(5, bean.getImage());
			pstmt.setString(6, bean.getCreatedBy());
			pstmt.setString(7, bean.getModifiedBy());
			pstmt.setTimestamp(8, bean.getCreatedDatetime());
			pstmt.setTimestamp(9, bean.getModifiedDatetime());
			pstmt.setLong(10, bean.getDeptId());
			pstmt.setString(11, bean.getSemester());
			pstmt.executeUpdate();
			conn.commit(); // End transaction
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
				throw new ApplicationException("Exception : add rollback exception " + ex.getMessage());
			}
			throw new ApplicationException("Exception : Exception in add Product");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		return pk;
	}

	public void delete(TeacherBean bean) throws ApplicationException {

		Connection conn = null;
		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn.prepareStatement("DELETE FROM teachers WHERE ID=?");
			pstmt.setLong(1, bean.getId());
			pstmt.executeUpdate();
			conn.commit(); // End transaction
			pstmt.close();

		} catch (Exception e) {

			try {
				conn.rollback();
			} catch (Exception ex) {
				throw new ApplicationException("Exception : Delete rollback exception " + ex.getMessage());
			}
			throw new ApplicationException("Exception : Exception in delete Product");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

	}

	public TeacherBean findByName(String name) throws ApplicationException {
		log.info("Model findByName Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM teachers WHERE name=?");
		TeacherBean bean = null;
		Connection conn = null;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, name);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new TeacherBean();
				bean.setId(rs.getLong(1));
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getString(3));
				bean.setDescription(rs.getString(4));
				bean.setImage(rs.getString(5));
				bean.setCreatedBy(rs.getString(6));
				bean.setModifiedBy(rs.getString(7));
				bean.setCreatedDatetime(rs.getTimestamp(8));
				bean.setModifiedDatetime(rs.getTimestamp(9));
				bean.setDeptId(rs.getLong(10));
				bean.setSemester(rs.getString(11));
			}
			rs.close();
		} catch (Exception e) {
			log.error(e);
			throw new ApplicationException("Exception : Exception in getting Teacher by name");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.info("Model findByName End");
		return bean;
	}

	public TeacherBean findByPK(long pk) throws ApplicationException {
		log.info("Model findByPK Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM teachers WHERE ID=?");
		TeacherBean bean = null;
		Connection conn = null;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setLong(1, pk);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new TeacherBean();
				bean.setId(rs.getLong(1));
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getString(3));
				bean.setDescription(rs.getString(4));
				bean.setImage(rs.getString(5));
				bean.setCreatedBy(rs.getString(6));
				bean.setModifiedBy(rs.getString(7));
				bean.setCreatedDatetime(rs.getTimestamp(8));
				bean.setModifiedDatetime(rs.getTimestamp(9));
				bean.setDeptId(rs.getLong(10));
				bean.setSemester(rs.getString(11));

			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new ApplicationException("Exception : Exception in getting Product by pk");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.info("Model findByPK End");
		return bean;
	}

	public void update(TeacherBean bean) throws ApplicationException, DuplicateRecordException {
		log.info("Model update Started");
		Connection conn = null;

		/*
		 * TeacherBean beanExist = findByUserName(bean.getUserName()); if (beanExist !=
		 * null && !(beanExist.getId() == bean.getId())) { throw new
		 * DuplicateRecordException("UserName is already exist"); }
		 */

		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn.prepareStatement("UPDATE teachers SET Name=?,price=?,description=?,image=?,"
					+ "CREATED_BY=?,MODIFIED_BY=?,CREATED_DATETIME=?,MODIFIED_DATETIME=?,dept_id=?,semester=? WHERE ID=?");
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getPrice());
			pstmt.setString(3, bean.getDescription());
			pstmt.setString(4, bean.getImage());
			pstmt.setString(5, bean.getCreatedBy());
			pstmt.setString(6, bean.getModifiedBy());
			pstmt.setTimestamp(7, bean.getCreatedDatetime());
			pstmt.setTimestamp(8, bean.getModifiedDatetime());
			pstmt.setLong(9, bean.getDeptId());
			pstmt.setString(10, bean.getSemester());
			pstmt.setLong(11, bean.getId());
			pstmt.executeUpdate();
			conn.commit(); // End transaction
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception ex) {
				throw new ApplicationException("Exception : Delete rollback exception " + ex.getMessage());
			}
			throw new ApplicationException("Exception in updating Product ");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.info("Model update End");
	}

	public List<TeacherBean> search(TeacherBean bean) throws ApplicationException {
		return search(bean, 0, 0);
	}

	public List<TeacherBean> search(TeacherBean bean, int pageNo, int pageSize) throws ApplicationException {
		log.info("Model search Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM teachers WHERE 1=1");

		if (bean != null) {
			if (bean.getId() > 0) {
				sql.append(" AND id = " + bean.getId());
			}
			if (bean.getName() != null && bean.getName().length() > 0) {
				sql.append(" AND Name like '" + bean.getName() + "%'");
			}
			if (bean.getDeptId() > 0) {
				sql.append(" AND dept_id = " + bean.getDeptId());
			}
			if (bean.getSemester() != null && bean.getSemester().length() > 0) {
				sql.append(" AND semester = '" + bean.getSemester() + "'");
			}
		}

		if (pageSize > 0) {
			pageNo = (pageNo - 1) * pageSize;

			sql.append(" Limit " + pageNo + ", " + pageSize);
		}

		ArrayList<TeacherBean> list = new ArrayList<TeacherBean>();
		Connection conn = null;
		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new TeacherBean();
				bean.setId(rs.getLong(1));
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getString(3));
				bean.setDescription(rs.getString(4));
				bean.setImage(rs.getString(5));
				bean.setCreatedBy(rs.getString(6));
				bean.setModifiedBy(rs.getString(7));
				bean.setCreatedDatetime(rs.getTimestamp(8));
				bean.setModifiedDatetime(rs.getTimestamp(9));
				bean.setDeptId(rs.getLong(10));
				bean.setSemester(rs.getString(11));
				list.add(bean);
			}
			rs.close();
		} catch (Exception e) {
			throw new ApplicationException("Exception : Exception in search Product");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.info("Model search End");
		return list;
	}

	public List<TeacherBean> list() throws ApplicationException {
		return list(0, 0);
	}

	public List<TeacherBean> list(int pageNo, int pageSize) throws ApplicationException {
		log.info("Model list Started");
		ArrayList<TeacherBean> list = new ArrayList<TeacherBean>();
		StringBuffer sql = new StringBuffer("select * from teachers");

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
				TeacherBean bean = new TeacherBean();
				bean.setId(rs.getLong(1));
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getString(3));
				bean.setDescription(rs.getString(4));
				bean.setImage(rs.getString(5));
				bean.setCreatedBy(rs.getString(6));
				bean.setModifiedBy(rs.getString(7));
				bean.setCreatedDatetime(rs.getTimestamp(8));
				bean.setModifiedDatetime(rs.getTimestamp(9));
				bean.setDeptId(rs.getLong(10));
				bean.setSemester(rs.getString(11));
				list.add(bean);
			}
			rs.close();
		} catch (Exception e) {
			throw new ApplicationException("Exception : Exception in getting list of Products");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		log.info("Model list End");
		return list;

	}

}
