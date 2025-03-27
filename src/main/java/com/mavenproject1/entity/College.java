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
public class College {
     @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    
     private int id;
    private String stateName;
private String district;
private String universityType;
private String universityName;
private String AISHE;
private String collegeName;
private String collegeType;
private String address;
private String website;
private String management;
private String yearOfEstablishment;
private String specialisedIn;
private String location;
private String uploadYear;
private String surveyYear;

    public College() {
    }

    public College(String stateName, String district, String universityType, String universityName, String AISHE, String collegeName, String collegeType, String address, String website, String management, String yearOfEstablishment, String specialisedIn, String location, String uploadYear, String surveyYear) {
        this.stateName = stateName;
        this.district = district;
        this.universityType = universityType;
        this.universityName = universityName;
        this.AISHE = AISHE;
        this.collegeName = collegeName;
        this.collegeType = collegeType;
        this.address = address;
        this.website = website;
        this.management = management;
        this.yearOfEstablishment = yearOfEstablishment;
        this.specialisedIn = specialisedIn;
        this.location = location;
        this.uploadYear = uploadYear;
        this.surveyYear = surveyYear;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStateName() {
        return stateName;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getUniversityType() {
        return universityType;
    }

    public void setUniversityType(String universityType) {
        this.universityType = universityType;
    }

    public String getUniversityName() {
        return universityName;
    }

    public void setUniversityName(String universityName) {
        this.universityName = universityName;
    }

    public String getAISHE() {
        return AISHE;
    }

    public void setAISHE(String AISHE) {
        this.AISHE = AISHE;
    }

    public String getCollegeName() {
        return collegeName;
    }

    public void setCollegeName(String collegeName) {
        this.collegeName = collegeName;
    }

    public String getCollegeType() {
        return collegeType;
    }

    public void setCollegeType(String collegeType) {
        this.collegeType = collegeType;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getManagement() {
        return management;
    }

    public void setManagement(String management) {
        this.management = management;
    }

    public String getYearOfEstablishment() {
        return yearOfEstablishment;
    }

    public void setYearOfEstablishment(String yearOfEstablishment) {
        this.yearOfEstablishment = yearOfEstablishment;
    }

    public String getSpecialisedIn() {
        return specialisedIn;
    }

    public void setSpecialisedIn(String specialisedIn) {
        this.specialisedIn = specialisedIn;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getUploadYear() {
        return uploadYear;
    }

    public void setUploadYear(String uploadYear) {
        this.uploadYear = uploadYear;
    }

    public String getSurveyYear() {
        return surveyYear;
    }

    public void setSurveyYear(String surveyYear) {
        this.surveyYear = surveyYear;
    }

    @Override
    public String toString() {
        return "College{" + "id=" + id + ", stateName=" + stateName + ", district=" + district + ", universityType=" + universityType + ", universityName=" + universityName + ", AISHE=" + AISHE + ", collegeName=" + collegeName + ", collegeType=" + collegeType + ", address=" + address + ", website=" + website + ", management=" + management + ", yearOfEstablishment=" + yearOfEstablishment + ", specialisedIn=" + specialisedIn + ", location=" + location + ", uploadYear=" + uploadYear + ", surveyYear=" + surveyYear + '}';
    }


    
}
