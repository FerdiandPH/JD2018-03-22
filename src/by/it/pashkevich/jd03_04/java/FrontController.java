package by.it.pashkevich.jd03_04.java;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FrontController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        process(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        process(req, resp);
    }

    private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ActionFactory actionFactory = new ActionFactory();
        IActionCmd cmd = actionFactory.defineCmd(req);
        String viewPage;
        try {
            viewPage = cmd.execute(req);

        } catch (Exception e) {
            viewPage = Actions.ERROR.jsp;
        }
        getServletContext().getRequestDispatcher(viewPage).forward(req, resp);
    }
}
