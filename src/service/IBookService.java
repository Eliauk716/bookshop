package service;

import entity.IndexBook;

import java.util.List;

public interface IBookService {
	public List<IndexBook> SearchByName(String name);
	
	public List<IndexBook> SearchByAuthor(String bauthor);

	public List<IndexBook> SearchByType(String type);
}
