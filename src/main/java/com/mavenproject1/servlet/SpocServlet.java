/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mavenproject1.servlet;

import com.mavenproject1.dao.SpocDao;
import com.mavenproject1.entity.Spoc;
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
 */


@MultipartConfig
@WebServlet(name = "SpocServlet",urlPatterns ={"/SpocServlet"} )
public class SpocServlet extends HttpServlet {

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
            
            String type=request.getParameter("type");
            
             SpocDao sd=new SpocDao(FactoryProduct.getFactory());
           HttpSession h=request.getSession();
            if(type.equals("edit")){
                int id=Integer.parseInt(request.getParameter("id"));
                boolean status=Boolean.parseBoolean(request.getParameter("spocStatus"));
                
                sd.updateSpoc(id,status);
                 
            h.setAttribute("message", "Spoc status changed Successfully");
            response.sendRedirect("Admin/spoc.jsp");
            }
            else{
            String name=request.getParameter("name");
            String mobile=request.getParameter("mobile");
            String address=request.getParameter("address");
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            String college=request.getParameter("college");
            String university=request.getParameter("university");
            String AISHE=request.getParameter("AISHE");
            String DOR=request.getParameter("DOR");
            Part photo=request.getPart("photo");
            
            Spoc spoc=sd.checkCollegeSpoc(college);
            if(spoc==null){
            int i=college.indexOf("(Id");
            
            int id=sd.getLastId();
            String UID="U"+college.substring((i+5),(i+11))+DOR.substring(3,5)+DOR.substring(6,10)+id;
            
            Spoc s=new Spoc();
            
            s.setAddress(address);
            s.setAisheCode(AISHE);
            s.setCollege(college);
            s.setDateOfRegistration(DOR);
            s.setEmail(email);
            s.setMobile(mobile);
            s.setName(name);
            s.setPassword(password);
            s.setPhoto(photo.getSubmittedFileName());
            s.setUniversity(university);
            s.setUID(UID);
            s.setStatus(false);
            
            
            sd.saveSpoc(s);
            
               String path1=request.getServletContext().getRealPath("img")+File.separator+"spocPhoto"+File.separator+photo.getSubmittedFileName();
           try{
            FileOutputStream fos1=new FileOutputStream(path1);
            InputStream is1=photo.getInputStream();
            byte[] data1=new byte[is1.available()];
            is1.read(data1);
            fos1.write(data1);
            fos1.close();
            
           }catch(Exception e){
                e.printStackTrace();
            }
           
            
            h.setAttribute("message", "Thanks for registering your application is under review.");
            }else{
             h.setAttribute("message", "College already registered, Spoc email id: "+spoc.getEmail());
            }
            
            response.sendRedirect("AISHE.jsp");
            
        }
            
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
