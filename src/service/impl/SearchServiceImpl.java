package service.impl;

import entity.Book;
import repository.SearchRepository;
import repository.impl.SearchRepositoryImpl;
import service.SearchService;

public class SearchServiceImpl implements SearchService {
    private SearchRepository searchRepository = new SearchRepositoryImpl();

    public Book findByBookname(String bookname){
        return searchRepository.findByBookname(bookname);
    };
}
