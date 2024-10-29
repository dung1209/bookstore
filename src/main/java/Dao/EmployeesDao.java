package Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import bookstorePTIT.bean.Categories;
import bookstorePTIT.bean.Employees;
import bookstorePTIT.bean.Publishers;
import HibernateUtils.HibernateUtils;

import java.util.List;

@Repository
public class EmployeesDao {  
    private static SessionFactory factory = HibernateUtils.getSessionFactory();

    public List<Employees> getEmployees() {
        List<Employees> employeesList = null;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Employees";
            Query<Employees> query = session.createQuery(hql, Employees.class);
            employeesList = query.getResultList();

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
        return employeesList;
    }
    
    public void save(Employees employee) {
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtils.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(employee);
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
    
    public void update(Employees employee) {
    	Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtils.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.update(employee);
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
            
            Employees employee = session.get(Employees.class, id);
            
            if (employee != null) {
                session.delete(employee);
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
    
    public Employees findEmployeeById(int employeeId) {
    	Employees employee = null;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Employees where employeeID = :employeeID";
            Query<Employees> query = session.createQuery(hql, Employees.class);
            query.setParameter("employeeID", employeeId);
            employee = query.uniqueResult();

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
        return employee;
    }
    
    public List<Employees> findEmployeeByName(String name) {
    	List<Employees> employees = null;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Employees where name LIKE :name";
            Query<Employees> query = session.createQuery(hql, Employees.class);
            query.setParameter("name", "%" + name + "%");
            employees = query.list();
            
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
        return employees;
    }
    
    public Employees findEmployeeByUsername(String username) {
    	Employees employee = null;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Employees where account.username = :username";
            Query<Employees> query = session.createQuery(hql, Employees.class);
            query.setParameter("username", username);
            employee = query.uniqueResult();

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
        return employee;
    }
}
