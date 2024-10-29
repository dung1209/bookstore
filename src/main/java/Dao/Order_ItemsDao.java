package Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import bookstorePTIT.bean.Books;
import bookstorePTIT.bean.Order_Items; 
import HibernateUtils.HibernateUtils;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Repository
public class Order_ItemsDao {  
    private static SessionFactory factory = HibernateUtils.getSessionFactory();
    
    public void createOrderItems(Order_Items orderItem) {
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            Transaction transaction = session.beginTransaction();
            session.save(orderItem); 
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<Order_Items> getOrderDetail(int orderID) {
    	List<Order_Items> orderDetails = new ArrayList<Order_Items>();
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Order_Items where orderID = :orderID";
            Query<Order_Items> query = session.createQuery(hql, Order_Items.class);
            query.setParameter("orderID", orderID);
            orderDetails = query.list();

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
        return orderDetails;
    }
    
    public List<Object[]> getBooksInOrder(int orderID) {
        List<Object[]> booksList = new ArrayList<>();
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "SELECT b.name, oi.quantity, oi.price FROM Books b, Order_Items oi " +
                         "WHERE b.bookID = oi.bookID AND oi.orderID = :orderID";
            Query<Object[]> query = session.createQuery(hql, Object[].class);
            query.setParameter("orderID", orderID);
            booksList = query.list();

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
    
    public List<Order_Items> findOrderItemsByOrderId(int orderId) {
        List<Order_Items> orderItems = null;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtils.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            String hql = "FROM Order_Items WHERE orderID = :orderId";
            Query<Order_Items> query = session.createQuery(hql, Order_Items.class);
            query.setParameter("orderId", orderId);
            orderItems = query.list();

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
        return orderItems;
    }
}
