public class Main {

    public static void main(String[] args) {

        /*Команда для деплоя в хироку*/
        //mvn clean heroku:deploy-war

        /*MealRepository repository = new InMemoryMealRepository();
        MealParser parser = new MealParser(repository);
        parser.getAllMeal();

        Map<String, List<Meal>> map = repository.getAll().stream()
                .sorted(Comparator.comparing(Meal::getCaloriesPerServing).thenComparing(Meal::getProteins).reversed())
                .collect(Collectors.groupingBy(Meal::getSection));

        map.forEach((section, meals) -> {
            System.out.println(section);
            meals.forEach(System.out::println);
        });*/
    }
}
