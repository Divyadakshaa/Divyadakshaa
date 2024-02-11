import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/RegServlet")
public class RegServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       Connection con = null;
        PrintWriter out = response.getWriter();
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            	
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventregistration", "root", "Dakshu1235");
            
            // Assuming there's an "events" table with columns "event_id" and "event_name"
            String sql = "SELECT name,email,phoneno,city FROM register";
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            response.setContentType("text/html");
            out.println("<html><body><h2>REGISTRATION DETAILS</h2>");

            // Iterate through the result set and display event details
            while (resultSet.next()) {
                String name= resultSet.getString("name");
                String email = resultSet.getString("email");
                String phoneno = resultSet.getString("phoneno");
                String city = resultSet.getString("city");
               
                out.println("<div><p>name: " +name + "</p><p> email: " + email+ "</p><p>phoneno: " + phoneno+ "</p><p>city:" + city + "</p></div><br>");
            }
            
            con.close();

            out.println("</body></html>");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("An error occurred while processing your request."+e.getMessage());
        } 
    }
}