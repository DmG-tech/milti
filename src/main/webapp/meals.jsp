<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Meals</title>

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/table.css">
    <link rel="stylesheet" href="css/form.css">


    <script src='js/tablesort.js'></script>
    <script src='js/tablesort.number.js'></script>

</head>
<body>
<div>
    <div class="box-title">
        <h1>Меню <a href="https://www.mealty.ru">www.mealty.ru</a></h1>

        <%--<hr>
        <p align="left">
            Для фильтрации по разделу меню необходимо выбрать интересующие разделы
            (можно выбрать несколько разделов, если не выбрано ни одного раздела - отобразится весь список)
            и нажать "показать".
            <br>Для сортировки необходимо тапнуть по интересующему заголовку стоблца (первый тап - сортировка по
            возрастанию, второй тап - по убыванию).
        </p>
        <hr>--%>

    </div>

    <div class="form">
        <form method="get" action="meals">
            <div class="box-form">
                <div class="filter">
                    <h3>Фильтр</h3>
                    <select class="filter" id="filter" name="filter">
                        <option value="all">Всё</option>
                        <c:forEach items="${sections}" var="section">
                            <option value="${section}">${section}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="sort">
                    <h3>Соритровка</h3>
                    <select class="sort" id="sort" name="sort">
                        <option value="default">По умолчанию</option>
                        <option value="proteins">Белки</option>
                        <option value="fats">Жиры</option>
                        <option value="carbohydrates">Углеводы</option>
                        <option value="caloriesPerServing">Калории на порцию</option>
                    </select>
                </div>

                <%--<input type="hidden" name="action" value="filter">
        <c:forEach items="${sections}" var="section">
            <div class="input">
                <b><input type="checkbox" class="custom-checkbox" name="filter" value="${section}">${section}</b>
            </div>
        </c:forEach>--%>
                <p><input type="submit" class="custom-button" value="Показать"></p>
            </div>
        </form>
    </div>

    <div class="box-table">
        <table id="meal-table" class="tablesorter">
            <thead>
            <tr>
                <th role="columnheader">Название</th>
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
                    <td aria-label="Нзвание">${meal.name}<br/>${meal.description}</td>
                    <td aria-label="Раздел меню">${meal.section}</td>
                    <td aria-label="Вес г(мл)">${meal.weight}</td>
                    <td aria-label="Белки (на порцию)">${meal.proteins}<br/>(${meal.proteinsPerServing})</td>
                    <td aria-label="Жиры (на порцию)">${meal.fats}<br/>(${meal.fatsPerServing})</td>
                    <td aria-label="Углеводы (на порцию)">${meal.carbohydrates}<br/>(${meal.carbohydratesPerServing})
                    </td>
                    <td aria-label="Калорий на 100г">${meal.calories}</td>
                    <td aria-label="Калорий на порцию">${meal.caloriesPerServing}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <script>
        new Tablesort(document.getElementById('meal-table'));
    </script>
</div>

<%--<style>
    div {
        display: block;
        background-color: #3b3b3b;
        width: 90%;
        height: 100%;
        margin: auto;
    }

    div.sec {
        display: inline-block;
        background-color: red;
        width: 40%;
        height: 40%;
        left: 10%;
        position: relative;
    }
</style>
<div>
    <div class="sec"></div>
    <div class="sec"></div>
</div>--%>
</body>
</html>