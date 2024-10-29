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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import Dao.BooksDao;
import Dao.CategoriesDao;
import Dao.ImportsDao;
import bookstorePTIT.bean.Authors;
import bookstorePTIT.bean.Books;
import bookstorePTIT.bean.Categories;
import bookstorePTIT.bean.Imports;
import bookstorePTIT.bean.Publishers;

@Controller
public class CategoryController {
	CategoriesDao categoriesDao = new CategoriesDao();
	
	@RequestMapping(value = "/admin/category-manage/add-new-category", method = RequestMethod.POST)
	public String addNewCategory(@ModelAttribute("newCategory") Categories category, RedirectAttributes redirectAttributes) {
		categoriesDao.save(category);
		System.out.println(">>>>check add category:" + category);
		redirectAttributes.addAttribute("addSuccess", "success");
		return "redirect:/admin/category-manage";
	}
	
	@RequestMapping(value = "/admin/category-manage/update/{categoryID}", method = RequestMethod.POST)
	public String updateCategory(@RequestParam("name") String name,
			@PathVariable("categoryID") int categoryID, RedirectAttributes redirectAttributes) {
		Categories category = categoriesDao.findCategoryById(categoryID);
		category.setName(name);
		
		categoriesDao.update(category);
		redirectAttributes.addAttribute("updateSuccess", "success");
		return "redirect:/admin/category-manage";
	}
	
	@RequestMapping(value = "/admin/category-manage/delete/{categoryID}", method = RequestMethod.POST)
	public String deleteBook(@PathVariable("categoryID") int categoryID, RedirectAttributes redirectAttributes) {
		categoriesDao.deleteById(categoryID);
		redirectAttributes.addAttribute("deleteSuccess", "success");
		return "redirect:/admin/category-manage";
	}
	
	@RequestMapping(value = "/admin/category-manage/find", method = RequestMethod.GET)
	public String findImports(@RequestParam("inputText") String input, Model model) {
		List<Categories> categories = categoriesDao.findCategoryByName(input);
		
		model.addAttribute("categories", categories);
		return "admin/CategoryManage";
	}
}
