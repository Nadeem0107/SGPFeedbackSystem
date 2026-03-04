package in.co.customer.feedback.sys.util;

import java.util.List;
import in.co.customer.feedback.sys.model.UserModel;
import in.co.customer.feedback.sys.bean.UserBean;

public class CheckUsers {
    public static void main(String[] args) {
        try {
            UserModel model = new UserModel();
            List<UserBean> list = model.list();
            System.out.println("User List:");
            for (UserBean bean : list) {
                System.out.println("ID: " + bean.getId() + ", Name: " + bean.getName() + ", Login: "
                        + bean.getUserName() + ", Password: " + bean.getPassword() + ", Role: " + bean.getRoleName());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
