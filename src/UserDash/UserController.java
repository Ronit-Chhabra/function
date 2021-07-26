package UserDash;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public UserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String path="D:\\prog\\newecli\\MainPorject\\WebContent\\uploads";
		response.setContentType("text/html");
	 
		MultipartRequest m=new MultipartRequest(request, path);
		UserDao dao=new UserDao();	
		
		if(m.getParameter("btn").equals("Save"))
		{
		
		String uid=m.getParameter("uid");
		String name=m.getParameter("name");
		String mobile=m.getParameter("phone");
		String address=m.getParameter("address");
		String city=m.getParameter("city");
		String state=m.getParameter("state");
		String code=m.getParameter("code");
		String pic=m.getOriginalFileName("pic");
		UserBean bean=new UserBean(uid,name,mobile,address,city,state,code,pic);
		
		String msg=dao.save(bean);
		if(dao.jasus==null)
		{
			out.println(msg);
		}
		else
			out.print(dao.jasus);
	 }
    else
	  if(m.getParameter("btn").equals("Update"))
		{
			String uid=m.getParameter("uid");
			String name=m.getParameter("name");
			String mobile=m.getParameter("phone");
			String address=m.getParameter("address");
			String city=m.getParameter("city");
			String state=m.getParameter("state");
			String code=m.getParameter("code");
			String pic=m.getOriginalFileName("pic");
			
			UserBean bean=new UserBean(uid,name,mobile,address,city,state,code,pic);
			
			
			String msg=dao.doUpdate(bean);
			
				out.println(msg);
			
		}

	}

}
