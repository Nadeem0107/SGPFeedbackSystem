package in.co.customer.feedback.sys.bean;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FeedbackBean extends BaseBean {
	
	
	private String feedback;
	private long productId;
	private String productName;
	private long userId;
	private String userName;
	private Date date;
	

	@Override
	public String getKey() {
		return null;
	}

	@Override
	public String getValue() {
		return null;
	}

}
