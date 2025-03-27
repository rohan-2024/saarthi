<%@page import="com.mavenproject1.entity.College"%>
<%@page import="java.util.List"%>
<%@page import="com.mavenproject1.dao.CollegeDao"%>
<%@page import="com.mavenproject1.helper.FactoryProduct"%>

<%@include file="components/mainheader.jsp" %>

<%@include file="components/message.jsp" %>

<%
    String code = null;
    code = request.getParameter("code");
    if (code != null) {
        CollegeDao cd = new CollegeDao(FactoryProduct.getFactory());
        List<College> list = cd.getAllCollegeByAISHE(code);              
%>

<!-- College Registration Form -->
<div class="container mt-5 mb-5">
    <div class="register-form p-0 rounded shadow" style="background-color: #333;">
        <!-- Logo inside the form with adjusted size -->
        <div class="text-center mb-4">
            <img src="images/logo.png" alt="Saarthi Logo" style="width: 150px; height: auto;">
        </div>
        <h2 class="text-center text-white mb-4">College Registration</h2>
        <form action="spocRegistration.jsp" method="post">
            <% if (list != null) { %>
                <div class="table-responsive">
                    <table id="myTable" class="table table-dark table-striped">
                        <thead>
                            <tr>
                                <th>Select</th>
                                <th>College Name</th>
                                <th>University Name</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                for (College c : list) {
                            %>
                            <tr>
                                <td><input type="radio" name="college" value="<%= c.getId() %>"></td>
                                <td><%= c.getCollegeName() %></td>
                                <td><%= c.getUniversityName() %></td>
                                <td>
                                    <button type="submit" class="btn btn-outline-success">Register</button>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            <% } else { %>
                <p class="text-center text-danger">Record not found</p>
            <% } %>
        </form>
    </div>
</div>

<% 
    } else {
%>

<!-- AISHE Code Form -->
<div class="container mt-5 mb-5">
    <div class="register-form p-4 rounded shadow" style="background-color: #333;">
        <div class="text-center mb-4">
            <img src="images/logo.png" alt="Saarthi Logo" style="width: 150px; height: auto;">
        </div>
        <h2 class="text-center text-white mb-4">Enter AISHE Code</h2>
        <form action="AISHE.jsp" method="post">
            <input type="text" class="form-control mb-3" name="code" placeholder="Enter AISHE Code">
            <button class="btn btn-primary btn-block" type="submit">Submit</button>
        </form>
        <p class="back-link text-center mt-3 text-white">Back to <a href="index.jsp" class="text-primary">Home</a></p>
    </div>
</div>

<% } %>

<%@include file="components/mainfooter.jsp" %>
