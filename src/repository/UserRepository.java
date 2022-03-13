package repository;

import entity.User;

public interface UserRepository {
    public User login(String username, String password);
}
