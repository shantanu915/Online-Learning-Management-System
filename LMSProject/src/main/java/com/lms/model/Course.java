package com.lms.model;



public class Course {
    private int id;
    private String title;
    private String description;
    private String status; // e.g., "pending", "approved"
    private int instructorId;

    public Course() {}

    public Course(int id, String title, String description, String status, int instructorId) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.status = status;
        this.instructorId = instructorId;
    }

    // Getters and setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public int getInstructorId() {
        return instructorId;
    }
    public void setInstructorId(int instructorId) {
        this.instructorId = instructorId;
    }
}

