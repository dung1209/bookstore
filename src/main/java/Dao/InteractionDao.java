package Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import HibernateUtils.HibernateUtils;
import bookstorePTIT.bean.Interactions;

@Repository
public class InteractionDao {
	private static SessionFactory factory = HibernateUtils.getSessionFactory();
	
	public void save(Interactions interaction) {
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtils.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(interaction);
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