<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- myPetsPage.jsp -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <title>My Pets</title>
    <style>
        .task-bar {
            background-color: #333;
            color: #fff;
            display: flex;
            align-items: center;
            height: 50px;
            padding: 0 20px;
        }

        .petshop-name {
            font-size: 24px;
        }

        .home-button,
        .mypet-button,
        .addpet-button {
            background-color: #333;
            color: #fff;
            border: none;
            padding: 10px 20px;
            margin-left: 10px;
            border-radius: 4px;
            cursor: pointer;
        }
     
.container {
        text-align: center;
        margin-top: 50px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
table {
        width: 50%;
        margin-top: 20px;
        border-collapse: collapse;
        border: 3px solid #ccc;
       
        
        
    }

    table td {
        padding: 10px;
        background-color:#fff;
        font-size:20px;
        text-align:left;
    }
    
table th {
        background-color: #000;
        color: white;
        padding: 10px;
        text-align:left;
    }
  
        
        .logout-button {
            position: absolute;
            top: 17px;
            right: 20px;
            font-size:25px;
            cursor: pointer;
            color:#fff;
        }
    </style>
</head>
<body>
    <div class="task-bar">
        <div class="petshop-name">PetShop</div>
        <a href="${contextPath}/welcome" class="home-button">Home</a>
        <a href="${contextPath}/myPets" class="mypet-button">My Pets</a>
        <a href="${contextPath}/add" class="addpet-button">Add Pets</a>
       <a href ="${contextPath}/logout" class="logout-button">Logout</a>
			
    </div>


      <form method="post" action="${pageContext.request.contextPath}/myPets">
     
    <table border = "1">
    <tr>
      <th>Pet ID</th>
      <th>Pet Name</th>
      <th>Pet Age</th>
      <th>Pet Place</th>
     
    </tr>
   <c:forEach var="pet" items="${boughtPets}">

      <tr>
      <td><c:out value="${pet.petId}"></td></c:out>
      <td><c:out value="${pet.petName}" ></td></c:out>
     <td> <c:out value="${pet.petAge}" ></td></c:out>
      <td><c:out value="${pet.petPlace}" ></td></c:out>
      </tr>
    </c:forEach>
    </form>
  </table>
 
</body>
</html>
