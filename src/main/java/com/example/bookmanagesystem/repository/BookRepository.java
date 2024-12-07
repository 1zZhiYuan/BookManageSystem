package com.example.bookmanagesystem.repository;

import com.example.bookmanagesystem.Model.Book;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author ZY
 * @create 9:14
 */



public interface BookRepository extends JpaRepository<Book, Long> {

}

