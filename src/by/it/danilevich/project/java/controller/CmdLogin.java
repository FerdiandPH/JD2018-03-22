package by.it.danilevich.project.java.controller;

import by.it.danilevich.project.java.beans.UserBean;
import by.it.danilevich.project.java.dao.Dao;
import by.it.danilevich.project.java.beans.UserBean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;

public class CmdLogin extends Cmd {
    @Override
    public Cmd execute(HttpServletRequest req) throws Exception {
        if (req.getMethod().equalsIgnoreCase("post")){
            String login=req.getParameter("login");
            String password=req.getParameter("password");
            UserBean user=new UserBean(0,"",1,"", "", login,password);
            Dao dao = Dao.getInstance();
            String where=String.format("WHERE login='%s' AND password='%s' LIMIT 0,1",login,password);
            List<UserBean> users = dao.userDao.getAll(where);
            if (users.size()>0){
                user=users.get(0);
                HttpSession session = req.getSession();
                session.setAttribute("user",user);
                return Actions.PROFILE.command;
            }
        }
        return null;
    }

    public static void main(String[] args) throws SQLException {
        Dao dao = Dao.getInstance();
        String where=String.format("WHERE login='%s' AND password='%s'","TestLogin","TestPassword");
        if (dao.userDao.getAll(where).size()==1){
            System.out.println("ok");
        }
    }
}
