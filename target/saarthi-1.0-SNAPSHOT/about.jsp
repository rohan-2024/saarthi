
<%@include file="components/mainheader.jsp" %>

    <!-- Header Section -->
    <header>
        <h1>About Us</h1>
        <img src="images/logo.png" alt="Saarthi Logo">
        <p>Discover the story behind Saarthi, by Rohan Singh.</p>
    </header>

    <!-- Main Content Section -->
    <div class="container content">
        <p>Welcome to Saarthi, where creativity meets innovation. This platform is a reflection of my passion and vision. With a deep interest in technology, design, and user experience, I have poured heart and soul into creating this platform that aims to connect creators with a global audience.</p>

        <p>At Saarthi, I believe in the power of diverse perspectives. Although this project has been developed by me, it is meant to serve as a community where all voices are welcome, and all ideas have the potential to flourish. The vision is to build a space that fosters collaboration and drives innovation.</p>

        <p>Join me on this exciting journey as we continue to grow, connect, and innovate. Every project tells a story, and every creator has a voice in this ever-evolving platform.</p>
    </div>

    <!-- Creater Section -->
    <div class="container creator-section">
        <h2 class="text-center mb-4">Meet the Creator</h2>
        <div class="row justify-content-center"> <!-- Added justify-content-center to center the content -->
            <div class="col-md-4 text-center"> <!-- Added text-center to center content inside the column -->
                <img src="images/rohan_1.jpg" alt="Rohan Singh" class="img-fluid rounded-circle" style="width: 150px; height: 150px;">

                <h4>Rohan Singh</h4>
                <p>Creator & Developer</p>
            </div>
        </div>
    </div>
    

    <!-- Contact Form Section -->
    <div class="container" id="contact-form">
        <h2 class="text-center mb-4">Contact Me</h2>
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

    <%@include file="components/mainfooter.jsp" %>
