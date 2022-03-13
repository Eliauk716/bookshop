package service.impl;

import entity.User;
import repository.UserRepository;
import repository.impl.UserRepositoryImpl;
import service.LoginService;

public class LoginServiceImpl implements LoginService {

    private UserRepository userRepository = new UserRepositoryImpl();

    @Override
    public User login(String username, String password) {
        return userRepository.login(username, password);
    }
}
