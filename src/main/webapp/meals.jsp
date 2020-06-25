<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Meals</title>
</head>
<body>
<section>
    <h3><a href="index.html">Home</a></h3>
    <hr/>
    <h2>Meals</h2>
    <%--<form method="get" action="meals">
        <input type="hidden" name="action" value="filter">
        <dl>
            <dt>From Date (inclusive):</dt>
            <dd><input type="date" name="startDate" value="${param.startDate}"></dd>
        </dl>
        <dl>
            <dt>To Date (inclusive):</dt>
            <dd><input type="date" name="endDate" value="${param.endDate}"></dd>
        </dl>
        <dl>
            <dt>From Time (inclusive):</dt>
            <dd><input type="time" name="startTime" value="${param.startTime}"></dd>
        </dl>
        <dl>
            <dt>To Time (exclusive):</dt>
            <dd><input type="time" name="endTime" value="${param.endTime}"></dd>
        </dl>
        <button type="submit">Filter</button>
    </form>--%>
    <hr/>
    <table border="1" cellpadding="8" cellspacing="0">
        <thead>
        <tr>
            <th>name</th>
            <th>description</th>
            <th>section</th>
            <th>weight</th>
            <th>unitWeight</th>
            <th>proteins</th>
            <th>fats</th>
            <th>carbohydrates</th>
            <th>calories</th>
            <th>caloriesPerServing</th>
        </tr>
        </thead>
        <c:forEach items="${meals}" var="meal">
            <jsp:useBean id="meal" type="model.Meal"/>
                <td>${meal.name}</td>
                <td>${meal.description}</td>
                <td>${meal.section}</td>
                <td>${meal.weight}</td>
                <td>${meal.unitWeight}</td>
                <td>${meal.proteins}</td>
                <td>${meal.fats}</td>
                <td>${meal.carbohydrates}</td>
                <td>${meal.calories}</td>
                <td>${meal.caloriesPerServing}</td>
            </tr>
        </c:forEach>
    </table>
</section>
</body>
</html>