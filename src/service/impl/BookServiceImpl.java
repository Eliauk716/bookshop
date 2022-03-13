package service.impl;

import entity.Book;
import repository.BookRepository;
import repository.impl.BookRepositoryImpl;
import service.BookService;

import java.util.List;

public class BookServiceImpl implements BookService {

    private BookRepository bookRepository = new BookRepositoryImpl();
    private final int LIMIT = 8;

    @Override
    public List<Book> findAll(int page) {
        int index = (page - 1) * LIMIT;

        return bookRepository.findAll(index, LIMIT);
    }

    @Override
    public int getnum() {
        return bookRepository.count();
    }
}
