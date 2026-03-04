package in.co.customer.feedback.sys.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CourseEndFeedbackBean extends BaseBean {

    private String coordinator;
    private String sem;
    private String sec;
    private String program;
    private String courseName;
    private String courseCode;
    private String academicYear;
    private String regNo;
    private String studentName;
    private int co1;
    private int co2;
    private int co3;
    private int co4;
    private int co5;
    private int co6;

    @Override
    public String getKey() {
        return id + "";
    }

    @Override
    public String getValue() {
        return studentName;
    }

}
