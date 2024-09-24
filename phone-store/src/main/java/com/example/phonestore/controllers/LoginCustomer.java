package com.example.phonestore.controllers;

import com.example.phonestore.models.User;
import com.example.phonestore.services.IUserService;
import com.example.phonestore.services.impl.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginCustomer", value = "/logincustomer")
public class LoginCustomer extends HttpServlet {
    private final IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/phoneCustomer/loginCustomer.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String account = req.getParameter("account");
        String password = req.getParameter("password");

        User user = userService.findByAccountAndPassword(account, password);
        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            resp.sendRedirect(req.getContextPath() + "/phoneCustomer");
        } else {
            req.setAttribute("error", "Invalid username or password");
            req.getRequestDispatcher("/phoneCustomer/loginCustomer.jsp").forward(req, resp);
        }
    }
}
