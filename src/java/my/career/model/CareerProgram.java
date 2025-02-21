package my.career.model;

public class CareerProgram {

    private int id;
    private int career_id;
    private int program_id;

    public CareerProgram(int id, int careerId, int programId) {
        this.id = id;
        this.career_id = careerId;
        this.program_id = programId;
    }

    public int getId() {
        return id;
    }
}
