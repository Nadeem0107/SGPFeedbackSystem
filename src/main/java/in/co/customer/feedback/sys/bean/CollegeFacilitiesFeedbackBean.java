package in.co.customer.feedback.sys.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CollegeFacilitiesFeedbackBean extends BaseBean {

    private String program;
    private String academicYear;
    private String studentName;
    private int q1;
    private int q2;
    private int q3;
    private int q4;
    private int q5;
    private int q6;
    private int q7;
    private int q8;
    private int q9;
    private int q10;
    private int q11;
    private int q12;
    private int q13;
    private int q14;
    private String signature;

    @Override
    public String getKey() {
        return id + "";
    }

    @Override
    public String getValue() {
        return studentName;
    }

}
