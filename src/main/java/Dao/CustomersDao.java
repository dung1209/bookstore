package Dao;


import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import HibernateUtils.HibernateUtils;
import bookstorePTIT.bean.Customers;

@Repository
public class CustomersDao {
	
	public Customers getCustomerById(int customerId) {
	    Customers customer = null;
	    Session session = null;
	    Transaction transaction = null;

	    try {
	        session = HibernateUtils.getSessionFactory().openSession();
	        transaction = session.beginTransaction();

	        String hql = "FROM Customers c WHERE c.id = :customerId";
	        Query<Customers> query = session.createQuery(hql, Customers.class);
	        query.setParameter("customerId", customerId);
	        customer = query.uniqueResult(); 

	        transaction.commit();
	    } catch (Exception e) {
	        if (transaction != null) {
	            transaction.rollback();
	        }
	        e.printStackTrace();
	    } finally {
	        if (session != null) {
	            session.close();
	        }
	    }
	    return customer;
	}

}
