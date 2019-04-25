package servlets;

import java.io.IOException;
import java.util.ArrayList;
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

/**
 * Servlet implementation class CheckLogin
 */
@WebServlet("/CheckLogin")
public class CheckLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String check = "no";
		
		Database db = new Database();
		db.finish = false;
		db.checkUser();
		while(!db.finish) {
			try {
				TimeUnit.SECONDS.sleep(1);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			if(db.finish) {
				System.out.println("back");
				break;
			}
		}
		
		String all = username + "-" + DigestUtils.sha256Hex(password);

		for(int i = 0; i < db.prev.size(); i++) {
			if(db.prev.get(i).equals(all)) {
				System.out.println("confirm");
				check = "yes";
			}
		}
		
		
		if(check.equals("yes")) {
			System.out.println("yes");
			RequestDispatcher dispatch = request.getRequestDispatcher("/GetUser?username=" + username + "&password=" + password);
			HttpSession session = request.getSession();
			session.setAttribute("error", "yes");
			if(dispatch != null) {
				dispatch.forward(request,  response);
			}
		}
		else {
			System.out.println("no");
			RequestDispatcher dispatch = request.getRequestDispatcher("Login.jsp?error=failed");
			HttpSession session = request.getSession();
			session.setAttribute("error", "no");
			if(dispatch != null) {
				dispatch.forward(request,  response);
			}
		}

		
	}



}
