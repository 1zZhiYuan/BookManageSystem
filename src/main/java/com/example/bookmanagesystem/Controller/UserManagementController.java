package com.example.bookmanagesystem.Controller;

import com.example.bookmanagesystem.Model.User;
import com.example.bookmanagesystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author ZY
 * @create 11:19
 */
@Controller
@RequestMapping("/manage-users")
public class UserManagementController {

    @Autowired
    private UserService userService;

    // 查看所有用户
    @GetMapping
    public String listUsers(Model model) {
        List<User> users = userService.getAllUsers();
//        System.out.println(users);  // 打印用户列表
        model.addAttribute("users", users);
        return "manage-users"; // 对应的视图名称
    }

    // 删除用户
    @PostMapping("/delete")
    public String deleteUser(@RequestParam Long userId) {
        userService.deleteUser(userId);
        return "redirect:/manage-users"; // 删除后重新加载用户列表
    }

    // 跳转到添加用户页面
    @GetMapping("/add")
    public String addUserForm(Model model) {
        model.addAttribute("user", new User()); // 用于创建新用户
        return "add-user"; // 对应的添加用户页面
    }

    // 添加用户
    @PostMapping("/add")
    @ResponseBody
    public ResponseEntity<String> addUser(@RequestBody User user) {
        try {
            userService.addUser(user); // 调用服务层添加用户
            return ResponseEntity.ok("用户添加成功！");
        } catch (Exception e) {
            e.printStackTrace();  // 打印异常堆栈，帮助调试
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("添加用户时发生错误！");
        }
    }




}

