package com.example.phonestore.controllers;

import com.example.phonestore.models.Phone;
import com.example.phonestore.services.IPhoneService;
import com.example.phonestore.services.impl.PhoneService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CustomerPhoneController", value = "/phoneCustomer")
public class CustomerPhoneController extends HttpServlet {
    private IPhoneService phoneService = new PhoneService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "infor":
                getPhoneInfo(req, resp);
                break;
            case "openCart":
                openCart(req, resp);
                break;
            case "deleteCart":
                deleteCart(req, resp);
                break;
            case "pay":
                deleteProduct(req,resp);
                break;
            case "iphone":
                showIphoneProduct(req,resp);
                break;
            case "samsung":
                showSamSungProduct(req,resp);
                break;

            default:
                List<Phone> phones = phoneService.findAll();
                req.setAttribute("phones", phones);
                RequestDispatcher dispatcher = req.getRequestDispatcher("/phoneCustomer/home.jsp");
                dispatcher.forward(req, resp);
                break;
        }
    }

    private void openCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Phone> phones = phoneService.findAllCart();
        req.setAttribute("phones", phones);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/phoneCustomer/cart.jsp");
        dispatcher.forward(req, resp);
    }

    private void showSamSungProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Phone> phones = phoneService.findByManufacturer("SamSung");
        req.setAttribute("phones", phones);
        req.setAttribute("message","Samsung");
        RequestDispatcher dispatcher = req.getRequestDispatcher("/phoneCustomer/search.jsp");
        dispatcher.forward(req, resp);
    }

    private void showIphoneProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Phone> phones = phoneService.findByManufacturer("Apple");
        req.setAttribute("phones", phones);
        req.setAttribute("message","Iphone");
        RequestDispatcher dispatcher = req.getRequestDispatcher("/phoneCustomer/search.jsp");
        dispatcher.forward(req, resp);
    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean isDeleted = phoneService.deleteProduct();
        if (!isDeleted) {
            req.setAttribute("message", "Xóa không thành công.");
        } else {
            req.setAttribute("message","Giỏ hàng trống");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/phoneCustomer/cart.jsp");
            dispatcher.forward(req, resp);
        }
    }

    private void deleteCart(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        int phoneId = Integer.parseInt(req.getParameter("id"));
        boolean isDeleted = phoneService.deleteCart(phoneId);
        if (!isDeleted) {
            req.setAttribute("message", "Xóa không thành công.");
        } else {
            openCart(req, resp);
        }
    }



    private void getPhoneInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Phone phone = phoneService.findById(id);
        if (phone == null) {
            req.setAttribute("message", "Không tìm thấy sản phẩm");
        } else {
            req.setAttribute("phone", phone);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/phoneCustomer/phoneInfor.jsp");
            dispatcher.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "search":
                searchPhone(req, resp);
                break;
            case "addCart":
                try {
                    addCart(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }

    private void addCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(req.getParameter("id"));
        boolean  check = phoneService.checkInventoryById(id);
        Phone phone = phoneService.findById(id);
        if (check) {
            phoneService.addCart(phone);
            req.setAttribute("phone", phone);
            req.setAttribute("message", "Đã thêm vào giỏ hàng");
        } else {
            req.setAttribute("phone", phone);
            req.setAttribute("message", "Bạn đã đặt quá số lượng tồn kho");
        }
//         Hiển thị lại trang

        RequestDispatcher dispatcher = req.getRequestDispatcher("/phoneCustomer/phoneInfor.jsp");
        dispatcher.forward(req, resp);
    }


    private void searchPhone(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("search");
        List<Phone> phones = phoneService.findByName(search);
        req.setAttribute("search",search);
        req.setAttribute("phones", phones);
        req.getRequestDispatcher("/phoneCustomer/search.jsp").forward(req, resp);
    }
}