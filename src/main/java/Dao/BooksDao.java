package Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import bookstorePTIT.bean.Books; 
import HibernateUtils.HibernateUtils;

import java.util.List;

@Repository
public class BooksDao {  
    private static SessionFactory factory = HibernateUtils.getSessionFactory();

    public List<Books> getBooks() {
        List<Books> booksList = null;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Books";
            Query<Books> query = session.createQuery(hql, Books.class);
            booksList = query.getResultList();

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
        return booksList;
    }
}
