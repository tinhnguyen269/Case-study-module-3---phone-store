package com.example.phonestore.repositories;

import com.example.phonestore.models.Phone;

import java.sql.SQLException;
import java.util.List;

public interface IPhoneRepository {
    List<Phone> findAll();

    void savePhone(Phone phone);

    boolean deleteById(int phoneId);

    List<Phone> findByName(String name);



    void update(int id, Phone phone);

    Phone findById(int id);

    List<Phone> findByManufacturer(String apple);

    List<Phone> findAllCart();

    boolean deleteProduct();

    boolean deleteCart(int phoneId);

    boolean checkInventoryById(int id);

    void addCart(Phone phone);
}
