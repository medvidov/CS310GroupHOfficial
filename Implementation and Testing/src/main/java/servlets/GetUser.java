package servlets;

import java.io.IOException;

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
 * Servlet implementation class GetUser
 */
@WebServlet("/GetUser")
public class GetUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Database db = new Database();
		//get user ba
		User myuser = db.getUser(username, password);
		//System.out.println(myuser.username);
		//System.out.println(myuser.uid);
		Gson gson = new Gson();
		
		//set into session
		HttpSession session = request.getSession();
		session.setAttribute("userObj", myuser);
		String userJSON =  gson.toJson(myuser);
		session.setAttribute("user", userJSON);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("Search.jsp");
		if (!(dispatch == null)) {
			dispatch.forward(request,  response);
		}
		
	}

	

}
