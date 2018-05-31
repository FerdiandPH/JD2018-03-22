package by.it.sgolovach.jd03_02.crud;

import by.it.sgolovach.jd03_02.ConnectionCreator;
import by.it.sgolovach.jd03_02.beans.Role;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Locale;

public class RolesCRUD {
   public static boolean create(Role role) throws SQLException {
        String sql = String.format(Locale.US,"INSERT INTO `roles` (`role`) VALUES ('%s')", role.getRole());
        try (Connection connection = ConnectionCreator.getConnection();
             Statement statement = connection.createStatement()
        ) {
            boolean result = (1 == statement.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS));
            if (result) {
                ResultSet generatedKeys = statement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int id = generatedKeys.getInt(1);
                    role.setId(id);
                }
            }
            return result;
        }
    }


  public static boolean update(Role role) throws SQLException {
        String sql = String.format(Locale.US,"UPDATE " +
                "`roles` SET `role`='%s'" +
                " WHERE `id`=%d", role.getRole(), role.getId());
        try (Connection connection = ConnectionCreator.getConnection();
             Statement statement = connection.createStatement()
        ) {
            return (1 == statement.executeUpdate(sql));
        }
    }

    public static boolean delete(Role role) throws SQLException {
        String sql = String.format(Locale.US,"DELETE FROM `roles` WHERE `id`=%d", role.getId());
        try (Connection connection = ConnectionCreator.getConnection();
             Statement statement = connection.createStatement()
        ) {
            return (1 == statement.executeUpdate(sql));
        }
    }

   public static Role read(int id) throws SQLException {
        String sql = String.format(Locale.US,"SELECT * FROM `roles` WHERE `id`=%d", id);
        try (Connection connection = ConnectionCreator.getConnection();
             Statement statement = connection.createStatement()
        ) {
            ResultSet resultSet = statement.executeQuery(sql);
            if (resultSet.next()) {
                return new Role(
                        resultSet.getInt("id"),
                        resultSet.getString("role")
                );
            }

        }
        return null;
    }

}
