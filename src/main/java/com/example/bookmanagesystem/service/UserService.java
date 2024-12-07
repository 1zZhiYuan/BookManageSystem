package com.example.bookmanagesystem.service;

import com.example.bookmanagesystem.Model.User;
import com.example.bookmanagesystem.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * @author ZY
 * @create 20:34
 */

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    // 检查用户名是否已存在
    public boolean usernameExists(String username) {
        return userRepository.findByUsername(username).isPresent();  // 使用 Optional 来避免 NullPointerException
    }

    // 注册用户（不加密密码）
    public boolean register(String username, String password) {
        // 检查用户名是否已存在
        if (usernameExists(username)) {
            return false;  // 用户名已存在，注册失败
        }

        // 创建用户对象并保存
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);  // 直接存储明文密码

        try {
            if (user.getRole() == null) {
                user.setRole("user"); // 设置默认角色
            }
            userRepository.save(user);  // 保存到数据库
            return true;  // 注册成功
        } catch (Exception e) {
            return false;  // 如果保存失败，则返回 false
        }
    }

    // 验证用户名和密码
    public User authenticate(String username, String password) {
        // 从数据库查找用户
        Optional<User> optionalUser = userRepository.findByUsername(username);

        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            // 验证密码
            if (user.getPassword().equals(password)) {
                return user;  // 用户验证成功
            }
        }
        return null;  // 验证失败
    }



    // 获取单个用户
    public Optional<User> getUserById(Long id) {
        return userRepository.findById(id);
    }

    // 更新用户信息
    public boolean updateUser(Long id, String username, String password) {
        Optional<User> optionalUser = userRepository.findById(id);

        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            user.setUsername(username);
            user.setPassword(password);  // 更新密码

            userRepository.save(user);  // 保存更新后的用户
            return true;
        }
        return false;  // 用户不存在，更新失败
    }

    // 删除用户
    public boolean deleteUser(Long id) {
        Optional<User> optionalUser = userRepository.findById(id);

        if (optionalUser.isPresent()) {
            userRepository.deleteById(id);  // 删除用户
            return true;
        }
        return false;  // 用户不存在，删除失败
    }


    public List<User> getAllUsers() {
        return userRepository.findAll();
    }



    public void addUser(User user) {
        userRepository.save(user);
    }


    public void updateUser(User user) {
        // 检查用户是否存在
        if (userRepository.existsById(user.getUserId())) {
            userRepository.save(user);  // 使用 save 方法更新用户信息
        } else {
            throw new RuntimeException("用户不存在");
        }
    }
}
