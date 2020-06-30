package servlet;

import repository.InMemoryMealRepository;
import controller.MealController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MealServlet extends HttpServlet {

    private MealController controller;

    @Override
    public void init() throws ServletException {
        super.init();
        controller = new MealController(new InMemoryMealRepository());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String sort = req.getParameter("sort");

        String filter = req.getParameter("filter");

        if (sort == null) {
            sort = "default";
        }

        if (filter == null) {
            filter = "all";
        }

        if ("all".equals(filter)) {
            req.setAttribute("meals", controller.getAll(sort));
        } else {
            req.setAttribute("meals", controller.getMealWithFilter(sort, req.getParameterValues("filter")));
        }
        req.setAttribute("sections", controller.getAllSection());
        req.getRequestDispatcher("/meals.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
