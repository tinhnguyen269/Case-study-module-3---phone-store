package com.example.phonestore.repositories.impl;

import com.example.phonestore.models.Phone;
import com.example.phonestore.repositories.IPhoneRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PhoneRepository implements IPhoneRepository {

    @Override
    public List<Phone> findAll() {
        List<Phone> phones = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        if (connection == null) {
            throw new RuntimeException("Database connection is null");
        }
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT id_product, name_product, manufacture, price, quantity, size, color, ram, battery, image FROM product");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id_product");
                String name = resultSet.getString("name_product");
                String manufacture = resultSet.getString("manufacture");
                long price = resultSet.getLong("price");
                int quantity = resultSet.getInt("quantity");
                float size = resultSet.getFloat("size");
                String color = resultSet.getString("color");
                int ram = resultSet.getInt("ram");
                int battery = resultSet.getInt("battery");
                String image = resultSet.getString("image");
                Phone phone = new Phone(id, name, image, manufacture, price, quantity, size, color, ram, battery);
                phones.add(phone);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return phones;
    }

    @Override
    public void savePhone(Phone phone) {
        String sql = "INSERT INTO product (name_product, image, manufacture, price, quantity, size, color, ram, battery) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Connection connection = BaseRepository.getConnection();
        if (connection == null) {
            throw new RuntimeException("Database connection is null");
        }
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, phone.getName());
            preparedStatement.setString(2, phone.getImg());
            preparedStatement.setString(3, phone.getManufacture());
            preparedStatement.setLong(4, phone.getPrice());
            preparedStatement.setInt(5, phone.getQuantity());
            preparedStatement.setFloat(6, phone.getSize());
            preparedStatement.setString(7, phone.getColor());
            preparedStatement.setInt(8, phone.getRam());
            preparedStatement.setInt(9, phone.getBattery());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean deleteById(int phoneId) {
        boolean isDeleted;
        Connection connection = BaseRepository.getConnection();
        if (connection == null) {
            throw new RuntimeException("Database connection is null");
        }
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM product WHERE id_product = ?");
            statement.setInt(1, phoneId);
            isDeleted = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return isDeleted;
    }

    @Override
    public List<Phone> findByName(String name) {
        List<Phone> result = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        if (connection == null) {
            throw new RuntimeException("Database connection is null");
        }
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT id_product, name_product, image, manufacture, price, quantity, size, color, ram, battery FROM product WHERE name_product LIKE ?");
            preparedStatement.setString(1, "%" + name + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id_product");
                String phoneName = resultSet.getString("name_product");
                String image = resultSet.getString("image");
                String manufacture = resultSet.getString("manufacture");
                long price = resultSet.getLong("price");
                int quantity = resultSet.getInt("quantity");
                float size = resultSet.getFloat("size");
                String color = resultSet.getString("color");
                int ram = resultSet.getInt("ram");
                int battery = resultSet.getInt("battery");

                Phone phone = new Phone(id, phoneName, image, manufacture, price, quantity, size, color, ram, battery);
                result.add(phone);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    @Override
    public Phone findById(int id) {
        Phone phone = null;
        Connection connection = BaseRepository.getConnection();
        if (connection == null) {
            throw new RuntimeException("Database connection is null");
        }
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM product WHERE id_product = ?");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String phoneName = resultSet.getString("name_product");
                String image = resultSet.getString("image");
                String manufacture = resultSet.getString("manufacture");
                long price = resultSet.getLong("price");
                int quantity = resultSet.getInt("quantity");
                float size = resultSet.getFloat("size");
                String color = resultSet.getString("color");
                int ram = resultSet.getInt("ram");
                int battery = resultSet.getInt("battery");

                phone = new Phone(id, phoneName, image, manufacture, price, quantity, size, color, ram, battery);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return phone;
    }

    @Override
    public List<Phone> findByManufacturer(String apple) {
        List<Phone> result = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        if (connection == null) {
            throw new RuntimeException("Database connection is null");
        }
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT id_product, name_product, image, manufacture, price, quantity, size, color, ram, battery FROM product WHERE manufacture = ?");
            preparedStatement.setString(1, apple);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id_product");
                String phoneName = resultSet.getString("name_product");
                String image = resultSet.getString("image");
                String manufacture = resultSet.getString("manufacture");
                long price = resultSet.getLong("price");
                int quantity = resultSet.getInt("quantity");
                float size = resultSet.getFloat("size");
                String color = resultSet.getString("color");
                int ram = resultSet.getInt("ram");
                int battery = resultSet.getInt("battery");

                Phone phone = new Phone(id, phoneName, image, manufacture, price, quantity, size, color, ram, battery);
                result.add(phone);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    @Override
    public List<Phone> findAllCart() {
        List<Phone> phones = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        if (connection == null) {
            throw new RuntimeException("Database connection is null");
        }
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("SELECT cart.id_product, product.name_product, cart.price, cart.quantity,product.color, product.image FROM product join cart on cart.id_product = product.id_product ");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id_product");
                String name = resultSet.getString("name_product");
                long price = resultSet.getLong("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String image = resultSet.getString("image");
                Phone phone = new Phone(id, image, color, name, price, quantity);
                phones.add(phone);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return phones;
    }

    @Override
    public boolean deleteProduct() {
        Connection connection = BaseRepository.getConnection();
        if (connection == null) {
            throw new RuntimeException("Không thể kết nối vào cơ sở dữ liệu");
        }

        PreparedStatement deleteCartItems = null;
        PreparedStatement updateProductQuantity = null;

        try {
            // Cập nhật số lượng sản phẩm trong bảng product
            updateProductQuantity = connection.prepareStatement(
                    "UPDATE product " +
                            "SET quantity = quantity - (SELECT IFNULL(SUM(cart.quantity), 0) FROM cart WHERE cart.id_product = product.id_product)"
            );
            int updatedRows = updateProductQuantity.executeUpdate();

            // Xóa tất cả các sản phẩm từ giỏ hàng (cart)
            deleteCartItems = connection.prepareStatement("DELETE FROM cart");
            int deletedRows = deleteCartItems.executeUpdate();

            return true;

        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi xóa sản phẩm từ giỏ hàng hoặc cập nhật số lượng sản phẩm", e);
        }
    }

    @Override
    public boolean deleteCart(int phoneId) {
        boolean isDeleted;
        Connection connection = BaseRepository.getConnection();
        if (connection == null) {
            throw new RuntimeException("Database connection is null");
        }
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE  FROM cart WHERE id_product = ?");
            statement.setInt(1, phoneId);
            isDeleted = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return isDeleted;
    }

    @Override
    public boolean checkInventoryById(int id) {
        Connection connection = BaseRepository.getConnection();
        if (connection == null) {
            throw new RuntimeException("Không thể kết nối vào cơ sở dữ liệu");
        }

        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        boolean isAvailable = true;

        try {
            preparedStatement = connection.prepareStatement(
                    "SELECT cart.quantity AS cart_quantity, product.quantity AS product_quantity " +
                            "FROM product " +
                            "JOIN cart ON cart.id_product = product.id_product " +
                            "WHERE cart.id_product = ? "
            );
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            // Kiểm tra số lượng tồn kho
            if (resultSet.next()) {
                int cartQuantity = resultSet.getInt("cart_quantity");
                int productQuantity = resultSet.getInt("product_quantity");
                if (cartQuantity >= productQuantity) {
                    isAvailable = false; 
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi kiểm tra tồn kho sản phẩm", e);
        }
        return isAvailable;
    }

    @Override
    public void addCart(Phone phone) {
        Connection connection = BaseRepository.getConnection();
        if (connection == null) {
            throw new RuntimeException("Database connection is null");
        }

        String selectQuery = "SELECT id_product FROM cart WHERE id_product = ?";
        String insertQuery = "INSERT INTO cart (id_product, price, quantity) VALUES (?, ?, ?)";
        String updateQuery = "UPDATE cart SET quantity = quantity + 1, price = price + ? WHERE id_product = ?";

        try (
                PreparedStatement selectStatement = connection.prepareStatement(selectQuery);
                PreparedStatement insertStatement = connection.prepareStatement(insertQuery);
                PreparedStatement updateStatement = connection.prepareStatement(updateQuery)
        ) {
            // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng hay chưa
            selectStatement.setInt(1, phone.getId());
            try (ResultSet resultSet = selectStatement.executeQuery()) {
                if (!resultSet.next()) {
                    // Nếu sản phẩm chưa tồn tại, thêm vào giỏ hàng
                    insertStatement.setInt(1, phone.getId());
                    insertStatement.setDouble(2, phone.getPrice());
                    insertStatement.setInt(3, 1);
                    insertStatement.executeUpdate();

                } else {
                    // Nếu sản phẩm đã tồn tại, cập nhật giỏ hàng
                    updateStatement.setInt(2, phone.getId());
                    updateStatement.setDouble(1, phone.getPrice());
                    updateStatement.executeUpdate();

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void update(int id, Phone phone) {
        Connection connection = BaseRepository.getConnection();
        if (connection == null) {
            throw new RuntimeException("Database connection is null");
        }
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE product SET name_product = ?, image = ?, manufacture = ?, price = ?, quantity = ?, size = ?, color = ?, ram = ?, battery = ? WHERE id_product = ?");

            preparedStatement.setString(1, phone.getName());
            preparedStatement.setString(2, phone.getImg());
            preparedStatement.setString(3, phone.getManufacture());
            preparedStatement.setLong(4, phone.getPrice());
            preparedStatement.setInt(5, phone.getQuantity());
            preparedStatement.setFloat(6, phone.getSize());
            preparedStatement.setString(7, phone.getColor());
            preparedStatement.setInt(8, phone.getRam());
            preparedStatement.setInt(9, phone.getBattery());
            preparedStatement.setInt(10, phone.getId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
