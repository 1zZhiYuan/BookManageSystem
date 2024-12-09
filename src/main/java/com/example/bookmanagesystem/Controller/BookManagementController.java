package com.example.bookmanagesystem.Controller;

import com.example.bookmanagesystem.Model.Book;

import com.example.bookmanagesystem.repository.BookRepository;
import com.example.bookmanagesystem.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/manage-books")
public class BookManagementController {

    @Autowired
    private BookRepository bookRepository;
    @Autowired
    private BookService bookService;

    // 查看书籍列表
    @GetMapping
    public String viewBooks(Model model) {
        List<Book> books = bookService.getAllBooks();
//        System.out.println( books );  // 打印用户列表
        model.addAttribute("books", books);
        return "manage-books";  // 返回管理书籍的JSP页面
    }


    // 处理添加新书籍请求
    @PostMapping("/addBook")
    public String addBook(@ModelAttribute Book book) {
        bookRepository.save(book);  // 保存新书籍
        return "redirect:/manage-books";  // 添加成功后重定向回书籍管理页面
    }



    @PostMapping("/deleteBook")
    public String deleteBook(@RequestParam Long bookId) {
        try {
            bookService.deleteBookById(bookId);
        } catch (Exception e) {
            e.printStackTrace(); // 打印错误日志
            return "error"; // 可跳转到一个友好的错误页面
        }
        return "redirect:/manage-books";
    }
    // 获取编辑页面
    @GetMapping("/editBook")
    public String editBook(@RequestParam("bookId") Long bookId, Model model) {
        Book book = bookService.getBookById(bookId);
        model.addAttribute("book", book);
        return "editBook"; // 对应 editBook.jsp
    }

    // 保存编辑内容
    @PostMapping("/updateBook")
    public String updateBook(@ModelAttribute Book updatedBook) {
        bookService.updateBook(updatedBook);
        return "redirect:/manage-books"; // 重定向到书籍管理页面
    }

}
