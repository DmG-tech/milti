<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Meals</title>

    <link rel="stylesheet" href="style.css">
    <script type="text/javascript" src="js/jquery-latest.js">
    </script>
    <script type="text/javascript" src="js/jquery.tablesorter.js">
    </script>
</head>
<body>


<section>
    <h3><a href="index.html">Home</a></h3>
    <h2>Meals</h2>

    <form method="get" action="meals">
        <input type="hidden" name="action" value="filter">
        <c:forEach items="${sections}" var="section">
            <p><input type="checkbox" name="filter" value="${section}">${section}<Br></p>
        </c:forEach>
        <p><input type="submit" value="Показать"></p>
    </form>

    <script type="text/javascript">
        $(document).ready(function(){
            $("#sort").tablesorter();
        });
    </script>

    <table id="sort" class="tablesorter" align="center" border="1" cellpadding="8" cellspacing="0">
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
            <tr>
            <td>${meal.name}<br />${meal.description}</td>
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
</section>

</body>
</html>