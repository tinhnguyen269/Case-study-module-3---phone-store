package com.example.phonestore.repositories.impl;

import com.example.phonestore.models.User;
import com.example.phonestore.repositories.IUserRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserRepository implements IUserRepository {
    @Override
    public User findByAccountAndPassword(String account, String password) {
        User user = null;
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().
                    prepareStatement("SELECT * FROM users WHERE account = ? AND password = ?");
            preparedStatement.setString(1,account);
            preparedStatement.setString(2,password);
            ResultSet resultSet =  preparedStatement.executeQuery();
            if (resultSet.next()){
                int id = resultSet.getInt("id_user");
                account = resultSet.getString("account");
                password = resultSet.getString("password");
                user = new User(id,account,password);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }
}
