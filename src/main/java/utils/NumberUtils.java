package utils;

public class NumberUtils {

    public static Double getDouble(String s) {
        Double number = null;
        try {
            return Double.parseDouble(s.replaceAll(",", "."));
        }
        catch (NumberFormatException e) {
            return null;
        }
    }

    public static Integer getInteger(String s) {
        Integer number = null;
        try {
            return Integer.parseInt(s.replaceAll(",", "."));
        }
        catch (NumberFormatException e) {
            return null;
        }
    }
}
