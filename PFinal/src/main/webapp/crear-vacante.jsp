<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jobsearch.Vacante, com.jobsearch.VacanteManager, java.util.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Nueva Vacante</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Crear Nueva Vacante</h1>
        <div class="glass-container">
            <%
            if (request.getMethod().equalsIgnoreCase("post")) {
                try {
                    String nombre = request.getParameter("nombre");
                    String descripcion = request.getParameter("descripcion");
                    List<String> palabrasClave = Arrays.asList(request.getParameter("palabrasClave").split(","));
                    double salario = Double.parseDouble(request.getParameter("salario"));
                    String estado = request.getParameter("estado");
                    String empresa = request.getParameter("empresa");
                    
                    Vacante nuevaVacante = new Vacante(0, nombre, descripcion, palabrasClave, salario, new Date(), estado, empresa);
                    VacanteManager.addVacante(nuevaVacante);
                    response.sendRedirect("lista-vacantes.jsp");
                } catch (Exception e) {
                    out.println("<p class='error'>Error al crear la vacante: " + e.getMessage() + "</p>");
                }
            }
            %>
            
            <form action="crear-vacante.jsp" method="post">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required>
                
                <label for="descripcion">Descripción:</label>
                <textarea id="descripcion" name="descripcion" required></textarea>
                
                <label for="palabrasClave">Palabras Clave (separadas por coma):</label>
                <input type="text" id="palabrasClave" name="palabrasClave" required>
                
                <label for="salario">Salario:</label>
                <input type="number" id="salario" name="salario" step="0.01" required>
                
                <label for="estado">Estado:</label>
                <select id="estado" name="estado" required>
                    <option value="disponible">Disponible</option>
                    <option value="finalizado">Finalizado</option>
                    <option value="oculto">Oculto</option>
                </select>
                
                <label for="empresa">Empresa:</label>
                <input type="text" id="empresa" name="empresa" required>
                
                <input type="submit" value="Crear Vacante" class="btn">
            </form>
            
            <a href="lista-vacantes.jsp" class="btn">Volver a la Lista de Vacantes</a>
        </div>
    </div>
</body>
</html>