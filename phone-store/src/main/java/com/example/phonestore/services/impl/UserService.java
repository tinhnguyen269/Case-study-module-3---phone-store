package com.example.phonestore.services.impl;

import com.example.phonestore.models.User;
import com.example.phonestore.repositories.IUserRepository;
import com.example.phonestore.repositories.impl.UserRepository;
import com.example.phonestore.services.IUserService;

public class UserService implements IUserService {
    private IUserRepository userRepository = new UserRepository();
    @Override
    public User findByAccountAndPassword(String account, String password) {
        return userRepository.findByAccountAndPassword(account,password);
    }
}
