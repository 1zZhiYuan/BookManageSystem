package com.example.bookmanagesystem.service;

/**
 * @author ZY
 * @create 20:35
 */

import com.example.bookmanagesystem.Model.User;
import com.example.bookmanagesystem.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public User authenticate(String username, String password) {
        return userRepository.findByUsernameAndPassword(username, password).orElse(null);
    }

    @Override
    public boolean register(String username, String password) {
        if (userRepository.findByUsername(username).isPresent()) {
            return false;
        }
        User user = new User();
        user.setUsername(username);
        user.setPassword(password); // 应加密存储
        user.setRole("user");
        userRepository.save(user);
        return true;
    }
}

