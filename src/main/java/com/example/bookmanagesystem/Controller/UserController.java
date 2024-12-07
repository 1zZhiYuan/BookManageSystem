package com.example.bookmanagesystem.Controller;

import com.example.bookmanagesystem.Model.User;
import com.example.bookmanagesystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    // 页面路径常量
    private static final String LOGIN_PAGE = "login";
    private static final String REGISTER_PAGE = "register";
    private static final String HOME_PAGE = "home";

    /**
     * 显示登录页面
     */
    @GetMapping("/login")
    public String showLoginPage() {
        return LOGIN_PAGE; // 返回 login.jsp 页面
    }

    /**
     * 处理登录请求
     */
    @PostMapping("/login")
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {
        // 校验输入格式（示例）
        if (username.isEmpty() || password.isEmpty()) {
            model.addAttribute("error", "用户名和密码不能为空！");
            return LOGIN_PAGE;
        }

        // 调用服务层处理登录逻辑
        User user = userService.authenticate(username, password);
        if (user != null) {
            // 登录成功，保存用户信息到 Session
            session.setAttribute("username", user.getUsername());
            session.setAttribute("role", user.getRole());
            return HOME_PAGE; // 跳转到首页
        }

        // 登录失败
        model.addAttribute("error", "用户名或密码错误！");
        return LOGIN_PAGE;
    }

    /**
     * 显示注册页面
     */
    @GetMapping("/register")
    public String showRegisterPage() {
        return REGISTER_PAGE; // 返回 register.jsp 页面
    }

    /**
     * 处理注册请求
     */
    @PostMapping("/register")
    public String register(@RequestParam String username,
                           @RequestParam String password,
                           @RequestParam String confirmPassword,
                           Model model) {

        // 检查两次密码是否一致
        if (!password.equals(confirmPassword)) {
            model.addAttribute("error", "两次密码输入不一致！");
            return REGISTER_PAGE;
        }

        // 校验用户名和密码格式
        if (!isValidUsername(username)) {
            model.addAttribute("error", "用户名格式不正确！应为 4-20 个字母、数字或下划线！");
            return REGISTER_PAGE;
        }
        if (!isValidPassword(password)) {
            model.addAttribute("error", "密码格式不正确！应包含至少 6 个字符，且包括字母和数字！");
            return REGISTER_PAGE;
        }

        // 检查用户名是否已存在
        if (userService.usernameExists(username)) {
            model.addAttribute("error", "用户名已存在！");
            return REGISTER_PAGE;
        }

        // 调用 service 层注册用户
        boolean isRegistered = userService.register(username, password);

        if (isRegistered) {
            model.addAttribute("message", "注册成功，请登录！");
            return LOGIN_PAGE;
        } else {
            model.addAttribute("username", username); // 回显用户名
            model.addAttribute("error", "注册失败，请稍后再试！");
            return REGISTER_PAGE;
        }
    }

    private boolean isValidUsername(String username) {
        return username.matches("[A-Za-z0-9_]{4,20}");
    }

    private boolean isValidPassword(String password) {
        return password.length() >= 6 && password.matches(".*[A-Za-z].*") && password.matches(".*\\d.*");
    }

    /**
     * 处理用户退出登录
     */
    @PostMapping("/logout")
    public String logout(HttpSession session) {
        // 清除会话
        session.invalidate();
        return LOGIN_PAGE; // 返回登录页面
    }

}
