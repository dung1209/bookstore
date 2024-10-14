package SpringMVC.UserController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Dao.CategoriesDao;
import Dao.Order_ItemsDao;
import Dao.OrdersDao;
import Dao.AuthorsDao;
import Dao.BooksDao;
import Dao.CartsDao;
import bookstorePTIT.bean.Categories;
import bookstorePTIT.bean.OrderRequest;
import bookstorePTIT.bean.Orders;
import bookstorePTIT.bean.Authors;
import bookstorePTIT.bean.Books;
import bookstorePTIT.bean.Carts;
import bookstorePTIT.bean.Order_Items;
import java.util.Optional;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class HomeController {

    @RequestMapping("/")
    //public String index(Model model) {
    public String index(@RequestParam(defaultValue = "1") int page, Model model) {
        CategoriesDao categoriesDao = new CategoriesDao();
        AuthorsDao authorsDao = new AuthorsDao();
        BooksDao booksDao = new BooksDao();
        
        List<Categories> categories = categoriesDao.getCategories();
        List<Authors> authors = authorsDao.getAuthors();
        //List<Books> books = booksDao.getBooks();
        /**/
        int booksPerPage = 6;
        int totalBooks = booksDao.countTotalBooks();
        int totalPages = (int) Math.ceil((double) totalBooks / booksPerPage);

        List<Books> paginatedBooks = booksDao.getBooks(page, booksPerPage);
        /**/
        
        model.addAttribute("categories", categories);
        model.addAttribute("authors", authors);
        //model.addAttribute("books", books);
        /**/
        model.addAttribute("books", paginatedBooks);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        /**/
        return "user/Home";
    }
    
    @RequestMapping("/book-detail/{bookId}")
	public String shopCart(@PathVariable("bookId") int bookId, Model model) {
    	CategoriesDao categoriesDao = new CategoriesDao();
        AuthorsDao authorsDao = new AuthorsDao();
        
        BooksDao booksDao = new BooksDao();
        Books book = booksDao.findBookById((int) bookId);
        
        List<Categories> categories = categoriesDao.getCategories();
        List<Authors> authors = authorsDao.getAuthors();
        String authorName = "Không rõ";
        String categoryName = "Không rõ";

        if (book != null) {
            Authors author = authorsDao.findAuthorById(book.getAuthor().getId());
            authorName = (author != null) ? author.getName() : "Không rõ";
            //Categories category = booksDao.findCategoryById(book.getCategoryID());
            //categoryName = (category != null) ? category.getName() : "Không rõ";
        }
        
        model.addAttribute("categories", categories);
        model.addAttribute("authors", authors);
        model.addAttribute("book", book);
        model.addAttribute("authorName", authorName);
        model.addAttribute("categoryName", categoryName); 
		return "user/BookDetail";
	}
    
    @RequestMapping("/shop-cart")
	public String shopCart(Model model) {
    	int customerID = 2; 
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
    public ResponseEntity<Map<String, Integer>> addToCart(@RequestBody Carts cart) {
        CartsDao cartsDao = new CartsDao();
        cart.setCustomerID(2); 
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
                           @RequestParam("quantity") List<String> quantities, 
                           Model model) {
        List<Map<String, String>> selectedBooks = new ArrayList<>();
        BooksDao booksDao = new BooksDao();

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
        return "user/Checkout";
    }
    
    @RequestMapping("/thankyou")
	public String checkout() {
		return "user/Thankyou";
	}
    
    @PostMapping("/create")
    public ResponseEntity<String> createOrder(@RequestBody OrderRequest orderRequest) {
        OrdersDao ordersDao = new OrdersDao();
        CartsDao cartsDao = new CartsDao();
        Order_ItemsDao orderItemsDao = new Order_ItemsDao();
        Orders order = orderRequest.getOrder();
        order.setCustomerID(2);
        order.setStatus(1);
        order.setOrderDate(LocalDateTime.now());
        int orderId = ordersDao.createOrder(
            order.getName(),
            order.getPhone(),
            order.getEmail(),
            order.getAddress(),
            order.getNote(),
            order.getTotal()
        );

        for (Order_Items item : orderRequest.getOrderItems()) {
            item.setOrderID(order.getId());
            item.setOrderID(orderId);
            item.setPrice(item.getPrice() * 1000);
            orderItemsDao.createOrderItems(item);
            cartsDao.deleteFromCart(2, item.getBookID());
        }

        return ResponseEntity.ok("Đơn hàng đã được tạo thành công!");
    }


}
