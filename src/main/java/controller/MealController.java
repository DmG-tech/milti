package controller;

import Repository.MealRepository;
import model.Meal;

import java.util.Collection;

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
}
