package vendors;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class deleteRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public deleteRecord() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    VendorDao dao=new VendorDao();
		PrintWriter out= response.getWriter();
	    String uid=request.getParameter("uid");
	    int count=dao.dodelete(uid);
	    int count1=dao.dofavdelete(uid);
	    //System.out.println(count1);
	    int c=count+count1;
	    out.print(c);
 	}

	


}
