package UserDash;

import java.util.ArrayList;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.criterion.Restrictions;

import vendors.VendorBean;


public class UserDao 
{
	public Exception jasus;
	AnnotationConfiguration cnf;
	SessionFactory sessionFactory;
	Session session;
	Transaction transaction;
   
	
	public UserDao()
     {
    	 cnf=new AnnotationConfiguration();
 		cnf.configure("hibernate.cfg.xml");
 		
 		sessionFactory=cnf.buildSessionFactory();
 		session=sessionFactory.openSession();
 		transaction=session.beginTransaction();
 		
     }
 	public String save(UserBean bean)
 	{
 		jasus=null;
 		try {
 		session.save(bean);
 		transaction.commit();
 		}
 		catch(Exception exp)
 		{
 			jasus=exp;
 		}
 		return "saved";
 	}
 	public String addfav(FavBean bean)
 	{
 		jasus=null;
 		try {
 		session.save(bean);
 		transaction.commit();
 		}
 		catch(Exception exp)
 		{
 			jasus=exp;
 		}
 		return "saved";
 	}
	public String doUpdate(UserBean bean)
	{
		try {
		  session.update(bean);
		  transaction.commit();
		  
		  return "Updated";
		}
		catch(Exception exp)
		{
			return exp.toString();
		}
	}
	
	public ArrayList<VendorFetchBean> getVendors(String function,String service,String city)
	{
		String str="select new UserDash.VendorFetchBean(obj.uid, obj.name, obj.mobile, obj.firm, obj.est,obj.address, obj.city,obj.site,obj.function, obj.service, obj.pwork, obj.pic1,obj.pic2) from VendorBean obj where function=:x and service like '%"+service+"%' and city=:z";
		Query query =session.createQuery(str);
   	    query.setString("x", function);
   	    //	query.setString("y", service);
   	    query.setString("z",city );
   	    ArrayList<VendorFetchBean> res=(ArrayList<VendorFetchBean>)query.list();
   	    //System.out.println(res);
   	    return res;
	}
	public ArrayList<String> fetchCity()
	{
		String str="select distinct city from VendorBean";
		Query query =session.createQuery(str);
		ArrayList<String> res=(ArrayList<String>)query.list();
   	    //System.out.println(res);
   	    return res;
	}
	public ArrayList<String> fetchService()
	{
		String str="select distinct service from FavBean";
		Query query =session.createQuery(str);
		ArrayList<String> res=(ArrayList<String>)query.list();
   	    //System.out.println(res);
   	    return res;
	}
	public ArrayList<String> fetchvid(String service,String uid)
	{
		String str="select distinct vid from FavBean where uid=:x and service=:y";
		Query query =session.createQuery(str);
		query.setString("x", uid);
		query.setString("y", service);
		ArrayList<String> res=(ArrayList<String>)query.list();
   	    //System.out.println(res);
   	    return res;
	}
	public ArrayList<VendorBean> getFavVendor(String i)
	{
		String str="from VendorBean where uid=:x";
		//System.out.println(i);
		Query qry=session.createQuery(str);
		qry.setString("x", i);
		ArrayList<VendorBean> res=(ArrayList<VendorBean>)qry.list();
		return res;
	}
	public String logSave(loginBean bean)
	{
		jasus=null;
		String str="";
		try {
			session.save(bean);
			transaction.commit();
			str="saved";
		} catch (Exception e) {
			jasus=e;
			str=jasus.toString();
			e.printStackTrace();
		}
		return str;
	}
	public String doLogin(String uid,String pwd)
	{
		String str="select type from loginBean where uid=:x and pwd=:y";
		Query qry=session.createQuery(str);
		qry.setString("x", uid);
		qry.setString("y", pwd);
		String type=(String)qry.uniqueResult();
		//System.out.println(type+"sdgkjsd");
		return type;
	}
	public loginBean fetchOneuser(String uid)
	{
		   /*String queryString = "from UserBean where uid = :x";  
		   Query query = session.createQuery(queryString);  
		   query.setString("x", uid);  
		  
		   UserBean record = (UserBean)query.uniqueResult();  
		  return record;*/
		
				//OR
		
		  Criteria cr = session.createCriteria(loginBean.class);
		  cr.add(Restrictions.eq("uid", uid));
		  loginBean record = (loginBean)cr.uniqueResult();  
		  return record;
	}
	
}
