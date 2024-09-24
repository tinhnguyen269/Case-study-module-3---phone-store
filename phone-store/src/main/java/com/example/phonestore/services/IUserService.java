package com.example.phonestore.services;

import com.example.phonestore.models.User;

public interface IUserService {
    User findByAccountAndPassword(String account, String password);
}
