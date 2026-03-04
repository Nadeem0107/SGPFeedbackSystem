package in.co.customer.feedback.sys.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TeacherBean extends BaseBean {

	private String name;
	private String price;
	private String description;
	private String image;

	@Override
	public String getKey() {
		return String.valueOf(id);
	}

	@Override
	public String getValue() {
		return name;
	}

}
