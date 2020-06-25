package utils;

import Repository.InMemoryMealRepository;
import Repository.MealRepository;
import model.Meal;

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
}
