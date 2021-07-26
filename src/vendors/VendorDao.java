package vendors;

import java.util.ArrayList;



import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.criterion.Restrictions;

import admin.AdminServiceResultBean;


							


public class VendorDao 
{
	public Exception jasus;
	AnnotationConfiguration cnf;
	SessionFactory sessionFactory;
	Session session;
	Transaction transaction;
     public VendorDao()
     {
    	 cnf=new AnnotationConfiguration();
 		cnf.configure("hibernate.cfg.xml");
 		
 		sessionFactory=cnf.buildSessionFactory();
 		session=sessionFactory.openSession();
 		
 		
     }
     public String save(VendorBean bean)
  	{
    	 transaction=session.beginTransaction();
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
     public String doUpdate(VendorBean bean)
 	{
    	 transaction=session.beginTransaction();
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
	public VendorBean fetchOne(String uid) {
		transaction=session.beginTransaction();
		 Criteria cr = session.createCriteria(VendorBean.class);
		  cr.add(Restrictions.eq("uid", uid));
		  VendorBean record = (VendorBean)cr.uniqueResult();  
		  return record;
		
	}
	
	public ArrayList<EventResultBean> getAllEvents()
	{
		transaction=session.beginTransaction();
		String str="select new vendors.EventResultBean(obj.functions) from AdminBean obj";
		Query query =session.createQuery(str);
		ArrayList<EventResultBean> all=(ArrayList<EventResultBean>)query.list();
		return all;
	}
	
     public ArrayList<ServiceResultBean>  getService(String event)
     {
    	 transaction=session.beginTransaction();
    	 String queryStr="select new vendors.ServiceResultBean(obj.events) from AdminBean obj where functions=:x";
    	 Query query =session.createQuery(queryStr);
    	 query.setString("x", event);
    	 ArrayList<ServiceResultBean> res=(ArrayList<ServiceResultBean>)query.list();
    	 /*for (ServiceResultBean obj : res) {
			System.out.println(obj.getService());
		}*/
    	 return res;
     }
		public ArrayList<VendorBean> fetchAll(){
			transaction=session.beginTransaction();
			Criteria cr = session.createCriteria(VendorBean.class);
			   ArrayList<VendorBean>allRecords = (ArrayList<VendorBean>)cr.list();
			   
			   return allRecords;
		}
		public int dodelete(String uid)
		{
			transaction=session.beginTransaction();
			String str="delete from VendorBean where uid=:x";
			Query qry=session.createQuery(str);
			qry.setString("x",uid);
		    int count=qry.executeUpdate();
		    transaction.commit();
		    return count;
		}
		public int dofavdelete(String uid)
		{
			transaction=session.beginTransaction();
			String str="delete from FavBean where vid=:x";
			Query qry=session.createQuery(str);
			qry.setString("x",uid);
		    int count=qry.executeUpdate();
		    transaction.commit();
		    return count;
		}
	
public int changePwd(String uid,String pwd)
{
	transaction=session.beginTransaction();
	String str="update loginBean set pwd=:x where uid=:y";
	Query qry=session.createQuery(str);
	qry.setString("x",pwd);
	qry.setString("y",uid);
    int count=qry.executeUpdate();
    transaction.commit();
    return count;
}
/*<%if(session.getAttribute("uid")==null)
	response.sendRedirect("index.jsp");
	%>*/
}