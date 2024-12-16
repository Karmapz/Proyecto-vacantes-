<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jobsearch.Vacante, com.jobsearch.VacanteManager, java.util.List" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Vacantes</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Lista de Vacantes</h1>
        <div class="glass-container">
            <form action="lista-vacantes.jsp" method="get">
                <input type="text" name="keyword" placeholder="Buscar vacantes...">
                <input type="submit" value="Buscar" class="btn">
            </form>
            
            <%
            String keyword = request.getParameter("keyword");
            List<Vacante> vacantes;
            if (keyword != null && !keyword.isEmpty()) {
                vacantes = VacanteManager.filterVacantes(keyword);
            } else {
                vacantes = VacanteManager.getAllVacantes();
            }
            %>
            
            <table>
                <tr>
                    <th>Nombre</th>
                    <th>Empresa</th>
                    <th>Salario</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
                <% for (Vacante vacante : vacantes) { %>
                    <tr>
                        <td><%= vacante.getNombre() %></td>
                        <td><%= vacante.getEmpresa() %></td>
                        <td>$<%= String.format("%.2f", vacante.getSalario()) %></td>
                        <td><%= vacante.getEstado() %></td>
                        <td>
                            <a href="editar-vacante.jsp?id=<%= vacante.getId() %>" class="btn">Editar</a>
                            <a href="aplicar-vacante.jsp?id=<%= vacante.getId() %>" class="btn">Aplicar</a>
                        </td>
                    </tr>
                <% } %>
            </table>
            
            <a href="crear-vacante.jsp" class="btn">Crear Nueva Vacante</a>
            <a href="reporte-aplicaciones.jsp" class="btn">Ver Reporte de Aplicaciones</a>
        </div>
    </div>
</body>
</html>