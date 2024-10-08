package Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import bookstorePTIT.bean.Books;
import bookstorePTIT.bean.Authors;
import bookstorePTIT.bean.Categories;
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
    
    public Books findBookById(int bookId) {
        Books book = null;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Books where id = :bookId";
            Query<Books> query = session.createQuery(hql, Books.class);
            query.setParameter("bookId", bookId);
            book = query.uniqueResult();
            
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
        return book;
    }
    
    public Authors findAuthorById(int authorId) {
        Authors author = null;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Authors where id = :authorId";
            Query<Authors> query = session.createQuery(hql, Authors.class);
            query.setParameter("authorId", authorId);
            author = query.uniqueResult();

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
        return author;
    }
    
    public Categories findCategoryById(int categoryId) {
        Categories category = null;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Categories where id = :categoryId";
            Query<Categories> query = session.createQuery(hql, Categories.class);
            query.setParameter("categoryId", categoryId);
            category = query.uniqueResult();

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
        return category;
    }

}
