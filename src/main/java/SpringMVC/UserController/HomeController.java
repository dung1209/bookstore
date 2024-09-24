package SpringMVC.UserController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
}
