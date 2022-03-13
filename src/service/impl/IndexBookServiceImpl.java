package service.impl;

import dao.IBookDao;
import dao.impl.BookDaoImpl;
import entity.IndexBook;
import service.IBookService;

import java.util.List;

public class IndexBookServiceImpl implements IBookService {
	IBookDao bookDao = new BookDaoImpl();
	
	public List<IndexBook> SearchByName(String name){
		return bookDao.SearchByName(name);
	}
	
	public List<IndexBook> SearchByAuthor(String bauthor){
		return bookDao.SearchByAuthor(bauthor);
	}

	public List<IndexBook> SearchByType(String type){return bookDao.SearchByType(type); }
}
