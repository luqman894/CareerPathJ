package my.career.model;

public class Program {
    private int id;                // New id field
    private int programId;         // Existing programId field
    private String programName;
    private String programDescription;
    private String entranceRequirement;

    // Constructor to initialize all fields
    public Program(int id, int programId, String programName, String programDescription, String entranceRequirement) {
        this.id = id;
        this.programId = programId;
        this.programName = programName;
        this.programDescription = programDescription;
        this.entranceRequirement = entranceRequirement;
    }

    // Getters and Setters for all fields
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProgramId() {
        return programId;
    }

    public void setProgramId(int programId) {
        this.programId = programId;
    }

    public String getProgramName() {
        return programName;
    }

    public void setProgramName(String programName) {
        this.programName = programName;
    }

    public String getProgramDescription() {
        return programDescription;
    }

    public void setProgramDescription(String programDescription) {
        this.programDescription = programDescription;
    }

    public String getEntranceRequirement() {
        return entranceRequirement;
    }

    public void setEntranceRequirement(String entranceRequirement) {
        this.entranceRequirement = entranceRequirement;
    }

    // Optional: Override toString() for better display
    @Override
    public String toString() {
        return "Program{" +
                "id=" + id +
                ", programId=" + programId +
                ", programName='" + programName + '\'' +
                ", programDescription='" + programDescription + '\'' +
                ", entranceRequirement='" + entranceRequirement + '\'' +
                '}';
    }
}
