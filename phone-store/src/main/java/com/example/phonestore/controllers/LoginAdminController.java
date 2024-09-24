package com.example.phonestore.controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginAdminController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        if ("nhom1".equals(username) && "nhom1".equals(password)) {
            resp.sendRedirect(req.getContextPath() + "/phone");
        } else {
            req.setAttribute("message", "Sai mật khẩu hoặc tên người dùng");
            req.getRequestDispatcher("/phoneAdmin/loginAd.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/phoneAdmin/loginAd.jsp").forward(req, resp);
    }
}
