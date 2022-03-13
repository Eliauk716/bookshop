package service;

import entity.Book;

import java.util.List;

public interface BookService {
    public List<Book> findAll(int page);
    public int getnum();
}
