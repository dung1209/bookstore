package Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import HibernateUtils.HibernateUtils;
import bookstorePTIT.bean.Accounts;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class authDao {
	public static SessionFactory factory;

	public Accounts getUserByUserName(String username) {
		factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		String hql = "from Accounts u where u.username = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", username);
		List<Accounts> usersList = query.getResultList();
		if (!usersList.isEmpty()) {
			return usersList.get(0);
		} else {
			return null;
		}
	}

	

	public Map<String, Object> CheckAccount(Accounts acc) {
	    Map<String, Object> rs = new HashMap<String, Object>();
	    String password = acc.getPassword();
	    Accounts acc1 = getUserByUserName(acc.getUsername()); // Lấy tài khoản từ cơ sở dữ liệu theo username
	    if (acc1 != null) {
	        if (acc1.isStatus() == false) { 
	            rs.put("check", false);
	            rs.put("message", "Tài khoản của bạn bị khóa. Vui lòng liên hệ quản lí để kích hoạt!");
	            return rs;
	        } else {
	            rs.put("isAdmin", acc1.getRole());
	            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	            if (passwordEncoder.matches(password, acc1.getPassword())) {
	                rs.put("check", true);
	                rs.put("message", "");
	            } else {
	                rs.put("check", false);
	                rs.put("message", "Tài khoản hoặc mật khẩu không chính xác!");
	            }
	        }
	    } else {
	        rs.put("check", false);
	        rs.put("message", "Tài khoản hoặc mật khẩu không chính xác!");
	    }
	    
	    return rs;
	}


	public int CheckUser(String username) {
		factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		String hql = "from Accounts u where u.username = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", username);
		List<Accounts> usersList = query.getResultList();

		if (!usersList.isEmpty()) {
			String role = usersList.get(0).getRole(); // Láº¥y giÃ¡ trá»‹ role dÆ°á»›i dáº¡ng chuá»—i
			if (role != null && role.equalsIgnoreCase("admin")) {
				return 1; // Tráº£ vá»� 1 náº¿u role lÃ  "admin"
			} else {
				return 0; // Tráº£ vá»� 0 náº¿u role khÃ´ng pháº£i lÃ  "admin"
			}
		}

		return -1; // Tráº£ vá»� -1 náº¿u khÃ´ng tÃ¬m tháº¥y ngÆ°á»�i dÃ¹ng nÃ o
	}

}
