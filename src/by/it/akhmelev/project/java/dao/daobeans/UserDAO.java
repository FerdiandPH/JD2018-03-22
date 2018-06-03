package by.it.akhmelev.project.java.dao.daobeans;

import by.it.akhmelev.project.java.beans.User;
import by.it.akhmelev.project.java.dao.UniversalDAO;

public class UserDAO extends UniversalDAO<User> {
    public UserDAO() {
        super(new User(), "users");
    }
}
