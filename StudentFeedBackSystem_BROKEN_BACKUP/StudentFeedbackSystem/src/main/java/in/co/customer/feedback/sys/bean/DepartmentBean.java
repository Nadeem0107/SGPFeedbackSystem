package in.co.customer.feedback.sys.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DepartmentBean extends BaseBean {

    private String name;
    private String description;

    @Override
    public String getKey() {
        return String.valueOf(id);
    }

    @Override
    public String getValue() {
        return name;
    }

}
