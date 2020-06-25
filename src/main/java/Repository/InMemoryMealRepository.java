package Repository;

import model.Meal;
import parser.MealParser;

import java.util.Collection;
import java.util.Comparator;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

public class InMemoryMealRepository implements MealRepository {
    private Map<Integer, Meal> mealMap = new ConcurrentHashMap<>();
    private AtomicInteger counter = new AtomicInteger(0);

    private MealParser parser = new MealParser();

    @Override
    public Meal save(Meal meal) {
        if (meal.isNew()) {
            meal.setId(counter.incrementAndGet());
        }
        return mealMap.put(meal.getId(), meal);
    }

    @Override
    public void delete(int id) {
        mealMap.remove(id);
    }

    @Override
    public Meal get(int id) {
        return mealMap.get(id);
    }

    @Override
    public Collection<Meal> getAll() {
        /*return mealMap.isEmpty() ? parser.getAllMeal() : mealMap.values().stream()
                .sorted(Comparator.comparing(Meal::getCaloriesPerServing).reversed())
                .collect(Collectors.toList());*/
        return mealMap.isEmpty() ? parser.getAllMeal() : mealMap.values();
    }
}
