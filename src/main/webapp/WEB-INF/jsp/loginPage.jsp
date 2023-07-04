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

    <title>Pet Shop - Log in with your account</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <style>
        .task-bar {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: left;
        }

        .task-bar .page-name {
            font-size: 20px;
            font-weight: bold;
            margin: 0;
        }

        .task-bar .sign-up-link {
            position: absolute;
            top: 20px;
            right: 20px;
            color: #fff;
            text-decoration: none;
        }

        .container {
            max-width: 3000px;
            margin-top: 40px;
            margin-bottom: 20px;
        }

        .form-heading {
            text-align: left;
            margin-bottom: 30px;
        }

        .form-signin {
            padding: 15px;
            background-color: #fff;
            border: 1px solid #e3e3e3;
            border-radius: 10px;
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

        .form-signin input[type="text"],
        .form-signin input[type="password"] {
            margin-bottom: 40px;

        }

        .form-signin .btn-block {
            margin-top: 40px;
             background-color:#1974D2;
             color:#fff;
             border: 1px solid #e3e3e3;
             margin-width: 60px;
              font-size: 20px;
  padding: 10px 20px;
             
             outline: none;
             
            
        }

        .form-signin .text-center {
            margin-top: 400px;
            margin-width: 500px;
        }

        .form-signin .form-label {
            display: block;
            margin-bottom: 50px;
            margin-width: 500px;
            font-weight: bold;
        }
    </style>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<div class="task-bar">
    <p class="page-name">Pet Shop</p>
    <a href="${contextPath}/" class="sign-up-link">Sign Up</a>
</div>

<div class="container">

    <form method="POST" action="${contextPath}/login" class="form-signin">
        <h1 class="form-heading">Login</h1>

        <div class="form-group ${error != null ? 'has-error' : ''}">
            <span>${message}</span><br>
            <br><label for="username" class="form-label">Name</label>
            <input id="username" name="username" type="text" class="form-control" placeholder="Username" autofocus="autofocus"/>
            <br><label for="password" class="form-label">Password</label>
            <input id="password" name="password" type="password" class="form-control" placeholder="Password"/>
            <span>${error}</span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

           <br> <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
            
        </div>
       

    </form>
    
    <c:if test="${param.success}">
    <div class="alert alert-success" role="alert">
        ${successMessage}
    </div>
</c:if>


</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
