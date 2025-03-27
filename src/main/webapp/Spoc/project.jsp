
<%@page import="com.mavenproject1.entity.Spoc"%>
<%@page import="com.mavenproject1.dao.SpocDao"%>
<%@page import="com.mavenproject1.entity.Student"%>
<%@page import="com.mavenproject1.dao.StudentDao"%>
<%@page import="com.mavenproject1.entity.Project"%>
<%@page import="java.util.List"%>
<%@page import="com.mavenproject1.dao.ProjectDao"%>
<%@page import="com.mavenproject1.helper.FactoryProduct"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            overflow-x: hidden;
        }

        /* Sidebar Styling */
        #sidebar {
            background-color: #343a40;
            height: 100vh;
            position: fixed;
            width: 250px;
            transition: all 0.3s ease;
            z-index: 1000;
        }

        #sidebar .sidebar-header {
            text-align: center;
            padding: 20px 0;
        }

        #sidebar .sidebar-header img {
            margin-bottom: 10px;
            width: 80px;
            height: 80px;
            border-radius: 50%;
        }

        #sidebar .nav-link {
            color: #bbb;
            font-size: 18px;
            padding: 15px 20px;
            border-bottom: 1px solid #444;
        }

        #sidebar .nav-link:hover,
        #sidebar .nav-link.active {
            background-color: #007bff;
            color: white;
            transition: background-color 0.3s;
        }

        #sidebar .nav-link i {
            margin-right: 10px;
        }

        /* Main Content Styling */
        main {
            margin-left: 250px;
            padding: 20px;
            transition: margin-left 0.3s ease;
        }

        /* Responsive Design */
        @media (max-width: 991px) {
            #sidebar {
                left: -250px;
            }

            #sidebar.active {
                margin-top: 35px;
                left: 0;
            }

            main {
                margin-left: 0;
            }
        }

        /* Modal Dialog Centering */
        .modal-dialog {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .modal-content {
            border-radius: 10px;
            width: 100%;
            max-width: 600px;
        }

        /* View Modal Styling */
        #viewModal .modal-body {
            text-align: center;
        }

        #viewModal .modal-body img {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            object-fit: cover;
            margin-bottom: 20px;
        }

        /* Edit Modal Styling */
        #editModal .modal-body {
            text-align: left;
        }

        /* Table styling */
        table {
            margin-top: 20px;
        }

        table th, table td {
            text-align: center;
            vertical-align: middle;
        }

        table tbody tr:hover {
            background-color: #f1f1f1;
            cursor: pointer;
        }

        .action-btns button {
            margin: 5px;
        }

        .rounded-img {
            border-radius: 50%;
            width: 50px;
            height: 50px;
            object-fit: cover;
        }
    </style>
</head>
<body>
                <%@include file="sidebar.jsp" %>
                <% ProjectDao pd = new ProjectDao(FactoryProduct.getFactory());
                    List<Project> list = pd.getAllProjectByCollegeID(spoc.getId());
                    StudentDao sd = new StudentDao(FactoryProduct.getFactory());
                    List<Student> studentlist = sd.getAllStudentByUID(spoc.getUID());
                    int approved = 0;
                    for (Project p : list) {
                        if (p.getStatus().equals("Approved")) {
                            approved = approved + 1;
                        }
                    }
                %>
                   
    <!-- Main Content -->
    <main>
        <div class="container-fluid">
            <div class="row mb-4">
                <div class="col-12 text-center">
                    <img src="logo.png" alt="Logo" class="img-fluid" width="150">
                    <p class="text-muted">Your Dashboard for Managing Projects</p>
                </div>
            </div>
            <h2 class="my-4">Project Management</h2>
            <div class="table-responsive">
                <%@include file="../components/message.jsp" %>
                       <!-- Register Button -->
           <div class="text-right mb-3">
    <button class="btn btn-success" data-toggle="modal" data-target="#registerModal">
        <i class="fas fa-upload"></i> Upload Project
    </button>
</div>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Sr.</th>
                            <th>Project ID</th>
                            <th>Title</th>
                            <th>Category</th>
                            <th>Submitted On</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Project Row Example -->
                          <%                  
                    for (Project p : list) {
                %>
                        <tr>
                          <td><%= p.getId()%></td>
                    <td><%= p.getProjectId()%> </td>
                    <td> <%= p.getTitle()%> </td>
                    <td> <%= p.getCategory()%> </td>
                    <td><%= p.getDOS()%> </td>
                            <td><span class="badge badge-success"><%= p.getStatus()%></span></td>
                            <td class="action-btns">
                                <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#viewModal<%= p.getId()%>" data-id="1">View</button>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        <!-- More Project Rows can be added here -->
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    
    <!-- View Modal -->
    <%
for (Project p : list) {
%>
    <div class="modal fade" id="viewModal<%= p.getId()%>" tabindex="-1" role="dialog" aria-labelledby="viewModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="viewModalLabel">View Project Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                   
                    <p><strong>Project Title:</strong> <%= p.getTitle()%></p>
                    <p><strong>Category:</strong> <%= p.getCategory()%></p>
                    <p><strong>Submitted On:</strong> <%= p.getDOS() %></p>
                     <%
            if (p.getLinks() != null) {
        %>
        <p><strong>Submitted link:</strong><a href="<%= p.getLinks()%>" target="_blank">Click here</a></p>
        <%
            }
        %>
       <p><strong>Project report:</strong><a href="../img/projectReports/<%= p.getProjectReport()%>" target="_blank">Click here</a></p>
       <p><strong>Consent letter:</strong><a href="../img/consentLetter/<%= p.getConsentLetter()%>" target="_blank">Click here</a></p>

                   <% Student s = sd.getStudentByStudentId(p.getStudent_id());
        %>
         <img src="../img/studentPhotos/<%= s.getPhoto()%>" alt="Student" class="rounded-img mb-3">
                    <hr>
                    <p><strong>Student Name:</strong> <%= s.getName()%></p>
                    <p><strong>Student ID:</strong> <%= s.getStudent_id()%></p>
                    <p><strong>Course: </strong> <%= s.getCourse()%></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
<%
    }
%>

   <!-- Upload Project Modal -->
<div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
                        <img src="../images/logo.png" style="height: 100px; width: 150px; margin-left: 150px;">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Upload Project</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="row g-3" action="../ProjectServlet" method="post" enctype="multipart/form-data">
                    <input type="text" value="add" hidden name="type">
                    <input type="text" name="College_id" hidden value="<%= spoc.getId() %>">
                    
                    <!-- Title Input -->
                    <div class="col-md-12">
                        <label for="title" class="form-label">Title</label>
                        <input name="title" type="text" class="form-control" id="title" required>
                    </div>
                    
                    <!-- Category Dropdown -->
                    <div class="col-md-12">
                        <label for="category" class="form-label">Category</label>
                        <select name="category" id="category" class="form-control" required>
                            <option selected>Choose...</option>
                            <option value="Software">Software</option>
                            <option value="Hardware">Hardware</option>
                            <option value="Research">Research</option>
                        </select>
                    </div>
                    
                    <!-- Description Input -->
                    <div class="col-md-12">
                        <label for="description" class="form-label">Description</label>
                        <input name="description" type="text" class="form-control" id="description" required>
                    </div>
                    
                    <!-- Project Report Upload -->
                    <div class="col-md-6">
                        <label for="document" class="form-label">Upload Project Report</label>
                        <input name="projectReport" type="file" class="form-control" id="document" required>
                    </div>
                    
                    <!-- Consent Letter Upload -->
                    <div class="col-md-6">
                        <label for="document1" class="form-label">Upload College Consent Letter</label>
                        <input name="consentLetter" type="file" class="form-control" id="document1" required>
                    </div>
                    
                    <!-- Project Links Input -->
                    <div class="col-md-12">
                        <label for="links" class="form-label">Add Links to your project (if any)</label>
                        <input name="links" type="text" class="form-control" id="links">
                    </div>
                    
                    <!-- Student Selection Table -->
                    <div class="col-md-12">
                        <h6 class="text-center">Choose Student</h6>
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Name</th>
                                    <th>Course</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                             <%
                                 for(Student s:studentlist){
                             %>
                                <tr>
                                    <td><img src="../img/studentPhotos/<%= s.getPhoto() %>" class="rounded-img" alt="Student Photo"></td>
                                    <td><%= s.getName() %></td>
                                    <td><%= s.getCourse() %></td>
                                    <td><input type="radio" value="<%= s.getStudent_id() %>" name="student_id" required></td>
                                </tr>
                               <%
                                   }
                               %>
                            </tbody>
                        </table>
                    </div>
                    
                    <!-- Submit Button -->
                    <div class="col-12 text-center">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const toggleSidebar = document.getElementById('toggleSidebar');
            const sidebar = document.getElementById('sidebar');

            toggleSidebar.addEventListener('click', () => {
                sidebar.classList.toggle('active');
            });
        });
    </script>
</body>
</html>
