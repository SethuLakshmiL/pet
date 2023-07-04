<!DOCTYPE html>
<html>
<head>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Add pets</title>
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
        background-color: grey;
        color: white;
        padding: 10px;
        text-align:left;
    }
    
   .addpetbutton,.cancelbutton.btn-block {
        margin-top: 10px;
        
        margin-left:200px;
        padding: 10px 10px;
        border: 1px solid #e3e3e3;
        color:#fff;
        background-color:#1974D2;
        text-align:center;
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
       
    </div>


      <form method="post" action="${pageContext.request.contextPath}/add">
      <table>
    <table border="1">
        <tr>
            <th colspan="2">
                <h2>Pet Information</h2>
            </th>
        </tr>
              
            <td><label for="petName">Name:</label></td>
            <td><input type="text" id="petName" name="petName" required></td>
        </tr>
        <tr>
            <td><label for="petAge">Age:</label></td>
            <td><input type="text" id="petAge" name="petAge" required></td>
        </tr>
        <tr>
            <td><label for="petPlace">Place:</label></td>
            <td><input type="text" id="petPlace" name="petPlace" required></td>
        </tr>
         
            <tr>
            <td colspan="2">
                               <input type="submit" value="Add Pet" name="submit" />
                    <input type="button" value="Cancel" name="cancel" onclick="window.location.href='${contextPath}/add'" />


            </td>
        </tr>
    </table>
        </table>
        </form>
    </div>
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
