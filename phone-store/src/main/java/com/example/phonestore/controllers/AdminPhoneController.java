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
import java.util.List;

@WebServlet(name = "PhoneController", value = "/phone")
public class AdminPhoneController extends HttpServlet {
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
            case "create":
                showCreateForm(req, resp);
                break;
            case "edit":
                editShowForm(req,resp);
                break;
            default:
                List<Phone> phones = phoneService.findAll();
                req.setAttribute("phones", phones);
                req.getRequestDispatcher("/phoneAdmin/list.jsp").forward(req, resp);
                break;
        }
    }

    private void editShowForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Phone phone = phoneService.findById(id);
        req.setAttribute("phone",phone);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/phoneAdmin/edit.jsp");
        dispatcher.forward(req,resp);
    }


    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp) {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/phoneAdmin/createAD.jsp");
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
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
            case "create":
                createPhone(req, resp);
                break;
            case "delete":
                deletePhone(req, resp);
                break;
            case "search":
                searchPhone(req, resp);
                break;
            case "edit":
                editPhone(req,resp);
                break;
        }
    }

    private void editPhone(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String image = req.getParameter("image");
        String manufacture = req.getParameter("manufacture");
        Long price = Long.parseLong(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        float size = Float.parseFloat(req.getParameter("size"));
        String color = req.getParameter("color");
        int ram = Integer.parseInt(req.getParameter("ram"));
        int battery = Integer.parseInt(req.getParameter("battery"));
        Phone phone = phoneService.findById(id);
        if (phone != null) {
            phone.setName(name);
            phone.setImg(image);
            phone.setManufacture(manufacture);
            phone.setPrice(price);
            phone.setQuantity(quantity);
            phone.setSize(size);
            phone.setColor(color);
            phone.setRam(ram);
            phone.setBattery(battery);
            phoneService.update(id, phone);
            resp.sendRedirect(req.getContextPath() + "/phone");
        } else {
            req.setAttribute("message", "Điện thoại không tồn tại");
            resp.sendRedirect(req.getContextPath() + "/phone");
        }
    }


    private void searchPhone(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("search");
        List<Phone> phones = phoneService.findByName(search);
        req.setAttribute("phones", phones);
        req.getRequestDispatcher("/phoneAdmin/list.jsp").forward(req, resp);
    }

    private void deletePhone(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int phoneId = 0;
        if (req.getParameter("id") != null) {
            try {
                phoneId = Integer.parseInt(req.getParameter("id"));
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        if (phoneId != 0) {
            boolean isDeleted = phoneService.deleteById(phoneId);
            if (!isDeleted) {
                req.setAttribute("message", "Xóa không thành công.");
            }
        } else {
            req.setAttribute("message", "ID không hợp lệ.");
        }
        resp.sendRedirect(req.getContextPath() + "/phone");
    }
    private void createPhone(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String img = req.getParameter("img");
        String manufacture = req.getParameter("manufacture");
        long price = (long) Double.parseDouble(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        float size = Float.parseFloat(req.getParameter("size"));
        String color = req.getParameter("color");
        int ram = Integer.parseInt(req.getParameter("ram"));
        int batery = Integer.parseInt(req.getParameter("batery"));

        if (name != null && img != null && manufacture != null && price > 0 && quantity > 0 && size > 0 && color != null && ram > 0 && batery > 0) {
            Phone phone = new Phone(0, name, img, manufacture, price, quantity, size, color, ram, batery);
            phoneService.savePhone(phone);
            resp.sendRedirect(req.getContextPath() + "/phone");
        } else {
            req.setAttribute("message", "Thông tin không hợp lệ. Vui lòng điền đầy đủ các trường.");
            req.getRequestDispatcher("/phoneAdmin/createAD.jsp").forward(req, resp);
        }
    }
}
