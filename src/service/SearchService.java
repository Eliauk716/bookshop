package service;

import entity.Book;

import java.util.List;

public interface SearchService {
    public Book findByBookname(String bookname);
}
