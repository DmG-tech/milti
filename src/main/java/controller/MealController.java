package controller;

import Repository.MealRepository;
import model.Meal;
import utils.MealUtils;

import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

public class MealController {

    private final MealRepository repository;

    public MealController(MealRepository repository) {
        this.repository = repository;
    }

    /*public Meal save (Meal meal);
    public void delete (int id);
    public Meal get(int id);*/

    public Collection<Meal> getAll() {
        return repository.getAll();
    }

    public Collection<String> getAllSection() {
        Set<String> sections = new LinkedHashSet<>();
        repository.getAll().forEach(meal -> sections.add(meal.getSection()));
        return sections;
    }

    public Collection<Meal> getMealWithFilter(String ...filter) {
        return filter == null ? getAll() : MealUtils.getMealBySection(filter);
    }
}
