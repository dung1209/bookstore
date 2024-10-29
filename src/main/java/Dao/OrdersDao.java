package Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import bookstorePTIT.bean.Books;
import bookstorePTIT.bean.Orders;
import HibernateUtils.HibernateUtils;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

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
	
	public Orders findOrderById(int orderID) {
		Orders order = null;
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Orders where id = :orderID";
            Query<Orders> query = session.createQuery(hql, Orders.class);
            query.setParameter("orderID", orderID);
            order = query.uniqueResult();
            
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
        return order;
    }
	
	public List<Orders> getOrders() {
        List<Orders> ordersList = new ArrayList<Orders>();
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Orders";
            Query<Orders> query = session.createQuery(hql, Orders.class);
            ordersList = query.getResultList();
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
        return ordersList;
    }
	
	public void update(Orders order) {
    	Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtils.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.update(order);
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
	
	public List<Integer> getStatuses() {
		List<Integer> status = new ArrayList<Integer>();
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            // Câu truy vấn HQL lấy danh sách trạng thái từ bảng Orders
            String hql = "SELECT o.status FROM Orders o";
            Query<Integer> query = session.createQuery(hql, Integer.class);
            
            // Lấy danh sách trạng thái và thêm vào List
            status = query.getResultList();

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
        return status;
	}
	
	public List<Orders> findOrdersByName(String name) {
    	List<Orders> orders = new ArrayList<Orders>();
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Orders where name LIKE :name";
            Query<Orders> query = session.createQuery(hql, Orders.class);
            query.setParameter("name", "%" + name + "%");
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
	
	public List<Orders> findOrdersByPhone(String phone) {
    	List<Orders> orders = new ArrayList<Orders>();
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Orders where phone LIKE :phone";
            Query<Orders> query = session.createQuery(hql, Orders.class);
            query.setParameter("phone", "%" + phone + "%");
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
	
	public List<Orders> findOrdersByStatus(int status) {
    	List<Orders> orders = new ArrayList<Orders>();
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();

            String hql = "from Orders where status = :status";
            Query<Orders> query = session.createQuery(hql, Orders.class);
            query.setParameter("status", status);
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
	
	public List<Orders> findOrdersByDate(LocalDate date) {
    	List<Orders> orders = new ArrayList<Orders>();
        Session session = null;
        Transaction transaction = null;
        try {
            if (factory == null) {
                factory = HibernateUtils.getSessionFactory();
            }
            session = factory.openSession();
            transaction = session.beginTransaction();
            
            java.sql.Date sqlDate = java.sql.Date.valueOf(date);
            String hql = "from Orders where CAST(orderDate AS date) = :date";
            Query<Orders> query = session.createQuery(hql, Orders.class);
            query.setParameter("date", sqlDate);
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

	public int getTotalOrdersToday() {
		Session session = null;
		Transaction transaction = null;
		int totalOrders = 0;

		try {
			session = factory.openSession();
			transaction = session.beginTransaction();

			String hql = "SELECT COUNT(o) FROM Orders o WHERE o.status = 3 AND CAST(o.orderDate AS date) = CAST(CURRENT_TIMESTAMP AS date)";
			totalOrders = ((Long) session.createQuery(hql).uniqueResult()).intValue();

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

		return totalOrders;
	}

	public BigDecimal getTotalRevenueToday() {
		Session session = null;
		Transaction transaction = null;
		BigDecimal revenueToday = BigDecimal.ZERO;

		try {
			session = factory.openSession();
			transaction = session.beginTransaction();

			String hql = "SELECT sum(o.total) FROM Orders o WHERE o.status = 3 AND CAST(o.orderDate AS date) = CAST(CURRENT_TIMESTAMP AS date)";
			revenueToday = (BigDecimal) session.createQuery(hql).uniqueResult();

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

		return revenueToday;
	}

	public BigDecimal getTotalRevenueThisMonth() {
		Session session = null;
		Transaction transaction = null;
		BigDecimal revenueThisMonth = BigDecimal.ZERO;

		try {
			session = factory.openSession();
			transaction = session.beginTransaction();

			String hql = "SELECT sum(o.total) FROM Orders o WHERE o.status = 3 AND MONTH(o.orderDate) = MONTH(CURRENT_TIMESTAMP) AND YEAR(o.orderDate) = YEAR(CURRENT_TIMESTAMP)";
			revenueThisMonth = (BigDecimal) session.createQuery(hql).uniqueResult();

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

		return revenueThisMonth;
	}

	public BigDecimal getTotalRevenueThisYear() {
		Session session = null;
		Transaction transaction = null;
		BigDecimal revenueThisYear = BigDecimal.ZERO;

		try {
			session = factory.openSession();
			transaction = session.beginTransaction();

			String hql = "SELECT sum(o.total) FROM Orders o WHERE o.status = 3 AND YEAR(o.orderDate) = YEAR(CURRENT_TIMESTAMP)";
			revenueThisYear = (BigDecimal) session.createQuery(hql).uniqueResult();

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

		return revenueThisYear;
	}

	public Map<String, BigDecimal> getDailyRevenue(int month, int year) {
		Map<String, BigDecimal> dailyRevenue = new TreeMap<>();
		Session session = null;
		Transaction transaction = null;
		try {
			if (factory == null) {
				factory = HibernateUtils.getSessionFactory();
			}
			session = factory.openSession();
			transaction = session.beginTransaction();

			String hql = "SELECT DAY(o.orderDate), SUM(o.total) " + "FROM Orders o "
					+ "WHERE o.status = 3 AND MONTH(o.orderDate) = :month AND YEAR(o.orderDate) = :year "
					+ "GROUP BY DAY(o.orderDate) " + "ORDER BY DAY(o.orderDate) ASC";

			Query<Object[]> query = session.createQuery(hql, Object[].class);
			query.setParameter("month", month);
			query.setParameter("year", year);

			List<Object[]> results = query.list();

			int daysInMonth = YearMonth.of(year, month).lengthOfMonth();
			for (int day = 1; day <= daysInMonth; day++) {
				String formattedDay = String.valueOf(day);
				dailyRevenue.put(formattedDay, BigDecimal.ZERO);
			}

			// Duyệt qua kết quả và thêm vào map doanh thu theo ngày
			for (Object[] row : results) {
				System.out.println(">>>check result:" + row[0] + "---" + row[1]);
				String day = String.valueOf(row[0]);
				BigDecimal revenue = (BigDecimal) row[1];
				dailyRevenue.put(day, revenue);
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
		return dailyRevenue;
	}

	public Map<String, BigDecimal> getMonthlyRevenue(int year) {
		Map<String, BigDecimal> monthlyRevenue = new LinkedHashMap<>();
		Session session = null;
		Transaction transaction = null;

		for (int i = 1; i <= 12; i++) {
			monthlyRevenue.put(String.valueOf(i), BigDecimal.ZERO);
		}
		try {
			if (factory == null) {
				factory = HibernateUtils.getSessionFactory();
			}
			session = factory.openSession();
			transaction = session.beginTransaction();

			String hql = "SELECT MONTH(o.orderDate), SUM(o.total) " + "FROM Orders o "
					+ "WHERE o.status = 3 AND YEAR(o.orderDate) = :year " + "GROUP BY MONTH(o.orderDate) "
					+ "ORDER BY MONTH(o.orderDate) ASC";

			Query<Object[]> query = session.createQuery(hql, Object[].class);
			query.setParameter("year", year);

			List<Object[]> results = query.list();

			for (Object[] row : results) {
				System.out.println(">>>check result:" + row[0] + "---" + row[1]);
				String month = String.valueOf(row[0]);
				BigDecimal revenue = (BigDecimal) row[1];
				monthlyRevenue.put(month, revenue);
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
		return monthlyRevenue;
	}

	public Map<String, BigDecimal> getYearlyRevenue() {
		Map<String, BigDecimal> yearlyRevenue = new LinkedHashMap<>();
		Session session = null;
		Transaction transaction = null;

		try {
			if (factory == null) {
				factory = HibernateUtils.getSessionFactory();
			}
			session = factory.openSession();
			transaction = session.beginTransaction();

			String hql = "SELECT YEAR(o.orderDate), SUM(o.total) " + "FROM Orders o " + "WHERE o.status = 3 "
					+ "GROUP BY YEAR(o.orderDate) " + "ORDER BY YEAR(o.orderDate) ASC";

			Query<Object[]> query = session.createQuery(hql, Object[].class);

			List<Object[]> results = query.list();

			for (Object[] row : results) {
				System.out.println(">>>check result:" + row[0] + "---" + row[1]);
				String year = String.valueOf(row[0]);
				BigDecimal revenue = (BigDecimal) row[1];
				yearlyRevenue.put(year, revenue);
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
		return yearlyRevenue;
	}

	public Map<String, BigDecimal> getCustomRevenue(String timeStart, String timeEnd, String type) {
		Map<String, BigDecimal> revenue = new HashMap<>();

		LocalDate startDate = (timeStart != null && !timeStart.isEmpty()) ? LocalDate.parse(timeStart) : null;
		LocalDate endDate = (timeEnd != null && !timeEnd.isEmpty()) ? LocalDate.parse(timeEnd) : null;

		switch (type) {
		case "daily":
			// Nếu không có cả hai, xử lý doanh thu hàng ngày toàn bộ
			if (startDate != null && endDate == null) {
				return getDailyRevenueFromDate(startDate); // Từ timeStart đến hiện tại
			} else if (startDate == null && endDate != null) {
				return getDailyRevenueToDate(endDate); // Từ dữ liệu đầu tiên đến timeEnd
			} else {
				return getDailyRevenueInRange(startDate, endDate); // Trong khoảng thời gian
			}
		case "monthly":
			// Tương tự cho doanh thu hàng tháng
			if (startDate != null && endDate == null) {
				return getMonthlyRevenueFromDate(startDate); // Từ timeStart đến hiện tại
			} else if (startDate == null && endDate != null) {
				return getMonthlyRevenueToDate(endDate); // Từ dữ liệu đầu tiên đến timeEnd
			} else {
				return getMonthlyRevenueInRange(startDate, endDate); // Trong khoảng thời gian
			}
		case "yearly":
			// Tương tự cho doanh thu hàng năm
			if (startDate != null && endDate == null) {
				return getYearlyRevenueFromDate(startDate); // Từ timeStart đến hiện tại
			} else if (startDate == null && endDate != null) {
				return getYearlyRevenueToDate(endDate); // Từ dữ liệu đầu tiên đến timeEnd
			} else {
				return getYearlyRevenueInRange(startDate, endDate); // Trong khoảng thời gian
			}
		default:
			// Xử lý khi type không hợp lệ (nếu cần)
			break;
		}
		return revenue;
	}

	private Map<String, BigDecimal> getDailyRevenueFromDate(LocalDate startDate) {
		Map<String, BigDecimal> dailyRevenue = new LinkedHashMap<>();

		Session session = null;
		Transaction transaction = null;
		
		try {
			session = factory.openSession();
			transaction = session.beginTransaction();

			String hql = "SELECT CAST(o.orderDate AS date) AS OrderDate, SUM(o.total) AS TotalRevenue " +
		             "FROM Orders o " +
		             "WHERE o.status = 3 AND o.orderDate >= :startDate " +
		             "GROUP BY CAST(o.orderDate AS date) " +
		             "ORDER BY CAST(o.orderDate AS date) ASC";

			Query<Object[]> query = session.createQuery(hql, Object[].class);
			query.setParameter("startDate", startDate.atStartOfDay());

			List<Object[]> results = query.list();

			for (Object[] row : results) {
				String date = String.valueOf(row[0]);
				BigDecimal revenue = (BigDecimal) row[1];
				dailyRevenue.put(date, revenue);
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

		return dailyRevenue;
	}

	private Map<String, BigDecimal> getDailyRevenueToDate(LocalDate endDate) {
		Map<String, BigDecimal> dailyRevenue = new LinkedHashMap<>();

		Session session = null;
		Transaction transaction = null;

		try {
			session = factory.openSession();
			transaction = session.beginTransaction();

			String hql = "SELECT CAST(o.orderDate AS date) AS OrderDate, SUM(o.total) AS TotalRevenue " +
		             "FROM Orders o " +
		             "WHERE o.status = 3 AND o.orderDate <= :endDate " +
		             "GROUP BY CAST(o.orderDate AS date) " +
		             "ORDER BY CAST(o.orderDate AS date) ASC";

			Query<Object[]> query = session.createQuery(hql, Object[].class);
			query.setParameter("endDate", endDate.atStartOfDay());

			List<Object[]> results = query.list();

			for (Object[] row : results) {
				String date = String.valueOf(row[0]);
				BigDecimal revenue = (BigDecimal) row[1];
				dailyRevenue.put(date, revenue);
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

		return dailyRevenue;
	}

	private Map<String, BigDecimal> getDailyRevenueInRange(LocalDate startDate, LocalDate endDate) {
		Map<String, BigDecimal> dailyRevenue = new LinkedHashMap<>();

		Session session = null;
		Transaction transaction = null;

		try {
			session = factory.openSession();
			transaction = session.beginTransaction();

			String hql = "SELECT CAST(o.orderDate AS date) AS OrderDate, SUM(o.total) AS TotalRevenue " +
		             "FROM Orders o " +
		             "WHERE o.status = 3 AND o.orderDate BETWEEN :startDate AND :endDate " +
		             "GROUP BY CAST(o.orderDate AS date) " +
		             "ORDER BY CAST(o.orderDate AS date) ASC";

			Query<Object[]> query = session.createQuery(hql, Object[].class);
			query.setParameter("startDate", startDate.atStartOfDay());
			query.setParameter("endDate", endDate.atStartOfDay());

			List<Object[]> results = query.list();

			for (Object[] row : results) {
				String date = String.valueOf(row[0]);
				BigDecimal revenue = (BigDecimal) row[1];
				dailyRevenue.put(date, revenue);
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

		return dailyRevenue;
	}
	
	
	private Map<String, BigDecimal> getMonthlyRevenueFromDate(LocalDate startDate) {
	    Map<String, BigDecimal> monthlyRevenue = new LinkedHashMap<>();
	    
	    Session session = null;
	    Transaction transaction = null;
	    
	    try {
	        session = factory.openSession();
	        transaction = session.beginTransaction();

	        String hql = "SELECT MONTH(o.orderDate), SUM(o.total) " 
	                   + "FROM Orders o "
	                   + "WHERE o.status = 3 AND o.orderDate >= :startDate "
	                   + "GROUP BY MONTH(o.orderDate) "
	                   + "ORDER BY MONTH(o.orderDate) ASC";

	        Query<Object[]> query = session.createQuery(hql, Object[].class);
	        query.setParameter("startDate", startDate.atStartOfDay());

	        List<Object[]> results = query.list();

	        for (Object[] row : results) {
	            String month = String.valueOf(row[0]);
	            BigDecimal revenue = (BigDecimal) row[1];
	            monthlyRevenue.put(month, revenue);
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
	    
	    return monthlyRevenue;
	}

	private Map<String, BigDecimal> getMonthlyRevenueToDate(LocalDate endDate) {
	    Map<String, BigDecimal> monthlyRevenue = new LinkedHashMap<>();

	    Session session = null;
	    Transaction transaction = null;

	    try {
	        session = factory.openSession();
	        transaction = session.beginTransaction();

	        String hql = "SELECT MONTH(o.orderDate), SUM(o.total) " 
	                   + "FROM Orders o "
	                   + "WHERE o.status = 3 AND o.orderDate <= :endDate "
	                   + "GROUP BY MONTH(o.orderDate) "
	                   + "ORDER BY MONTH(o.orderDate) ASC";


	        Query<Object[]> query = session.createQuery(hql, Object[].class);
	        query.setParameter("endDate", endDate.atStartOfDay());

	        List<Object[]> results = query.list();

	        for (Object[] row : results) {
	            String month = String.valueOf(row[0]);
	            BigDecimal revenue = (BigDecimal) row[1];
	            monthlyRevenue.put(month, revenue);
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

	    return monthlyRevenue;
	}

	private Map<String, BigDecimal> getMonthlyRevenueInRange(LocalDate startDate, LocalDate endDate) {
	    Map<String, BigDecimal> monthlyRevenue = new LinkedHashMap<>();

	    Session session = null;
	    Transaction transaction = null;

	    try {
	        session = factory.openSession();
	        transaction = session.beginTransaction();

	        String hql = "SELECT MONTH(o.orderDate), SUM(o.total) " 
	                   + "FROM Orders o "
	                   + "WHERE o.status = 3 AND o.orderDate BETWEEN :startDate AND :endDate "
	                   + "GROUP BY MONTH(o.orderDate) "
	                   + "ORDER BY MONTH(o.orderDate) ASC";

	        Query<Object[]> query = session.createQuery(hql, Object[].class);
	        query.setParameter("startDate", startDate.atStartOfDay());
	        query.setParameter("endDate", endDate.atStartOfDay());

	        List<Object[]> results = query.list();

	        for (Object[] row : results) {
	            String month = String.valueOf(row[0]);
	            BigDecimal revenue = (BigDecimal) row[1];
	            monthlyRevenue.put(month, revenue);
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

	    return monthlyRevenue;
	}

	private Map<String, BigDecimal> getYearlyRevenueFromDate(LocalDate startDate) {
	    Map<String, BigDecimal> yearlyRevenue = new LinkedHashMap<>();

	    Session session = null;
	    Transaction transaction = null;
	    
	    try {
	        session = factory.openSession();
	        transaction = session.beginTransaction();

	        String hql = "SELECT YEAR(o.orderDate), SUM(o.total) " 
	                   + "FROM Orders o "
	                   + "WHERE o.status = 3 AND o.orderDate >= :startDate "
	                   + "GROUP BY YEAR(o.orderDate) "
	                   + "ORDER BY YEAR(o.orderDate) ASC";

	        Query<Object[]> query = session.createQuery(hql, Object[].class);
	        query.setParameter("startDate", startDate.atStartOfDay());

	        List<Object[]> results = query.list();

	        for (Object[] row : results) {
	            String year = String.valueOf(row[0]);
	            BigDecimal revenue = (BigDecimal) row[1];
	            yearlyRevenue.put(year, revenue);
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

	    return yearlyRevenue;
	}

	private Map<String, BigDecimal> getYearlyRevenueToDate(LocalDate endDate) {
	    Map<String, BigDecimal> yearlyRevenue = new LinkedHashMap<>();

	    Session session = null;
	    Transaction transaction = null;

	    try {
	        session = factory.openSession();
	        transaction = session.beginTransaction();

	        String hql = "SELECT YEAR(o.orderDate), SUM(o.total) " 
	                   + "FROM Orders o "
	                   + "WHERE o.status = 3 AND o.orderDate <= :endDate "
	                   + "GROUP BY YEAR(o.orderDate) "
	                   + "ORDER BY YEAR(o.orderDate) ASC";

	        Query<Object[]> query = session.createQuery(hql, Object[].class);
	        query.setParameter("endDate", endDate.atStartOfDay());

	        List<Object[]> results = query.list();

	        for (Object[] row : results) {
	            String year = String.valueOf(row[0]);
	            BigDecimal revenue = (BigDecimal) row[1];
	            yearlyRevenue.put(year, revenue);
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

	    return yearlyRevenue;
	}

	private Map<String, BigDecimal> getYearlyRevenueInRange(LocalDate startDate, LocalDate endDate) {
	    Map<String, BigDecimal> yearlyRevenue = new LinkedHashMap<>();

	    Session session = null;
	    Transaction transaction = null;

	    try {
	        session = factory.openSession();
	        transaction = session.beginTransaction();

	        String hql = "SELECT YEAR(o.orderDate), SUM(o.total) " 
	                   + "FROM Orders o "
	                   + "WHERE o.status = 3 AND o.orderDate BETWEEN :startDate AND :endDate "
	                   + "GROUP BY YEAR(o.orderDate) "
	                   + "ORDER BY YEAR(o.orderDate) ASC";

	        Query<Object[]> query = session.createQuery(hql, Object[].class);
	        query.setParameter("startDate", startDate.atStartOfDay());
	        query.setParameter("endDate", endDate.atStartOfDay());

	        List<Object[]> results = query.list();

	        for (Object[] row : results) {
	            String year = String.valueOf(row[0]);
	            BigDecimal revenue = (BigDecimal) row[1];
	            yearlyRevenue.put(year, revenue);
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

	    return yearlyRevenue;
	}

}
