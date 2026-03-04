import java.sql.*;

public class VerifyLogin {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/StudentFeedbackSystem";
        String user = "root";
        String password = "nadeemm0107#";
        String targetUser = "User123";
        String targetPass = "Pa$$w0rd!";

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            System.out.println("Connection Successful!");
            String query = "SELECT * FROM User WHERE USERNAME = ? AND PASSWORD = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, targetUser);
                pstmt.setString(2, targetPass);
                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        System.out.println("LOGIN SUCCESS: Found user " + rs.getString("userName") + " with role "
                                + rs.getString("RoleName"));
                    } else {
                        System.out.println("LOGIN FAILED: No match for " + targetUser + " / " + targetPass);
                        // Check if user exists at all
                        try (PreparedStatement pstmt2 = conn
                                .prepareStatement("SELECT * FROM user WHERE USERNAME = ?")) {
                            pstmt2.setString(1, targetUser);
                            try (ResultSet rs2 = pstmt2.executeQuery()) {
                                if (rs2.next()) {
                                    System.out.println("User exists, but password mismatch. DB Password: "
                                            + rs2.getString("password"));
                                } else {
                                    System.out.println("User does not exist in DB.");
                                }
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
