package utils;

public class NumberUtils {

    public static Double getDouble(String s) {
        try {
            return Double.parseDouble(s.replaceAll(",", "."));
        }
        catch (NumberFormatException e) {
            return null;
        }
    }

    public static Integer getInteger(String s) {
        try {
            return Integer.parseInt(s.replaceAll(",", "."));
        }
        catch (NumberFormatException e) {
            return null;
        }
    }
}
