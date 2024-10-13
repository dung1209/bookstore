package SpringMVC.AdminController;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import Dao.BooksDao;
import bookstorePTIT.bean.Authors;
import bookstorePTIT.bean.Books;
import bookstorePTIT.bean.Categories;
import bookstorePTIT.bean.Publishers;

@Controller
public class BookController {
	private BooksDao bookDao = new BooksDao();
	
	@RequestMapping(value = "/admin/book-manage/add-new-book", method = RequestMethod.POST)
	public String addNewBook(@RequestParam("name") String name,
							@RequestParam("authorID") int authorID,
							@RequestParam("categoryID") int categoryID,
							@RequestParam("publisherID") int publisherID,
							@RequestParam("publicationDate") int year,
							@RequestParam("title") String title,
							@RequestParam("price") Double price,
							
							@RequestParam("image") CommonsMultipartFile imageFile,
							HttpServletRequest request) {
		//@RequestParam("stock") int stock,
		Books newBook = new Books();
		System.out.println("check img: " + imageFile.toString());
		
	        try {
	        	 String saveDirectory=request.getSession().getServletContext().getRealPath("/")+"WEB-INF"+File.separator+"assets"+File.separator+"admin"+File.separator+"home\\";//to save to images folder
	        	   String fileName = imageFile.getOriginalFilename();//getting file name
	        	   System.out.println("directory with file name: " + saveDirectory+fileName);
	        	   imageFile.transferTo(new File(saveDirectory + fileName));
	            
	            newBook.setImage(imageFile.getOriginalFilename());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    
		Categories cate = new Categories();
		cate.setId(categoryID);
		Authors author = new Authors();
		author.setId(authorID);
		Publishers publisher = new Publishers();
		publisher.setPublisherID(publisherID);
		
		newBook.setName(name);
		newBook.setAuthor(author);
		newBook.setCategory(cate);
		newBook.setPublisher(publisher);
		newBook.setPublicationDate(year);
		newBook.setTitle(title);
		newBook.setPrice(price);
		newBook.setSold(0);
		newBook.setStock(0);
		newBook.setCreatedAt(new Date());
		//newBook.setImage("test.png");
		
		System.out.println(newBook);
		
		bookDao.save(newBook);
		
		return "redirect:/admin/book-manage";
	}
	
	@RequestMapping(value = "/admin/book-manage/delete/{id}", method = RequestMethod.POST)
	public String deleteBook(@PathVariable("id") int id) {
		bookDao.deleteById(id);
		return "redirect:/admin/book-manage";
	}
	
	@RequestMapping(value = "/admin/book-manage/update/{id}", method = RequestMethod.POST)
	public String updateBook(@PathVariable("id") int id,
			@RequestParam("name") String name,
			@RequestParam("authorID") int authorID,
			@RequestParam("categoryID") int categoryID,
			@RequestParam("publisherID") int publisherID,
			@RequestParam("publicationDate") int year,
			@RequestParam("title") String title,
			@RequestParam("price") Double price,
			@RequestParam("stock") int stock,
			@RequestParam("sold") int sold,
			@RequestParam("image") String img,
			HttpServletRequest request) {
		
		Books newBook = new Books();
		
		Categories cate = new Categories();
		cate.setId(categoryID);
		Authors author = new Authors();
		author.setId(authorID);
		Publishers publisher = new Publishers();
		publisher.setPublisherID(publisherID);
		
		newBook.setId(id);
		newBook.setName(name);
		newBook.setAuthor(author);
		newBook.setCategory(cate);
		newBook.setPublisher(publisher);
		newBook.setPublicationDate(year);
		newBook.setTitle(title);
		newBook.setPrice(price);
		newBook.setSold(sold);
		newBook.setStock(stock);
		newBook.setCreatedAt(new Date());
		newBook.setImage(img);
		
		bookDao.update(newBook);
		
		return "redirect:/admin/book-manage";
	}
	
	@RequestMapping(value = "/admin/book-manage/find", method = RequestMethod.GET)
	public String findBooks(@RequestParam("selectOption") String option,
			@RequestParam("inputText") String input, Model model) {
		List<Books> books = new ArrayList<>();
		int type = Integer.valueOf(option);
		switch (type) {
        	case 0:
        		books = bookDao.findBooksByName(input);
        		System.out.println(">>>>>check find book: " + books);
        		break;
        	case 1:
        		books = bookDao.findBooksByAuthor(input);
        		System.out.println(">>>>>check find book: " + books);
        		break;
        	case 2:
        		books = bookDao.findBooksByCategory(input);
        		System.out.println(">>>>>check find book: " + books);
        		break;
        	case 3:
        		books = bookDao.findBooksByPublisher(input);
        		System.out.println(">>>>>check find book: " + books);
        		break;
        	default:
        		break;
		}
		model.addAttribute("books", books);
		return "admin/BookManage";
	}
}
