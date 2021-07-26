package UserDash;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class SendSms extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SendSms() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out= response.getWriter();
		String msg=request.getParameter("txt");
		String mob=request.getParameter("mob");
		System.out.println(mob);
		String re=SST_SMS.bceSunSoftSend(mob, msg);
	
		out.println(re);
		System.out.println(re);
	}

	

}
