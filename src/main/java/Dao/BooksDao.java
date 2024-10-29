package Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import bookstorePTIT.bean.Books;
import bookstorePTIT.bean.Carts;
import bookstorePTIT.bean.Authors;
import bookstorePTIT.bean.Categories;
import HibernateUtils.HibernateUtils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
public class BooksDao {  
    public static SessionFactory factory = HibernateUtils.getSessionFactory();
    
    public List<Books> getBooks() {
        List<Books> booksList = new ArrayList<Books>();
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Books";
            Query<Books> query = session.createQuery(hql, Books.class);
            booksList = query.getResultList();
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
    /**/
    public List<Books> getBooks(int page, int booksPerPage) {
        List<Books> booksList = null;
        Session session = null;
        Transaction transaction = null;
        
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Books";
            Query<Books> query = session.createQuery(hql, Books.class);

            // Tính toán chỉ số bắt đầu và số lượng sách
            int startIndex = (page - 1) * booksPerPage;
            query.setFirstResult(startIndex); // Bắt đầu từ chỉ số này
            query.setMaxResults(booksPerPage); // Lấy số lượng sách trên mỗi trang

            booksList = query.getResultList();
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
    
    public int countTotalBooks() {
        int totalBooks = 0;
        Session session = null;
        Transaction transaction = null;

        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "SELECT COUNT(*) FROM Books"; // Đếm tổng số sách
            Query<Long> query = session.createQuery(hql, Long.class);
            totalBooks = query.uniqueResult().intValue(); // Lấy kết quả duy nhất
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
        return totalBooks;
    }

    /**/
    
    public void save(Books book) {
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtils.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(book);
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
    
    public void update(Books book) {
    	Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtils.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.update(book);
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
            
            Books book = session.get(Books.class, id);
            
            if (book != null) {
                session.delete(book);
                System.out.println("Sách đã được xóa thành công!");
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
    
    public Books findBookById(int bookId) {
        Books book = null;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Books where bookID = :bookId";
            Query<Books> query = session.createQuery(hql, Books.class);
            query.setParameter("bookId", bookId);
            book = query.uniqueResult();
            
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
        return book;
    }
    
    public List<Books> findBooksByName(String name) {
    	List<Books> books = null;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Books where name LIKE :name";
            Query<Books> query = session.createQuery(hql, Books.class);
            query.setParameter("name", "%" + name + "%");
            books = query.list();
            
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
        return books;
    }
    
    public List<Books> findBooksByAuthor(String author) {
    	List<Books> books = null;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Books where author.name LIKE :author";
            Query<Books> query = session.createQuery(hql, Books.class);
            query.setParameter("author", "%" + author + "%");
            books = query.list();
            
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
        return books;
    }
    
    public List<Books> findBooksByCategory(String category) {
    	List<Books> books = null;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Books where category.name LIKE :category";
            Query<Books> query = session.createQuery(hql, Books.class);
            query.setParameter("category", "%" + category + "%");
            books = query.list();
            
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
        return books;
    }
    
    public List<Books> findBooksByPublisher(String publisher) {
    	List<Books> books = null;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Books where publisher.name LIKE :publisher";
            Query<Books> query = session.createQuery(hql, Books.class);
            query.setParameter("publisher", "%" + publisher + "%");
            books = query.list();
            
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
        return books;
    }
    
    public int getTotalRemainingStock() {
    	int totalRemainingStock = 0;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "SELECT SUM(b.stock - b.sold) FROM Books b";
            totalRemainingStock = ((Long) session.createQuery(hql).uniqueResult()).intValue();
            
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
        return totalRemainingStock;
    }
    
    public List<Books> getTopSellingBooks() {
    	List<Books> books = null;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "FROM Books ORDER BY sold DESC";
            Query<Books> query = session.createQuery(hql, Books.class);
            query.setMaxResults(3); // Giới hạn kết quả về 3 cuốn sách

            books = query.list();
            
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
        return books;
    }
    
    
}
