package to;

public class MealTo {
    private String name;
    private String description;
    private String section;

    private Double weight;
    private String unitWeight;

    private Double proteins;
    private Double fats;
    private Double carbohydrates;
    private Double calories;

    private Double proteinsPerServing;
    private Double fatsPerServing;
    private Double carbohydratesPerServing;
    private Double caloriesPerServing;

    public MealTo(String name, String description, String section, Double weight, String unitWeight, Double proteins, Double fats, Double carbohydrates, Double calories) {
        this.name = name;
        this.description = description;
        this.section = section;
        this.weight = weight;
        this.unitWeight = unitWeight;
        this.proteins = proteins;
        this.fats = fats;
        this.carbohydrates = carbohydrates;
        this.calories = calories;

        setProteinsPerServing();
        setFatsPerServing();
        setCarbohydratesPerServing();
        setCaloriesPerServing();
    }

    public void setProteinsPerServing() {
        this.proteinsPerServing = Math.floor(weight / 100 * proteins);
    }

    public void setFatsPerServing() {
        this.fatsPerServing = Math.floor(weight / 100 * fats);
    }

    public void setCarbohydratesPerServing() {
        this.carbohydratesPerServing = Math.floor(weight / 100 * carbohydrates);
    }

    public void setCaloriesPerServing() {
        this.caloriesPerServing = Math.floor(weight / 100 *  calories);
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public String getSection() {
        return section;
    }

    public Double getWeight() {
        return weight;
    }

    public String getUnitWeight() {
        return unitWeight;
    }

    public Double getProteins() {
        return proteins;
    }

    public Double getFats() {
        return fats;
    }

    public Double getCarbohydrates() {
        return carbohydrates;
    }

    public Double getCalories() {
        return calories;
    }

    public Double getProteinsPerServing() {
        return proteinsPerServing;
    }

    public Double getFatsPerServing() {
        return fatsPerServing;
    }

    public Double getCarbohydratesPerServing() {
        return carbohydratesPerServing;
    }

    public Double getCaloriesPerServing() {
        return caloriesPerServing;
    }
}
