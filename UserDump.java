import java.sql.*;
import java.io.*;

public class UserDump {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/StudentFeedbackSystem";
        String user = "root";
        String password = "nadeemm0107#";
        try (Connection conn = DriverManager.getConnection(url, user, password);
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT userName, password, RoleName FROM user");
                PrintWriter out = new PrintWriter(new FileWriter("user_dump_simple.txt"))) {
            while (rs.next()) {
                out.println("U:" + rs.getString(1) + "|P:" + rs.getString(2) + "|R:" + rs.getString(3));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
