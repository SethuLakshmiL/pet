<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>User Registration</title>
    <style >
    .task-bar {
  background-color: #333;
  color: #fff;
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 50px;
  padding: 0 20px;
}
.petshop-name {
  font-size: 24px;
}

.login-option {
  font-size: 18px;
  cursor: pointer;
  color: #fff;
}


        .form-signin .btn-block {
            margin-top: 40px;
             background-color:#1974D2;
             color:#fff;
             border: 1px solid #e3e3e3;
             margin-width: 20px;
             font-size: 20px;
  padding: 10px 20px;
             
             outline: none;
             
            
        }
        button.register {
  font-size: 70px;
  padding: 10px 20px;
}
        
         .form-signin .form-control {
        width:100%;
            position: relative;
            height: auto;
            
            -moz-box-sizing: border-box;
            box-sizing: border-box;
                        margin-width: 2000px;
            
            padding: 10px;
            font-size: 16px;
        }
    </style>
</head>
<body>
<div class="task-bar">
  <div class="petshop-name">PetShop</div>
  <a href="${contextPath}/login" class="login-option">Login</a>
</div>

<div class="container">

    <form:form method="POST" modelAttribute="userForm" class="form-signin">
        <h2 class="form-signin-heading">Register</h2>
        <spring:bind path="userName">
            <div class="form-group ${status.error ? 'has-error' : ''}">
            <span>${message}</span><br>
             <br><label for="userName">Name:</label><br>
             <br>   <form:input type="text" path="userName" class="form-control" placeholder="Name"
                            autofocus="true"></form:input>
                <form:errors path="userName"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="userPassword">
            <div class="form-group ${status.error ? 'has-error' : ''}">
             <br>  <label for="userPassword">Password:</label><br>
               <br> <form:input type="userPassword" path="userPassword" class="form-control" placeholder="Password"></form:input>
                <form:errors path="userPassword"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="ConfirmPassword">
            <div class="form-group ${status.error ? 'has-error' : ''}">
           <br>   <label for="confirmPassword">Confirm Password:</label><br>
               <br> <form:input type="password" path="ConfirmPassword" class="form-control"
                            placeholder="Confirm your password"></form:input>
                <form:errors path="ConfirmPassword"></form:errors>
            </div>
        </spring:bind>
         
        <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
        
    </form:form>

</div>


</body>
</html>