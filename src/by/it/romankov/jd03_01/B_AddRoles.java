package by.it.romankov.jd03_01;

import com.mysql.fabric.jdbc.FabricMySQLDriver;

import java.sql.*;

public class B_AddRoles {
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try {
            Driver driver = new FabricMySQLDriver();
            DriverManager.registerDriver(driver);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:2016/romankov", "root", "")) {
            if(!connection.isClosed()) System.out.println("Соединение с базой установлено");
            Statement statement = connection.createStatement();
            statement.executeUpdate("INSERT INTO `roles`(`id`, `role`) VALUES (DEFAULT,'director')");
            statement.executeUpdate("INSERT INTO `roles`(`id`, `role`) VALUES (DEFAULT,'agent')");
            statement.executeUpdate("INSERT INTO `roles`(`id`, `role`) VALUES (DEFAULT,'client')");
            statement.executeUpdate("INSERT INTO `roles`(`id`, `role`) VALUES (DEFAULT,'repeted_client')");
            connection.close();
            if(connection.isClosed()) System.out.println("Соединение с базой прервано");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
