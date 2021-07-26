package UserDash;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import vendors.VendorBean;


public class FetchCity extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FetchCity() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out= response.getWriter();
		UserDao dao=new UserDao();
		ArrayList<String> bean=	dao.fetchCity();
	
		Gson gson=new Gson();
		//Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String str=gson.toJson(bean);
		response.setContentType("application/json");
		out.println(str);
		System.out.println(str);	
	 	
	}

	
}
