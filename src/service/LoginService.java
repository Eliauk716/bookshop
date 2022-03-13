package service;

import entity.User;

public interface LoginService {
    public User login(String username, String password);
}
