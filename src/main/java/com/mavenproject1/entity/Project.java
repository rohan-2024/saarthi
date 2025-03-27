/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mavenproject1.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

/**
 *
 * @author Atifa
 */
@Entity
public class Project {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    
    private int id;
    private String title;
    private String description;
    private String category;
    private String DOS;//Date of submission
    private String student_id;
    private String status;
    private String links;
    private String projectReport;
    private String projectId;
    private String reviewedBy;
    private String consentLetter;
    private int College_id;

    
    public Project() {
    }
    
    public Project(String title, String description, String category, String DOS, String student_id, String status, String links, String projectReport, String projectId, String reviewedBy, String consentLetter, int College_id) {
        this.title = title;
        this.description = description;
        this.category = category;
        this.DOS = DOS;
        this.student_id = student_id;
        this.status = status;
        this.links = links;
        this.projectReport = projectReport;
        this.projectId = projectId;
        this.reviewedBy = reviewedBy;
        this.consentLetter = consentLetter;
        this.College_id = College_id;
    }

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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDOS() {
        return DOS;
    }

    public void setDOS(String DOS) {
        this.DOS = DOS;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getLinks() {
        return links;
    }

    public void setLinks(String links) {
        this.links = links;
    }

    public String getProjectReport() {
        return projectReport;
    }

    public void setProjectReport(String projectReport) {
        this.projectReport = projectReport;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getReviewedBy() {
        return reviewedBy;
    }

    public void setReviewedBy(String reviewedBy) {
        this.reviewedBy = reviewedBy;
    }

    public String getConsentLetter() {
        return consentLetter;
    }

    public void setConsentLetter(String consentLetter) {
        this.consentLetter = consentLetter;
    }

    public int getCollege_id() {
        return College_id;
    }

    public void setCollege_id(int College_id) {
        this.College_id = College_id;
    }

    @Override
    public String toString() {
        return "Project{" + "id=" + id + ", title=" + title + ", description=" + description + ", category=" + category + ", DOS=" + DOS + ", student_id=" + student_id + ", status=" + status + ", links=" + links + ", projectReport=" + projectReport + ", projectId=" + projectId + ", reviewedBy=" + reviewedBy + ", consentLetter=" + consentLetter + ", College_id=" + College_id + '}';
    }
   
}
