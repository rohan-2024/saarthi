/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mavenproject1.servlet;

import com.mavenproject1.dao.AdminDao;
import com.mavenproject1.dao.SpocDao;
import com.mavenproject1.dao.StudentDao;
import com.mavenproject1.entity.Admin;
import com.mavenproject1.entity.Spoc;
import com.mavenproject1.entity.Student;
import com.mavenproject1.helper.FactoryProduct;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author LENOVO
 */
@WebServlet(name="LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
       
            
             String userId=request.getParameter("userId");
            String password=request.getParameter("password");
            
            AdminDao admindao=new AdminDao(FactoryProduct.getFactory());
            Admin admin =admindao.getAdminByIdandPassword(userId, password);
            
         
            
            SpocDao spocdao= new SpocDao(FactoryProduct.getFactory());
            Spoc spoc=spocdao.getSpocUIDandPassword(userId, password);
            StudentDao studentdao=new StudentDao(FactoryProduct.getFactory());
            Student student=studentdao.getStudentByStudentIdAndPassword(userId, password);
            
             HttpSession h=request.getSession();
             
             if(admin!=null){
                  h.setAttribute("current-user", admin);
            response.sendRedirect("Admin/profile.jsp");
             }
            
             else if(spoc!=null){
                 if(spoc.isStatus()){
                     h.setAttribute("current-user", spoc);
                     response.sendRedirect("Spoc/profile.jsp");
                 }else{
                     h.setAttribute("message", "You are not approved yet, Please contact admin for further information!");
                     response.sendRedirect("login.jsp");
            }
             }
             else if(student!=null){
                  h.setAttribute("current-user", student);
            response.sendRedirect("Student/profile.jsp");
             }
             
              else{
             h.setAttribute("message", "Invalid Credential ! Please check it ");
             response.sendRedirect("login.jsp");
             
             }
        }
        catch(Exception e){
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
