package in.co.customer.feedback.sys.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ParentsFeedbackBean extends BaseBean {

    private String studentName;
    private String program;
    private String academicYear;
    private int q1;
    private int q2;
    private int q3;
    private int q4;
    private int q5;

    @Override
    public String getKey() {
        return id + "";
    }

    @Override
    public String getValue() {
        return studentName;
    }

}
