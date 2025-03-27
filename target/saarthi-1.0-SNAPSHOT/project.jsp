<%@include file="components/mainheader.jsp" %>


<!-- Search, Filter, and Sort -->
<div class="container mt-4 mb-2">
    <div class="row">
        <div class="col-md-4">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search" id="searchInput">
                <div class="input-group-append">
                    <button class="btn btn-primary" type="button" id="searchButton"><i class="fas fa-search"></i></button>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <select class="custom-select" id="filterSelect">
                <option value="all">All Categories</option>
                <option value="hardware">Hardware</option>
                <option value="software">Software</option>
            </select>
        </div>
        <div class="col-md-4">
            <div class="input-group">
                <div class="input-group-prepend">
                    <label class="input-group-text" for="sortSelect">Sort By:</label>
                </div>
                <select class="custom-select sort-dropdown" id="sortSelect">
                    <option value="name">Name</option>
                    <!-- Add more sorting options as needed -->
                </select>
            </div>
        </div>
    </div>
</div>

<!-- Project Title -->
<div class="container">
    <h2 class="text-center mb-4">All Projects</h2>
</div>

<!-- Project Cards Grid -->
<div class="container">
    <div class="row" id="projectCards">
        <!-- Sample Project Cards -->
        <div class="col-md-4">
            <div class="card project-card sample-card">
                <img src="images/robot.jpg" class="card-img-top card-img-fix" alt="Sample Project 1">
                <div class="card-body">
                    <h5 class="card-title sample-card-title">Sample Project 1</h5>
                    <p class="card-text"><strong>Student:</strong> John Doe</p>
                    <p class="card-text"><strong>Course:</strong> Computer Engineering</p>
                    <p class="card-text"><strong>College:</strong> ABC University</p>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#projectModal" data-details='{ "name": "Sample Project 1", "student": "John Doe", "course": "Computer Engineering", "college": "ABC University" }'>View Details</button>
                </div>
            </div>
        </div> <div class="col-md-4">
            <div class="card project-card sample-card">
                <img src="images/mobile.jpg" class="card-img-top card-img-fix" alt="Sample Project 1">
                <div class="card-body">
                    <h5 class="card-title sample-card-title">Sample Project 2</h5>
                    <p class="card-text"><strong>Student:</strong> John Doe</p>
                    <p class="card-text"><strong>Course:</strong> Computer Engineering</p>
                    <p class="card-text"><strong>College:</strong> ABC University</p>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#projectModal" data-details='{ "name": "Sample Project 1", "student": "John Doe", "course": "Computer Engineering", "college": "ABC University" }'>View Details</button>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card project-card sample-card">
                <img src="images/hardware.jpg" class="card-img-top card-img-fix" alt="Sample Project 2">
                <div class="card-body">
                    <h5 class="card-title sample-card-title">Sample Project 3</h5>
                    <p class="card-text"><strong>Student:</strong> Jane Smith</p>
                    <p class="card-text"><strong>Course:</strong> Software Engineering</p>
                    <p class="card-text"><strong>College:</strong> XYZ College</p>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#projectModal" data-details='{ "name": "Sample Project 2", "student": "Jane Smith", "course": "Software Engineering", "college": "XYZ College" }'>View Details</button>
                </div>
            </div>
        </div>
        <!-- Add more sample cards as needed -->
    </div>
</div>

<!-- Pagination -->
<div class="container mt-4 mb-2">
    <ul class="pagination justify-content-center">
        <li class="page-item">
            <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <!-- Add more page numbers as needed -->
        <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</div>

<!-- Project Modal -->
<div class="modal fade" id="projectModal" tabindex="-1" role="dialog" aria-labelledby="projectModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="projectModalLabel">Project Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h5 id="modalProjectName">Project Name</h5>
                <p id="modalStudentDetails">Student details...</p>
                <p id="modalCourseDetails">Course details...</p>
                <p id="modalCollegeDetails">College details...</p>
                <!-- Add more details as needed -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

  <%@include file="components/mainfooter.jsp" %>
