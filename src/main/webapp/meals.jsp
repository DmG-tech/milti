<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Meals</title>

    <link rel="stylesheet" href="style.css">

    <script src='js/tablesort.js'></script>
    <script src='js/tablesort.number.js'></script>
</head>
<body>
<div class="center">
    <h1>Меню <a href="https://www.mealty.ru">www.mealty.ru</a></h1>
</div>

<div class="center">

    <div class="layer-table">
        <table id="sort" class="tablesorter">
            <thead>
            <tr>
                <th role="columnheader">Нзвание</th>
                <th role="columnheader">Раздел меню</th>
                <th role="columnheader">Вес г(мл)</th>
                <th role="columnheader">Белки</th>
                <th role="columnheader">Жиры</th>
                <th role="columnheader">Углеводы</th>
                <th role="columnheader">Калорий на 100г</th>
                <th role="columnheader">Калорий в порции</th>
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
    </div>

    <div class="layer-form">
        <form method="get" action="meals">
            <input type="hidden" name="action" value="filter">
            <c:forEach items="${sections}" var="section">
                <p><input type="checkbox" class="custom-checkbox" name="filter" value="${section}">${section}</p>
            </c:forEach>
            <p><input type="submit" value="Показать"></p>
        </form>
    </div>

</div>
<script>
    new Tablesort(document.getElementById('sort'));
</script>
</body>
</html>