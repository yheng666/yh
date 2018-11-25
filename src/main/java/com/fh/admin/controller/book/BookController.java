package com.fh.admin.controller.book;

import com.fh.admin.biz.book.IBookService;
import com.fh.admin.po.book.Book;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BookController {

    @Resource
    private IBookService bookService;


    /**
     * 删除图书
     * @param book
     * @return
     */
    @RequestMapping("/book/deleteBook")
    @ResponseBody
    public Map deleteBook(Book book) {
        bookService.deleteBook(book);
        Map resultMap = new HashMap();
        resultMap.put("status","ok");
        return resultMap;
    }

    /**
     * 修改图书
     * @param book
     * @return
     */
    @RequestMapping("/book/updateBook")
    @ResponseBody
    public Map updateBook(Book book) {
        bookService.updateBook(book);
        Map resultMap = new HashMap();
        resultMap.put("status","ok");
        return resultMap;
    }

    /**
     * 图书回显
     * @return
     */
    @RequestMapping("/book/findBookById")
    @ResponseBody
    public Map findBookById(Book book){
        Book bookInfo = bookService.findBookById(book);
        Map resultMap = new HashMap();
        resultMap.put("data",bookInfo);
        resultMap.put("status","ok");
        return resultMap;
    }

    /**
     * 图书查询
     * @return
     */
    @RequestMapping("/book/list")
    @ResponseBody
    public Map findBookList(Book book) {
        List<Book> bookList = bookService.findBookList(book);
        Map resultMap = new HashMap();
        resultMap.put("data",bookList);
        resultMap.put("status","ok");
        return resultMap;
    }

    @RequestMapping("/book/toList")
    public String toList() {
        return "book/list";
    }

    @RequestMapping("/book/add")
    @ResponseBody
    public Map addBook(Book book) {
        bookService.addBook(book);
        Map resultMap = new HashMap();
        resultMap.put("status","ok");
        return resultMap;
    }

    @RequestMapping("/book/toAdd")
    public String toAddBook(){
        return "book/add";
    }


}
