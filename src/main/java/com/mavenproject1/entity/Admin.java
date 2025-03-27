/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mavenproject1.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

/**
 *
 * @author Swastik Computer
 */


@Entity
public class Admin {
     @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private int id;
      private String name;
      private String mobile;
      private String address;
      private String email;
       private String photo;
      private String password;

    public Admin() {
    }

    public Admin(String name, String mobile, String address, String email, String photo, String password) {
        this.name = name;
        this.mobile = mobile;
        this.address = address;
        this.email = email;
        this.photo = photo;
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

    @Override
    public String toString() {
        return "Admin{" + "id=" + id + ", name=" + name + ", mobile=" + mobile + ", address=" + address + ", email=" + email + ", photo=" + photo + ", password=" + password + '}';
    }
    
}
