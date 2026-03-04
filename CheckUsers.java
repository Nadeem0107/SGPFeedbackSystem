import java.sql.*;

public class CheckUsers {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/StudentFeedbackSystem";
        String user = "root";
        String password = "nadeemm0107#";
        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            System.out.println("Connection OK");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM user");
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnsNumber = rsmd.getColumnCount();
            while (rs.next()) {
                for (int i = 1; i <= columnsNumber; i++) {
                    if (i > 1)
                        System.out.print(",  ");
                    String columnValue = rs.getString(i);
                    System.out.print(rsmd.getColumnName(i) + ": " + columnValue);
                }
                System.out.println("");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
