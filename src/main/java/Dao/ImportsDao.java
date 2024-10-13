package Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import bookstorePTIT.bean.Authors;
import bookstorePTIT.bean.Books;
import bookstorePTIT.bean.Imports;
import HibernateUtils.HibernateUtils;

import java.util.List;

@Repository
public class ImportsDao {  
    private static SessionFactory factory = HibernateUtils.getSessionFactory();

    public List<Imports> getImports() {
        List<Imports> importsList = null;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Imports";
            Query<Imports> query = session.createQuery(hql, Imports.class);
            importsList = query.list();

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
        return importsList;
    }
    
    public Imports findImportByID(int id) {
        Imports import1 = null;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Imports where importID = :id";
            Query<Imports> query = session.createQuery(hql, Imports.class);
            query.setParameter("id", id);
            import1 = query.uniqueResult();

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
        return import1;
    }
    
    public void save(Imports imports) {
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtils.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(imports);
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
    
    public void update(Imports imports) {
    	Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtils.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.update(imports);
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
            
            Imports imp = session.get(Imports.class, id);
            
            if (imp != null) {
                session.delete(imp);
                
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
    
    public List<Imports> findImportsByBookName(String name) {
    	List<Imports> imports = null;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Imports where book.name LIKE :name";
            Query<Imports> query = session.createQuery(hql, Imports.class);
            query.setParameter("name", "%" + name + "%");
            imports = query.list();
            
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
        return imports;
    }
    public List<Imports> findImportsByDate(String input) {
    	List<Imports> imports = null;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Imports where 1=1"; // Khởi tạo điều kiện truy vấn
            String[] dateParts = input.split("/"); // Phân tách theo dấu "/"

            if (dateParts.length == 3) {
                // Trường hợp: dd/MM/yyyy
                int day = Integer.parseInt(dateParts[0]);
                int month = Integer.parseInt(dateParts[1]);
                int year = Integer.parseInt(dateParts[2]);

                hql += " AND DAY(received_at) = :day";
                hql += " AND MONTH(received_at) = :month";
                hql += " AND YEAR(received_at) = :year";

                Query<Imports> query = session.createQuery(hql, Imports.class);
                query.setParameter("day", day);
                query.setParameter("month", month);
                query.setParameter("year", year);
                imports = query.list();

            } else if (dateParts.length == 2) {
                // Trường hợp: MM/yyyy
                if (input.matches("\\d{2}/\\d{4}")) {
                    int month = Integer.parseInt(dateParts[0]);
                    int year = Integer.parseInt(dateParts[1]);

                    hql += " AND MONTH(received_at) = :month";
                    hql += " AND YEAR(received_at) = :year";

                    Query<Imports> query = session.createQuery(hql, Imports.class);
                    query.setParameter("month", month);
                    query.setParameter("year", year);
                    imports = query.list();
                } 
                // Trường hợp: dd/MM
                else if (input.matches("\\d{2}/\\d{2}")) {
                    int day = Integer.parseInt(dateParts[0]);
                    int month = Integer.parseInt(dateParts[1]);

                    hql += " AND DAY(received_at) = :day";
                    hql += " AND MONTH(received_at) = :month";

                    Query<Imports> query = session.createQuery(hql, Imports.class);
                    query.setParameter("day", day);
                    query.setParameter("month", month);
                    imports = query.list();
                }

            } else if (dateParts.length == 1) {
                // Trường hợp: yyyy
                int year = Integer.parseInt(dateParts[0]);

                hql += " AND YEAR(received_at) = :year";

                Query<Imports> query = session.createQuery(hql, Imports.class);
                query.setParameter("year", year);
                imports = query.list();
            }
            
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
        return imports;
    }
}
