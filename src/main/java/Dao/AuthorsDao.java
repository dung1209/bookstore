package Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import bookstorePTIT.bean.Authors;
import HibernateUtils.HibernateUtils;

import java.util.List;

@Repository
public class AuthorsDao {  
    private static SessionFactory factory = HibernateUtils.getSessionFactory();

    public List<Authors> getAuthors() {
        List<Authors> authorsList = null;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Authors";
            Query<Authors> query = session.createQuery(hql, Authors.class);
            authorsList = query.getResultList();

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
        return authorsList;
    }
}
