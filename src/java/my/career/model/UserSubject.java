package my.career.model;

public class UserSubject {

    private int user_subject_id;
    private String subject_id;
    private String subject_grade;

    public UserSubject(int id, String subjectName, String grade) {
        this.user_subject_id = id;
        this.subject_id = subjectName;
        this.subject_grade = grade;
    }

    public int getId() {
        return user_subject_id;
    }

    public String getSubjectName() {
        return subject_id;
    }

    public String getGrade() {
        return subject_grade;
    }
}
