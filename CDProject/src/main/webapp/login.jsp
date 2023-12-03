<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Welcome back!</title>
    <link rel="stylesheet" href="./assets/css/style.css">    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
</head>

<body>
    <div class="container">
        <h2>Login Form</h2>
        <c:if test="${not empty errorMessage}">
            <p style="color: red;">${errorMessage}</p>
        </c:if>
        <form action="home" method="post" accept-charset="UTF-8">
        <input type="hidden" name="action" value="handle-login">
            <div class="form-group">
                <label class="pad_top">Email:</label>
	    		<input type="email" name="email" required/><br>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" name="password" required><br>
            </div>
            <div class="form-group" style="display: flex; justify-content: center;">
	    		<input type="submit" id="btn" value="Login">
            </div>
            <div class="form-group" style="text-align: center;">
	    		<a href="home?action=dang-ky" style="text-decoration: none;">Đăng ký tài khoản mới</a>
            </div>    
        </form>
    </div>
</body>

</html>