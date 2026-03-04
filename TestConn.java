import java.sql.*;

public class TestConn {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/StudentFeedbackSystem";
        String user = "root";
        String password = "nadeemm0107#";
        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            System.out.println("Connection Successful!");
            try (Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT userName, password, RoleName FROM user")) {
                System.out.println("--- Users List Start ---");
                while (rs.next()) {
                    System.out.println("USERNAME[" + rs.getString(1) + "] PASSWORD[" + rs.getString(2) + "] ROLE["
                            + rs.getString(3) + "]");
                }
                System.out.println("--- Users List End ---");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
