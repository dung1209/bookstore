package SpringMVC.UserController;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import Dao.AccDao;
import Dao.authDao;
import bookstorePTIT.bean.Accounts;
import HibernateUtils.HibernateUtils;




@Controller
public class LoginUserController {
	AccDao accountsDao =new AccDao();
	
    @RequestMapping("/login")
   	public String login() {
   		return "/login/login-home";
   	}
    
    
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@ModelAttribute("account") Accounts account, ModelMap model, HttpSession hsession) {
        // Kiểm tra xem đối tượng account có hợp lệ không
        if (account == null || account.getUsername() == null || account.getPassword() == null) {
            model.addAttribute("error", "Tên đăng nhập hoặc mật khẩu không được để trống.");
            return "/login/login-home"; // Quay lại trang đăng nhập với thông báo lỗi
        }

        authDao dao = new authDao();
        Map<String, Object> checkexist = dao.CheckAccount(account);
        
        System.out.print("checkexist:" + checkexist);

        // Kiểm tra xem tài khoản có tồn tại và hợp lệ không
        if ((Boolean) checkexist.get("check")) {
            // Lấy thông tin tài khoản đầy đủ
            Accounts accountfull = dao.getUserByUserName(account.getUsername());
            // Thiết lập thông tin vào session
            hsession.setAttribute("account", accountfull);
            hsession.setAttribute("username", account.getUsername());
            hsession.setAttribute("getRole", dao.CheckUser(account.getUsername()));
            hsession.setAttribute("isAdmin", (String) checkexist.get("isAdmin"));
            if ("admin".equals(checkexist.get("isAdmin")))  {
                return "redirect:/admin/home"; // Chuyển hướng đến trang quản lý
            } else {
                return "redirect:/"; // Chuyển hướng về trang chính cho người dùng thông thường
            }
            
        } else {
            model.addAttribute("error", "Thông tin đăng nhập không chính xác!");
            return "/login/login-home"; 
        }
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request, Model model) {
        // Lấy session hiện tại và hủy nó
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // Hủy session
            return "redirect:/"; // Chuyển hướng đến trang chính
        } else {
            // Nếu không có session hiện tại, hiển thị thông báo lỗi
            model.addAttribute("errorLogout", "Không có session hiện tại.");
            return "redirect:/"; // Chuyển hướng đến trang chính
        }
    }

    
    @RequestMapping("/signUp")
   	public String signUp() {
    	return "/login/signUp";
   	}
    
    @RequestMapping("/forgot-password")
   	public String forgotPassword() {
    	return "/login/forgot-password";
//   		return "/user/signUp";
   	}

	

	@Transactional
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
    public String register(@RequestParam("username") String username,
                           @RequestParam("password") String password,
                           @RequestParam("confirm_password") String confirmPassword,
                           @RequestParam("email") String email,
                           Model model) {
        // Kiểm tra username đã tồn tại
        if (AccDao.isUsernameExists(username)) {
            model.addAttribute("error", "Tên đăng nhập đã tồn tại!");
            return "/login/signUp"; // Trả về trang đăng ký kèm thông báo lỗi
        }
        // Kiểm tra email đã tồn tại
        if (AccDao.isEmailExists(email)) {
            model.addAttribute("error", "Email đã được sử dụng!");
            return "/login/signUp";
        }
        if (!password.equals(confirmPassword)) {
            model.addAttribute("error", "Mật khẩu không khớp!");
            return "/login/signUp";
        }

        // Tạo tài khoản mới và lưu vào cơ sở dữ liệu
        Accounts account = new Accounts();
        account.setUsername(username);
        account.setPassword(password);
        account.setEmail(email);
        account.setRole("user"); // Vai trò mặc định là người dùng (không phải admin)
        account.setStatus(true); // Tài khoản mặc định là kích hoạt
        AccDao.save(account);
        model.addAttribute("message", "Đăng ký thành công!");
        return "/login/signUp"; // Chuyển đến trang đăng nhập sau khi đăng ký thành công
    }
	
	@RequestMapping(value = "/forgot-password", method = RequestMethod.POST)
	    public String sendOTP(@RequestParam("email") String email, HttpSession session, Model model) {
	        Accounts account = AccDao.findByEmail(email);
	        if (account != null) {
	            // Gửi mã OTP đến email
	            String otp = generateOTP(); // Tạo mã OTP
	            sendEmailWithOTP(email, otp); // Gửi email chứa mã OTP
	            session.setAttribute("otp", otp); // Lưu mã OTP vào session
	            session.setAttribute("email", email); // Lưu email vào session
	            model.addAttribute("message1", "Mã OTP đã được gửi đến email của bạn.");
	            return "/login/verify-otp"; 
	        } else {
	            model.addAttribute("error", "Email không tồn tại trong hệ thống.");
	            return "/login/forgot-password"; 
	        }
	    }	

	    // Xử lý xác nhận mã OTP
		@RequestMapping(value = "/verify-otp", method = RequestMethod.POST)
	    public String verifyOTP(@RequestParam("otp") String otp, HttpSession session, Model model) {
	        String sessionOtp = (String) session.getAttribute("otp");
	        if (sessionOtp != null && sessionOtp.equals(otp)) {
	            model.addAttribute("message2", "Mã OTP hợp lệ. Vui lòng nhập mật khẩu mới.");
	            return "/login/update-password"; 
	        } else {
	            model.addAttribute("error", "Mã OTP không hợp lệ.");
	            return "/login/verify-otp"; 
	        }
	    }

	    // Cập nhật mật khẩu mới
		@RequestMapping(value = "/update-password", method = RequestMethod.POST)
	    public String updatePassword(@RequestParam("newPassword") String newPassword,
	                                 @RequestParam("confirmPassword") String confirmPassword,
	                                 HttpSession session, Model model) {
	        String email = (String) session.getAttribute("email");
	        if (newPassword.equals(confirmPassword)) {
	            AccDao.updatePassword(email, newPassword); // Cập nhật mật khẩu
	            model.addAttribute("message3", "Mật khẩu đã được cập nhật thành công.");
	            return "/login/login-home"; // Chuyển hướng đến trang đăng nhập
	        } else {
	            model.addAttribute("error", "Mật khẩu xác nhận không khớp.");
	            return "/login/update-password"; // Quay lại trang quên mật khẩu
	        }
	    }

	    private String generateOTP() {
	        // Tạo mã OTP ngẫu nhiên (ví dụ: 6 chữ số)
	        Random random = new Random();
	        return String.format("%06d", random.nextInt(1000000));
	    }

	    private void sendEmailWithOTP(String email, String otp) {
	        // Sử dụng JavaMail để gửi email chứa mã OTP
	        String subject = "Book store PTIT_Mã xác nhận quên mật khẩu";
	        String body = "Mã OTP của bạn là: " + otp;
	        try {
	            sendEmail(email, subject, body);
	        } catch (Exception e) {
	            System.out.println("Gửi email thất bại: " + e.getMessage());
	        }
	    }
	    
	    @Autowired
	    private JavaMailSender mailSender;

	    public void sendEmail(String to, String subject, String body) {
	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setTo(to);
	        message.setSubject(subject);
	        message.setText(body);
	        mailSender.send(message);
	    }
}