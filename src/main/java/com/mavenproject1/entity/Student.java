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
public class Student {
     @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
     private int  id;
     private String name;
     private String mobile;
     private String address;
     private String email;
     private String gender;
     private String collegeName;
     private String course;
     private String UID;
     private String DOR; //date of registration
     private String photo;
     private String student_id;
     private String password;
     
    public Student() {
    }

    public Student(String name, String mobile, String address, String email, String gender, String collegeName, String course, String UID, String DOR, String photo, String student_id, String password) {
        this.name = name;
        this.mobile = mobile;
        this.address = address;
        this.email = email;
        this.gender = gender;
        this.collegeName = collegeName;
        this.course = course;
        this.UID = UID;
        this.DOR = DOR;
        this.photo = photo;
        this.student_id = student_id;
        this.password = password;
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getCollegeName() {
        return collegeName;
    }

    public void setCollegeName(String collegeName) {
        this.collegeName = collegeName;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getUID() {
        return UID;
    }

    public void setUID(String UID) {
        this.UID = UID;
    }

    public String getDOR() {
        return DOR;
    }

    public void setDOR(String DOR) {
        this.DOR = DOR;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Student{" + "id=" + id + ", name=" + name + ", mobile=" + mobile + ", address=" + address + ", email=" + email + ", gender=" + gender + ", collegeName=" + collegeName + ", course=" + course + ", UID=" + UID + ", DOR=" + DOR + ", photo=" + photo + ", student_id=" + student_id + ", password=" + password + '}';
    }

    

   
}
