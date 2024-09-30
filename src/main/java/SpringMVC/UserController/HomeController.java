package SpringMVC.UserController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import Dao.CategoriesDao;
import Dao.AuthorsDao;
import Dao.BooksDao;
import Dao.CartsDao;
import bookstorePTIT.bean.Categories;
import bookstorePTIT.bean.Authors;
import bookstorePTIT.bean.Books;
import bookstorePTIT.bean.Carts;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String index(Model model) {
        CategoriesDao categoriesDao = new CategoriesDao();
        AuthorsDao authorsDao = new AuthorsDao();
        BooksDao booksDao = new BooksDao();
        List<Categories> categories = categoriesDao.getCategories();
        List<Authors> authors = authorsDao.getAuthors();
        List<Books> books = booksDao.getBooks();
        model.addAttribute("categories", categories);
        model.addAttribute("authors", authors);
        model.addAttribute("books", books);
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
            Authors author = booksDao.findAuthorById(book.getAuthorID());
            authorName = (author != null) ? author.getName() : "Không rõ";
            Categories category = booksDao.findCategoryById(book.getCategoryID());
            categoryName = (category != null) ? category.getName() : "Không rõ";
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
    public ResponseEntity<Map<String, String>> addToCart(@RequestBody Carts cart) {
        CartsDao cartsDao = new CartsDao();
        cart.setCustomerID(2);
        cart.setQuantity(1);
        cartsDao.save(cart);
        //return ResponseEntity.ok("Sản phẩm đã được thêm vào giỏ hàng!");
        return ResponseEntity.ok(Collections.singletonMap("", "Sản phẩm đã được thêm vào giỏ hàng!"));

    }

    
}
