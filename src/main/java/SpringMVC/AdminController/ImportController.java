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
import Dao.ImportsDao;
import bookstorePTIT.bean.Authors;
import bookstorePTIT.bean.Books;
import bookstorePTIT.bean.Categories;
import bookstorePTIT.bean.Imports;
import bookstorePTIT.bean.Publishers;

@Controller
public class ImportController {
	ImportsDao importsDao = new ImportsDao();
	BooksDao booksDao = new BooksDao();
	
	@RequestMapping(value = "/admin/import-manage/add-new-import", method = RequestMethod.POST)
	public String addNewImport(@ModelAttribute("newimport") Imports newImport, @RequestParam("bookID") int bookID) {
		Books book = new Books();
		book.setBookID(bookID);
		
		newImport.setReceived_at(new Date());
		newImport.setBook(book);
		System.out.println("check bookID: " + book.getbookID());
		
		importsDao.save(newImport);
		Books existingBook = booksDao.findBookById(bookID);
		if (existingBook != null) {
            int newQuantity = existingBook.getStock() + newImport.getQuantity(); 
            existingBook.setStock(newQuantity) ; 
            
            booksDao.update(existingBook);  
        } else {
            System.out.println("Sách không tồn tại với ID: " + bookID);
        }
		
		return "redirect:/admin/import-manage";
	}
	
	@RequestMapping(value = "/admin/import-manage/update/{importID}", method = RequestMethod.POST)
	public String updateImport(@ModelAttribute("importupdate") Imports importupdate,
			@PathVariable("importID") int importID, 
			@RequestParam("bookID") int bookID,
			@RequestParam("oldQuantity") int oldQuantity) {
		Imports imports = importsDao.findImportByID(importID);
		imports.setQuantity(importupdate.getQuantity());
		imports.setPrice_import(importupdate.getPrice_import());
		
		System.out.println(">>>>>>check update import" + imports);
		System.out.println(">>>>>>check bookID import" + bookID);
		importsDao.update(imports);
		
		Books existingBook = booksDao.findBookById(bookID);
		int newQuantity = existingBook.getStock() + (importupdate.getQuantity() - oldQuantity);
        existingBook.setStock(newQuantity) ; 
        
        booksDao.update(existingBook);  
		
		return "redirect:/admin/import-manage";
	}
	
	@RequestMapping(value = "/admin/import-manage/delete/{importID}", method = RequestMethod.POST)
	public String deleteBook(@PathVariable("importID") int importID) {
		importsDao.deleteById(importID);
		return "redirect:/admin/import-manage";
	}
	
	@RequestMapping(value = "/admin/import-manage/find", method = RequestMethod.GET)
	public String findImports(@RequestParam("selectOption") String option,
			@RequestParam("inputText") String input, Model model) {
		List<Imports> imports = new ArrayList<>();
		int type = Integer.valueOf(option);
		switch (type) {
        	case 0:
        		imports = importsDao.findImportsByBookName(input);
        		break;
        	case 1:
        		imports = importsDao.findImportsByDate(input);
        		break;
        	default:
        		break;
		}
		model.addAttribute("imports", imports);
		return "admin/ImportManage";
	}
}
