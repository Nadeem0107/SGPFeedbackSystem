package in.co.customer.feedback.sys.bean;

import java.sql.Timestamp;

import lombok.Data;

/**
 * BaseBean JavaBean encapsulates Generic attributes
 */

@Data
public abstract class BaseBean implements DropdownListBean {
	
	
	protected long id;
	protected String createdBy;
	protected String modifiedBy;
	protected Timestamp createdDatetime;
	protected Timestamp modifiedDatetime;

	
	
	
}
