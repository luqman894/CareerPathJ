package my.career.model;

public class Application {
    private int applicationId;
    private int userId;
    private Program programId1;
    private Program programId2;
    private Program programId3;
    private String applicationDate;
    private String applicationStatus;

    public Application(int applicationId, int userId, Program programId1, Program programId2, Program programId3, String applicationDate, String applicationStatus) {
        this.applicationId = applicationId;
        this.userId = userId;
        this.programId1 = programId1;
        this.programId2 = programId2;
        this.programId3 = programId3;
        this.applicationDate = applicationDate;
        this.applicationStatus = applicationStatus;
    }

    public int getApplicationId() { return applicationId; }
    public int getUserId() { return userId; }
    public Program getProgram1() { return programId1; }
    public Program getProgram2() { return programId2; }
    public Program getProgram3() { return programId3; }
    public String getApplicationDate() { return applicationDate; }
    public String getApplicationStatus() { return applicationStatus; }
}
