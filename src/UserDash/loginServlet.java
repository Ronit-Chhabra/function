package UserDash;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
        PrintWriter out=response.getWriter();
		
        String type="";
		response.setContentType("text/html");
	    UserDao dao=new UserDao();	
		
		String uid=request.getParameter("uid");
		String pwd=request.getParameter("pwd");
		HttpSession ssn=request.getSession();
		ssn.setAttribute("uid", uid);
		
		type=dao.doLogin(uid,pwd);
		Gson gson = new Gson();
		String gt = gson.toJson(type);
		out.print(gt);
		System.out.println(gt);
	}

	

}
