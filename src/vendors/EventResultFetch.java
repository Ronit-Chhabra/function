package vendors;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

public class EventResultFetch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public EventResultFetch() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out= response.getWriter();
		VendorDao dao=new VendorDao();
		
		ArrayList<EventResultBean> all=dao.getAllEvents();
		Gson gson=new Gson();
		//Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String str=gson.toJson(all);
		response.setContentType("application/json");
		out.println(str);
		//System.out.println(str);
	}



}
