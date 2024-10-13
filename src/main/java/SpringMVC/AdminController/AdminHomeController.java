package SpringMVC.AdminController;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import Dao.AuthorsDao;
import Dao.BooksDao;
import Dao.CategoriesDao;
import Dao.ImportsDao;
import Dao.PublishersDao;
import bookstorePTIT.bean.Authors;
import bookstorePTIT.bean.Books;
import bookstorePTIT.bean.Categories;
import bookstorePTIT.bean.Imports;
import bookstorePTIT.bean.Publishers;

@Controller
@RequestMapping("/admin")
public class AdminHomeController {
	BooksDao booksDao = new BooksDao();
	AuthorsDao authorsDao = new AuthorsDao();
	CategoriesDao categoriesDao = new CategoriesDao();
	PublishersDao publishersDao = new PublishersDao();
	ImportsDao importsDao = new ImportsDao();
	
	@RequestMapping("/home")
	public String index(Model model) {
		
		return "admin/Home";
	}
	
	@RequestMapping("/book-manage")
	public String bookManage(Model model) {
		List<Books> books = booksDao.getBooks();
		model.addAttribute("books", books);
		
		Set<Publishers> uniquePublishers = new HashSet<>(publishersDao.getPublishers());
		Set<Categories> uniqueCategories  = new HashSet<>(categoriesDao.getCategories());
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
	
	@RequestMapping("/staff-manage")
	public String staffManage() {
		return "admin/StaffManage";
	}
	
	@RequestMapping("/statistic-manage")
	public String statisticManage() {
		return "admin/StatisticManage";
	}
}
