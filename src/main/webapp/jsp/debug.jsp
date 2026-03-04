<%@page import="java.sql.*" %>
    <%@page import="in.co.customer.feedback.sys.util.JDBCDataSource" %>
        <html>

        <body>
            <h2>Debug Database</h2>
            <% Connection conn=null; try { conn=JDBCDataSource.getConnection(); Statement stmt=conn.createStatement();
                try { ResultSet rs=stmt.executeQuery("SELECT count(*) FROM st_feedback"); if(rs.next()) { %>
                <p>st_feedback count: <%= rs.getInt(1) %>
                </p>
                <% } rs.close(); rs=stmt.executeQuery("SELECT * FROM st_feedback"); %>
                    <table border="1">
                        <tr>
                            <th>ID</th>
                            <th>TeacherID</th>
                            <th>StudentName</th>
                            <th>Knowledge</th>
                        </tr>
                        <% while(rs.next()) { %>
                            <tr>
                                <td>
                                    <%= rs.getLong(1) %>
                                </td>
                                <td>
                                    <%= rs.getLong(2) %>
                                </td>
                                <td>
                                    <%= rs.getString(4) %>
                                </td>
                                <td>
                                    <%= rs.getInt(5) %>
                                </td>
                            </tr>
                            <% } %>
                    </table>
                    <% rs.close(); } catch(Exception e) { %>
                        <p>Error querying st_feedback: <%= e.getMessage() %>
                        </p>
                        <% e.printStackTrace(); } } catch(Exception e) { %>
                            <p>Connection/General Error: <%= e.getMessage() %>
                            </p>
                            <% e.printStackTrace(); } finally { if(conn !=null) { JDBCDataSource.closeConnection(conn);
                                } } %>
        </body>

        </html>
