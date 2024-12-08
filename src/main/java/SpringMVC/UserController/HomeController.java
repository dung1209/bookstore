package SpringMVC.UserController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.fasterxml.jackson.databind.ObjectMapper;
import Dao.CategoriesDao;
import Dao.CustomersDao;
import Dao.InteractionDao;
import Dao.Order_ItemsDao;
import Dao.OrdersDao;
import Dao.PublishersDao;
import Dao.AccountsDao;
import Dao.AuthorsDao;
import Dao.BooksDao;
import Dao.CartsDao;
import bookstorePTIT.bean.Categories;
import bookstorePTIT.bean.Customers;
import bookstorePTIT.bean.Interactions;
import bookstorePTIT.bean.OrderRequest;
import bookstorePTIT.bean.Orders;
import bookstorePTIT.bean.Authors;
import bookstorePTIT.bean.Books;
import bookstorePTIT.bean.Carts;
import bookstorePTIT.bean.Publishers;
import service.RecommendationServiceCBF;
import bookstorePTIT.bean.Order_Items;
import java.util.Optional;
import javax.servlet.http.HttpSession;

import java.awt.print.Book;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.time.format.DateTimeFormatter;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String index(@RequestParam(defaultValue = "1") int page, Model model) {
		PublishersDao publishersDao = new PublishersDao();
		CategoriesDao categoriesDao = new CategoriesDao();
		AuthorsDao authorsDao = new AuthorsDao();
		BooksDao booksDao = new BooksDao();
		
		List<Publishers> publishers = publishersDao.getPublishers();
		List<Categories> categories = categoriesDao.getCategories();
		List<Authors> authors = authorsDao.getAuthors();

		int booksPerPage = 9;
		int totalBooks = booksDao.countTotalBooks();
		int totalPages = (int) Math.ceil((double) totalBooks / booksPerPage);
		List<Books> paginatedBooks = booksDao.getBooks(page, booksPerPage);
		
		model.addAttribute("publishers", publishers);
		model.addAttribute("categories", categories);
		model.addAttribute("authors", authors);
		model.addAttribute("books", paginatedBooks);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		return "user/Home";
	}

	 
	RecommendationServiceCBF recommendationServiceCBF = new RecommendationServiceCBF();
	
	@RequestMapping("/book-detail/{bookId}")
	public String shopCart(@PathVariable("bookId") int bookId, Model model) {
		PublishersDao publishersDao = new PublishersDao();
		CategoriesDao categoriesDao = new CategoriesDao();
		AuthorsDao authorsDao = new AuthorsDao();

		BooksDao booksDao = new BooksDao();
		Books book = booksDao.findBookById((int) bookId);
		
		List<Publishers> publishers = publishersDao.getPublishers();
		List<Categories> categories = categoriesDao.getCategories();
		List<Authors> authors = authorsDao.getAuthors();
		String authorName = "Không rõ";
		String categoryName = "Không rõ";
		String publisherName = "Không rõ";

		if (book != null) {
			Authors author = authorsDao.findAuthorById(book.getAuthor().getId());
			authorName = (author != null) ? author.getName() : "Không rõ";
			Categories category = categoriesDao.findCategoryById(book.getCategory().getId());
			categoryName = (category != null) ? category.getName() : "Không rõ";
			Publishers publisher = publishersDao.findPublisherById(book.getPublisher().getPublisherID());
			publisherName = (publisher != null) ? publisher.getName() : "Không rõ";
			
            List<Books> recommendedBooks = recommendationServiceCBF.getRecommendations(book);
    		model.addAttribute("recommendedBooks", recommendedBooks);
		}
		
		model.addAttribute("publishers", publishers);
		model.addAttribute("categories", categories);
		model.addAttribute("authors", authors);
		model.addAttribute("book", book);
		model.addAttribute("authorName", authorName);
		model.addAttribute("categoryName", categoryName);
		model.addAttribute("publisherName", publisherName);
		model.addAttribute("bookID", bookId);
		return "user/BookDetail";
	}

	@RequestMapping("/shop-cart")
	public String shopCart(Model model, HttpSession hsession) {
		Integer accountID = (Integer) hsession.getAttribute("userID");

		if (accountID == null) {
			model.addAttribute("message", "Vui lòng đăng nhập để xem giỏ hàng.");
			model.addAttribute("booksInCart", new ArrayList<Books>());
			model.addAttribute("carts", new ArrayList<Carts>());
			return "user/Cart";
		}

		CustomersDao customersDao = new CustomersDao();
		int customerID = customersDao.getCustomerIDByAccountID(accountID);

		CartsDao cartDao = new CartsDao();
		BooksDao booksDao = new BooksDao();

		List<Carts> carts = cartDao.findCartsByCustomerId(customerID);
		List<Books> booksInCart = new ArrayList<>();

		for (Carts cart : carts) {
			int bookID = cart.getBookID();
			Books book = booksDao.findBookById(bookID);
			if (book != null) {
				booksInCart.add(book);
			}
		}
		model.addAttribute("booksInCart", booksInCart);
		model.addAttribute("carts", carts);
		return "user/Cart";
	}

	@PostMapping("/cart/add")
	public ResponseEntity<Map<String, Integer>> addToCart(@RequestBody Carts cart, Model model, HttpSession hsession) {
		Integer accountID = (Integer) hsession.getAttribute("userID");
		CustomersDao customersDao = new CustomersDao();
		int customerID = customersDao.getCustomerIDByAccountID(accountID);

		CartsDao cartsDao = new CartsDao();
		cart.setCustomerID(customerID);
		Optional<Carts> existingCart = cartsDao.findByCustomerIdAndBookId(cart.getCustomerID(), cart.getBookID());
		if (existingCart.isPresent()) {
			return ResponseEntity.ok(Collections.singletonMap("status", 0));
		} else {
			saveCart(cart);
			return ResponseEntity.ok(Collections.singletonMap("status", 1));
		}
	}

	private void saveCart(Carts cart) {
		CartsDao cartsDao = new CartsDao();
		if (cart.getQuantity() <= 0) {
			cart.setQuantity(1);
		}
		cartsDao.save(cart);
	}

	@GetMapping("/shop-cart/checkout")
	public String checkout(@RequestParam("productId") List<String> productIds,
			@RequestParam("quantity") List<String> quantities, Model model, HttpSession hsession) {
		
		Integer accountID = (Integer) hsession.getAttribute("userID");
		CustomersDao customersDao = new CustomersDao();
		int customerID = customersDao.getCustomerIDByAccountID(accountID);
		
		List<Map<String, String>> selectedBooks = new ArrayList<>();
		BooksDao booksDao = new BooksDao();
		AccountsDao accountsDao = new AccountsDao();

		Customers customer = customersDao.getCustomerById(customerID);
		String email = accountsDao.getEmailByAccountId(customer.getAccountID());

		Map<String, String> customerInfo = new HashMap<>();
		customerInfo.put("name", customer.getName());
		customerInfo.put("phone", customer.getPhone());
		customerInfo.put("address", customer.getAddress());
		customerInfo.put("email", email);

		for (int i = 0; i < productIds.size(); i++) {
			String productId = productIds.get(i);
			String quantity = quantities.get(i);

			int bookId = Integer.parseInt(productId);
			Books book = booksDao.findBookById(bookId);

			if (book != null) {
				Map<String, String> bookDetails = new HashMap<>();
				bookDetails.put("productId", productId);
				bookDetails.put("quantity", quantity);
				bookDetails.put("title", book.getTitle());
				bookDetails.put("name", book.getName());
				bookDetails.put("image", book.getImage());
				bookDetails.put("price", String.valueOf(book.getPrice()));

				selectedBooks.add(bookDetails);
			}
		}
		model.addAttribute("selectedBooks", selectedBooks);
		model.addAttribute("customerInfo", customerInfo);

		return "user/Checkout";
	}

	@RequestMapping("/thankyou")
	public String checkout() {
		return "user/Thankyou";
	}

	@PostMapping("/create")
	public ResponseEntity<String> createOrder(@RequestBody OrderRequest orderRequest, Model model, HttpSession hsession) {
			
		Integer accountID = (Integer) hsession.getAttribute("userID");
		CustomersDao customersDao = new CustomersDao();
		int customerID = customersDao.getCustomerIDByAccountID(accountID);
			
		OrdersDao ordersDao = new OrdersDao();
		CartsDao cartsDao = new CartsDao();
		Order_ItemsDao orderItemsDao = new Order_ItemsDao();
		Orders order = orderRequest.getOrder();
		order.setCustomerID(customerID);
		order.setStatus(1);
		order.setOrderDate(LocalDateTime.now());
		int orderId = ordersDao.createOrder(customerID, order.getName(), order.getPhone(), order.getEmail(), order.getAddress(),
				order.getNote(), order.getTotal());

		for (Order_Items item : orderRequest.getOrderItems()) {
			item.setOrderID(order.getId());
			item.setOrderID(orderId);
			item.setPrice(item.getPrice() * 1000);
			orderItemsDao.createOrderItems(item);
			cartsDao.deleteFromCart(customerID, item.getBookID());
		}
		return ResponseEntity.ok("Đơn hàng đã được tạo thành công!");
	}

	@PostMapping("/cart/delete")
	public ResponseEntity<String> deleteFromCart(@RequestParam("bookID") int bookID, Model model, HttpSession hsession) {
		Integer accountID = (Integer) hsession.getAttribute("userID");
		CustomersDao customersDao = new CustomersDao();
		int customerID = customersDao.getCustomerIDByAccountID(accountID);

		CartsDao cartsDao = new CartsDao();

		Optional<Carts> cartItem = cartsDao.findByCustomerIdAndBookId(customerID, bookID);
		if (cartItem.isPresent()) {
			cartsDao.delete(cartItem.get());
			return ResponseEntity.ok("Sản phẩm đã được xóa khỏi giỏ hàng!");
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Sản phẩm không tồn tại trong giỏ hàng!");
		}
	}

	@GetMapping("/cart/data")
	@ResponseBody
	public ResponseEntity<List<Map<String, Object>>> getCartData(Model model, HttpSession hsession) {
		Integer accountID = (Integer) hsession.getAttribute("userID");
		CustomersDao customersDao = new CustomersDao();
		int customerID = customersDao.getCustomerIDByAccountID(accountID);
			
		CartsDao cartDao = new CartsDao();
		BooksDao booksDao = new BooksDao();

		List<Carts> carts = cartDao.findCartsByCustomerId(customerID);
		List<Map<String, Object>> booksInCart = new ArrayList<>();

		for (Carts cart : carts) {
			int bookID = cart.getBookID();
			Books book = booksDao.findBookById(bookID);
			if (book != null) {
				Map<String, Object> bookInfo = new HashMap<>();
				bookInfo.put("bookID", book.getbookID());
				bookInfo.put("name", book.getName());
				bookInfo.put("price", book.getPrice());
				bookInfo.put("quantity", cart.getQuantity());
				bookInfo.put("image", book.getImage());
				booksInCart.add(bookInfo);
			}
		}
		return ResponseEntity.ok(booksInCart);
	}

	@RequestMapping("/order")
	public String order(Model model, HttpSession hsession) {
		Integer accountID = (Integer) hsession.getAttribute("userID");
		
		if (accountID == null) {
			model.addAttribute("message", "Vui lòng đăng nhập để xem đơn hàng.");
			model.addAttribute("orders", new ArrayList<Orders>());
			return "user/Order";
		}
		
		CustomersDao customersDao = new CustomersDao();
		int customerID = customersDao.getCustomerIDByAccountID(accountID);
		
		OrdersDao ordersDao = new OrdersDao();
		Order_ItemsDao orderItemsDao = new Order_ItemsDao();

		List<Orders> orders = ordersDao.findOrdersByCustomerId(customerID);
		Collections.reverse(orders);

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		for (Orders order : orders) {
			String formattedDate = order.getOrderDate().format(formatter);
			order.setFormattedOrderDate(formattedDate);

			List<Order_Items> orderItems = orderItemsDao.findOrderItemsByOrderId(order.getId());
			order.setOrderItems(orderItems);
		}
		model.addAttribute("orders", orders);
		return "user/Order";
	}

	@RequestMapping(value = "/getBookName", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<String, String>> getBookName(@RequestParam("bookID") int bookID) {
		BooksDao booksDao = new BooksDao();
		Books book = booksDao.findBookById(bookID);

		Map<String, String> response = new HashMap<>();
		if (book != null) {
			response.put("name", book.getName());
		} else {
			response.put("name", "Unknown Book");
		}
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "/getBookImage", method = RequestMethod.GET)
	@ResponseBody
	public String getBookImage(@RequestParam("bookID") int bookID) {
		BooksDao booksDao = new BooksDao();
		Books book = booksDao.findBookById(bookID);

		if (book != null) {
			return book.getImage();
		}
		return "Unknown Image";
	}

	@PostMapping("/order/delete")
	@ResponseBody
	public String deleteOrder(@RequestParam("orderID") int orderID) {
		OrdersDao ordersDao = new OrdersDao();
		Orders order = ordersDao.findOrderById(orderID);

		if (order != null) {
			order.setStatus(0);
			ordersDao.updateOrder(order);
			return "Success";
		}
		return "Order not found";
	}

	@RequestMapping("/contact")
	public String register() {
		return "user/Contact";
	}

	@RequestMapping("/account")
	public String account(Model model, HttpSession hsession) {
		CustomersDao customerDao = new CustomersDao();
		AccountsDao accountDao = new AccountsDao();
		
		Integer accountID = (Integer) hsession.getAttribute("userID");
		String email = accountDao.getEmailByAccountId(accountID);
		
		if (accountID == null) {
			model.addAttribute("customer", null);
			model.addAttribute("email", null);
			return "user/Account";
		}
		
		CustomersDao customersDao = new CustomersDao();
		int customerID = customersDao.getCustomerIDByAccountID(accountID);
		Customers customer = customerDao.getCustomerById(customerID);

		model.addAttribute("customer", customer);
		model.addAttribute("email", email);
		return "user/Account";
	}

	@PostMapping("/updateCustomer")
	@ResponseBody
	public Map<String, Object> updateCustomer(@RequestBody Map<String, Object> requestData, Model model, HttpSession hsession) {
		
		Integer accountID = (Integer) hsession.getAttribute("userID");
		CustomersDao customersDao = new CustomersDao();
		int customerID = customersDao.getCustomerIDByAccountID(accountID);
		
		Map<String, Object> response = new HashMap<>();
		String newEmail = (String) requestData.get("newEmail");
		Customers customer = new ObjectMapper().convertValue(requestData.get("customer"), Customers.class);

		try {
			AccountsDao accountsDao = new AccountsDao();

			Customers existingCustomer = customersDao.getCustomerById(customerID);

			if (existingCustomer != null) {
				existingCustomer.setName(customer.getName());
				existingCustomer.setPhone(customer.getPhone());
				existingCustomer.setAddress(customer.getAddress());

				customersDao.updateCustomer(existingCustomer);

				int accountId = existingCustomer.getAccountID();
				accountsDao.updateEmailByAccountId(accountId, newEmail);

				response.put("success", true);
			} else {
				response.put("success", false);
				response.put("message", "Customer not found");
			}
		} catch (Exception e) {
			response.put("success", false);
			e.printStackTrace();
		}
		return response;
	}
	
	@RequestMapping("/evaluate")
	public String evaluate(@RequestParam("orderId") int orderId, Model model, HttpSession hsession) {
		
	    Order_ItemsDao orderItemsDao = new Order_ItemsDao();
	    BooksDao bookDao = new BooksDao();
	    
	    List<Order_Items> orderItems = orderItemsDao.getOrderDetail(orderId);
	    
	    for (Order_Items item : orderItems) {
	    	Books book = bookDao.findBookById(item.getBookID());
	        
	        item.setName(book.getName());
	        item.setImage(book.getImage());
	    }
	    
	    model.addAttribute("orderItems", orderItems);
	    return "user/Evaluate";
	}
	
	@RequestMapping(value = "/submitRating", method = RequestMethod.POST)
	public String submitRating(@RequestParam("id") int id,
	                            @RequestParam("rating") Integer rating) {
	    Order_ItemsDao orderItemsDao = new Order_ItemsDao();
	    Order_Items orderItem = orderItemsDao.getOrderItemById(id);
	    System.out.print("orderItem: " + orderItem);
	    System.out.print("rating: " + rating);

	    if (orderItem != null) {
	        orderItem.setRating(rating);

	        orderItemsDao.updateOrderItem(orderItem);
	    }
	    return "user/Evaluate";
	}
	
	@PostMapping("/saveInteraction")
    public ResponseEntity<String> saveInteraction(@RequestBody Interactions interaction) {
    	InteractionDao interactionDao = new InteractionDao();
    	Interactions newInter = new Interactions();
    	newInter.setUserID(interaction.getAccountID());
    	newInter.setBookID(interaction.getBookID());
    	newInter.setInteractionType(interaction.getInteractionType());
    	System.out.println(">>> check interaction: " + interaction);
    	System.out.println(">>> check new interaction: " + newInter);
    	boolean exists = interactionDao.checkInteractionExistence(interaction.getAccountID(), interaction.getBookID());
        if (exists) {
        	System.out.println(">>> Tương tác đã tồn tại");
            return ResponseEntity.badRequest().body("Tương tác này đã tồn tại, không thể ghi nhận lại.");
        }
    	interactionDao.save(newInter);
        return ResponseEntity.ok("Tương tác đã được ghi nhận.");
    }
	
	@CrossOrigin(origins = "http://localhost:5064")
	@GetMapping("/booksRecommend/{bookID}")
	public ResponseEntity<Map<String, Object>> booksRecommend(@PathVariable("bookID") int bookID, Model model) {
		BooksDao booksDao = new BooksDao();
		Books book = booksDao.findBookById(bookID);
		Map<String, Object> bookInfo = new HashMap<>();
	    bookInfo.put("bookID", book.getbookID());
	    bookInfo.put("name", book.getName());
	    bookInfo.put("price", book.getPrice());
	    bookInfo.put("image", book.getImage());
	    
		return ResponseEntity.ok(bookInfo);
	}

}