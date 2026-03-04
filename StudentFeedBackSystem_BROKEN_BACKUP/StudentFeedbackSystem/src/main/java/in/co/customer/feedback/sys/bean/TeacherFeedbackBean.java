package in.co.customer.feedback.sys.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TeacherFeedbackBean extends BaseBean {

    private long teacherId;
    private long studentId;
    private String studentName;
    
    // Ratings 1-5
    private int knowledgeRating; // Subject Knowledge
    private int communicationRating; // Communication Skill
    private int methodologyRating; // Teaching Methodology
    private int punctualityRating; // Punctuality and Discipline
    private int overallRating; // Overall Rating
    
    private String comments;

    @Override
    public String getKey() {
        return String.valueOf(id);
    }

    @Override
    public String getValue() {
        return String.valueOf(teacherId);
    }
}
