/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mavenproject1.servlet;

import com.mavenproject1.dao.ProjectDao;
import com.mavenproject1.entity.Project;
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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author LENOVO
 */@MultipartConfig
@WebServlet(name="ProjectServlet", urlPatterns = {"/ProjectServlet"})
public class ProjectServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
          String type=request.getParameter("type");
          
            HttpSession h=request.getSession();
             ProjectDao pd=new ProjectDao(FactoryProduct.getFactory());
             Project p=new Project();
            if(type.equals("add")){
                
             int College_id=Integer.parseInt(request.getParameter("College_id"));
            String title=request.getParameter("title");
            String description=request.getParameter("description");
            String category=request.getParameter("category");
            String student_id=request.getParameter("student_id");
            String links=request.getParameter("links");
            Part projectReport=request.getPart("projectReport");
            Part consentLetter=request.getPart("consentLetter");
            
            String projectId="P"+pd.getLastId();
                
      LocalDate currentDate=LocalDate.now();
      DateTimeFormatter format=DateTimeFormatter.ofPattern("dd-MM-yyyy");
      String DOS=currentDate.format(format);
     
      
      p.setCategory(category);
      p.setCollege_id(College_id);
      p.setConsentLetter(consentLetter.getSubmittedFileName());
      p.setProjectReport(projectReport.getSubmittedFileName());
      p.setDOS(DOS);
      p.setDescription(description);
      p.setLinks(links);
      p.setProjectId(projectId);
      p.setStatus("Submitted");
      p.setStudent_id(student_id);
      p.setTitle(title);
      
      pd.saveProject(p);
      
      
      
      
       String path1=request.getServletContext().getRealPath("img")+File.separator+"projectReports"+File.separator+projectReport.getSubmittedFileName();
       String path2=request.getServletContext().getRealPath("img")+File.separator+"consentLetter"+File.separator+consentLetter.getSubmittedFileName();
       
       try{
            FileOutputStream fos1=new FileOutputStream(path1);
            InputStream is1=projectReport.getInputStream();
            byte[] data1=new byte[is1.available()];
            is1.read(data1);
            fos1.write(data1);
            fos1.close();
            
            FileOutputStream fos2=new FileOutputStream(path2);
            InputStream is2=consentLetter.getInputStream();
            byte[] data2=new byte[is2.available()];
            is2.read(data2);
            fos2.write(data2);
            fos2.close();
            
           }catch(Exception e){
                e.printStackTrace();
            }
       
        h.setAttribute("message", "Project Uploaded Successfully");
       response.sendRedirect("Spoc/project.jsp");
        }else if(type.equals("update")){
            
              int id=Integer.parseInt(request.getParameter("id"));
            String reviewedBy=request.getParameter("reviewedBy");
            String status=request.getParameter("status");
            
            pd.updateProject(id, reviewedBy, status);
             h.setAttribute("message", "Project Updated Successfully");
       response.sendRedirect("Admin/project.jsp");
        }
      
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
