
<%@page import="com.mavenproject1.dao.SpocDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mavenproject1.dao.StudentDao"%>
<%@page import="com.mavenproject1.helper.FactoryProduct"%>
<%@page import="com.mavenproject1.entity.Student"%>
<%@page import="com.mavenproject1.entity.Spoc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management</title>
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
            max-width: 500px;
        }

        /* View Modal Styling */
        #viewModal .modal-body {
            display: block;
            text-align: center;
        }

        #viewModal .modal-body img {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            object-fit: cover;
            margin-bottom: 20px;
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

        /* Rounded image */
        .rounded-img {
            border-radius: 50%;
            width: 50px;
            height: 50px;
            object-fit: cover;
        }

        /* Badge styling */
        .badge {
            font-size: 14px;
        }
    </style>
</head>
<body>
                <%@include file="sidebar.jsp" %>

                <%    StudentDao sd = new StudentDao(FactoryProduct.getFactory());

                    List<Student> list = sd.getAllStudentByUID(spoc.getUID());
                    int noOfStudents = list.size();
                %>


 <!-- Main Content -->
    <main>
        <div class="container-fluid">
            <div class="row mb-4">
                <div class="col-12 text-center">
                    <img src="logo.png" alt="Logo" class="img-fluid" width="150">
                    <p class="text-muted">Your Dashboard for Managing Students</p>
                </div>
            </div>
            <h2 class="my-4">Student Management</h2>
            <div class="table-responsive">
         
                 <%@include file="../components/message.jsp" %>
                              <!-- Register Button -->
            <div class="mb-3 text-right">
                <button class="btn btn-success" data-toggle="modal" data-target="#registerModal">Register Student</button>
            </div>
                <table class="table table-bordered table-striped">
                    <thead>
                        
                        <tr>
                            <th>Sr.</th>
                            <th></th>
                            <th>Name</th>
                            <th>Student ID</th>
                            <th>UID</th>
                            <th>Registration Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Student Row Example -->
                         <%
                                        for (Student s : list) {
                                    %>
                        <tr>
                            <td><%= s.getId()%></td>
                            <td><img src="../img/studentPhotos/<%= s.getPhoto()%>" alt="Student" class="rounded-img"></td>
                             <td><%= s.getName()%> </td>
                                        <td> <%= s.getStudent_id()%> </td>
                                        <td><%= s.getUID()%> </td>
                                        <td><%= s.getDOR()%> </td>

                            <td class="action-btns">
                                <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#viewModal<%= s.getId()%>" data-id="1">View</button>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        <!-- More Student Rows can be added here -->
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <!-- View Modal -->
         <%            for (Student s : list) {
        %>
    <div class="modal fade" id="viewModal<%= s.getId()%>" tabindex="-1" role="dialog" aria-labelledby="viewModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="viewModalLabel">View Student Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <img src="../img/studentPhotos/<%= s.getPhoto( )%>" alt="Student" class="img-fluid mb-3">
                    <p><strong>Name:</strong> <%= s.getName() %></p>
                    <p><strong>Student ID:</strong> <%= s.getStudent_id() %></p>
                    <p><strong>Email:</strong> <%= s.getEmail() %></p>
                    <p><strong>Course:</strong> <%=s.getCourse() %></p>
                    <p><strong>College</strong> <%= s.getCollegeName() %></p>
                 
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

    <!-- Register Modal -->
     <div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                                   <img src="../images/logo.png" style="height: 100px; width: 150px; margin-left: 150px;">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="registerModalLabel">Student Registration</h1>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form class="row g-3" action="../StudentServlet" method="post" enctype="multipart/form-data">
                        <input type="text" value="123" hidden name="password">
                        <input type="text" value="<%= spoc.getUID()%>" hidden name="UID">
                        <div class="col-md-6">
                            <label for="fullName" class="form-label">Full Name</label>
                            <input type="text" name="name" class="form-control" id="fullName">
                        </div>
                        <div class="col-md-6">
                            <label for="collegeName" class="form-label">College Name</label>
                            <input type="text" value="<%= spoc.getCollege()%>" name="collegeName" class="form-control" id="collegeName" readonly>
                        </div>
                        <div class="col-md-6">
                            <label for="course" class="form-label">Course</label>
                            <input type="text" name="course" class="form-control" id="course">
                        </div>
                        <div class="col-md-6">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" id="email">
                        </div>
                        <div class="col-md-6">
                            <label for="mobileNumber" class="form-label">Mobile Number</label>
                            <input type="text" name="mobile" class="form-control" id="mobileNumber">
                        </div>
                        <div class="col-md-6">
                            <label for="address" class="form-label">Address</label>
                            <input type="text" name="address" class="form-control" id="address">
                        </div>
                        <div class="col-md-4">
                            <label for="gender" class="form-label">Gender</label>
                            <input type="text" name="gender" class="form-control" id="gender">
                        </div>
                        <div class="col-md-8">
                            <label for="document" class="form-label">Document</label>
                            <input type="file" name="photo" class="form-control" id="document">
                        </div>
                        <div class="col-12">
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
