package com.example.bookmanagesystem.repository;

/**
 * @author ZY
 * @create 20:32
 */



import com.example.bookmanagesystem.Model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;


@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUsername(String username);
    Optional<User> findByUsernameAndPassword(String username, String password);
    Optional<User> findById(Long userId);

}
