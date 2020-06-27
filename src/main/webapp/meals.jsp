<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Meals</title>

    <link rel="stylesheet" href="css/style.css">
    <%--<link rel="stylesheet" href="css/table.css">
    <link rel="stylesheet" href="css/form.css">--%>

    <%--<script src='js/tablesort.js'></script>
    <script src='js/tablesort.number.js'></script>--%>

</head>
<body>
<div class="d-main">
    <div class="d-title">
        <h1>Меню <a href="https://www.mealty.ru">www.mealty.ru</a></h1>
    </div>
    <div class="d-nav">
        <form method="get" action="meals">
            <div class="d-select">
                <div class="d-filter">
                    <h3>Фильтр</h3>
                    <select class="filter" id="filter" name="filter">
                        <option value="all">Всё</option>
                        <c:forEach items="${sections}" var="section">
                            <option value="${section}">${section}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="d-sort">
                    <h3>Соритровка</h3>
                    <select class="sort" id="sort" name="sort">
                        <option value="default">По умолчанию</option>
                        <option value="proteins">Белки</option>
                        <option value="fats">Жиры</option>
                        <option value="carbohydrates">Углеводы</option>
                        <option value="caloriesPerServing">Калории на порцию</option>
                    </select>
                </div>
            </div>
            <div class="d-button">
                <p><input type="submit" class="custom-button" value="Показать"></p>
            </div>
        </form>
    </div>
    <div class="d-cont">
        <c:forEach items="${meals}" var="meal">
            <jsp:useBean id="meal" type="to.MealTo"/>
            <div class="meal-card">
                <table>
                    <tbody>
                    <tr>
                            <%--<th>Название</th>--%>
                        <td class="t-name" colspan="2">${meal.name}<br/>${meal.description}</td>
                    </tr>
                    <tr>
                        <th>Раздел меню</th>
                        <td>${meal.section}</td>
                    </tr>
                    <tr>
                        <th>Вес<br/><small>г (мл)</small></th>
                        <td>${meal.weight}</td>
                    </tr>
                    <tr>
                        <th>Белки<br/><small>(на порцию)</small></th>
                        <td>${meal.proteins}<br/>(${meal.proteinsPerServing})</td>
                    </tr>
                    <tr>
                        <th>Жиры<br/><small>(на порцию)</small></th>
                        <td>${meal.fats}<br/>(${meal.fatsPerServing})</td>
                    </tr>
                    <tr>
                        <th>Углеводы<br/><small>(на порцию)</small></th>
                        <td>${meal.carbohydrates}<br/>(${meal.carbohydratesPerServing})</td>
                    </tr>
                    <tr>
                        <th>Калории<br/><small>(на 100г)</small></th>
                        <td>${meal.calories}</td>
                    </tr>
                    <tr>
                        <th>Калории<br/><small>(на порцию)</small></th>
                        <td>${meal.caloriesPerServing}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </c:forEach>
        <div class="meal-tabel">
            <table>
                <thead>
                <tr>
                    <th>Название</th>
                    <th>Раздел меню</th>
                    <th>Вес<br/><small>г(мл)</small></th>
                    <th>Белки<br/><small>(на порцию)</small></th>
                    <th>Жиры<br/><small>(на порцию)</small></th>
                    <th>Углеводы<br/><small>(на порцию)</small></th>
                    <th>Калорий<br/>на 100г</th>
                    <th>Калорий на порцию</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${meals}" var="meal">
                <%--<jsp:useBean id="meal" type="to.MealTo"/>--%>
                <tr>
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
    </div>
</div>
<%--<script>
    new Tablesort(document.getElementById('meal-table'));
</script>--%>
</body>
</html>