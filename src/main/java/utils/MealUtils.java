package utils;

import Repository.InMemoryMealRepository;
import Repository.MealRepository;
import model.Meal;
import to.MealTo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

public class MealUtils {

    private static MealRepository repository = new InMemoryMealRepository();

    public static Collection<Meal> getMealBySection(String ...filter) {
        List<String> sections = List.of(filter);
        return repository.getAll().stream().filter(meal -> sections.contains(meal.getSection())).collect(Collectors.toList());
    }

    private static boolean checkedMeal(Meal meal) {
        return meal.getProteins() != null &&
                meal.getFats() != null &&
                meal.getCarbohydrates() != null &&
                meal.getCalories() != null &&
                meal.getWeight() != null;
    }

    public static Collection<MealTo> getTos(Collection<Meal> meals) {
        List<MealTo> mealTos = new ArrayList<>(200);
        meals.forEach(meal -> mealTos.add(getMealTo(meal)));
        mealTos.remove(null);
        return mealTos;
    }

    private static MealTo getMealTo(Meal meal) {
        return checkedMeal(meal) ? new MealTo(
                meal.getName(),
                meal.getDescription(),
                meal.getSection(),
                meal.getWeight(),
                meal.getUnitWeight(),
                meal.getProteins(),
                meal.getFats(),
                meal.getCarbohydrates(),
                meal.getCalories()) : null;
    }
}
