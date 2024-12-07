package com.example.bookmanagesystem.service;

import com.example.bookmanagesystem.Model.Book;
import com.example.bookmanagesystem.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BookService {

    @Autowired
    private BookRepository bookRepository;


    /**
     * 获取所有书籍
     * @return 所有书籍列表
     */
    public List<Book> getAllBooks() {
        return bookRepository.findAll();
    }

    /**
     * 根据 ID 获取书籍
     * @param bookId 书籍 ID
     * @return 书籍信息（可选）
     */
    public Book getBookById(Long bookId) {
        return bookRepository.findById(bookId)
                .orElseThrow(() -> new RuntimeException("书籍未找到，ID: " + bookId));
    }

    /**
     * 新增或更新书籍
     * @param book 书籍信息
     * @return 保存后的书籍
     */
    public Book saveBook(Book book) {
        return bookRepository.save(book);
    }

    /**
     * 根据 ID 删除书籍
     * @param bookId 书籍 ID
     */
    public void deleteBookById(Long bookId) {
        bookRepository.deleteById(bookId);
    }

    public void addBook(Book book) {
        bookRepository.save(book);
    }


    public void updateBook(Book updatedBook) {
        Book existingBook = bookRepository.findById(updatedBook.getBookId())
                .orElseThrow(() -> new IllegalArgumentException("书籍不存在: " + updatedBook.getBookId()));

        existingBook.setTitle(updatedBook.getTitle());
        existingBook.setAuthor(updatedBook.getAuthor());
        existingBook.setCategory(updatedBook.getCategory());
        existingBook.setStock(updatedBook.getStock());

        bookRepository.save(existingBook); // 保存修改
    }
}


