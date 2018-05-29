package by.it.sgolovach.jd03_01;

import com.mysql.fabric.jdbc.FabricMySQLDriver;

import java.sql.*;

public class TaskB_AddRoles {
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

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:2016/sgolovach", "root", "")) {
            if(!connection.isClosed()) System.out.println("Соединение с базой установлено");
            Statement statement = connection.createStatement();
            statement.executeUpdate("INSERT INTO `sgolovach`.`roles` (`id`, `role`) VALUES (DEFAULT, 'admin')");
            statement.executeUpdate("INSERT INTO `sgolovach`.`roles` (`id`, `role`) VALUES (DEFAULT, 'user')");
            statement.executeUpdate("INSERT INTO `sgolovach`.`roles` (`id`, `role`) VALUES (DEFAULT, 'guest')");
            statement.executeUpdate("INSERT INTO `sgolovach`.`roles` (`id`, `role`) VALUES (DEFAULT, 'director')");
            connection.close();
            if(connection.isClosed()) System.out.println("Соединение с базой прервано");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
