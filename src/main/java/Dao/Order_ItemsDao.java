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
    
    public void createOrderItems(Order_Items orderItem) {
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            Transaction transaction = session.beginTransaction();
            session.save(orderItem); 
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
