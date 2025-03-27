

<%@include file="components/mainheader.jsp" %>
  
  <!-- Carousel/Slider Section -->
<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel" data-interval="3000">
    <div class="carousel-inner">
        <div class="carousel-item active" style="background-image: url('images/industry.jpg');">
            <div class="carousel-overlay"></div>
            <div class="carousel-caption">
                <img src="images/logo.png" alt="Saarthi Logo">
                <p>Showcasing Innovation and Creativity</p>
            </div>
        </div>
        <div class="carousel-item" style="background-image: url('images/meeting.jpg');">
            <div class="carousel-overlay"></div>
            <div class="carousel-caption">
                <img src="images/logo.png" alt="Saarthi Logo">
                <p>Showcasing Innovation and Creativity</p>
            </div>
        </div>
        <div class="carousel-item" style="background-image: url('images/network.jpg');">
            <div class="carousel-overlay"></div>
            <div class="carousel-caption">
                <img src="images/logo.png" alt="Saarthi Logo">
                <p>Showcasing Innovation and Creativity</p>
            </div>
        </div>
    </div>

    <!-- Next and Previous Buttons -->
    <a class="carousel-control-prev" href="#carouselExampleSlidesOnly" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleSlidesOnly" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>


    <!-- Featured Projects Section -->
    <div class="container mt-4">
        <h2 class="text-center mb-4">Featured Projects</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <img src="images/mobile.jpg" class="card-img-top card-img-fix" alt="Project 1">
                    <div class="card-body">
                        <h5 class="card-title">Smart Mobile App</h5>
                        <p class="card-text">A cutting-edge mobile app for task management with AI-powered recommendations.</p>
                        <a href="#" class="btn btn-primary">Learn More <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="images/watch.jpg" class="card-img-top card-img-fix" alt="Project 2">
                    <div class="card-body">
                        <h5 class="card-title">AI Smart Watch</h5>
                        <p class="card-text">An advanced smartwatch that tracks health and fitness with machine learning.</p>
                        <a href="#" class="btn btn-primary">Learn More <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="images/service.png" class="card-img-top card-img-fix" alt="Project 3">
                    <div class="card-body">
                        <h5 class="card-title">Home Automation System</h5>
                        <p class="card-text">An IoT-based system that lets you control home appliances remotely, compatible with voice assistants.</p>
                        <a href="#" class="btn btn-primary">Learn More <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Testimonials Section -->
    <div class="container mt-4">
        <h2 class="text-center mb-4">What Our Users Say</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="testimonial">
                    <img src="images/rohan_1.jpg" alt="User 1" class="img-fluid">
                    <p>"This platform has been a game-changer for showcasing our projects. It's user-friendly and visually appealing."</p>
                    <p class="text-right">- Rohan Singh</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="testimonial">
                    <img src="images/priya.jpg" alt="User 2" class="img-fluid">
                    <p>"I love the diversity of projects on this platform. It's a great place to discover and get inspired by others."</p>
                    <p class="text-right">- Priya Kumari</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="testimonial">
                    <img src="images/alex.jpg" alt="User 3" class="img-fluid">
                    <p>"Submitting my project here was easy, and the exposure it received was beyond my expectations."</p>
                    <p class="text-right">- Alex Kumar</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Contact Form Section -->
    <div class="container mt-4" id="contact-form">
        <h2 class="text-center mb-4">Contact Us</h2>
        <form>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" placeholder="Your Name">
                </div>
                <div class="form-group col-md-6">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="Your Email">
                </div>
            </div>
            <div class="form-group">
                <label for="message">Message</label>
                <textarea class="form-control" id="message" rows="4" placeholder="Your Message"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Send Message <i class="fas fa-paper-plane"></i></button>
        </form>
    </div>

    <!-- Additional Section Before Footer -->
    <div class="container mt-4">
        <h2 class="text-center mb-4">Explore More</h2>
        <div class="row">
            <div class="col-md-6">
                <div class="card mb-4">
                    <img src="images/lightbulb.jpg" class="card-img-top card-img-fix" alt="Additional Category 1">
                    <div class="card-body">
                        <h5 class="card-title">Innovative Ideas</h5>
                        <p class="card-text">Explore projects that push the boundaries of innovation and creativity. From technology to design, discover new ideas every day.</p>
                        <a href="#" class="btn btn-primary">Explore <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card mb-4">
                    <img src="images/create.jpg" class="card-img-top card-img-fix" alt="Additional Category 2">
                    <div class="card-body">
                        <h5 class="card-title">Creative Solutions</h5>
                        <p class="card-text">Browse through projects that showcase unique and creative solutions to everyday challenges. Find inspiration and ideas that make a difference.</p>
                        <a href="#" class="btn btn-primary">Explore <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

        
        <%@include file="components/mainfooter.jsp" %>
    