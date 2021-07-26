package UserDash;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;


public class signservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public signservlet() {
        super();
        
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out=response.getWriter();
		
		response.setContentType("text/html");
	 
		UserDao dao=new UserDao();	
		
		
		
		String uid=request.getParameter("uid");
		String pwd=request.getParameter("pwd");
		String type=request.getParameter("type");
		loginBean bean=new loginBean(uid,pwd,type);
		
		String msg=dao.logSave(bean);
		if(dao.jasus==null)
		{
			out.println(msg);
		}
		else
			out.print(dao.jasus);
	}

	


}
