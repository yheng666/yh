package com.fh.admin.biz.book;

import com.fh.admin.po.book.Book;

import java.util.List;

public interface IBookService {
    void addBook(Book book);

    List<Book> findBookList(Book book);

    Book findBookById(Book book);

    void updateBook(Book book);

    void deleteBook(Book book);
}
