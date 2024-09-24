package com.example.phonestore.models;

public class User {
    private int id;
    private String account;
    private String name;

    public User(int id, String account, String name) {
        this.id = id;
        this.account = account;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
