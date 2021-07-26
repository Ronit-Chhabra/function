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


public class fetchFavVendor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public fetchFavVendor() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out= response.getWriter();
		UserDao dao=new UserDao();
		String uid=request.getParameter("uid");
		System.out.println(uid);	
		String service=request.getParameter("service");
		System.out.println(service);	
		ArrayList<String> bean=	dao.fetchvid(service,uid);
		
		ArrayList<VendorBean> all=new ArrayList<VendorBean>();
		for(int i=0;i<bean.size();i++)
		{
			ArrayList<VendorBean> vendor=dao.getFavVendor(bean.get(i));
			//System.out.println(vendor);
			all.add(vendor.get(0));
		}
		Gson gson=new Gson();
		//Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String str=gson.toJson(all);
		response.setContentType("application/json");
		out.print(str);
		System.out.println(str);
	}

	

}
