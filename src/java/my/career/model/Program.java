package my.career.model;

public class Program {
    private int id;                // New id field
    private String programName;
    private String programDescription;
    private String entranceRequirement;

    // Constructor to initialize all fields
    public Program(int id, String programName, String programDescription, String entranceRequirement) {
        this.id = id;
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
                ", programName='" + programName + '\'' +
                ", programDescription='" + programDescription + '\'' +
                ", entranceRequirement='" + entranceRequirement + '\'' +
                '}';
    }
}
