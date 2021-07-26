package vendors;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;



public class VendorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public VendorController() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String path="D:\\prog\\newecli\\MainPorject\\WebContent\\uploads";
		response.setContentType("text/html");
	 
		MultipartRequest m=new MultipartRequest(request, path);
		VendorDao dao=new VendorDao();
		
		if(m.getParameter("btn").equals("Save"))
		{
			String uid=m.getParameter("uid");
			String name=m.getParameter("name");
			String mobile=m.getParameter("mobile");
			String address=m.getParameter("address");
			String city=m.getParameter("city");
			String firm=m.getParameter("firm");
			String est=m.getParameter("est");
			String pic1=m.getOriginalFileName("pic1");
        	String pic2=m.getOriginalFileName("pic2");
        	String site=m.getParameter("site");
        	String pwork=m.getParameter("pwork");
        	String function=m.getParameter("function");
        	String services=m.getParameter("selservice");
        	System.out.println(uid);
        	VendorBean bean=new VendorBean(uid,name,mobile,firm,est,address,city,site,function,services,pwork,pic1,pic2);
            String res=dao.save(bean);
            if(dao.jasus==null)
    		{
    			out.println(res);
    		}
    		else
    			out.print(dao.jasus);
		}
		else
			  if(m.getParameter("btn").equals("Update"))
				{
				  String uid=m.getParameter("uid");
					String name=m.getParameter("name");
					String mobile=m.getParameter("mobile");
					String address=m.getParameter("address");
					String city=m.getParameter("city");
					String firm=m.getParameter("firm");
					String est=m.getParameter("est");
					String pic1=m.getOriginalFileName("pic1");
		        	String pic2=m.getOriginalFileName("pic2");
		        	String site=m.getParameter("site");
		        	String pwork=m.getParameter("pwork");
		        	String function=m.getParameter("function");
		        	String services=m.getParameter("selservice");
		        	
		        	VendorBean bean=new VendorBean(uid,name,mobile,firm,est,address,city,site,function,services,pwork,pic1,pic2);
		        	
		        	String msg=dao.doUpdate(bean);
					
					out.println(msg);
				}
	}

}
