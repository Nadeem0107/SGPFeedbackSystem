package model;

public class Faculty {

    private int facultyId;
    private String name;
    private String subject;

    // No-argument constructor
    public Faculty() {}

    // Parameterized constructor
    public Faculty(int facultyId, String name, String subject) {
        this.facultyId = facultyId;
        this.name = name;
        this.subject = subject;
    }

    // Getters and Setters
    public int getFacultyId() {
        return facultyId;
    }

    public void setFacultyId(int facultyId) {
        this.facultyId = facultyId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }
}
