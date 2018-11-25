package com.fh.admin.biz.book;

import com.fh.admin.mapper.book.IBookMapper;
import com.fh.admin.po.book.Book;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements IBookService {

    @Autowired
    private IBookMapper bookMapper;

    public void addBook(Book book) {
        bookMapper.addBook(book);
    }

    public List<Book> findBookList(Book book) {
        if(StringUtils.isNotBlank(book.getBookName())){
            book.setBookName("%"+book.getBookName()+"%");
        }
        return bookMapper.findBookList(book);
    }

    public Book findBookById(Book book) {
        return bookMapper.findBookById(book);
    }

    public void updateBook(Book book) {
        bookMapper.updateBook(book);
    }

    public void deleteBook(Book book) {
        bookMapper.deleteBook(book);
    }
}
