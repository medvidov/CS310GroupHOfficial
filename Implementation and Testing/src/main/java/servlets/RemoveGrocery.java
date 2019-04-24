package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import objects.User;

/**
 * Servlet implementation class RemoveGrocery
 */
@WebServlet("/RemoveGrocery")
public class RemoveGrocery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveGrocery() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int id = Integer.parseInt(request.getParameter("id"));
		
		User thisUser = (User) session.getAttribute("userObj");
		thisUser.removeGrocery(id);
		
		session.setAttribute("userObj", thisUser);
		
		Gson gson = new Gson();
		String userJSON = gson.toJson(thisUser);
		String gList = gson.toJson(thisUser.gList);

	    session.setAttribute("user", userJSON);
	    session.setAttribute("gList", gList);
	    
	}



}
