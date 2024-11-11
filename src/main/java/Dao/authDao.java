package Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import HibernateUtils.HibernateUtils;
import bookstorePTIT.bean.Accounts;

public class authDao {
	public static SessionFactory factory;

	public Accounts getUserByUserName(String username) {
		factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		String hql = "from Accounts u where u.username = :id";
		Query query=session.createQuery(hql);
		query.setParameter("id", username);
		List<Accounts> usersList =  query.getResultList();
		 if (!usersList.isEmpty()) {
		        return usersList.get(0); // Lấy phần tử đầu tiên của danh sách
		    } else {
		        return null; // Trả về null nếu không tìm thấy người dùng nào
		    }
	}
	
	public Map CheckAccount(Accounts acc) {
		Map<String, Object> rs= new HashMap<String, Object>();
		String password=acc.getPassword();
//		Users user1=getUserByUserName(user.getUsername());
		Accounts acc1=getUserByUserName(acc.getUsername());
		
		if(acc1!=null)
		{
			rs.put("isAdmin",acc1.getRole());
		}
		
		if(acc1 !=null) {
			rs.put("password",acc1.getPassword());
			if(password.trim().equals(acc1.getPassword().trim()))
			{
				rs.put("check",true);
				rs.put("message","");
			}
			else {
				rs.put("check",false);
				rs.put("message","Tài khoản hoặc mật khẩu không chính xác!");
			}
			
		}
		else {
			
			rs.put("check",false);
			rs.put("message","Tài khoản hoặc mật khẩu không chính xác!");
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
	        String role = usersList.get(0).getRole(); // Lấy giá trị role dưới dạng chuỗi
	        if (role != null && role.equalsIgnoreCase("admin")) {
	            return 1; // Trả về 1 nếu role là "admin"
	        } else {
	            return 0; // Trả về 0 nếu role không phải là "admin"
	        }
	    }
	    
	    return -1; // Trả về -1 nếu không tìm thấy người dùng nào
	}

}
