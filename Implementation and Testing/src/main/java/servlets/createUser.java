package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.concurrent.TimeUnit;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;

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
		String check = "yes";
		
		//create user
		Database db = new Database();
//		db.checkUser();
//		while(!db.finish) {
//			try {
//				TimeUnit.SECONDS.sleep(1);
//			} catch (InterruptedException e) {
//				e.printStackTrace();
//			}
//			if(db.finish) {
//				System.out.println("back");
//				break;
//			}
//		}
//		
//		for(int i = 0; i < db.prev.size(); i++) {
//			String all = db.prev.get(i);
//			String token[] = all.split("-");
//			if(token[0].equals(username)) {
//				System.out.println("user has been taken");
//				check = "no";
//				break;
//			}
//		}
		
		
		db.createUser(username, password);
		RequestDispatcher dispatch = request.getRequestDispatcher("Sign.jsp");
		if (!(dispatch == null)) {
			dispatch.forward(request,  response);
		}
		
	}


}
