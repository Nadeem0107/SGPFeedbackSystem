package in.co.customer.feedback.sys.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import in.co.customer.feedback.sys.bean.FeedbackBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.exception.DatabaseException;
import in.co.customer.feedback.sys.exception.DuplicateRecordException;
import in.co.customer.feedback.sys.util.JDBCDataSource;

/**
 * JDBC Implementation of FeedbackModel
 */

public class FeedbackModel {
	private static Logger log = Logger.getLogger(FeedbackModel.class.getName());

	public Integer nextPK() throws DatabaseException {
		log.info("Model nextPK Started");
		Connection conn = null;
		int pk = 0;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(ID) FROM Feedback");
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

	public long add(FeedbackBean bean) throws ApplicationException, DuplicateRecordException {

		Connection conn = null;
		int pk = 0;

		try {
			conn = JDBCDataSource.getConnection();
			pk = nextPK();
			conn.setAutoCommit(false);
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO Feedback VALUES(?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setInt(1, pk);
			pstmt.setString(2, bean.getFeedback());
			pstmt.setLong(3, bean.getProductId());
			pstmt.setString(4, bean.getProductName());
			pstmt.setLong(5, bean.getUserId());
			pstmt.setString(6, bean.getUserName());
			pstmt.setDate(7, new java.sql.Date(new Date().getTime()));
			pstmt.setString(8, bean.getCreatedBy());
			pstmt.setString(9, bean.getModifiedBy());
			pstmt.setTimestamp(10, bean.getCreatedDatetime());
			pstmt.setTimestamp(11, bean.getModifiedDatetime());
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
			throw new ApplicationException("Exception : Exception in add Feedback");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		return pk;
	}

	public void delete(FeedbackBean bean) throws ApplicationException {

		Connection conn = null;
		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn.prepareStatement("DELETE FROM Feedback WHERE ID=?");
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
			throw new ApplicationException("Exception : Exception in delete Feedback");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

	}

	public FeedbackBean findByName(String name) throws ApplicationException {
		log.info("Model findByLogin Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM Feedback WHERE name=?");
		FeedbackBean bean = null;
		Connection conn = null;
		System.out.println("sql" + sql);

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, name);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new FeedbackBean();
				bean.setId(rs.getLong(1));
				bean.setFeedback(rs.getString(2));
				bean.setProductId(rs.getLong(3));
				bean.setProductName(rs.getString(4));
				bean.setUserId(rs.getLong(5));
				bean.setUserName(rs.getString(6));
				bean.setDate(rs.getDate(7));
				bean.setCreatedBy(rs.getString(8));
				bean.setModifiedBy(rs.getString(9));
				bean.setCreatedDatetime(rs.getTimestamp(10));
				bean.setModifiedDatetime(rs.getTimestamp(11));

			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new ApplicationException("Exception : Exception in getting Feedback by login");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.info("Model findByLogin End");
		return bean;
	}

	public FeedbackBean findByPK(long pk) throws ApplicationException {
		log.info("Model findByPK Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM Feedback WHERE ID=?");
		FeedbackBean bean = null;
		Connection conn = null;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setLong(1, pk);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new FeedbackBean();
				bean.setId(rs.getLong(1));
				bean.setFeedback(rs.getString(2));
				bean.setProductId(rs.getLong(3));
				bean.setProductName(rs.getString(4));
				bean.setUserId(rs.getLong(5));
				bean.setUserName(rs.getString(6));
				bean.setDate(rs.getDate(7));
				bean.setCreatedBy(rs.getString(8));
				bean.setModifiedBy(rs.getString(9));
				bean.setCreatedDatetime(rs.getTimestamp(10));
				bean.setModifiedDatetime(rs.getTimestamp(11));

			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new ApplicationException("Exception : Exception in getting Feedback by pk");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.info("Model findByPK End");
		return bean;
	}

	

	public List<FeedbackBean> search(FeedbackBean bean) throws ApplicationException {
		return search(bean, 0, 0);
	}

	public List<FeedbackBean> search(FeedbackBean bean, int pageNo, int pageSize) throws ApplicationException {
		log.info("Model search Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM Feedback WHERE 1=1");

		if (bean != null) {
			if (bean.getId() > 0) {
				sql.append(" AND id = " + bean.getId());
			}
			
			if (bean.getUserId() > 0) {
				sql.append(" AND UserId = " + bean.getUserId());
			}
			
			if (bean.getProductId() > 0) {
				sql.append(" AND ProductId = " + bean.getProductId());
			}
			
			if (bean.getFeedback() != null && bean.getFeedback().length() > 0) {
				sql.append(" AND Feedback like '" + bean.getFeedback() + "%'");
			}
		}

		if (pageSize > 0) {
			pageNo = (pageNo - 1) * pageSize;

			sql.append(" Limit " + pageNo + ", " + pageSize);
		}

		ArrayList<FeedbackBean> list = new ArrayList<FeedbackBean>();
		Connection conn = null;
		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new FeedbackBean();
				bean.setId(rs.getLong(1));
				bean.setFeedback(rs.getString(2));
				bean.setProductId(rs.getLong(3));
				bean.setProductName(rs.getString(4));
				bean.setUserId(rs.getLong(5));
				bean.setUserName(rs.getString(6));
				bean.setDate(rs.getDate(7));
				bean.setCreatedBy(rs.getString(8));
				bean.setModifiedBy(rs.getString(9));
				bean.setCreatedDatetime(rs.getTimestamp(10));
				bean.setModifiedDatetime(rs.getTimestamp(11));
				list.add(bean);
			}
			rs.close();
		} catch (Exception e) {
			throw new ApplicationException("Exception : Exception in search Feedback");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.info("Model search End");
		return list;
	}

	public List<FeedbackBean> list() throws ApplicationException {
		return list(0, 0);
	}

	public List<FeedbackBean> list(int pageNo, int pageSize) throws ApplicationException {
		log.info("Model list Started");
		ArrayList<FeedbackBean> list = new ArrayList<FeedbackBean>();
		StringBuffer sql = new StringBuffer("select * from Feedback");

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
				FeedbackBean bean = new FeedbackBean();
				bean.setId(rs.getLong(1));
				bean.setFeedback(rs.getString(2));
				bean.setProductId(rs.getLong(3));
				bean.setProductName(rs.getString(4));
				bean.setUserId(rs.getLong(5));
				bean.setUserName(rs.getString(6));
				bean.setDate(rs.getDate(7));
				bean.setCreatedBy(rs.getString(8));
				bean.setModifiedBy(rs.getString(9));
				bean.setCreatedDatetime(rs.getTimestamp(10));
				bean.setModifiedDatetime(rs.getTimestamp(11));
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

}
