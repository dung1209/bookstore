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
	
	public int getAccountIDByCustomerID(int customerID) {
    	Session session = null;
        Transaction transaction = null;
        int accountID = 0;
        try {
        	session = HibernateUtils.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query<Integer> query = session.createQuery("SELECT c.accountID FROM Customers c WHERE c.id = :customerID", Integer.class);
            query.setParameter("customerID", customerID);
            accountID = query.uniqueResult();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace(); 
        }
        return accountID; 
    }
	
	public void updateCustomer(Customers customer) {
	    Session session = null;
	    Transaction transaction = null;
	    try {
	        session = HibernateUtils.getSessionFactory().openSession();
	        transaction = session.beginTransaction();
	        
	        Customers existingCustomer = session.get(Customers.class, customer.getId());
	        if (existingCustomer != null) {
	            existingCustomer.setName(customer.getName());
	            existingCustomer.setPhone(customer.getPhone());
	            existingCustomer.setAddress(customer.getAddress());

	            session.update(existingCustomer);
	        }

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
	}

}
