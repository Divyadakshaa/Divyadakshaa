<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Registration</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
    background:url(https://www1.chester.ac.uk/sites/default/files/styles/hero/public/Events%20Management%20festival%20image.jpg?itok=eJ3k-5R6);
    margin: 0;
    padding: 0;
  }

  .container {
    width: 80%;
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }

  h1 {
    text-align: center;
    color: #333;
  }

  form {
    display: flex;
    flex-direction: column;
  }

  label {
    margin-bottom: 6px;
    color: #555;
  }

  input[type="text"] {
    padding: 10px;
    margin-bottom: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }

  input[type="submit"] {
    padding: 10px 20px;
    background-color: #333;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  input[type="submit"]:hover {
    background-color: #555;
  }
</style>
</head>
<body>
  <div class="container">
    <h1>Event Registration</h1>
    <form action="" method="post">
      <label for="name">Name:</label>
      <input type="text" id="name" name="name" required>
      <label for="email">Email:</label>
      <input type="text" id="email" name="email" required>
      <label for="phoneno">Phone number:</label>
      <input type="text" id="phoneno" name="phoneno" required>
      <label for="city">City:</label>
      <input type="text" id="city" name="city" required>
      <input type="submit" value="Register">
    </form>
  </div>
  <%if (request.getMethod().equalsIgnoreCase("post")) {
	    try {
	        String connectionURL = "jdbc:mysql://localhost:3306/eventregistration";
	        String dbUsername = "root"; // Provide your actual database username
	        String dbPassword = "Dakshu1235"; // Provide your actual database password

	        String name = request.getParameter("name");
	        String email = request.getParameter("email");
	        String phoneno = request.getParameter("phoneno");
	        String city = request.getParameter("city");

	        Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection connection = DriverManager.getConnection(connectionURL, dbUsername, dbPassword);

	        String SQLQuery = "insert into register (name, email, phoneno, city) values (?, ?, ?, ?)";
	        PreparedStatement ps = connection.prepareStatement(SQLQuery);

	        ps.setString(1, name);
	        ps.setString(2, email);
	        ps.setString(3, phoneno);
	        ps.setString(4, city);
	        
	        int x = ps.executeUpdate();
	        response.sendRedirect("selection.jsp");

	        ps.close();
	        connection.close();
	    } catch (Exception e) {
	        out.println(e.getMessage());
	    }
	}
 %>
</body>
</html>
