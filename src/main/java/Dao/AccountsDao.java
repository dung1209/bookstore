package Dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import HibernateUtils.HibernateUtils;

@Repository
public class AccountsDao {
	
    public String getEmailByAccountId(int accountId) {
        String email = null;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtils.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            String hql = "SELECT a.email FROM Accounts a WHERE a.id = :accountId";
            Query<String> query = session.createQuery(hql, String.class);
            query.setParameter("accountId", accountId);
            email = query.uniqueResult(); 

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
        return email;
    }
    
    public void updateEmailByAccountId(int accountId, String newEmail) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtils.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            Query query = session.createQuery("UPDATE Accounts a SET a.email = :newEmail WHERE a.id = :accountId");
            query.setParameter("newEmail", newEmail);
            query.setParameter("accountId", accountId);

            int result = query.executeUpdate();
            transaction.commit();

            if (result > 0) {
                System.out.println("Email updated successfully.");
            } else {
                System.out.println("No account found with the specified ID.");
            }
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
