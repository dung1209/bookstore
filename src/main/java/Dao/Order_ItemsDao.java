package Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;
import bookstorePTIT.bean.Order_Items; 
import HibernateUtils.HibernateUtils;
import java.math.BigDecimal;

@Repository
public class Order_ItemsDao {  
    private static SessionFactory factory = HibernateUtils.getSessionFactory();

    public void addOrderItem(int orderId, int bookId, int quantity, BigDecimal price) {
        Session session = factory.openSession();
        Transaction transaction = null;

        try {
            transaction = session.beginTransaction();

            Order_Items orderItem = new Order_Items();
            orderItem.setOrderID(orderId);
            orderItem.setBookID(bookId);
            orderItem.setQuantity(quantity);
            orderItem.setPrice(price);

            session.save(orderItem); 
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
}
