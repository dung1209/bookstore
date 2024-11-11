package SpringMVC.AdminController;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.transaction.annotation.Transactional;
import org.hibernate.Hibernate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import Dao.AuthorsDao;
import Dao.BooksDao;
import Dao.CategoriesDao;
import Dao.EmployeesDao;
import Dao.ImportsDao;
import Dao.Order_ItemsDao;
import Dao.OrdersDao;
import Dao.PublishersDao;
import bookstorePTIT.bean.Authors;
import bookstorePTIT.bean.Books;
import bookstorePTIT.bean.Categories;
import bookstorePTIT.bean.Employees;
import bookstorePTIT.bean.Imports;
import bookstorePTIT.bean.Order_Items;
import bookstorePTIT.bean.Orders;
import bookstorePTIT.bean.Publishers;

@Controller
@RequestMapping("/admin")
public class AdminHomeController {
	BooksDao booksDao = new BooksDao();
	AuthorsDao authorsDao = new AuthorsDao();
	CategoriesDao categoriesDao = new CategoriesDao();
	PublishersDao publishersDao = new PublishersDao();
	ImportsDao importsDao = new ImportsDao();
	EmployeesDao employeesDao = new EmployeesDao();
	OrdersDao ordersDao = new OrdersDao();
	Order_ItemsDao order_ItemsDao = new Order_ItemsDao();

	@RequestMapping("/home")
	public String index(Model model) {
		int countBook = booksDao.getTotalRemainingStock();
		model.addAttribute("countBook", countBook);

		int ordersToday = ordersDao.getTotalOrdersToday();
		model.addAttribute("ordersToday", ordersToday);

		DecimalFormat df = new DecimalFormat("#,###");
		BigDecimal revenueToday = ordersDao.getTotalRevenueToday();
		model.addAttribute("revenueToday", df.format(revenueToday != null ? revenueToday : BigDecimal.ZERO));
		BigDecimal revenueThisMonth = ordersDao.getTotalRevenueThisMonth();
		model.addAttribute("revenueThisMonth", df.format(revenueThisMonth != null ? revenueThisMonth : BigDecimal.ZERO));
		BigDecimal revenueThisYear = ordersDao.getTotalRevenueThisYear();
		model.addAttribute("revenueThisYear", df.format(revenueThisYear != null ? revenueThisYear : BigDecimal.ZERO));

		List<Books> topSellingBooks = booksDao.getTopSellingBooks();
		model.addAttribute("topSellingBooks", topSellingBooks);
		return "admin/Home";
	}

	@RequestMapping("/order")
	public String orderManage(Model model) {
		List<Orders> orders = ordersDao.getOrders();
		Map<Integer, List<Order_Items>> orderDetailsMap = new HashMap<>();
		Map<Integer, List<Map<String, Object>>> booksInOrder = new HashMap<>();
		int[] status = {1, 2, 3, 4};
	    for (Orders order : orders) {
	    	// Lấy danh sách sách trong đơn hàng
	        List<Object[]> booksData = order_ItemsDao.getBooksInOrder(order.getId());
	        List<Map<String, Object>> booksList = new ArrayList<>();

	        // Chuyển dữ liệu từ Object[] sang Map để dễ dùng trong JSON
	        for (Object[] obj : booksData) {
	            Map<String, Object> bookInfo = new HashMap<>();
	            bookInfo.put("name", obj[0]);
	            bookInfo.put("quantity", obj[1]);
	            bookInfo.put("price", obj[2]);
	            booksList.add(bookInfo);
	        }
	        booksInOrder.put(order.getId(), booksList);
	        List<Order_Items> orderDetails = order_ItemsDao.getOrderDetail(order.getId());
	        orderDetailsMap.put(order.getId(), orderDetails);
	    }
	    Gson gson = new Gson();
	    String orderDetailsJson = gson.toJson(orderDetailsMap);
	    String booksNameJson = gson.toJson(booksInOrder);
	    //System.out.println(orderDetailsJson);
		model.addAttribute("status", status);
		model.addAttribute("orders", orders);
		model.addAttribute("orderDetailsMap", orderDetailsJson);
		model.addAttribute("booksNameJson", booksNameJson);
		return "admin/OrderManage";
	}
	
	@RequestMapping("/book-manage")
	public String bookManage(Model model) {
		List<Books> books = booksDao.getBooks();
		model.addAttribute("books", books);

		Set<Publishers> uniquePublishers = new HashSet<>(publishersDao.getPublishers());
		Set<Categories> uniqueCategories = new HashSet<>(categoriesDao.getCategories());
		Set<Authors> uniqueAuthors = new HashSet<>(authorsDao.getAuthors());

		System.out.println("uniqueAuthors: " + uniqueAuthors);
		System.out.println("uniqueCategories: " + uniqueCategories);
		System.out.println("uniquePublishers: " + uniquePublishers);
		model.addAttribute("uniqueAuthors", uniqueAuthors);
		model.addAttribute("uniqueCategories", uniqueCategories);
		model.addAttribute("uniquePublishers", uniquePublishers);
		return "admin/BookManage";
	}

	@RequestMapping("/import-manage")
	public String importManage(Model model) {
		List<Imports> imports = importsDao.getImports();
		Set<Books> uniqueBooks = new HashSet<>(booksDao.getBooks());
		model.addAttribute("uniqueBooks", uniqueBooks);
		model.addAttribute("imports", imports);
		return "admin/ImportManage";
	}

	@RequestMapping("/author-manage")
	public String authorManage(Model model) {
		List<Authors> authors = authorsDao.getAuthors();
		System.out.println(">>>check authors: " + authors);
		model.addAttribute("authors", authors);
		return "admin/AuthorManage";
	}

	@RequestMapping("/category-manage")
	public String categoryManage(Model model) {
		List<Categories> categories = categoriesDao.getCategories();
		model.addAttribute("categories", categories);
		return "admin/CategoryManage";
	}

	@RequestMapping("/publisher-manage")
	public String publisherManage(Model model) {
		List<Publishers> publishers = publishersDao.getPublishers();
		model.addAttribute("publishers", publishers);
		return "admin/PublisherManage";
	}

	@RequestMapping("/employee-manage")
	public String staffManage(Model model) {
		List<Employees> employees = employeesDao.getEmployees();
		model.addAttribute("employees", employees);
		return "admin/EmployeeManage";
	}

	@RequestMapping("/statistic-manage")
	public String statisticManage(@RequestParam(name = "type", defaultValue = "daily") String type,
			@RequestParam(name = "timeStart", required = false) String timeStart,
			@RequestParam(name = "timeEnd", required = false) String timeEnd,
			Model model) {
		Map<String, BigDecimal> data = new HashMap<>();
		LocalDate currentDate = LocalDate.now();
		int currentMonth = currentDate.getMonthValue();
        int currentYear = currentDate.getYear(); 
        
        if ((timeStart == null || timeStart.isEmpty()) && (timeEnd == null || timeEnd.isEmpty())) {
            switch (type) {
                case "daily":
                    data = ordersDao.getDailyRevenue(currentMonth, currentYear);
                    break;
                case "monthly":
                    data = ordersDao.getMonthlyRevenue(currentYear);
                    break;
                case "yearly":
                    data = ordersDao.getYearlyRevenue();
                    break;
                default:
                    // Xử lý khi type không hợp lệ (nếu cần)
                    break;
            }
        } else if (timeStart != null && (timeEnd == null || timeEnd.isEmpty())) {
            // Xử lý khi time được cung cấp
            switch (type) {
                case "daily":
                	data = ordersDao.getCustomRevenue(timeStart, timeEnd, type);
                    break;
                case "monthly":
                	data = ordersDao.getCustomRevenue(timeStart, timeEnd, type);
                    break;
                case "yearly":
                	data = ordersDao.getCustomRevenue(timeStart, timeEnd, type);
                    break;
                default:
                    break;
            }
        } else if ((timeStart == null || timeStart.isEmpty()) && timeEnd != null) {
            // Xử lý khi time được cung cấp
            switch (type) {
                case "daily":
                	data = ordersDao.getCustomRevenue(timeStart, timeEnd, type);
                    break;
                case "monthly":
                	data = ordersDao.getCustomRevenue(timeStart, timeEnd, type);
                    break;
                case "yearly":
                	data = ordersDao.getCustomRevenue(timeStart, timeEnd, type);
                    break;
                default:
                    break;
            }
        } else {
        	switch (type) {
            case "daily":
            	data = ordersDao.getCustomRevenue(timeStart, timeEnd, type);
                break;
            case "monthly":
            	data = ordersDao.getCustomRevenue(timeStart, timeEnd, type);
                break;
            case "yearly":
            	data = ordersDao.getCustomRevenue(timeStart, timeEnd, type);
                break;
            default:
                break;
        }
        }
		model.addAttribute("statistics", new Gson().toJson(data));
		model.addAttribute("selectedType", type);

		return "admin/StatisticManage";
	}
}
