package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import objects.Database;
import objects.User;

/**
 * Servlet implementation class createUser
 */
@WebServlet("/createUser")
public class createUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public createUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		//create user
		Database db = new Database();
		db.createUser(username, password);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("Sign.jsp");
		if (!(dispatch == null)) {
			dispatch.forward(request,  response);
		}
	}


}
