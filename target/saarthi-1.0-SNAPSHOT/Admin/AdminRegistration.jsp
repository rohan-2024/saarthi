

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <h1>Registration</h1>
        <form method="post" action="../AdminServlet" enctype="multipart/form-data">
            <label>Enter name</label><br>
        <input type="text" name="name"/><br>
        
        <label>Enter Address</label><br>
        <input type="text" name="address"/><br>
        
          <label>Enter Mobile</label><br>
        <input type="text" name="mobile"/><br>
        
          <label>Enter email name</label><br>
         <input type="email" name="email"/> <br>
         
           <label>Enter password name</label><br>
         <input type="password" name="password"/><br>
         
           <label>Upload photo</label><br>
         <input type="file" name="photo"/><br>
         
         
         <button type="submit">Submit</button>
        </form>
        
    </body>
</html>
