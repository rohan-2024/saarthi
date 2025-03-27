      
<%@page import="com.mavenproject1.entity.Student"%>
<%@page import="com.mavenproject1.dao.SpocDao"%>
<%@page import="com.mavenproject1.entity.Spoc"%>
<%@page import="com.mavenproject1.helper.FactoryProduct"%>
<%
    Student student = (Student) session.getAttribute("current-user");
%>
  <!-- Navbar -->
    <nav class="navbar navbar-dark bg-dark fixed-top">
        <button class="btn btn-dark d-lg-none" id="toggleSidebar">
            <i class="fas fa-bars"></i>
        </button>
        <a class="navbar-brand mx-auto d-lg-none" href="#">Student Dashboard</a>
    </nav>

    <!-- Sidebar -->
    <nav id="sidebar">
        <div class="sidebar-header text-center">
             <div style="margin-bottom: 10px;">
                <img src="../images/logo3.jpg" alt="Rohan Axis Logo" class="img-fluid" style="border-radius: 0%; width: 120px; height: 50px;">
            </div>
            <img src="../img/studentPhotos/<%= student.getPhoto()%>" alt="Admin" class="img-fluid">
            <h4 class="text-white"><%= student.getName()%></h4>
        </div>
        <ul class="nav flex-column">
            <li class="nav-item"><a href="profile.jsp" class="nav-link"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li class="nav-item"><a href="project.jsp" class="nav-link"><i class="fas fa-cogs"></i> Project Management</a></li>
            <li class="nav-item"><a href="../LogoutServlet" class="nav-link"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </nav>
