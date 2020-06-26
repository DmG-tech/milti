<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Meals</title>

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/table.css">
    <link rel="stylesheet" href="css/form.css">

    <script src='js/tablesort.js'></script>
    <script src='js/tablesort.number.js'></script>

    <%--<script type="text/javascript" src="js/jquery-latest.js">
    </script>
    <script type="text/javascript" src="js/jquery.tablesorter.js">
    </script>--%>
</head>
<body>
<div class="box-title">
<h1>Меню <a href="https://www.mealty.ru">www.mealty.ru</a></h1>
    <hr>
    <p>
        Для фильтрации по разделу меню необходимо выбрать интересующие разделы
        (можно выбрать несколько разделов, если не выбрано ни одного раздела - отобразится весь список)
        и нажать "показать".
        <br>Для сортировки необходимо тапнуть по интересующему заголовку стоблца (первый тап - сортировка по возрастанию, второй тап - по убыванию).
    </p>
    <hr>
</div>
<div class="box-form">
<form method="get" action="meals">
    <input type="hidden" name="action" value="filter">
    <c:forEach items="${sections}" var="section">
        <b><input type="checkbox" class="custom-checkbox" name="filter" value="${section}">${section}</b>
    </c:forEach>
    <p><input type="submit" class="custom-button" value="Показать"></p>
</form>
</div>
<div class="box-table">
<table id="meal-table" class="tablesorter">
    <thead>
    <tr>
        <th role="columnheader">Нзвание</th>
        <th role="columnheader">Раздел меню</th>
        <th role="columnheader">Вес<br/><small>г(мл)</small></th>
        <th role="columnheader">Белки<br/><small>(на порцию)</small></th>
        <th role="columnheader">Жиры<br/><small>(на порцию)</small></th>
        <th role="columnheader">Углеводы<br/><small>(на порцию)</small></th>
        <th role="columnheader">Калорий<br/>на 100г</th>
        <th role="columnheader">Калорий на порцию</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${meals}" var="meal">
        <jsp:useBean id="meal" type="to.MealTo"/>
        <tr role="row">
            <td>${meal.name}<br/>${meal.description}</td>
            <td>${meal.section}</td>
            <td>${meal.weight}</td>
            <td>${meal.proteins}<br/>(${meal.proteinsPerServing})</td>
            <td>${meal.fats}<br/>(${meal.fatsPerServing})</td>
            <td>${meal.carbohydrates}<br/>(${meal.carbohydratesPerServing})</td>
            <td>${meal.calories}</td>
            <td>${meal.caloriesPerServing}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>

<%--<script>
    $(document).ready(function(){
        $("#meal-table").tablesorter();
    });
</script>--%>

<script>
    new Tablesort(document.getElementById('meal-table'));
</script>
</body>
</html>