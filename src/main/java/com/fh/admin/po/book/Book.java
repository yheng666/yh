package com.fh.admin.po.book;

import java.io.Serializable;

public class Book implements Serializable {
    private static final long serialVersionUID = 399184066325815111L;

    private Integer id;
    private String bookName;
    private Double bookPrice;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public Double getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(Double bookPrice) {
        this.bookPrice = bookPrice;
    }
}
