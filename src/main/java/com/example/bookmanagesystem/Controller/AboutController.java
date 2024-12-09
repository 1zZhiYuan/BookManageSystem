package com.example.bookmanagesystem.Controller;

/**
 * @author ZY
 * @create 22:42
 */
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AboutController {

    @GetMapping("/about")
    public String about() {
        return "about"; // 返回关于我们的JSP页面
    }
}
