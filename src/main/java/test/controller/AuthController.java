package test.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import test.DAO.UserRepository;
import test.Entity.User;

@Controller
public class AuthController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/login")
    public String showLoginForm(HttpServletRequest request, Model model) {
        String errorParameter = request.getParameter("error");
        if (errorParameter != null) {
            model.addAttribute("loginError", "Tên người dùng hoặc mật khẩu không chính xác. Vui lòng bạn nhập lại.");
        }
        return "login";
    }

    @PostMapping("/login")
    public String processLogin() {
        // Xử lý đăng nhập ở đây (nếu cần)
        return "redirect:/Students/index";
    }

    @GetMapping("/logout")
    public String logout() {
        // Xử lý đăng xuất ở đây (nếu cần)
        return "redirect:/login?logout";
    }

    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute User user) {
        if (userRepository.findByUsername(user.getUsername()) != null) {
            return "redirect:/register?error";
        }

        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);

        return "redirect:/login?registered";
    }
}
