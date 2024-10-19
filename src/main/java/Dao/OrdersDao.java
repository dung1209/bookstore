package Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import bookstorePTIT.bean.Order_Items;
import bookstorePTIT.bean.Orders;
import HibernateUtils.HibernateUtils;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public class OrdersDao {  
    private static SessionFactory factory = HibernateUtils.getSessionFactory();

    public int createOrder(String name, String phone, String email, String address, String note, BigDecimal total) {
        Session session = factory.openSession();
        Transaction transaction = null;
        int orderId = 0; 

        try {
            transaction = session.beginTransaction();

            Orders order = new Orders();
            order.setCustomerID(2);
            order.setName(name);
            order.setPhone(phone);
            order.setEmail(email);
            order.setAddress(address);
            order.setNote(note);
            order.setOrderDate(LocalDateTime.now());
            order.setTotal(total);
            order.setStatus(1);

            orderId = (Integer) session.save(order);
            transaction.commit(); 

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close(); 
        }

        return orderId;
    }
    
    public List<Orders> findOrdersByCustomerId(int customerId) {
        List<Orders> orders = null;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtils.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            String hql = "FROM Orders WHERE customerID = :customerId";
            Query<Orders> query = session.createQuery(hql, Orders.class);
            query.setParameter("customerId", customerId);
            orders = query.list(); 

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
        return orders;
    }

}
