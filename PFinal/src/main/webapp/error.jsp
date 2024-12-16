<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Error</h1>
        <div class="glass-container">
            <p class="error">Lo sentimos, ha ocurrido un error:</p>
            <p><%= exception.getMessage() %></p>
            <a href="index.jsp" class="btn">Volver a la página principal</a>
        </div>
    </div>
</body>
</html>