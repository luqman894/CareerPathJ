/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package my.career.model;

/**
 *
 * @author Luqman
 */
public class Career {
    private int careerId;         // Career ID
    private String careerName;    // Career Name
    private String description;   // Career Description

    // Constructor to initialize all fields
    public Career(int careerId, String careerName, String description) {
        this.careerId = careerId;
        this.careerName = careerName;
        this.description = description;
    }

    // Getter and Setter for careerId
    public int getCareerId() {
        return careerId;
    }

    public void setCareerId(int careerId) {
        this.careerId = careerId;
    }

    // Getter and Setter for careerName
    public String getCareerName() {
        return careerName;
    }

    public void setCareerName(String careerName) {
        this.careerName = careerName;
    }

    // Getter and Setter for description
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    // Optional: toString method for easy printing of the Career object
    @Override
    public String toString() {
        return "Career{" +
                "careerId=" + careerId +
                ", careerName='" + careerName + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}

