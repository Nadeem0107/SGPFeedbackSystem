package in.co.customer.feedback.sys.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class DbCheck {
    public static void main(String[] args) {
        try {
            Connection conn = JDBCDataSource.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM user");
            if (rs.next()) {
                System.out.println("TOTAL USERS IN DATABASE: " + rs.getInt(1));
            }

            rs = stmt.executeQuery("SELECT userName, password, RoleName FROM user");
            System.out.println("--- User List ---");
            while (rs.next()) {
                System.out.println(
                        "User: " + rs.getString(1) + " | Pwd: " + rs.getString(2) + " | Role: " + rs.getString(3));
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
