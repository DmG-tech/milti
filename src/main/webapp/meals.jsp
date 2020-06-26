<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Meals</title>

    <link rel="stylesheet" href="css/style.css">

    <script type="text/javascript" src="js/jquery-latest.js">
    </script>
    <script type="text/javascript" src="js/jquery.tablesorter.js">
    </script>
</head>
<body>
<h1>Меню <a href="https://www.mealty.ru">www.mealty.ru</a></h1>
<form method="get" action="meals">
    <input type="hidden" name="action" value="filter">
    <c:forEach items="${sections}" var="section">
        <p><input type="checkbox" class="custom-checkbox" name="filter" value="${section}">${section}</p>
    </c:forEach>
    <p><input type="submit" value="Показать"></p>
</form>
<table id="meal-table" class="tablesorter">
    <thead>
    <tr>
        <th>Нзвание</th>
        <th>Раздел меню</th>
        <th>Вес г(мл)</th>
        <th>Белки</th>
        <th>Жиры</th>
        <th>Углеводы</th>
        <th>Калорий на 100г</th>
        <th>Калорий в порции</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${meals}" var="meal">
        <jsp:useBean id="meal" type="model.Meal"/>
        <tr role="row">
            <td>${meal.name}<br/>${meal.description}</td>
            <td>${meal.section}</td>
            <td>${meal.weight}</td>
            <td>${meal.proteins}</td>
            <td>${meal.fats}</td>
            <td>${meal.carbohydrates}</td>
            <td>${meal.calories}</td>
            <td>${meal.caloriesPerServing}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<script>
    $(document).ready(function(){
        $("#meal-table").tablesorter();
    });
</script>
</body>
</html>