/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mavenproject1.helper;

/**
 *
 * @author shahid
 */
public class Helper {
    public static String get10Words(String desc)
    {
        String[] strs=desc.split(" ");
        if(strs.length>5)
        {
            String resc="";
            for(int i=0;i<5;i++)
            {
               resc=resc+strs[i]+" ";
            }
            return (resc+"...");
        }else{
            return(desc+"...");
        }
    }
}
