package SpringMVC.AdminController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import Dao.EmployeesDao;
import Validator.ValidateInfor;
import bookstorePTIT.bean.Accounts;
import bookstorePTIT.bean.Employees;

@Controller
public class EmployeeController {
	EmployeesDao employeesDao = new EmployeesDao();
	
	@PostMapping("/admin/employee-manage/validate")
	public ResponseEntity<String> validateEmployee(@RequestParam String phone, @RequestParam String cccd, @RequestParam String email,@RequestParam String username) {
		
		Gson gson = new Gson();
		Map<String, String> responseMap = new HashMap<>();
	    
		if (!ValidateInfor.checkSdt(phone)) {
			responseMap.put("message", "Số điện thoại không hợp lệ");
	        return ResponseEntity.badRequest()
	        		.contentType(MediaType.APPLICATION_JSON)
	        		.body(gson.toJson(responseMap));
		}
		
		if (!ValidateInfor.checkCCCD(cccd)) {
			responseMap.put("message", "CCCD không hợp lệ");
	        return ResponseEntity.badRequest()
	        		.contentType(MediaType.APPLICATION_JSON)
	        		.body(gson.toJson(responseMap));
		}
		
		if (!ValidateInfor.checkMail(email)) {
			responseMap.put("message", "Email không hợp lệ");
	        return ResponseEntity.badRequest()
	        		.contentType(MediaType.APPLICATION_JSON)
	        		.body(gson.toJson(responseMap));
		}
		if (username !="") {
			Employees employee = employeesDao.findEmployeeByUsername(username);
			if (employee != null) {
				responseMap.put("message", "Username đã tồn tại");
		        return ResponseEntity.badRequest()
		        		.contentType(MediaType.APPLICATION_JSON)
		        		.body(gson.toJson(responseMap));
			}
		}
		
	    responseMap.put("message", "valid");
	    return ResponseEntity.ok(gson.toJson(responseMap));
	}
	
	@RequestMapping(value = "/admin/employee-manage/add-new-employee", method = RequestMethod.POST)
	public String addNewEmployee(@ModelAttribute("newEmployee") Employees newEmployee,
				@RequestParam("email") String email,
				@RequestParam("username") String username,
				@RequestParam("password") String password,
				RedirectAttributes redirectAttributes) {
		Accounts account = new Accounts();
		account.setUsername(username);
		account.setPassword(password);
		account.setEmail(email);
		account.setRole("nhanvien");
		account.setStatus(true);
		
		newEmployee.setAccount(account);
		employeesDao.save(newEmployee);
		
		redirectAttributes.addAttribute("addSuccess", "success");
		
		return "redirect:/admin/employee-manage";
	}
	
	@RequestMapping(value = "/admin/employee-manage/update/{employeeID}", method = RequestMethod.POST)
	public String updateEmployee(@ModelAttribute("employeeUpdate") Employees employeeUpdate,
			@PathVariable("employeeID") int employeeID,
			@RequestParam("email") String email,
			RedirectAttributes redirectAttributes) {

		Employees employee = employeesDao.findEmployeeById(employeeID);
		employee.setName(employeeUpdate.getName());
		employee.setPhone(employeeUpdate.getPhone());
		employee.setCCCD(employeeUpdate.getCCCD());
		employee.setAddress(employeeUpdate.getAddress());
		employee.getAccount().setEmail(email);
		
		employeesDao.update(employee);
		
		redirectAttributes.addAttribute("updateSuccess", "success");
		return "redirect:/admin/employee-manage";
	}
	
	@RequestMapping(value = "/admin/employee-manage/delete/{employeeID}", method = RequestMethod.POST)
	public String deleteEmployee(@PathVariable("employeeID") int employeeID, RedirectAttributes redirectAttributes) {
		employeesDao.deleteById(employeeID);
		redirectAttributes.addAttribute("deleteSuccess", "success");
		return "redirect:/admin/employee-manage";
	}
	
	@RequestMapping(value = "/admin/employee-manage/find", method = RequestMethod.GET)
	public String findEmployees(@RequestParam("inputText") String input, Model model) {
		List<Employees> employees = employeesDao.findEmployeeByName(input);
		model.addAttribute("employees", employees);
		return "admin/EmployeeManage";
	}
}
