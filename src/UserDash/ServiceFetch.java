package UserDash;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

public class ServiceFetch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ServiceFetch() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out= response.getWriter();
		UserDao dao=new UserDao();
		ArrayList<String> bean=	dao.fetchService();
	
		Gson gson=new Gson();
		//Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String str=gson.toJson(bean);
		response.setContentType("application/json");
		out.println(str);
		System.out.println(str);		
	}

	

}
