package vendors;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

public class FetchAllVendors extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FetchAllVendors() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VendorDao dao=new VendorDao();
		ArrayList<VendorBean>all=	dao.fetchAll();
		Gson gson=new Gson();
		String jsonAll=gson.toJson(all);
		System.out.println(jsonAll);
		PrintWriter out=response.getWriter();
		response.setContentType("application/json");
		out.println(jsonAll);
	}

	

}
