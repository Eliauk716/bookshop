package repository;

import entity.Book;

public interface SearchRepository {
    public Book findByBookname(String bookname);
}
