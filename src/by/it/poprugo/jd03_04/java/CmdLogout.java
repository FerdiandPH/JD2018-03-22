package by.it.poprugo.jd03_04.java;

import javax.servlet.http.HttpServletRequest;

public class CmdLogout implements ActionCmd {
    @Override
    public String execute(HttpServletRequest reg) throws Exception {
        return Actions.LOGOUT.jsp;
    }
}
