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
                /*LocalDate startDate = parseLocalDate(req.getParameter("startDate"));
                LocalDate endDate = parseLocalDate(req.getParameter("endDate"));
                LocalTime startTime = parseLocalTime(req.getParameter("startTime"));
                LocalTime endTime = parseLocalTime(req.getParameter("endTime"));
                req.setAttribute("meals", mealController.getBetween(startDate, startTime, endDate, endTime));
                req.getRequestDispatcher("/meals.jsp").forward(req, response);*/
                break;
            case "all":
            default:
                req.setAttribute("meals", controller.getAll());
                req.getRequestDispatcher("/meals.jsp").forward(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    private int getId(HttpServletRequest request) {
        String paramId = Objects.requireNonNull(request.getParameter("id"));
        return Integer.parseInt(paramId);
    }
}
