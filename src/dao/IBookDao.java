package dao;

import entity.IndexBook;

import java.util.List;

public interface IBookDao {
	public List<IndexBook> SearchByName(String bname);
	public List<IndexBook> SearchByAuthor(String bauthor);
	public List<IndexBook> SearchByType(String type);
}
