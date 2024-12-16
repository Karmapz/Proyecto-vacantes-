<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jobsearch.Vacante, com.jobsearch.VacanteManager, java.util.Date" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aplicar a Vacante</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Aplicar a Vacante</h1>
        <div class="glass-container">
            <%
            int id = Integer.parseInt(request.getParameter("id"));
            Vacante vacante = VacanteManager.getVacante(id);
            
            if (request.getMethod().equalsIgnoreCase("post")) {
                try {
                    // Registrar la aplicación
                    VacanteManager.aplicarAVacante(id, new Date());
                    out.println("<p class='success'>¡Aplicación enviada con éxito para la vacante: " + vacante.getNombre() + "!</p>");
                } catch (Exception e) {
                    out.println("<p class='error'>Error al aplicar a la vacante: " + e.getMessage() + "</p>");
                }
            }
            %>
            
            <h2><%= vacante.getNombre() %></h2>
            <p><strong>Empresa:</strong> <%= vacante.getEmpresa() %></p>
            <p><strong>Descripción:</strong> <%= vacante.getDescripcion() %></p>
            <p><strong>Salario:</strong> $<%= String.format("%.2f", vacante.getSalario()) %></p>
            
            <form action="aplicar-vacante.jsp?id=<%= id %>" method="post">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required>
                
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
                
                <label for="telefono">Teléfono:</label>
                <input type="tel" id="telefono" name="telefono" required>
                
                <label for="cv">CV (URL):</label>
                <input type="url" id="cv" name="cv" required>
                
                <input type="submit" value="Enviar Aplicación" class="btn">
            </form>
            
            <a href="lista-vacantes.jsp" class="btn">Volver a la Lista de Vacantes</a>
        </div>
    </div>
</body>
</html>