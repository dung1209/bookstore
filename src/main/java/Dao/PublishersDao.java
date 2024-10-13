package Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import bookstorePTIT.bean.Categories;
import bookstorePTIT.bean.Publishers;
import HibernateUtils.HibernateUtils;

import java.util.List;

@Repository
public class PublishersDao {  
    private static SessionFactory factory = HibernateUtils.getSessionFactory();

    public List<Publishers> getPublishers() {
        List<Publishers> publishersList = null;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Publishers";
            Query<Publishers> query = session.createQuery(hql, Publishers.class);
            publishersList = query.getResultList();

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
        return publishersList;
    }
    
    public void save(Publishers publisher) {
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtils.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(publisher);
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
    
    public void update(Publishers publisher) {
    	Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtils.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.update(publisher);
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
    
    public void deleteById(int id) {
    	Session session = null;
        Transaction transaction = null;
    	
        try {
        	session = HibernateUtils.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            
            Publishers publisher = session.get(Publishers.class, id);
            
            if (publisher != null) {
                session.delete(publisher);
            }
            
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
    
    public Publishers findPublisherById(int publisherId) {
    	Publishers publisher = null;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Publishers where publisherID = :publisherId";
            Query<Publishers> query = session.createQuery(hql, Publishers.class);
            query.setParameter("publisherId", publisherId);
            publisher = query.uniqueResult();

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
        return publisher;
    }
    
    public List<Publishers> findPublisherByName(String name) {
    	List<Publishers> publishers = null;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Publishers where name LIKE :name";
            Query<Publishers> query = session.createQuery(hql, Publishers.class);
            query.setParameter("name", "%" + name + "%");
            publishers = query.list();
            
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
        return publishers;
    }
}
