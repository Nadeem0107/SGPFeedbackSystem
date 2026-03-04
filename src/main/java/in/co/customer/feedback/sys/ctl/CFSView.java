package in.co.customer.feedback.sys.ctl;

public interface CFSView {

	public String APP_CONTEXT = "/StudentFeedbackSystem";

	public String PAGE_FOLDER = "/jsp";

	public String ERROR_VIEW = PAGE_FOLDER + "/ErrorView.jsp";

	public String USER_VIEW = PAGE_FOLDER + "/UserView.jsp";
	public String USER_LIST_VIEW = PAGE_FOLDER + "/userList.jsp";
	public String USER_REGISTRATION_VIEW = PAGE_FOLDER + "/userRegistration.jsp";

	public String LOGIN_VIEW = PAGE_FOLDER + "/login.jsp";

	public String GET_IMAGE_VIEW = PAGE_FOLDER + "/getImage.jsp";

	public String TEACHER_VIEW = PAGE_FOLDER + "/teacher.jsp";
	public String TEACHER_LIST_VIEW = PAGE_FOLDER + "/teacherList.jsp";

	public String FEEDBACK_LIST_VIEW = PAGE_FOLDER + "/feedbackList.jsp";

	public String TEACHERS_LIST_VIEW = PAGE_FOLDER + "/userTeacherList.jsp";

	public String TEACHER_DETAIL_VIEW = PAGE_FOLDER + "/teacherDetail.jsp";

	public String STATUS_VIEW = PAGE_FOLDER + "/status.jsp";

	public String WELCOME_VIEW = PAGE_FOLDER + "/welcome.jsp";

	public String CHANGE_PASSWORD_VIEW = PAGE_FOLDER + "/changePassword.jsp";

	public String MY_PROFILE_VIEW = PAGE_FOLDER + "/myProfile.jsp";

	public String FORGET_PASSWORD_VIEW = PAGE_FOLDER + "/forgetPassword.jsp";

	public String ERROR_CTL = APP_CONTEXT + "/ctl/ErrorCtl";

	public String USER_CTL = APP_CONTEXT + "/ctl/user";
	public String USER_LIST_CTL = APP_CONTEXT + "/ctl/userList";

	public String FEEDBACK_LIST_CTL = APP_CONTEXT + "/ctl/feedbackList";

	public String TEACHER_DETAIL_CTL = APP_CONTEXT + "/ctl/teacherDetail";

	public String TEACHER_CTL = APP_CONTEXT + "/ctl/teacher";
	public String TEACHER_LIST_CTL = APP_CONTEXT + "/ctl/teacherList";

	public String TEACHERS_LIST_CTL = APP_CONTEXT + "/ctl/teachers";

	public String STATUS_CTL = APP_CONTEXT + "/ctl/status";

	public String USER_REGISTRATION_CTL = APP_CONTEXT + "/registration";
	public String LOGIN_CTL = APP_CONTEXT + "/login";
	public String WELCOME_CTL = APP_CONTEXT + "/welcome";
	public String LOGOUT_CTL = APP_CONTEXT + "/login";

	public String CHANGE_PASSWORD_CTL = APP_CONTEXT + "/ctl/changePassword";

	public String MY_PROFILE_CTL = APP_CONTEXT + "/ctl/myProfile";

	public String FORGET_PASSWORD_CTL = APP_CONTEXT + "/forgetPassword";

	public String RESET_PASSWORD_VIEW = PAGE_FOLDER + "/resetPassword.jsp";
	public String RESET_PASSWORD_CTL = APP_CONTEXT + "/resetPassword";

	public String TEACHER_FEEDBACK_CTL = APP_CONTEXT + "/ctl/teacherFeedback";
	public String TEACHER_FEEDBACK_LIST_CTL = APP_CONTEXT + "/ctl/teacherFeedbackList";

	public String TEACHER_FEEDBACK_VIEW = PAGE_FOLDER + "/teacherFeedback.jsp";
	public String TEACHER_FEEDBACK_LIST_VIEW = PAGE_FOLDER + "/teacherFeedbackList.jsp";

	public String COLLEGE_FACILITIES_FEEDBACK_VIEW = PAGE_FOLDER + "/collegeFacilitiesFeedback.jsp";
	public String COURSE_END_FEEDBACK_VIEW = PAGE_FOLDER + "/courseEndFeedback.jsp";
	public String PARENTS_FEEDBACK_VIEW = PAGE_FOLDER + "/parentsFeedback.jsp";

	public String COLLEGE_FACILITIES_FEEDBACK_CTL = APP_CONTEXT + "/ctl/collegeFacilitiesFeedback";
	public String COURSE_END_FEEDBACK_CTL = APP_CONTEXT + "/ctl/courseEndFeedback";
	public String PARENTS_FEEDBACK_CTL = APP_CONTEXT + "/ctl/parentsFeedback";

	public String COLLEGE_FACILITIES_FEEDBACK_LIST_VIEW = PAGE_FOLDER + "/collegeFacilitiesFeedbackList.jsp";
	public String COURSE_END_FEEDBACK_LIST_VIEW = PAGE_FOLDER + "/courseEndFeedbackList.jsp";
	public String PARENTS_FEEDBACK_LIST_VIEW = PAGE_FOLDER + "/parentsFeedbackList.jsp";

	public String COLLEGE_FACILITIES_FEEDBACK_LIST_CTL = APP_CONTEXT + "/ctl/collegeFacilitiesFeedbackList";
	public String COURSE_END_FEEDBACK_LIST_CTL = APP_CONTEXT + "/ctl/courseEndFeedbackList";
	public String PARENTS_FEEDBACK_LIST_CTL = APP_CONTEXT + "/ctl/parentsFeedbackList";

	public String COMPLAINT_VIEW = PAGE_FOLDER + "/complaint.jsp";
	public String COMPLAINT_LIST_VIEW = PAGE_FOLDER + "/complaintList.jsp";

	public String COMPLAINT_CTL = APP_CONTEXT + "/ctl/complaint";
	public String COMPLAINT_LIST_CTL = APP_CONTEXT + "/ctl/complaintList";

	public String MID_SEM_FEEDBACK_VIEW = PAGE_FOLDER + "/midSem-Feedback.jsp";
	public String MID_SEM_FEEDBACK_LIST_VIEW = PAGE_FOLDER + "/midSem-FeedbackList.jsp";
	public String MID_SEM_FEEDBACK_CTL = APP_CONTEXT + "/ctl/midSemFeedback";
	public String MID_SEM_FEEDBACK_LIST_CTL = APP_CONTEXT + "/ctl/midSemFeedbackList";

	public String END_SEM_FEEDBACK_VIEW = PAGE_FOLDER + "/endSem-Feedback.jsp";
	public String END_SEM_FEEDBACK_LIST_VIEW = PAGE_FOLDER + "/endSem-FeedbackList.jsp";
	public String END_SEM_FEEDBACK_CTL = APP_CONTEXT + "/ctl/endSemFeedback";
	public String END_SEM_FEEDBACK_LIST_CTL = APP_CONTEXT + "/ctl/endSemFeedbackList";

}
