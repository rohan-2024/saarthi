<%@include file="components/mainheader.jsp" %>

<!-- Login/Signup Form -->
<div class="container mt-5 mb-5">
    <div class="login-signup-form p-4 rounded shadow" style="background-color: #333;">
        <!-- Logo inside the form with adjusted size -->
        <div class="text-center mb-4">
            <img src="images/logo.png" alt="Saarthi Logo" style="width: 150px; height: auto;">
        </div>
        <h2 class="text-center text-white mb-4">Login</h2>
        <%@include file="components/message.jsp" %>
        <form action="LoginServlet" method="post">
            <div class="form-group">
                <label for="userId" class="text-white">User Id</label>
                <input type="text" class="form-control" name="userId" id="userId" placeholder="Enter User Id">
            </div>
            <div class="form-group">
                <label for="loginPassword" class="text-white">Password</label>
                <input type="password" name="password" class="form-control" id="loginPassword" placeholder="Password">
            </div>
            <button type="submit" class="btn btn-primary btn-block">Login</button>
        </form>

        <p class="signup-link text-center text-white mt-3">Want to find your college? <a href="AISHE.jsp" class="text-primary">Click here</a></p>
    </div>
</div>

    <%@include file="components/mainfooter.jsp" %>
