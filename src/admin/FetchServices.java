package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;


public class FetchServices extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public FetchServices() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
	 	AdminDao dao=new AdminDao();
		String e=request.getParameter("event");
	 	ArrayList<AdminServiceResultBean> res=dao.getService(e);
	 	//System.out.println(res);
	 	Gson gson=new Gson();
	 	String str=gson.toJson(res);
	 	response.setContentType("application/json");
	 	out.print(str);
	}

}
