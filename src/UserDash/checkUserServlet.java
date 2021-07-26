package UserDash;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vendors.VendorBean;


public class checkUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public checkUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		UserDao dao=new UserDao();
		String uid=request.getParameter("uid");
		loginBean bean=	dao.fetchOneuser(uid);
		//VendorBean bean1=dao.fetchonevendor(uid);
		if(bean==null)
			out.println("You Can take it");
		else
			out.print("Already Taken");
	}

	
	

}
