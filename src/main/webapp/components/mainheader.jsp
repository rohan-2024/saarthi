<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Saarthi</title>
    <!-- Add Bootstrap CSS link here -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Add Font Awesome CSS link here -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">

    <style>
        /* Custom styles for dark mode */
body {
    background-color: #1f1f1f;
    color: #fff;
}

.navbar-brand img {
    width: 80px;
    height: auto;
    border: 2px solid black;
    padding: 5px;
    background-color: rgba(0, 0, 0, 0.5);
   }

 .navbar-brand .second-logo {
            width: 80px;
            height: auto;
            margin-left: 10px; /* Adjust the space between logos */
            border: 2px solid #fff;
            border-radius: 50%;
 }

/* Carousel styles */
.carousel-item {
    position: relative;
    height: 70vh;
    min-height: 300px;
    background: no-repeat center center scroll;
    background-size: cover;
}

.carousel-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5); /* Darker overlay */
}

.carousel-caption {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    color: #fff; /* Ensuring caption text is visible */
}

.carousel-caption img {
    width: 180px;
    height: auto;
    border: 3px solid #fff;
    padding: 10px;
    background-color: rgba(0, 0, 0, 0.4);
    border-radius: 50%;
    box-shadow: 1px 1px 20px silver;
}

.carousel-caption p {
    font-size: 1.2em;
    color: #fff;
}

/* Card styles (Featured Projects, Project Page, Login, AISHE) */
.card, .project-card, .login-signup-form, .register-form {
    transition: transform 0.3s, box-shadow 0.3s;
    border: none;
    border-radius: 15px;
    background-color: #343a40;
}

.card:hover, .project-card:hover, .login-signup-form:hover, .register-form:hover {
    transform: scale(1.05);
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

/* Fixing the card/image size */
.card-img-fix, .sample-card img, .creator-member img {
    height: 100px;
    object-fit: cover;

}

/* Card Title and Text */
.card-title, .sample-card-title {
    color: #f8f9fa;
}

.card-text {
    color: #d1d1d1;
}

/* Buttons */
.btn-primary, .btn-outline-success {
    background-color: #007bff;
    border-color: #007bff;
}

.btn-primary:hover, .btn-outline-success:hover {
    background-color: #0056b3;
    border-color: #0056b3;
}

/* Testimonials */
.testimonial {
    background-color: #212529;
    padding: 20px;
    border-radius: 15px;
    margin-bottom: 20px;
    text-align: center;
    height: 300px;
}

.testimonial:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.testimonial img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    margin-bottom: 10px;
    display: inline-block;
}

.testimonial p {
    font-size: 1.2em;
    color: #fff;
}

/* Login/Signup Form */
.login-signup-form, .register-form {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    background-color: #333;
}

.login-signup-form h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #fff;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    font-weight: bold;
}

.form-control {
    border-radius: 5px;
}

/* Footer */
footer {
    background: linear-gradient(to right, #343a40, #1f1f1f);
    color: #fff;
    padding: 20px 0;
    position: relative;
    clear: both;
}

footer .social-icons a {
    color: #fff;
    margin: 0 10px;
}

footer .social-icons a:hover {
    color: #007bff;
}

/* Search and Filter styles */
#searchFilter {
    margin: 20px 0;
}

/* Sort Dropdown styles */
.sort-dropdown {
    margin-left: 10px;
}

/* About and Creator Section */
header {
    background: linear-gradient(to right, #343a40, #1f1f1f);
    padding: 50px 0;
    text-align: center;
    color: #fff;
}

header h1 {
    font-size: 3em;
    font-weight: bold;
}

header img {
    width: 180px;
    height: auto;
}

.content {
    padding: 30px 0;
}

.content p {
    font-size: 1.2em;
    line-height: 1.6;
}

.creator-section {
    padding: 30px 0;
    text-align: center;
}

.creator-member {
    margin-bottom: 30px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100%;
}

.creator-member img {
    width: 150px;
    height: 150px;
    border-radius: 50%;
    margin-bottom: 15px;
    object-fit: cover;
    border: 5px solid #fff;
}

/* Contact Form */
#contact-form {
    background: linear-gradient(to right, #343a40, #1f1f1f);
    padding: 30px;
    border-radius: 15px;
    margin-top: 30px;
    transition: transform 0.3s, box-shadow 0.3s;
}

#contact-form:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

/* AISHE Page */
.back-link {
    text-align: center;
    margin-top: 20px;
    color: #ccc;
}

.back-link a {
    color: #007bff;
}

.back-link a:hover {
    text-decoration: underline;
}

/* Logo Styling for AISHE */
.logo {
    display: block;
    width: 180px;
    height: auto;
    border: 3px solid #fff;
    padding: 10px;
    background-color: rgba(0, 0, 0, 0.4);
    border-radius: 50%;
    box-shadow: 1px 1px 20px silver;
    margin: 0 auto 20px;
}

    </style>
</head>

<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">
            <img src="images/logo3.jpg" alt="Saarthi Logo"> <!-- Replace with your logo image path -->
            <img src="images/logo.png" alt="Rohan axis logo" class="second-logo">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="project.jsp">Projects</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about.jsp">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Login/Signup</a>
                </li>
            </ul>
        </div>
    </nav>
