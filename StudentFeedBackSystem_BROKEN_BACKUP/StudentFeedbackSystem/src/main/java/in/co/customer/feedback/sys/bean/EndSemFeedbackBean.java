package in.co.customer.feedback.sys.bean;

/**
 * End-Sem Feedback Bean
 */
public class EndSemFeedbackBean extends BaseBean {

    private String regNo;
    private String studentName;
    private String branch;
    private String semester;
    private String faculty;
    private String subject;

    // Section A
    private int a1, a2, a3, a4, a5, a6, a7;
    // Section B
    private int b1, b2, b3, b4, b5, b6, b7, b8, b9;
    // Section C
    private int c1, c2, c3, c4, c5, c6;

    public String getRegNo() {
        return regNo;
    }

    public void setRegNo(String regNo) {
        this.regNo = regNo;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getFaculty() {
        return faculty;
    }

    public void setFaculty(String faculty) {
        this.faculty = faculty;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    // Getters and Setters for A
    public int getA1() {
        return a1;
    }

    public void setA1(int a1) {
        this.a1 = a1;
    }

    public int getA2() {
        return a2;
    }

    public void setA2(int a2) {
        this.a2 = a2;
    }

    public int getA3() {
        return a3;
    }

    public void setA3(int a3) {
        this.a3 = a3;
    }

    public int getA4() {
        return a4;
    }

    public void setA4(int a4) {
        this.a4 = a4;
    }

    public int getA5() {
        return a5;
    }

    public void setA5(int a5) {
        this.a5 = a5;
    }

    public int getA6() {
        return a6;
    }

    public void setA6(int a6) {
        this.a6 = a6;
    }

    public int getA7() {
        return a7;
    }

    public void setA7(int a7) {
        this.a7 = a7;
    }

    // Getters and Setters for B
    public int getB1() {
        return b1;
    }

    public void setB1(int b1) {
        this.b1 = b1;
    }

    public int getB2() {
        return b2;
    }

    public void setB2(int b2) {
        this.b2 = b2;
    }

    public int getB3() {
        return b3;
    }

    public void setB3(int b3) {
        this.b3 = b3;
    }

    public int getB4() {
        return b4;
    }

    public void setB4(int b4) {
        this.b4 = b4;
    }

    public int getB5() {
        return b5;
    }

    public void setB5(int b5) {
        this.b5 = b5;
    }

    public int getB6() {
        return b6;
    }

    public void setB6(int b6) {
        this.b6 = b6;
    }

    public int getB7() {
        return b7;
    }

    public void setB7(int b7) {
        this.b7 = b7;
    }

    public int getB8() {
        return b8;
    }

    public void setB8(int b8) {
        this.b8 = b8;
    }

    public int getB9() {
        return b9;
    }

    public void setB9(int b9) {
        this.b9 = b9;
    }

    // Getters and Setters for C
    public int getC1() {
        return c1;
    }

    public void setC1(int c1) {
        this.c1 = c1;
    }

    public int getC2() {
        return c2;
    }

    public void setC2(int c2) {
        this.c2 = c2;
    }

    public int getC3() {
        return c3;
    }

    public void setC3(int c3) {
        this.c3 = c3;
    }

    public int getC4() {
        return c4;
    }

    public void setC4(int c4) {
        this.c4 = c4;
    }

    public int getC5() {
        return c5;
    }

    public void setC5(int c5) {
        this.c5 = c5;
    }

    public int getC6() {
        return c6;
    }

    public void setC6(int c6) {
        this.c6 = c6;
    }

    @Override
    public String getKey() {
        return id + "";
    }

    @Override
    public String getValue() {
        return studentName;
    }
}
