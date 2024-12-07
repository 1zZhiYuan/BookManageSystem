package com.example.bookmanagesystem.Model;

import javax.persistence.*;
import java.util.Date;

/**
 * 用户实体类，代表系统中的用户信息。
 * @author ZY
 * @create 14:08
 */

@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long userId;

    private String username;
    private String password;
    private String role;

    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;

    // 在保存之前自动设置 createdAt 为当前时间
    @PrePersist
    public void prePersist() {
        if (createdAt == null) {
            createdAt = new Date(); // 设置为当前时间
        }
    }

    // Getter 和 Setter 方法
    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}
