package by.it.poprugo.project.java.controller;

//import by.it.poprugo.project.java.beans.User;
//import by.it.poprugo.project.java.dao.DAO;
//
//import javax.servlet.http.HttpServletRequest;
//
//public class CmdSignup extends CmdAbstact {
//    @Override
//    public CmdAbstact execute(HttpServletRequest reg) throws Exception {
//        if (reg.getMethod().equalsIgnoreCase("post")) {
//            String login = reg.getParameter("login");
//            String email = reg.getParameter("email");
//            String password = reg.getParameter("password");
//            User user = new User(0, login, password, email, 2);
//            DAO dao = DAO.getInstance();
//            dao.user.create(user);
//            return Actions.LOGIN.command;
//        }
//        return null;
//    }
//}
