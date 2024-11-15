package Dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Repository;

import HibernateUtils.HibernateUtils;
import bookstorePTIT.bean.Accounts;

@Repository
public class AccDao {
	private static SessionFactory factory = HibernateUtils.getSessionFactory();

	@Autowired
    private static  SessionFactory sessionFactory;

    public static Accounts getAccountByUsernameAndPassword(String username, String password) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "FROM Accounts a WHERE a.username = :username AND a.password = :password";
        Query<Accounts> query = session.createQuery(hql, Accounts.class);
        query.setParameter("username", username);
        query.setParameter("password", password);
        return query.uniqueResult(); // Trả về User nếu tìm thấy, nếu không sẽ là null
    }    
 
    
    public static void save(Accounts acc) {
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtils.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(acc);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace(); // Có thể thay thế bằng logger
            throw e; // Ném lại ngoại lệ để có thể xử lý ở nơi khác nếu cần
        } finally {
            if (session != null) {
                session.close(); 
            }
        }
    }

    public static boolean isUsernameExists(String username) {
        Session session = null;
        try {
            session = HibernateUtils.getSessionFactory().openSession(); // Mở phiên mới
            String hql = "SELECT COUNT(*) FROM Accounts WHERE username = :username";
            Query<Long> query = session.createQuery(hql, Long.class);
            query.setParameter("username", username);
            Long count = query.uniqueResult();
            return count != null && count > 0;
        } finally {
            if (session != null) {
                session.close(); 
            }
        }
    }

    public static boolean isEmailExists(String email) {
        Session session = null;
        try {
            session = HibernateUtils.getSessionFactory().openSession(); // Mở phiên mới
            String hql = "SELECT COUNT(*) FROM Accounts WHERE email = :email";
            Query<Long> query = session.createQuery(hql, Long.class);
            query.setParameter("email", email);
            Long count = query.uniqueResult();
            return count != null && count > 0;
        } finally {
            if (session != null) {
                session.close(); 
            }
        }
    }
  
    public static Accounts findByEmail(String email) {
        Session session = null;
        Transaction tx = null;
        Accounts account = null;

        try {
        	 session = HibernateUtils.getSessionFactory().openSession(); // Mở phiên mới
            tx = session.beginTransaction();
            // Sử dụng HQL để tìm tài khoản theo email
            Query<Accounts> query = session.createQuery("FROM Accounts WHERE email = :email", Accounts.class);
            query.setParameter("email", email);
            List<Accounts> results = query.list();
            if (!results.isEmpty()) {
                account = results.get(0); // Lấy tài khoản đầu tiên
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return account; // Trả về tài khoản hoặc null nếu không tìm thấy
    }

    public static void updatePassword(String email, String newPassword) {
        Session session = null;
        Transaction tx = null;

        try {
        	 session = HibernateUtils.getSessionFactory().openSession(); // Mở phiên mới
            tx = session.beginTransaction();
            // Tìm tài khoản theo email
            Accounts account = findByEmail(email);
            if (account != null) {
            	String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());
                account.setPassword(hashedPassword); // Cập nhật mật khẩu đã mã hóa
                session.update(account); // Lưu thay đổi
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
    
}
