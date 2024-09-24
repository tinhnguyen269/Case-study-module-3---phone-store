package com.example.phonestore.services.impl;

import com.example.phonestore.models.Phone;
import com.example.phonestore.repositories.IPhoneRepository;
import com.example.phonestore.repositories.impl.PhoneRepository;
import com.example.phonestore.services.IPhoneService;

import java.sql.SQLException;
import java.util.List;

public class PhoneService implements IPhoneService {
    private IPhoneRepository phoneRepository = new PhoneRepository();
    @Override
    public List<Phone> findAll() {
        return phoneRepository.findAll();
    }

    @Override
    public void savePhone(Phone phone) {
        phoneRepository.savePhone(phone);
    }

    @Override
    public boolean deleteById(int phoneId) {
        return phoneRepository.deleteById(phoneId);
    }

    @Override
    public List<Phone> findByName(String name) {
        return phoneRepository.findByName(name);
    }




    @Override
    public void update(int id, Phone phone) {
        phoneRepository.update(id,phone);
    }

    @Override
    public Phone findById(int id) {
        return phoneRepository.findById(id);
    }

    @Override
    public List<Phone> findByManufacturer(String samSung) {
        return phoneRepository.findByManufacturer(samSung);
    }

    @Override
    public List<Phone> findAllCart() {
        return phoneRepository.findAllCart();
    }

    @Override
    public boolean deleteProduct() {
        return phoneRepository.deleteProduct();
    }

    @Override
    public boolean deleteCart(int phoneId) {
        return phoneRepository.deleteCart(phoneId);
    }

    @Override
    public boolean checkInventoryById(int id) {
        return phoneRepository.checkInventoryById(id);
    }

    @Override
    public void addCart(Phone phone) {
        phoneRepository.addCart(phone);
    }

}
