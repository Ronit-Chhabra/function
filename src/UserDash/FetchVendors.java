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


/**
 * Servlet implementation class FetchVendors
 */
public class FetchVendors extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public FetchVendors() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
	 	UserDao dao=new UserDao();
		String fun=request.getParameter("function");
		String ser=request.getParameter("service");
		String city=request.getParameter("city");
	 	ArrayList<VendorFetchBean> res=dao.getVendors(fun,ser,city);
	 	System.out.println(res);
	 	Gson gson=new Gson();
	 	String str=gson.toJson(res);
	 	//System.out.println(str);
	 	response.setContentType("application/json");
	 	out.print(str);
	 	//	System.out.println(str);
	}


}
