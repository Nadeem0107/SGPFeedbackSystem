package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Feedback;

public class FeedbackDAO {

    public void saveFeedback(int rating, String comments, String faculty) {
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO feedback (rating, comments, faculty) VALUES (?,?,?)"
            );
            ps.setInt(1, rating);
            ps.setString(2, comments);
            ps.setString(3, faculty);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Feedback> getAllFeedback() {
        List<Feedback> list = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM feedback");

            while (rs.next()) {
                Feedback f = new Feedback();
                f.setRating(rs.getInt("rating"));
                f.setComments(rs.getString("comments"));
                f.setFaculty(rs.getString("faculty"));
                list.add(f);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
