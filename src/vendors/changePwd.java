package vendors;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class changePwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public changePwd() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str="";
		PrintWriter out= response.getWriter();
		VendorDao dao=new VendorDao();
		String uid=request.getParameter("uid");
		System.out.println(uid);
		String pwd=request.getParameter("pwd");
		int count=	dao.changePwd(uid,pwd);
	     if(count!=0)
	     {
	    	  str="Password Changed";
	     }
	     else
	     {
	    	 str="Password didnt Changed";
	     }
		out.println(str);
		//System.out.println(str);
	}

	
}
