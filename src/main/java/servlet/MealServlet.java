package servlet;

import Repository.InMemoryMealRepository;
import controller.MealController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

public class MealServlet extends HttpServlet {

    private MealController controller;

    @Override
    public void init() throws ServletException {
        super.init();
        controller = new MealController(new InMemoryMealRepository());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        switch (action == null ? "all" : action) {
            case "filter":
                req.setAttribute("meals", controller.getMealWithFilter(req.getParameterValues("filter")));
                break;
            case "all":
            default:
                req.setAttribute("meals", controller.getAll());
                break;
        }
        req.setAttribute("sections", controller.getAllSection());
        req.getRequestDispatcher("/meals.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
