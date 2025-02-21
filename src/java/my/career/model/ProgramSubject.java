package my.career.model;

public class ProgramSubject {

    private int id;
    private int program_id;
    private int subject_id;

    public ProgramSubject(int id, int programId, int subjectId) {
        this.id = id;
        this.program_id = programId;
        this.subject_id = subjectId;
    }

    public int getId() {
        return id;
    }
}
