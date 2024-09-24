package com.example.phonestore.repositories;

import com.example.phonestore.models.User;

public interface IUserRepository {
    User findByAccountAndPassword(String account, String password);
}
