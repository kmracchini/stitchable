<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="title" value="Site Administration" />
<%@include file="head.jsp"%>
<%@include file="header.jsp"%>

<script type="text/javascript" class="init">
    $(document).ready( function () {
        $('#patternTable').DataTable();
    } );

    $(document).ready( function () {
        $('#designerTable').DataTable();
    } );
</script>
<html>
<body>
<div class="container-fluid">
    <c:choose>
        <c:when test="${user.isAdmin == 1}">
            <h2>Welcome, admin! </h2>

            <h3>Designers</h3>
            <table id="designerTable" class="display">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Website</th>
                    <th>Edit / Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="designer" items="${designers}">
                    <tr>
                        <td>${designer.id}</td>
                        <td>${designer.name}</td>
                        <td>${designer.website}</td>
                        <td></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>


            <h3>Patterns</h3>
            <table id="patternTable" class="display">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Designer</th>
                    <th>Name</th>
                    <th>Image</th>
                    <th>Link</th>
                    <th>Edit / Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="pattern" items="${patterns}">
                    <tr>
                        <td>${pattern.id}</td>
                        <td>${pattern.designer.name}</td>
                        <td>${pattern.name}</td>
                        <td><a href="images/${pattern.image}">Pattern image</a></td>
                        <td><a href="${pattern.url}">Link to pattern</a></td>
                        <td></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <h2><a href="logIn">You need to log in to view this page.</a></h2>
        </c:otherwise>
    </c:choose>
</div>

</body>
</html>