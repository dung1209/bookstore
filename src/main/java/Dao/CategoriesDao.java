package Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import bookstorePTIT.bean.Authors;
import bookstorePTIT.bean.Categories;
import HibernateUtils.HibernateUtils;

import java.util.ArrayList;
import java.util.List;

@Repository
public class CategoriesDao {  
    private static SessionFactory factory = HibernateUtils.getSessionFactory();

    public List<Categories> getCategories() {
        List<Categories> categoriesList = new ArrayList<Categories>();
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Categories";
            Query<Categories> query = session.createQuery(hql, Categories.class);
            categoriesList = query.getResultList();

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
        return categoriesList;
    }
    
    public void save(Categories categories) {
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtils.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(categories);
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
    
    public void update(Categories categories) {
    	Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtils.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.update(categories);
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
            
            Categories categories = session.get(Categories.class, id);
            
            if (categories != null) {
                session.delete(categories);
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
    
    public List<Categories> findCategoryByName(String name) {
    	List<Categories> categories = null;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Categories where name LIKE :name";
            Query<Categories> query = session.createQuery(hql, Categories.class);
            query.setParameter("name", "%" + name + "%");
            categories = query.list();
            
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
        return categories;
    }

}
