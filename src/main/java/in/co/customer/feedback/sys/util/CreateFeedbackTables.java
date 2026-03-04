package in.co.customer.feedback.sys.util;

import java.sql.Connection;
import java.sql.Statement;

public class CreateFeedbackTables {

    public static void main(String[] args) {
        Connection conn = null;
        Statement stmt = null;
        try {
            System.out.println("Creating Mid-Sem and End-Sem Feedback Tables...");
            conn = JDBCDataSource.getConnection();
            stmt = conn.createStatement();

            String midSemSQL = "CREATE TABLE IF NOT EXISTS st_midsem_feedback (" +
                    "ID BIGINT PRIMARY KEY," +
                    "reg_no VARCHAR(50)," +
                    "student_name VARCHAR(255)," +
                    "branch VARCHAR(100)," +
                    "semester INT," +
                    "faculty VARCHAR(255)," +
                    "subject VARCHAR(255)," +
                    "q1 INT, q2 INT, q3 INT, q4 INT, q5 INT, q6 INT," +
                    "q7 INT, q8 INT, q9 INT, q10 INT, q11 INT, q12 INT," +
                    "created_by VARCHAR(255)," +
                    "modified_by VARCHAR(255)," +
                    "created_datetime TIMESTAMP," +
                    "modified_datetime TIMESTAMP NULL" +
                    ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";

            String endSemSQL = "CREATE TABLE IF NOT EXISTS st_endsem_feedback (" +
                    "ID BIGINT PRIMARY KEY," +
                    "reg_no VARCHAR(50)," +
                    "student_name VARCHAR(255)," +
                    "branch VARCHAR(100)," +
                    "semester VARCHAR(50)," +
                    "faculty VARCHAR(255)," +
                    "subject VARCHAR(255)," +
                    "a1 INT, a2 INT, a3 INT, a4 INT, a5 INT, a6 INT, a7 INT," +
                    "b1 INT, b2 INT, b3 INT, b4 INT, b5 INT, b6 INT, b7 INT, b8 INT, b9 INT," +
                    "c1 INT, c2 INT, c3 INT, c4 INT, c5 INT, c6 INT," +
                    "created_by VARCHAR(255)," +
                    "modified_by VARCHAR(255)," +
                    "created_datetime TIMESTAMP," +
                    "modified_datetime TIMESTAMP NULL" +
                    ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";

            stmt.executeUpdate(midSemSQL);
            System.out.println("✓ Mid-Sem table created.");
            stmt.executeUpdate(endSemSQL);
            System.out.println("✓ End-Sem table created.");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCDataSource.closeConnection(conn);
        }
    }
}
