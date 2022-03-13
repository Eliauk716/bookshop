package service.impl;

import dao.IUserDao;
import dao.impl.UserDaoImpl;
import entity.IndexUser;
import service.IUserService;

import java.util.List;

public class UserServiceImpl implements IUserService {
	IUserDao loginDao = new UserDaoImpl();
	
	public boolean login(IndexUser login) {
		return loginDao.login(login);
	}
	
	public boolean regist(IndexUser regist) {
		if(!isExit(regist.getName())) {
			return loginDao.regist(regist);
		}
		return false;
	}
	
	public  List<IndexUser> All(IndexUser login){
		return loginDao.All(login);
	}
	
	public boolean update(IndexUser user) {
		return loginDao.update(user);
	}
	
	public IndexUser UserByName(String name) {
		return loginDao.UserByName(name);
	}
	
	public boolean isExit(String name) {
		return loginDao.isExit(name);
	}
}
