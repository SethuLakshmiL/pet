<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

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

<title>Home Page</title>

 
<style>
table {
	margin: 0 auto;
	border-collapse: collapse;
	width: 80%;
}

th, td {
	padding: 8px;
	text-align: left;
}

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

.home-button {
	background-color: #333;
	color: #fff;
	border: none;
	padding: 10px 20px;
	margin-left: 10px;
	border-radius: 4px;
	cursor: pointer;
}

.mypet-button {
	background-color: #333;
	color: #fff;
	border: none;
	padding: 10px 20px;
	margin-left: 10px;
	margin-right: 10px;
	border-radius: 4px;
	cursor: pointer;
}

.addpet-button {
	background-color: #333;
	color: #fff;
	border: none;
	padding: 10px 20px;
	margin-left: 10px;
	margin-right: 10px;
	border-radius: 4px;
	cursor: pointer;
}
.logout-button {
           background-color: #333;
	color: #fff;
	border: none;
	padding: 10px 20px;
	margin-left: 800px;
	margin-right: 10px;
	border-radius: 15px;
	cursor: pointer;
	font-size :20px;
        }
</style>

</head>
<body>
	<div class="task-bar">
		<div class="petshop-name">PetShop</div>
		
			
		<a href="${contextPath}/welcome" class="home-button">Home</a> <a
			href="${contextPath}/myPets" class="mypet-button">My Pets</a> <a
			href="${contextPath}/add" class="addpet-button">Add Pets</a>
			<a href ="${contextPath}/logout" class="logout-button">Logout</a>
			
	</div>
<form method="post" action="${pageContext.request.contextPath}/welcome">
    
    <c:if test="${not empty errorMsg}">
        <p style="color:red">${errorMsg}</p>
    </c:if>
	<br />
	<br />
 <span>${message}</span><br>

		<table border="1">
			<tr>
			<th>Pet Id</th>
    <th>Pet Name</th>
    <th>Pet Age</th>
    <th>Pet Place</th>
     
            <th>Status</th>
            <th>Action</th>
  </tr>
  
  <c:forEach items="${pets}" var="pet">
    <tr>
    <td><c:out value="${pet.petId}"></c:out>
      <td><c:out value="${pet.petName}" ></td></c:out>
     <td> <c:out value="${pet.petAge}" ></td></c:out>
      <td><c:out value="${pet.petPlace}" ></td></c:out>
       
                <td><c:out value="${pet.sold ? 'Sold' : 'Available'}" ></td></c:out>
               <c:choose>
					<c:when test="${pet.sold}">
						<td>Sold Out</td>
					</c:when>
					<c:otherwise>
						<td>
							<a href="${contextPath}/buyPet/${pet.petId}" class="buy-button">Buy</a>


						</td>
					</c:otherwise>
				</c:choose>
                </tr>
    </tr>
  </c:forEach>
</table>
</form>


    
    
	
		
		
		
	
	<c:if test="${pageContext.request.userPrincipal.name != null}">
            <form id="logoutForm" method="POST" action="${contextPath}/logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
            <div class="logout-button">
                <a onclick="document.forms['logoutForm'].submit()">Logout</a>
            </div>
        </c:if>
		</body>
</html>
