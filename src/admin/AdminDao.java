package admin;

import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;



public class AdminDao {
	public Exception jasus;
	AnnotationConfiguration cnf;
	SessionFactory sessionFactory;
	Session session;
	Transaction transaction;
     public AdminDao()
     {
    	 cnf=new AnnotationConfiguration();
 		cnf.configure("hibernate.cfg.xml");
 		
 		sessionFactory=cnf.buildSessionFactory();
 		session=sessionFactory.openSession();
 		transaction=session.beginTransaction();
 		
     }
     public String update(AdminBean bean)
  	{
  		jasus=null;
  		try {
  		session.update(bean);
  		transaction.commit();
  		}
  		catch(Exception exp)
  		{
  			jasus=exp;
  		}
  		return "updated";
  	}
   /* public static void main(String args[])
    {
    	new Dao().getService();
    }*/
     public ArrayList<AdminServiceResultBean> getService(String event)
     {
    	 String queryStr="select new admin.AdminServiceResultBean(obj.events) from AdminBean obj where functions=:x";
    	 Query query =session.createQuery(queryStr);
    	 query.setString("x", event);
    	 ArrayList<AdminServiceResultBean> res=(ArrayList<AdminServiceResultBean>)query.list();
    	 /*for (ServiceResultBean obj : res) {
			System.out.println(obj.getService());
		}*/
    	 return res;
     }
}
