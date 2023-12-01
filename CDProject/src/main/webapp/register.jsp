<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <title>Registration Page</title>
    <link rel="stylesheet" href="./assets/css/style.css">    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
</head>

<body>
    <div class="container">
        <h2>Registration Form</h2>
        <c:if test="${not empty errorMessage}">
        	<p style="color: red;">${errorMessage}</p>
    	</c:if>
        <form action="home" method="post" accept-charset="UTF-8">
        <input type="hidden" name="action" value="handle-register">
            <div class="form-group">
	            <label class="pad_top">First Name:</label>
		    	<input type="text" name="firstName" required /><br>
            </div>
            <div class="form-group">
	            <label class="pad_top">Last Name:</label>
	    		<input type="text" name="lastName" required /><br> 
            </div>
            <div class="form-group">
                <label class="pad_top">Email:</label>
	    		<input type="email" name="email" required /><br>
            </div>
            <div class="form-group">
                <label for="pad_top">Phone number:</label>
                <input type="text" name="phone" required /><br>
            </div>
            <div class="form-group">
                <label for="pad_top">Address:</label>
                <input type="text" name="address" required /><br>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" name="password" required /><br>
            </div>
            <div class="form-group">
                <label>&nbsp;</label>
	    		<input type="submit" id="btn" value="Register">
            </div>
        </form>
    </div>

</body>

</html>