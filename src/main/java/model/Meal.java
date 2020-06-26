package model;

public class Meal {

    private Integer id;
    private String name;
    private String description;
    private String section;

    private Double weight;
    private String unitWeight;

    private Double proteins;
    private Double fats;
    private Double carbohydrates;
    private Double calories;

    public Meal(Integer id, String name, String description, String section, Double weight, String unitWeight, Double proteins, Double fats, Double carbohydrates, Double calories) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.section = section;
        this.weight = weight;
        this.unitWeight = unitWeight;
        this.proteins = proteins;
        this.fats = fats;
        this.carbohydrates = carbohydrates;
        this.calories = calories;
    }

    public Meal(String name, String description, String section, Double weight, String unitWeight, Double proteins, Double fats, Double carbohydrates, Double calories) {
        this(null, name, description, section, weight, unitWeight, proteins, fats, carbohydrates, calories);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSection() {
        return section;
    }

    public void setSection(String section) {
        this.section = section;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    public String getUnitWeight() {
        return unitWeight;
    }

    public void setUnitWeight(String unitWeight) {
        this.unitWeight = unitWeight;
    }

    public Double getProteins() {
        return proteins;
    }

    public void setProteins(Double proteins) {
        this.proteins = proteins;
    }

    public Double getFats() {
        return fats;
    }

    public void setFats(Double fats) {
        this.fats = fats;
    }

    public Double getCarbohydrates() {
        return carbohydrates;
    }

    public void setCarbohydrates(Double carbohydrates) {
        this.carbohydrates = carbohydrates;
    }

    public Double getCalories() {
        return calories;
    }

    public void setCalories(Double calories) {
        this.calories = calories;
    }

    public boolean isNew () {
        return id == null;
    }

    @Override
    public String toString() {
        return name + "_" +
                description + "_" +
                section + "_" +
                unitWeight + "_" +
                weight + "_" +
                carbohydrates + "_" +
                fats + "_" +
                proteins + "_" +
                calories;
    }
}
