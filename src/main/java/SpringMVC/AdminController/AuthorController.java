package SpringMVC.AdminController;

import java.io.File;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import Dao.AuthorsDao;
import Dao.BooksDao;
import Dao.ImportsDao;
import bookstorePTIT.bean.Authors;
import bookstorePTIT.bean.Books;
import bookstorePTIT.bean.Categories;
import bookstorePTIT.bean.Imports;
import bookstorePTIT.bean.Publishers;

@Controller
public class AuthorController {
	AuthorsDao authorsDao = new AuthorsDao();
	
	@RequestMapping(value = "/admin/author-manage/add-new-author", method = RequestMethod.POST)
	public String addNewAuthor(@RequestParam("name") String name,
			@RequestParam("bio") String bio,
			@RequestParam("birthdate") String birthdate,
			RedirectAttributes redirectAttributes) {
		System.out.println(">>>>>birthdate" + birthdate.getClass().getName());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date dob = null;
		try {
			dob = formatter.parse(birthdate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
        
		Authors author = new Authors();
		author.setName(name);
		author.setBio(bio);
		author.setBirthdate(dob);
		System.out.println(">>>>>>>check new author" +author);
		authorsDao.save(author);
		//System.out.println(">>>>>add author");
		redirectAttributes.addAttribute("addSuccess", "success");
		return "redirect:/admin/author-manage";
	}
	
	@RequestMapping(value = "/admin/author-manage/update/{authorID}", method = RequestMethod.POST)
	public String updateAuthor(@PathVariable("authorID") int authorID, 
							@RequestParam("name") String name,
							@RequestParam("bio") String bio,
							@RequestParam("birthdate") String birthdate,
							RedirectAttributes redirectAttributes) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date dob = null;
		try {
			dob = formatter.parse(birthdate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
		
		Authors author = authorsDao.findAuthorById(authorID);
		author.setName(name);
		author.setBio(bio);
		author.setBirthdate(dob);
		
		System.out.println(">>>>Check update author: " + author);
		
		authorsDao.update(author);
		redirectAttributes.addAttribute("updateSuccess", "success");
		return "redirect:/admin/author-manage";
	}
	
	@RequestMapping(value = "/admin/author-manage/delete/{authorID}", method = RequestMethod.POST)
	public String deleteAuthor(@PathVariable("authorID") int authorID, RedirectAttributes redirectAttributes) {
		authorsDao.deleteById(authorID);
		redirectAttributes.addAttribute("deleteSuccess", "success");
		return "redirect:/admin/author-manage";
	}
	
	@RequestMapping(value = "/admin/author-manage/find", method = RequestMethod.GET)
	public String findAuthors(@RequestParam("inputText") String input, Model model) {
		List<Authors> authors = authorsDao.findAuthorByName(input);
		model.addAttribute("authors", authors);
		
		return "admin/AuthorManage";
	}
}
