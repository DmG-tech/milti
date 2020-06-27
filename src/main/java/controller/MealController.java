package controller;

import Repository.MealRepository;
import to.MealTo;
import utils.MealUtils;

import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.Set;

public class MealController {

    private final MealRepository repository;

    public MealController(MealRepository repository) {
        this.repository = repository;
    }

    /*public Meal save (Meal meal);
    public void delete (int id);
    public Meal get(int id);*/

    public Collection<MealTo> getAll(String sort) {
        return MealUtils.getTos(repository.getAll());
    }

    public Collection<String> getAllSection() {
        Set<String> sections = new LinkedHashSet<>();
        repository.getAll().forEach(meal -> sections.add(meal.getSection()));
        return sections;
    }

    public Collection<MealTo> getMealWithFilter(String sort, String ...filter) {
        return filter == null ? getAll(sort) : MealUtils.getMealToBySection(sort, filter);
    }
}
