/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mavenproject1.servlet;


import com.mavenproject1.dao.AdminDao;
import com.mavenproject1.entity.Admin;
import com.mavenproject1.helper.FactoryProduct;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;


/**
 *
 * @author Swastik Computer
 */@MultipartConfig
@WebServlet(name="AdminServlet", urlPatterns = {"/AdminServlet"})
public class AdminServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
             String name =request.getParameter("name");
             String mobile =request.getParameter("mobile");
             String address =request.getParameter("address");
             String email=request.getParameter("email");
             String password = request.getParameter("password");
             Part photo=request.getPart("photo");
       
             AdminDao cd = new AdminDao(FactoryProduct.getFactory());
           Admin a =new Admin();
           
           a.setName(name);
           a.setAddress(address);
           a.setMobile(mobile);
           a.setEmail(email);
           a.setPassword(password);
           a.setPhoto(photo.getSubmittedFileName());
           
          cd.saveAdmin(a);
            String path1=request.getServletContext().getRealPath("img") + File.separator +"adminPhoto"+File.separator+photo.getSubmittedFileName();
       try{
           FileOutputStream fos1=new FileOutputStream(path1);
           InputStream is1= photo.getInputStream();
          byte[] data1= new byte[is1.available()];
          is1.read(data1);
          fos1.write(data1);
          fos1.close();
       }
      catch(Exception e){
          e.printStackTrace();
      }
       HttpSession h=request.getSession();
       h.setAttribute("message", "Registration successful, Please login");
           response.sendRedirect("login.jsp");
      
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
