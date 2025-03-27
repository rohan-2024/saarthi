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
public class Spoc {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
      private int id;
      private String name;
      private String mobile;
      private String address;
      private String email;
      private String college;
      private String university;
      private String aisheCode;
      private String UID;
      private String dateOfRegistration;
      private String photo;
      private String password;
      private boolean status;

    public Spoc() {
    }

    public Spoc(String name, String mobile, String address, String email, String college, String university, String aisheCode, String UID, String dateOfRegistration, String photo, String password, boolean status) {
        this.name = name;
        this.mobile = mobile;
        this.address = address;
        this.email = email;
        this.college = college;
        this.university = university;
        this.aisheCode = aisheCode;
        this.UID = UID;
        this.dateOfRegistration = dateOfRegistration;
        this.photo = photo;
        this.password = password;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public String getAisheCode() {
        return aisheCode;
    }

    public void setAisheCode(String aisheCode) {
        this.aisheCode = aisheCode;
    }

    public String getUID() {
        return UID;
    }

    public void setUID(String UID) {
        this.UID = UID;
    }

    public String getDateOfRegistration() {
        return dateOfRegistration;
    }

    public void setDateOfRegistration(String dateOfRegistration) {
        this.dateOfRegistration = dateOfRegistration;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Spoc{" + "id=" + id + ", name=" + name + ", mobile=" + mobile + ", address=" + address + ", email=" + email + ", college=" + college + ", university=" + university + ", aisheCode=" + aisheCode + ", UID=" + UID + ", dateOfRegistration=" + dateOfRegistration + ", photo=" + photo + ", password=" + password + ", status=" + status + '}';
    }

    
    
       
}

