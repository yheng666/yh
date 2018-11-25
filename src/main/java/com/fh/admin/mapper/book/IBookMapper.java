package com.fh.admin.mapper.book;

import com.fh.admin.po.book.Book;

import java.util.List;

public interface IBookMapper {
    void addBook(Book book);

    List<Book> findBookList(Book book);

    Book findBookById(Book book);

    void updateBook(Book book);

    void deleteBook(Book book);
}
