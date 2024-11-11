package HibernateUtils;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {
    private static SessionFactory sessionFactory;

    static {
        try {
            Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
            configuration.addAnnotatedClass(bookstorePTIT.bean.Categories.class);
            configuration.addAnnotatedClass(bookstorePTIT.bean.Authors.class);
            configuration.addAnnotatedClass(bookstorePTIT.bean.Books.class);
            configuration.addAnnotatedClass(bookstorePTIT.bean.Carts.class);
            configuration.addAnnotatedClass(bookstorePTIT.bean.Orders.class);
            configuration.addAnnotatedClass(bookstorePTIT.bean.Order_Items.class);
            configuration.addAnnotatedClass(bookstorePTIT.bean.Customers.class);
            configuration.addAnnotatedClass(bookstorePTIT.bean.Accounts.class);
            configuration.addAnnotatedClass(bookstorePTIT.bean.Publishers.class);
            configuration.addAnnotatedClass(bookstorePTIT.bean.Imports.class);
            StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder();
            builder.applySettings(configuration.getProperties());
            StandardServiceRegistry serviceRegistry = builder.build();
            sessionFactory = configuration.buildSessionFactory(serviceRegistry);
        } catch (Throwable ex) {
            System.out.println("Error at session factory initialization");
            ex.printStackTrace();
        }
    }

    public static SessionFactory getSessionFactory() {
        //return sessionFactory;
    	if (sessionFactory == null) {
            try {
                Configuration configuration = new Configuration().configure();
                sessionFactory = configuration.buildSessionFactory();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return sessionFactory;
    }
}
