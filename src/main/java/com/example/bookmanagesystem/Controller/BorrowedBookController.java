package com.example.bookmanagesystem.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BorrowedBookController {

    @GetMapping("/borrowed-books")
    public String viewBorrowedBooks() {
        // 返回静态页面的视图
        return "borrowedBooks";  // 与页面的名称对应
    }
    // 借书页面
    @GetMapping("/borrow-book")
    public String borrowBook() {
        // 返回借书页面视图
        return "borrowBook";  // 与借书页面的名称对应
    }

    // 还书页面
    @GetMapping("/return-book")
    public String returnBook() {
        // 返回还书页面视图
        return "returnBook";  // 与还书页面的名称对应
    }
}
