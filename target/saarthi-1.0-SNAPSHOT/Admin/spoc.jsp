
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
    <title>SPOC Management</title>
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

        /* Edit Modal (specific adjustments) */
        #editModal .modal-body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start; /* Align form fields below the image */
            text-align: center;
        }

        #editModal .modal-body img, #viewModal .modal-body img {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            object-fit: cover;
            margin-bottom: 20px;
            margin-left: 50px;
        } 
        
       

        /* Center the form content below the image */
        #editModal .modal-body form {
            width: 100%;
            max-width: 400px;
            text-align: left; /* Align form fields to the left */
        }

        /* Optional: Add some space between form fields */
        #editModal .modal-body .form-group {
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
                
                <% 
                    SpocDao spocdao=new SpocDao(FactoryProduct.getFactory());
                    List<Spoc> spocList=spocdao.getAllSpoc();
                    
                    int approved = 0;
                    for (Spoc s:spocList) {
                        if (s.isStatus()) {
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
                    <p class="text-muted">Your Dashboard for Managing SPOCs</p>
                </div>
            </div>
            <h2 class="my-4">SPOC Management</h2>
            <div class="table-responsive">
                 <%@include file="../components/message.jsp" %>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Sr.</th>
                            <th></th>
                            <th>Name</th>
                            <th>AISHE</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- SPOC Row Example -->
                         <%                  
                                        for (Spoc s:spocList) {
                          %>
                        <tr>
                       
                            <td><%= s.getId() %></td>
                            <td><img src="../img/spocPhoto/<%= s.getPhoto() %>" alt="SPOC" class="rounded-img"></td>
                             <td> <%= s.getName()  %> </td>
                             <td> <%= s.getAisheCode() %> </td>
                                <%
                                            if(s.isStatus()){
                                        %>
                                        <td><span class="badge badge-success">Approved</span></td>
                                         <%
                                            }else{
                                        %>
                                        <td><span class="badge badge-success">Pending</span></td>
                                           <%
                                            }
                                        %>
                            <td class="action-btns">
                                <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#viewModal<%= s.getId() %>" data-id="1">View</button>
                                <button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#editModal<%= s.getId() %>" data-id="1">Edit</button>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        <!-- More SPOC Rows can be added here -->
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <!-- View Modal -->
        
 <%            for (Spoc s : spocList) {
        %>
    <div class="modal fade" id="viewModal<%= s.getId() %>" tabindex="-1" role="dialog" aria-labelledby="viewModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="viewModalLabel">View SPOC Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <img src="../img/spocPhoto/<%= s.getPhoto()%>" alt="SPOC" class="img-fluid mb-3 modal-rounded-img">
                    <p><strong>Name:</strong> <%= s.getName()%></p>
                    <p><strong>AISHE:</strong> <%= s.getAisheCode() %></p>
                    <p><strong>Email</strong> <%= s.getEmail() %></p>
                    <p><strong>Address:</strong> <%= s.getAddress() %></p>
                    <p><strong>College:</strong> <%= s.getCollege() %></p>
                    
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
    <!-- Edit Modal -->
    
 <%            for (Spoc s : spocList) {
        %>
    <div class="modal fade" id="editModal<%= s.getId() %>" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <form action="../SpocServlet" method="post">
            <div class="modal-content">
                
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">Edit SPOC Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <img src="../img/spocPhoto/<%= s.getPhoto()%>" alt="SPOC" class="img-fluid mb-3 modal-rounded-img">
                
                          <input type="text" name="id" value="<%= s.getId() %>" hidden> 
                        <input type="text" name="type" value="edit" hidden> 
                        
                        <div class="form-group">
                            <label for="spocName">Name</label>
                            <input type="text" class="form-control" id="spocName" readonly value="<%= s.getName()%>">
                        </div>
                        <div class="form-group">
                            <label for="spocAISHE">AISHE</label>
                            <input type="text" class="form-control" id="spocAISHE" readonly value="<%= s.getAisheCode() %>">
                        </div>
                       
                         <div class="form-group">
                            <label for="spocEmail">Email</label>
                            <input type="text" class="form-control" id="spocEmail" readonly value=" <%= s.getEmail()%>">
                        </div>
                        <div class="form-group">
                            <label for="spocEmail">Address</label>
                            <input type="text" class="form-control" id="spocAddress" readonly value=" <%= s.getAddress() %>">
                        </div>
                        <div class="form-group">
                            <label for="spocEmail">College</label>
                            <input type="text" class="form-control" id="spocCollege" readonly value=" <%= s.getCollege() %>">
                        </div>
                        
                         <div class="form-group">
                            <label for="spocEmail">Status</label>
                             <%
                            if(s.isStatus()){
                        %>
                            <input type="text" class="form-control" id="spocStatus" readonly value="Approved">
                             <%
                             }else{
                         %><input type="text" class="form-control" id="spocStatus" readonly value="Pending">
                      <%
                          }
                      %>       
                        </div>
                        
                         
                        <div class="form-group">
                            <label for="spocStatus">Change Status</label>
                            <select class="form-control" id="spocStatus" name="spocStatus">
                                  <%
                            if(s.isStatus()){
                        %>
                                <option value="false">Pending</option>
                                 <%
                             }else{
                                 %>
                                <option value="true">Approve</option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save Changes</button>
                </div>
                
            </div>
            </form>
        </div>
    </div>
<%
    }
%>
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
