
<%@page import="com.mavenproject1.entity.Project"%>
<%@page import="com.mavenproject1.dao.ProjectDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mavenproject1.entity.Spoc"%>
<%@page import="com.mavenproject1.entity.Student"%>
<%@page import="com.mavenproject1.dao.StudentDao"%>
<%@page import="com.mavenproject1.dao.SpocDao"%>
<%@page import="com.mavenproject1.helper.FactoryProduct"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
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
    </style>
</head>
<body>
     
    
                <%@include file="sidebar.jsp" %>
                <%    
                    ProjectDao pd = new ProjectDao(FactoryProduct.getFactory());
                    List<Project> projectList = pd.getAllProjectByStudentId(student.getStudent_id());
                    int approved = 0;
                    int pending = 0;
                    for (Project p : projectList) {
                        if (p.getStatus().equals("Approved")) {
                            approved = approved + 1;
                        } else {
                            pending = pending + 1;
                        }
                    }
                %>        


    <!-- Main Content -->
    <main>
        <div class="container-fluid">
            <div class="row mb-4">
                <!-- Logo Above Cards -->
                <div class="col-12 text-center">
                    <img src="logo.png" alt="Logo" class="img-fluid" width="150">
                    <p class="text-muted">Your Dashboard for Managing Projects</p>
                </div>
            </div>
            <h2 class="my-4">Dashboard</h2>
            <div class="row">
               
                <div class="col-md-3 mb-4">
                    <div class="card shadow-sm text-center">
                        <div class="card-body">
                            <i class="fas fa-project-diagram text-success"></i>
                            <h5 class="card-title mt-3">Total Projects</h5>
                            <p class="card-text"><%= projectList.size()%></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card shadow-sm text-center">
                        <div class="card-body">
                            <i class="fas fa-users text-info"></i>
                            <h5 class="card-title mt-3">Pending Projects</h5>
                            <p class="card-text"><%= pending %></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card shadow-sm text-center">
                        <div class="card-body">
                            <i class="fas fa-check-circle text-warning"></i>
                            <h5 class="card-title mt-3">Approved Projects</h5>
                            <p class="card-text"><%= approved%></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

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