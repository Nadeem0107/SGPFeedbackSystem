package in.co.customer.feedback.sys.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ComplaintBean extends BaseBean {

    private String program;
    private String academicYear;
    private String complaintType;
    private String subject;
    private String description;
    private String priority;
    private String status;
    private String targetRole;
    private String targetDepartment;

    @Override
    public String getKey() {
        return id + "";
    }

    @Override
    public String getValue() {
        return subject;
    }

}
