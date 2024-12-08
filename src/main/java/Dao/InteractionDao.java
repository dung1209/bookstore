package Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;
import org.hibernate.query.Query;
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
	
	public boolean checkInteractionExistence(int userID, int bookID) {
        boolean exists = false;
        Session session = null; 

        try {
            session = factory.openSession();
            String hql = "SELECT 1 FROM Interactions u WHERE u.accountID = :userID AND u.bookID = :bookID";
            Query<?> query = session.createQuery(hql);
            query.setParameter("userID", userID);
            query.setParameter("bookID", bookID);

            Object result = query.uniqueResult();
            exists = result != null;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return exists;
    }

}