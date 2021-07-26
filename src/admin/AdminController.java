package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;



public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
	 	AdminDao dao=new AdminDao();
	 	if(request.getParameter("btn").equals("Update"))
	 	{
	 		String function=request.getParameter("func");
	 		String events=request.getParameter("events");
	 		
	 		AdminBean bean=new AdminBean(function,events);
	 		String res=dao.update(bean);
	 		if(dao.jasus==null)
			{
				out.println(res);
			}
			else
				out.print(dao.jasus);
	 	}
	 	
	 	
	 	
	}

}
