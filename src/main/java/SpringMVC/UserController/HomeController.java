package SpringMVC.UserController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import Dao.CategoriesDao;
import Dao.AuthorsDao;
import Dao.BooksDao;
import bookstorePTIT.bean.Categories;
import bookstorePTIT.bean.Authors;
import bookstorePTIT.bean.Books;
import java.util.List;

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
    
}
