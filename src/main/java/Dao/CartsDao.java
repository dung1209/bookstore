package Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import bookstorePTIT.bean.Books;
import bookstorePTIT.bean.Authors;
import bookstorePTIT.bean.Carts;
import bookstorePTIT.bean.Categories;
import HibernateUtils.HibernateUtils;

import java.util.List;

@Repository
public class CartsDao {  
	
	@Autowired
    private SessionFactory sessionFactory;
    
	public List<Carts> findCartsByCustomerId(int customerId) {
        List<Carts> carts = null;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtils.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            String hql = "FROM Carts WHERE customerID = :customerId";
            Query<Carts> query = session.createQuery(hql, Carts.class);
            query.setParameter("customerId", customerId);
            carts = query.list(); 

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
        return carts;
    }
	
	public void save(Carts cart) {
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtils.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(cart);
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
