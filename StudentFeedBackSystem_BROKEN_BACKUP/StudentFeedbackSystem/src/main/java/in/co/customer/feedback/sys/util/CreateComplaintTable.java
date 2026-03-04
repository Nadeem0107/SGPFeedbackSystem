package in.co.customer.feedback.sys.util;

import java.sql.Connection;
import java.sql.Statement;

/**
 * Utility class to create the complaint table
 * Run this once to set up the complaint table in the database
 */
public class CreateComplaintTable {

    public static void main(String[] args) {
        Connection conn = null;
        Statement stmt = null;

        try {
            System.out.println("========================================");
            System.out.println("Creating Complaint Table...");
            System.out.println("========================================");

            // Get database connection
            conn = JDBCDataSource.getConnection();
            stmt = conn.createStatement();

            // Create complaint table
            String createTableSQL = "CREATE TABLE IF NOT EXISTS `complaint` (" +
                    "`id` bigint(20) NOT NULL," +
                    "`program` varchar(50) DEFAULT NULL," +
                    "`academicYear` varchar(20) DEFAULT NULL," +
                    "`complaintType` varchar(50) DEFAULT NULL," +
                    "`subject` varchar(255) DEFAULT NULL," +
                    "`description` text DEFAULT NULL," +
                    "`priority` varchar(20) DEFAULT NULL," +
                    "`status` varchar(20) DEFAULT 'Pending'," +
                    "`createdBy` varchar(50) DEFAULT NULL," +
                    "`modifiedBy` varchar(50) DEFAULT NULL," +
                    "`createdDatetime` timestamp NOT NULL DEFAULT current_timestamp()," +
                    "`modifiedDatetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()," +
                    "PRIMARY KEY (`id`)" +
                    ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";

            stmt.executeUpdate(createTableSQL);

            System.out.println("✓ Complaint table created successfully!");
            System.out.println("========================================");
            System.out.println();
            System.out.println("Next steps:");
            System.out.println("1. Build the project: mvn clean install");
            System.out.println("2. Run the application: mvn jetty:run");
            System.out.println("3. Access at: http://localhost:8080/CustomerFeedbackSystem");
            System.out.println("========================================");

        } catch (Exception e) {
            System.err.println("ERROR: Failed to create complaint table");
            System.err.println("Error message: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
