package com.example.bookmanagesystem.Controller;

/**
 * @author ZY
 * @create 9:14
 */

import com.example.bookmanagesystem.Model.Book;
import com.example.bookmanagesystem.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class BookController {

    @Autowired
    private BookService bookService;

    @GetMapping("/viewBooks")
    public String viewBooks(Model model) {
        List<Book> books = bookService.getAllBooks();
        System.out.println( books );  // 打印用户列表
        model.addAttribute("books", books);
        return "viewBooks"; // 指定 JSP 页面
    }
}

