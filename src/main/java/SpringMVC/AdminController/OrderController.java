package SpringMVC.AdminController;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
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

import Dao.Order_ItemsDao;
import Dao.OrdersDao;
import Validator.ValidateInfor;
import bookstorePTIT.bean.Order_Items;
import bookstorePTIT.bean.Orders;

@Controller
public class OrderController {
	private OrdersDao ordersDao = new OrdersDao();
	private Order_ItemsDao order_ItemsDao = new Order_ItemsDao();
	
	@PostMapping("/admin/order/validate")
	public ResponseEntity<String> validateOrder(@RequestParam String phone, @RequestParam String email) {
		System.out.println(">>>check phone: " + phone);
		System.out.println(">>>check email: " + email);
		
		Gson gson = new Gson();
		Map<String, String> responseMap = new HashMap<>();
	    
		if (!ValidateInfor.checkSdt(phone)) {
			responseMap.put("message", "Số điện thoại không hợp lệ");
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
		// Nếu dữ liệu hợp lệ
	    responseMap.put("message", "valid");
	    return ResponseEntity.ok(gson.toJson(responseMap));
	}
	
	@RequestMapping(value = "/admin/order/accept/{orderID}", method = RequestMethod.POST)
	public String acceptOrder(@PathVariable("orderID") int orderID, RedirectAttributes redirectAttributes) {
		Orders order = ordersDao.findOrderById(orderID);
		order.setStatus(2);
		ordersDao.update(order);
		redirectAttributes.addAttribute("acceptSuccess", "success");
		return "redirect:/admin/order";
	}
	
	@RequestMapping(value = "/admin/order/cancel/{orderID}", method = RequestMethod.POST)
	public String cancelOrder(@PathVariable("orderID") int orderID, RedirectAttributes redirectAttributes) {
		Orders order = ordersDao.findOrderById(orderID);
		order.setStatus(0);
		ordersDao.update(order);
		redirectAttributes.addAttribute("cancelSuccess", "success");
		return "redirect:/admin/order";
	}
	
	@RequestMapping(value = "admin/order/update/{orderID}", method = RequestMethod.POST)
	public String updateOrder(@PathVariable("orderID") int orderID, @ModelAttribute("updateOrder") Orders updateOrder,
			RedirectAttributes redirectAttributes) {
		Orders order = ordersDao.findOrderById(orderID);
		order.setName(updateOrder.getName());
		order.setPhone(updateOrder.getPhone());
		order.setEmail(updateOrder.getEmail());
		order.setAddress(updateOrder.getAddress());
		order.setNote(updateOrder.getNote());
		order.setStatus(updateOrder.getStatus());
		ordersDao.update(order);
		System.out.println(">>>check update order" +order);
		redirectAttributes.addAttribute("updateSuccess", "success");
		return "redirect:/admin/order";
	}

	@RequestMapping(value = "/admin/order/find", method = RequestMethod.GET)
	public String findOrders(@RequestParam("selectOption") String option, @RequestParam("inputText") String input,
			Model model) {
		List<Orders> orders = new ArrayList<>();

		int type = Integer.valueOf(option);
		switch (type) {
		case 0:
			orders = ordersDao.findOrdersByName(input);
			break;
		case 1:
			orders = ordersDao.findOrdersByPhone(input);
			break;
		case 2:
			switch (input) {
			case "Đã hủy":
				orders = ordersDao.findOrdersByStatus(0);
				break;
			case "Chờ xác nhận":
				orders = ordersDao.findOrdersByStatus(1);
				break;
			case "Đã xác nhận":
				orders = ordersDao.findOrdersByStatus(2);
				break;
			case "Đã giao":
				orders = ordersDao.findOrdersByStatus(3);
				break;
			case "Đang giao":
				orders = ordersDao.findOrdersByStatus(4);
				break;
			}
			break;
		case 3:
			try {
                // Chuyển đổi chuỗi input thành LocalDate
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                LocalDate date = LocalDate.parse(input, formatter);
                
                // Gọi hàm tìm kiếm theo ngày
                orders = ordersDao.findOrdersByDate(date);
            } catch (DateTimeParseException e) {
                e.printStackTrace();
                model.addAttribute("error", "Định dạng ngày không hợp lệ. Vui lòng nhập theo định dạng yyyy-MM-dd.");
            }
			break;
		default:
			break;
		}
		Map<Integer, List<Order_Items>> orderDetailsMap = new HashMap<>();

		for (Orders order : orders) {
			List<Order_Items> orderDetails = order_ItemsDao.getOrderDetail(order.getId());
			orderDetailsMap.put(order.getId(), orderDetails);
		}
		Gson gson = new Gson();
		String orderDetailsJson = gson.toJson(orderDetailsMap);
		System.out.println(orderDetailsJson);
		model.addAttribute("orderDetailsMap", orderDetailsJson);
		model.addAttribute("orders", orders);
		return "admin/OrderManage";
	}
}
