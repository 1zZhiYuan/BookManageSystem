package com.example.bookmanagesystem.Model;

/**
 * @author ZY
 * @create 9:51
 */
import javax.persistence.*;
import java.time.LocalDate;
@Entity
@Table(name = "borrowed_books")
public class BorrowedBook {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;  // 主键

    @ManyToOne
    @JoinColumn(name = "user_id")  // 外键关联到 User 实体
    private User user;

    @ManyToOne
    @JoinColumn(name = "book_id", nullable = false)  // 外键关联到 Book 实体
    private Book book;

    @Column(name = "borrow_date", nullable = false)
    private LocalDate borrowDate;  // 借书日期

    @Column(name = "return_date")
    private LocalDate returnDate;  // 还书日期（可以为空）

    // Getter 和 Setter 方法
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public LocalDate getBorrowDate() {
        return borrowDate;
    }

    public void setBorrowDate(LocalDate borrowDate) {
        this.borrowDate = borrowDate;
    }

    public LocalDate getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(LocalDate returnDate) {
        this.returnDate = returnDate;
    }
}
