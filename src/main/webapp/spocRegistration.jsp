<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="com.mavenproject1.entity.College"%>
<%@page import="com.mavenproject1.dao.CollegeDao"%>
<%@page import="com.mavenproject1.helper.FactoryProduct"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int id = Integer.parseInt(request.getParameter("college"));
    CollegeDao cd = new CollegeDao(FactoryProduct.getFactory());
    College c = cd.getCollegeById(id);
    LocalDate currentDate = LocalDate.now();
    DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy");
    String DOR = currentDate.format(format);
%>

<%@include file="components/mainheader.jsp" %>

<!-- Custom Form Section -->
<div class="container mt-5 mb-5">
    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-sm-12">
            <div class="card" style="box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); border-radius: 15px; padding: 30px; background-color: #fff;">
                <div class="card-header text-center" style="background-color: #4CAF50; color: white; border-top-left-radius: 15px; border-top-right-radius: 15px;">
                    <!-- Logo Section -->
                    <img src="images/logo.png" alt="College Logo" style="max-width: 150px; margin-bottom: 20px;">
                    <h2 style="font-weight: bold;">SPOC Registration Form</h2>
                </div>
                <div class="card-body">
                    <form action="SpocServlet" method="post" enctype="multipart/form-data">
                        <input type="text" value="add" name="type" hidden>
                        <input type="text" hidden value="<%= DOR %>" class="form-control" name="DOR">
                        
                        <div class="row">
                            <!-- Left Column Form -->
                            <div class="col-md-6 mb-3">
                                <div class="form-group">
                                    <label for="name" style="font-weight: bold;">Full Name</label>
                                    <input type="text" name="name" class="form-control" id="name" placeholder="Enter your full name" required style="border-radius: 10px; box-shadow: none;">
                                </div>
                                <div class="form-group">
                                    <label for="address" style="font-weight: bold;">Address</label>
                                    <input type="text" name="address" class="form-control" id="address" placeholder="Enter your address" required style="border-radius: 10px; box-shadow: none;">
                                </div>
                                <div class="form-group">
                                    <label for="mobile" style="font-weight: bold;">Mobile Number</label>
                                    <input type="tel" name="mobile" class="form-control" id="mobile" placeholder="Enter your mobile number" required style="border-radius: 10px; box-shadow: none;">
                                </div>
                                <div class="form-group">
                                    <label for="email" style="font-weight: bold;">Email address</label>
                                    <input type="email" name="email" class="form-control" id="email" placeholder="Enter your email" required style="border-radius: 10px; box-shadow: none;">
                                </div>
                                <div class="form-group">
                                    <label for="password" style="font-weight: bold;">Password</label>
                                    <input type="password" name="password" class="form-control" id="password" placeholder="Enter your password" required style="border-radius: 10px; box-shadow: none;">
                                </div>
                            </div>

                            <!-- Right Column Form -->
                            <div class="col-md-6 mb-3">
                                <div class="form-group">
                                    <label for="college" style="font-weight: bold;">College</label>
                                    <input type="text" value="<%= c.getCollegeName() %>" class="form-control" readonly name="college" style="border-radius: 10px; box-shadow: none;">
                                </div>
                                <div class="form-group">
                                    <label for="university" style="font-weight: bold;">University</label>
                                    <input type="text" name="university" class="form-control" value="<%= c.getUniversityName() %>" readonly id="university" style="border-radius: 10px; box-shadow: none;">
                                </div>
                                <div class="form-group">
                                    <label for="code" style="font-weight: bold;">AISHE Code</label>
                                    <input type="text" value="<%= c.getAISHE() %>" readonly class="form-control" name="AISHE" style="border-radius: 10px; box-shadow: none;">
                                </div>
                                <div class="form-group">
                                    <label for="file" style="font-weight: bold;">Upload File</label>
                                    <input type="file" class="form-control" name="photo" required style="border-radius: 10px; box-shadow: none;">
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-primary" style="border-radius: 50px; padding: 12px 20px; font-size: 16px; background-color: #007bff; border: none; transition: background-color 0.3s ease;">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="components/mainfooter.jsp" %>
