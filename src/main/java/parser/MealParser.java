package parser;

import model.Meal;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.*;

import static utils.NumberUtils.*;

public class MealParser {

    public List<Meal> getAllMeal() {
        Document startPage = null;
        try {
            startPage = Jsoup.connect("https://www.mealty.ru/catalog/").get();
        } catch (IOException e) {
            return Collections.emptyList();
        }

        List<Meal> meals = new ArrayList<>(200);

        Element menu = startPage.getElementsByClass("col-md-8").first();

        String section = null;

        Elements elements = menu.getAllElements();
        for (Element element : elements) {

            String mealCardClass = "meal-card";
            String sectionClass = "withline menu-category-title";

            if (sectionClass.equals(element.className())) {
                section = element.text();
            }

            if (mealCardClass.equals(element.className())) {
                meals.add(getMeal(element, mealCardClass, section));
            }
        }
        return meals;
    }

    private Meal getMeal(Element element, String mealCardClass, String section) {
        String name = element.getElementsByClass(mealCardClass + "__name").text();
        String description = element.getElementsByClass(mealCardClass + "__name-note").text();

        Double weight = getDouble(element.getElementsByClass(mealCardClass + "__weight").text());
        String unitWeight = element.getElementsByClass(mealCardClass + "__weight_unit").text();

        Double proteins = getDouble(element.getElementsByClass(mealCardClass + "__proteins").text());
        Double fats = getDouble(element.getElementsByClass(mealCardClass + "__fats").text());
        Double carbohydrates = getDouble(element.getElementsByClass(mealCardClass + "__carbohydrates").text());
        Double calories = getDouble(element.getElementsByClass(mealCardClass + "__calories").text());

        return new Meal(name, description, section, weight, unitWeight, proteins, fats, carbohydrates, calories);
    }
}
