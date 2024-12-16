<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jobsearch.Vacante, com.jobsearch.VacanteManager, java.util.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reporte de Aplicaciones</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Reporte de Aplicaciones</h1>
        <div class="glass-container">
            <form action="reporte-aplicaciones.jsp" method="get">
                <label for="fechaInicio">Fecha de inicio:</label>
                <input type="date" id="fechaInicio" name="fechaInicio" required>
                
                <label for="fechaFin">Fecha de fin:</label>
                <input type="date" id="fechaFin" name="fechaFin" required>
                
                <input type="submit" value="Generar Reporte" class="btn">
            </form>
            
            <%
            String fechaInicio = request.getParameter("fechaInicio");
            String fechaFin = request.getParameter("fechaFin");
            
            if (fechaInicio != null && fechaFin != null) {
                try {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    Date inicio = sdf.parse(fechaInicio);
                    Date fin = sdf.parse(fechaFin);
                    
                    Map<Vacante, Integer> aplicaciones = VacanteManager.getAplicacionesPorVacante(inicio, fin);
                    int totalAplicaciones = 0;
                    
                    if (!aplicaciones.isEmpty()) {
            %>
                    <h2>Resultados del Reporte</h2>
                    <table>
                        <tr>
                            <th>Vacante</th>
                            <th>Empresa</th>
                            <th>Aplicaciones</th>
                        </tr>
                        <% for (Map.Entry<Vacante, Integer> entry : aplicaciones.entrySet()) {
                            Vacante vacante = entry.getKey();
                            int cantidadAplicaciones = entry.getValue();
                            totalAplicaciones += cantidadAplicaciones;
                        %>
                        <tr>
                            <td><%= vacante.getNombre() %></td>
                            <td><%= vacante.getEmpresa() %></td>
                            <td><%= cantidadAplicaciones %></td>
                        </tr>
                        <% } %>
                        <tr>
                            <td colspan="2"><strong>Total de Aplicaciones:</strong></td>
                            <td><strong><%= totalAplicaciones %></strong></td>
                        </tr>
                    </table>
            <% } else { %>
                    <p>No se encontraron aplicaciones en el rango de fechas seleccionado.</p>
            <%  }
                } catch (Exception e) {
                    out.println("<p class='error'>Error al generar el reporte: " + e.getMessage() + "</p>");
                }
            }
            %>
            
            <a href="lista-vacantes.jsp" class="btn">Volver a la Lista de Vacantes</a>
        </div>
    </div>
</body>
</html>