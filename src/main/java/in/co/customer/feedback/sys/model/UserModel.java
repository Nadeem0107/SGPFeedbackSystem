package in.co.customer.feedback.sys.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import in.co.customer.feedback.sys.bean.UserBean;
import in.co.customer.feedback.sys.exception.ApplicationException;
import in.co.customer.feedback.sys.exception.DatabaseException;
import in.co.customer.feedback.sys.exception.DuplicateRecordException;
import in.co.customer.feedback.sys.exception.RecordNotFoundException;
import in.co.customer.feedback.sys.util.JDBCDataSource;

/**
 * JDBC Implementation of UserModel
 */

public class UserModel {
	private static Logger log = Logger.getLogger(UserModel.class.getName());

	public Integer nextPK() throws DatabaseException {
		log.info("Model nextPK Started");
		Connection conn = null;
		int pk = 0;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(ID) FROM User");
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

	public long add(UserBean bean) throws ApplicationException, DuplicateRecordException {

		Connection conn = null;
		int pk = 0;

		UserBean existbean = findByUserName(bean.getUserName());

		if (existbean != null) {
			throw new DuplicateRecordException("User Name is already exists");
		}

		try {
			conn = JDBCDataSource.getConnection();
			pk = nextPK();
			conn.setAutoCommit(false);
			PreparedStatement pstmt = conn
					.prepareStatement("INSERT INTO User VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setInt(1, pk);
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getUserName());
			pstmt.setString(4, bean.getPassword());
			pstmt.setString(5, bean.getEmail());
			pstmt.setString(6, bean.getContactNo());
			pstmt.setString(7, bean.getGender());
			pstmt.setDate(8, new java.sql.Date(bean.getDob().getTime()));
			pstmt.setLong(9, bean.getRoleId());
			pstmt.setString(10, bean.getRoleName());
			pstmt.setString(11, bean.getCreatedBy());
			pstmt.setString(12, bean.getModifiedBy());
			pstmt.setTimestamp(13, bean.getCreatedDatetime());
			pstmt.setTimestamp(14, bean.getModifiedDatetime());
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
			throw new ApplicationException("Exception : Exception in add User");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		return pk;
	}

	public void delete(UserBean bean) throws ApplicationException {

		Connection conn = null;
		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn.prepareStatement("DELETE FROM User WHERE ID=?");
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
			throw new ApplicationException("Exception : Exception in delete User");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

	}

	public UserBean findByUserName(String UserName) throws ApplicationException {
		log.info("Model findByLogin Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM User WHERE USERNAME=?");
		UserBean bean = null;
		Connection conn = null;
		System.out.println("sql" + sql);

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, UserName);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new UserBean();
				bean.setId(rs.getLong(1));
				bean.setName(rs.getString(2));
				bean.setUserName(rs.getString(3));
				bean.setPassword(rs.getString(4));
				bean.setEmail(rs.getString(5));
				bean.setContactNo(rs.getString(6));
				bean.setGender(rs.getString(7));
				bean.setDob(rs.getDate(8));
				bean.setRoleId(rs.getLong(9));
				bean.setRoleName(rs.getString(10));
				bean.setCreatedBy(rs.getString(11));
				bean.setModifiedBy(rs.getString(12));
				bean.setCreatedDatetime(rs.getTimestamp(13));
				bean.setModifiedDatetime(rs.getTimestamp(14));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new ApplicationException("Exception : Exception in getting User by login");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.info("Model findByLogin End");
		return bean;
	}

	public UserBean findByPK(long pk) throws ApplicationException {
		log.info("Model findByPK Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM User WHERE ID=?");
		UserBean bean = null;
		Connection conn = null;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setLong(1, pk);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new UserBean();
				bean.setId(rs.getLong(1));
				bean.setName(rs.getString(2));
				bean.setUserName(rs.getString(3));
				bean.setPassword(rs.getString(4));
				bean.setEmail(rs.getString(5));
				bean.setContactNo(rs.getString(6));
				bean.setGender(rs.getString(7));
				bean.setDob(rs.getDate(8));
				bean.setRoleId(rs.getLong(9));
				bean.setRoleName(rs.getString(10));
				bean.setCreatedBy(rs.getString(11));
				bean.setModifiedBy(rs.getString(12));
				bean.setCreatedDatetime(rs.getTimestamp(13));
				bean.setModifiedDatetime(rs.getTimestamp(14));

			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new ApplicationException("Exception : Exception in getting User by pk");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.info("Model findByPK End");
		return bean;
	}

	public void update(UserBean bean) throws ApplicationException, DuplicateRecordException {
		log.info("Model update Started");
		Connection conn = null;

		UserBean beanExist = findByUserName(bean.getUserName());
		if (beanExist != null && !(beanExist.getId() == bean.getId())) {
			throw new DuplicateRecordException("UserName is already exist");
		}

		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn.prepareStatement(
					"UPDATE User SET NAME=?,USERNAME=?,PASSWORD=?,EMAIL=?,CONTACTNO=?,GENDER=?,DOB=?,roleid=?,roleName=?,"
							+ "CREATED_BY=?,MODIFIED_BY=?,CREATED_DATETIME=?,MODIFIED_DATETIME=? WHERE ID=?");
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getUserName());
			pstmt.setString(3, bean.getPassword());
			pstmt.setString(4, bean.getEmail());
			pstmt.setString(5, bean.getContactNo());
			pstmt.setString(6, bean.getGender());
			pstmt.setDate(7, new java.sql.Date(bean.getDob().getTime()));
			pstmt.setLong(8, bean.getRoleId());
			pstmt.setString(9, bean.getRoleName());
			pstmt.setString(10, bean.getCreatedBy());
			pstmt.setString(11, bean.getModifiedBy());
			pstmt.setTimestamp(12, bean.getCreatedDatetime());
			pstmt.setTimestamp(13, bean.getModifiedDatetime());
			pstmt.setLong(14, bean.getId());
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
			throw new ApplicationException("Exception in updating User ");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.info("Model update End");
	}

	public List<UserBean> search(UserBean bean) throws ApplicationException {
		return search(bean, 0, 0);
	}

	public List<UserBean> search(UserBean bean, int pageNo, int pageSize) throws ApplicationException {
		log.info("Model search Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM User WHERE 1=1");

		if (bean != null) {
			if (bean.getId() > 0) {
				sql.append(" AND id = " + bean.getId());
			}

			if (bean.getRoleId() > 0) {
				sql.append(" AND RoleId = " + bean.getRoleId());
			}
			if (bean.getRoleName() != null && bean.getRoleName().length() > 0) {
				sql.append(" AND RoleName like '" + bean.getRoleName() + "%'");
			}
			if (bean.getName() != null && bean.getName().length() > 0) {
				sql.append(" AND NAME like '" + bean.getName() + "%'");
			}

			if (bean.getUserName() != null && bean.getUserName().length() > 0) {
				sql.append(" AND USERNAME like '" + bean.getUserName() + "%'");
			}
			if (bean.getPassword() != null && bean.getPassword().length() > 0) {
				sql.append(" AND PASSWORD like '" + bean.getPassword() + "%'");
			}

			if (bean.getEmail() != null && bean.getEmail().length() > 0) {
				sql.append(" AND Email like '" + bean.getEmail() + "'");
			}

			if (bean.getContactNo() != null && bean.getContactNo().length() > 0) {
				sql.append(" AND CONTACT_NO = " + bean.getContactNo());
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
				bean = new UserBean();
				bean.setId(rs.getLong(1));
				bean.setName(rs.getString(2));
				bean.setUserName(rs.getString(3));
				bean.setPassword(rs.getString(4));
				bean.setEmail(rs.getString(5));
				bean.setContactNo(rs.getString(6));
				bean.setGender(rs.getString(7));
				bean.setDob(rs.getDate(8));
				bean.setRoleId(rs.getLong(9));
				bean.setRoleName(rs.getString(10));
				bean.setCreatedBy(rs.getString(11));
				bean.setModifiedBy(rs.getString(12));
				bean.setCreatedDatetime(rs.getTimestamp(13));
				bean.setModifiedDatetime(rs.getTimestamp(14));
				list.add(bean);
			}
			rs.close();
		} catch (Exception e) {
			throw new ApplicationException("Exception : Exception in search User");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.info("Model search End");
		return list;
	}

	public List<UserBean> list() throws ApplicationException {
		return list(0, 0);
	}

	public List<UserBean> list(int pageNo, int pageSize) throws ApplicationException {
		log.info("Model list Started");
		ArrayList<UserBean> list = new ArrayList<UserBean>();
		StringBuffer sql = new StringBuffer("select * from User");

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
				UserBean bean = new UserBean();
				bean.setId(rs.getLong(1));
				bean.setName(rs.getString(2));
				bean.setUserName(rs.getString(3));
				bean.setPassword(rs.getString(4));
				bean.setEmail(rs.getString(5));
				bean.setContactNo(rs.getString(6));
				bean.setGender(rs.getString(7));
				bean.setDob(rs.getDate(8));
				bean.setRoleId(rs.getLong(9));
				bean.setRoleName(rs.getString(10));
				bean.setCreatedBy(rs.getString(11));
				bean.setModifiedBy(rs.getString(12));
				bean.setCreatedDatetime(rs.getTimestamp(13));
				bean.setModifiedDatetime(rs.getTimestamp(14));
				list.add(bean);
			}
			rs.close();
		} catch (Exception e) {
			throw new ApplicationException("Exception : Exception in getting list of Users");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		log.info("Model list End");
		return list;

	}

	public UserBean authenticate(String UserName, String password) throws ApplicationException {
		log.info("Model authenticate Started for: " + UserName);
		StringBuffer sql = new StringBuffer("SELECT * FROM User WHERE USERNAME = ? AND PASSWORD = ?");
		UserBean bean = null;
		Connection conn = null;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, UserName);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				log.info("User found in database");
				bean = new UserBean();
				bean.setId(rs.getLong(1));
				bean.setName(rs.getString(2));
				bean.setUserName(rs.getString(3));
				bean.setPassword(rs.getString(4));
				bean.setEmail(rs.getString(5));
				bean.setContactNo(rs.getString(6));
				bean.setGender(rs.getString(7));
				bean.setDob(rs.getDate(8));
				bean.setRoleId(rs.getLong(9));
				bean.setRoleName(rs.getString(10));
				bean.setCreatedBy(rs.getString(11));
				bean.setModifiedBy(rs.getString(12));
				bean.setCreatedDatetime(rs.getTimestamp(13));
				bean.setModifiedDatetime(rs.getTimestamp(14));
			} else {
				log.info("No user found with those credentials in database");
			}
		} catch (Exception e) {
			log.severe("Exception in authenticate: " + e.getMessage());
			e.printStackTrace();
			throw new ApplicationException("Exception : " + e.getMessage());

		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		log.info("Model authenticate End");
		return bean;
	}

	public boolean changePassword(Long id, String oldPassword, String newPassword)
			throws RecordNotFoundException, ApplicationException {

		log.info("model changePassword Started");

		boolean flag = false;

		UserBean beanExist = null;

		beanExist = findByPK(id);

		if (beanExist != null && beanExist.getPassword().equals(oldPassword)) {
			beanExist.setPassword(newPassword);
			try {
				update(beanExist);
			} catch (DuplicateRecordException e) {
				throw new ApplicationException("LoginId is already exist");
			}
			flag = true;
		} else {
			throw new RecordNotFoundException("Old password is Invalid");
		}

		log.info("Model changePassword End");
		return flag;

	}

	public UserBean updateAccess(UserBean bean) throws ApplicationException {
		return null;
	}

	public long registerUser(UserBean bean) throws ApplicationException, DuplicateRecordException {

		log.info("Model add Started");

		long pk = add(bean);

		return pk;
	}

	/**
	 * Find a user by their email address
	 */
	public UserBean findByEmail(String email) throws ApplicationException {
		log.info("Model findByEmail Started");
		String sql = "SELECT * FROM User WHERE EMAIL=?";
		UserBean bean = null;
		Connection conn = null;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new UserBean();
				bean.setId(rs.getLong(1));
				bean.setName(rs.getString(2));
				bean.setUserName(rs.getString(3));
				bean.setPassword(rs.getString(4));
				bean.setEmail(rs.getString(5));
				bean.setContactNo(rs.getString(6));
				bean.setGender(rs.getString(7));
				bean.setDob(rs.getDate(8));
				bean.setRoleId(rs.getLong(9));
				bean.setRoleName(rs.getString(10));
				bean.setCreatedBy(rs.getString(11));
				bean.setModifiedBy(rs.getString(12));
				bean.setCreatedDatetime(rs.getTimestamp(13));
				bean.setModifiedDatetime(rs.getTimestamp(14));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new ApplicationException("Exception : Exception in getting User by email");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.info("Model findByEmail End");
		return bean;
	}

	/**
	 * Reset password directly by setting a new password for the given user ID.
	 * Used by the reset password flow (token-based).
	 */
	public boolean resetPasswordDirect(long userId, String newPassword) throws ApplicationException {
		log.info("Model resetPasswordDirect Started");
		Connection conn = null;
		boolean flag = false;

		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement pstmt = conn
					.prepareStatement("UPDATE User SET PASSWORD=?, MODIFIED_DATETIME=? WHERE ID=?");
			pstmt.setString(1, newPassword);
			pstmt.setTimestamp(2, new java.sql.Timestamp(System.currentTimeMillis()));
			pstmt.setLong(3, userId);
			int rows = pstmt.executeUpdate();
			conn.commit();
			pstmt.close();
			flag = (rows > 0);
		} catch (Exception e) {
			e.printStackTrace();
			try {
				if (conn != null)
					conn.rollback();
			} catch (Exception ex) {
				throw new ApplicationException("Exception : Reset password rollback exception " + ex.getMessage());
			}
			throw new ApplicationException("Exception in resetting password");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.info("Model resetPasswordDirect End");
		return flag;
	}

	// ---- Token-based reset password support ----

	/** In-memory store for reset tokens: token -> {userId, expiryTime} */
	private static java.util.concurrent.ConcurrentHashMap<String, long[]> resetTokens = new java.util.concurrent.ConcurrentHashMap<>();

	/**
	 * Generate a secure reset token for the given user ID.
	 * Token is valid for 30 minutes.
	 */
	public static String generateResetToken(long userId) {
		String token = java.util.UUID.randomUUID().toString();
		long expiry = System.currentTimeMillis() + (30 * 60 * 1000); // 30 minutes
		resetTokens.put(token, new long[] { userId, expiry });
		return token;
	}

	/**
	 * Validate a reset token and return the associated user ID.
	 * Returns -1 if the token is invalid or expired.
	 */
	public static long validateResetToken(String token) {
		if (token == null || !resetTokens.containsKey(token)) {
			return -1;
		}
		long[] data = resetTokens.get(token);
		if (System.currentTimeMillis() > data[1]) {
			resetTokens.remove(token); // expired
			return -1;
		}
		return data[0]; // userId
	}

	/**
	 * Invalidate (consume) a reset token after it has been used.
	 */
	public static void invalidateResetToken(String token) {
		resetTokens.remove(token);
	}

	/**
	 * Forget password - sends a reset link email to the user's registered email
	 * address.
	 * Only works for HOD and Principal roles.
	 */
	public String forgetPassword(String login)
			throws ApplicationException, RecordNotFoundException {
		UserBean userData = findByUserName(login);

		if (userData == null) {
			throw new RecordNotFoundException("Username does not exist!");
		}

		// Only allow HOD and Principal/Admin to reset password
		String roleName = userData.getRoleName();
		if (roleName == null ||
				(!"HOD".equalsIgnoreCase(roleName) && !"Principal".equalsIgnoreCase(roleName)
						&& !"Admin".equalsIgnoreCase(roleName))) {
			throw new RecordNotFoundException(
					"Password reset is only available for HOD and Principal accounts. Students should contact their HOD.");
		}

		if (userData.getEmail() == null || userData.getEmail().trim().isEmpty()) {
			throw new RecordNotFoundException(
					"No email address is registered for this account. Please contact the administrator.");
		}

		// Generate reset token
		String token = generateResetToken(userData.getId());

		// Build reset link
		String resetLink = in.co.customer.feedback.sys.util.PropertyReader.getValue("app.base.url")
				+ "/resetPassword?token=" + token;
		System.out.println("DEBUG: Password Reset Link: " + resetLink);

		// Build email body
		String emailBody = "<div style='font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto;'>"
				+ "<div style='background: linear-gradient(135deg, #3b71ca, #2563eb); padding: 30px; border-radius: 12px 12px 0 0; text-align: center;'>"
				+ "<h1 style='color: white; margin: 0; font-size: 24px;'>Password Reset Request</h1>"
				+ "</div>"
				+ "<div style='background: #ffffff; padding: 30px; border: 1px solid #e2e8f0; border-radius: 0 0 12px 12px;'>"
				+ "<p style='color: #333; font-size: 16px;'>Hello <strong>" + userData.getName() + "</strong>,</p>"
				+ "<p style='color: #555; font-size: 14px;'>We received a request to reset your password for your <strong>"
				+ roleName + "</strong> account.</p>"
				+ "<p style='color: #555; font-size: 14px;'>Click the button below to set a new password:</p>"
				+ "<div style='text-align: center; margin: 30px 0;'>"
				+ "<a href='" + resetLink + "' style='background-color: #3b71ca; color: white; padding: 14px 32px; "
				+ "text-decoration: none; border-radius: 8px; font-size: 16px; font-weight: bold; display: inline-block;'>Reset Password</a>"
				+ "</div>"
				+ "<p style='color: #888; font-size: 12px;'>This link will expire in <strong>30 minutes</strong>.</p>"
				+ "<p style='color: #888; font-size: 12px;'>If you did not request a password reset, please ignore this email.</p>"
				+ "<hr style='border: none; border-top: 1px solid #eee; margin: 20px 0;'>"
				+ "<p style='color: #aaa; font-size: 11px; text-align: center;'>Student Feedback System - Sanjay Gandhi Polytechnic</p>"
				+ "</div></div>";

		try {
			in.co.customer.feedback.sys.util.EmailUtility.sendEmail(
					userData.getEmail(),
					"Password Reset - Student Feedback System",
					emailBody);
		} catch (Exception e) {
			log.severe("Failed to send password reset email: " + e.getMessage());
			e.printStackTrace();
			throw new ApplicationException(
					"Failed to send reset email. Please try again later or contact administrator.");
		}

		return "A password reset link has been sent to your registered email address (" + maskEmail(userData.getEmail())
				+ "). Please check your inbox.";
	}

	/**
	 * Mask email for privacy, e.g., a****@gmail.com
	 */
	private String maskEmail(String email) {
		if (email == null || !email.contains("@"))
			return "****";
		int atIndex = email.indexOf("@");
		if (atIndex <= 1)
			return email;
		return email.charAt(0) + "****" + email.substring(atIndex);
	}
}
