package dao;

import entity.IndexUser;

import java.util.List;

public interface IUserDao {
	public boolean login(IndexUser login);

	public boolean regist(IndexUser regist) ;
	
	public List<IndexUser> All(IndexUser login);
	
	public boolean update(IndexUser user) ;
	
	public IndexUser UserByName(String name);
	
	public boolean isExit(String name);
}
