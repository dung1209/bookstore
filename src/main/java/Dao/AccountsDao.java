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
}
