package HibernateUtils;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {
	public static SessionFactory getSessionFactory() {
        SessionFactory sessionFactory = null;
        try {
            Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
            configuration.addAnnotatedClass(bookstorePTIT.bean.Categories.class);
            configuration.addAnnotatedClass(bookstorePTIT.bean.Authors.class);
            configuration.addAnnotatedClass(bookstorePTIT.bean.Books.class);
            configuration.addAnnotatedClass(bookstorePTIT.bean.Carts.class);
            StandardServiceRegistryBuilder builder 
                = new StandardServiceRegistryBuilder();
            builder.applySettings(configuration.getProperties());
            StandardServiceRegistry serviceRegistry = builder.build();
            sessionFactory = configuration.buildSessionFactory(serviceRegistry);
        } catch (Throwable ex) {
        	System.out.println("error at session");
            ex.printStackTrace();
        }
        return sessionFactory;
    }
}
