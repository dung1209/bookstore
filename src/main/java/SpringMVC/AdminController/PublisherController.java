package SpringMVC.AdminController;

import java.io.File;
import java.math.BigDecimal;
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
import Dao.CategoriesDao;
import Dao.ImportsDao;
import Dao.PublishersDao;
import bookstorePTIT.bean.Authors;
import bookstorePTIT.bean.Books;
import bookstorePTIT.bean.Categories;
import bookstorePTIT.bean.Imports;
import bookstorePTIT.bean.Publishers;

@Controller
public class PublisherController {
	PublishersDao publishersDao = new PublishersDao();
	
	@RequestMapping(value = "/admin/publisher-manage/add-new-publisher", method = RequestMethod.POST)
	public String addNewPublisher(@ModelAttribute("newPublisher") Publishers newPublisher) {
		publishersDao.save(newPublisher);
		System.out.println(">>>>check add publisher: " + newPublisher);
		
		return "redirect:/admin/publisher-manage";
	}
	
	@RequestMapping(value = "/admin/publisher-manage/update/{publisherID}", method = RequestMethod.POST)
	public String updatePublisher(@RequestParam("name") String name,
			@PathVariable("publisherID") int publisherID) {
		Publishers publisher = publishersDao.findPublisherById(publisherID);
		publisher.setName(name);
		System.out.println(">>>check update publisher: " + publisher);
		
		publishersDao.update(publisher);
		return "redirect:/admin/publisher-manage";
	}
	
	@RequestMapping(value = "/admin/publisher-manage/delete/{publisherID}", method = RequestMethod.POST)
	public String deletePublisher(@PathVariable("publisherID") int categoryID) {
		publishersDao.deleteById(categoryID);
		return "redirect:/admin/publisher-manage";
	}
	
	@RequestMapping(value = "/admin/publisher-manage/find", method = RequestMethod.GET)
	public String findpublishers(@RequestParam("inputText") String input, Model model) {
		List<Publishers> publishers = publishersDao.findPublisherByName(input);
		
		model.addAttribute("publishers", publishers);
		return "admin/PublisherManage";
	}
}
