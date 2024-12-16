<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jobsearch.Vacante, com.jobsearch.VacanteManager, java.util.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Vacante</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Editar Vacante</h1>
        <div class="glass-container">
            <%
            int id = Integer.parseInt(request.getParameter("id"));
            Vacante vacante = VacanteManager.getVacante(id);
            
            if (request.getMethod().equalsIgnoreCase("post")) {
                String action = request.getParameter("action");
                if ("update".equals(action)) {
                    try {
                        vacante.setNombre(request.getParameter("nombre"));
                        vacante.setDescripcion(request.getParameter("descripcion"));
                        vacante.setPalabrasClave(Arrays.asList(request.getParameter("palabrasClave").split(",")));
                        vacante.setSalario(Double.parseDouble(request.getParameter("salario")));
                        vacante.setEstado(request.getParameter("estado"));
                        vacante.setEmpresa(request.getParameter("empresa"));
                        
                        VacanteManager.updateVacante(vacante);
                        response.sendRedirect("lista-vacantes.jsp");
                    } catch (Exception e) {
                        out.println("<p class='error'>Error al actualizar la vacante: " + e.getMessage() + "</p>");
                    }
                } else if ("delete".equals(action)) {
                    try {
                        VacanteManager.deleteVacante(id);
                        response.sendRedirect("lista-vacantes.jsp");
                    } catch (Exception e) {
                        out.println("<p class='error'>Error al eliminar la vacante: " + e.getMessage() + "</p>");
                    }
                }
            }
            %>
            
            <form action="editar-vacante.jsp?id=<%= id %>" method="post">
                <input type="hidden" name="action" value="update">
                
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" value="<%= vacante.getNombre() %>" required>
                
                <label for="descripcion">Descripción:</label>
                <textarea id="descripcion" name="descripcion" required><%= vacante.getDescripcion() %></textarea>
                
                <label for="palabrasClave">Palabras Clave (separadas por coma):</label>
                <input type="text" id="palabrasClave" name="palabrasClave" value="<%= String.join(",", vacante.getPalabrasClave()) %>" required>
                
                <label for="salario">Salario:</label>
                <input type="number" id="salario" name="salario" value="<%= vacante.getSalario() %>" step="0.01" required>
                
                <label for="estado">Estado:</label>
                <select id="estado" name="estado" required>
                    <option value="disponible" <%= vacante.getEstado().equals("disponible") ? "selected" : "" %>>Disponible</option>
                    <option value="finalizado" <%= vacante.getEstado().equals("finalizado") ? "selected" : "" %>>Finalizado</option>
                    <option value="oculto" <%= vacante.getEstado().equals("oculto") ? "selected" : "" %>>Oculto</option>
                </select>
                
                <label for="empresa">Empresa:</label>
                <input type="text" id="empresa" name="empresa" value="<%= vacante.getEmpresa() %>" required>
                
                <input type="submit" value="Actualizar Vacante" class="btn">
            </form>
            
            <form action="editar-vacante.jsp?id=<%= id %>" method="post" onsubmit="return confirm('¿Está seguro de que desea eliminar esta vacante?');">
                <input type="hidden" name="action" value="delete">
                <input type="submit" value="Eliminar Vacante" class="btn btn-danger">
            </form>
            
            <a href="lista-vacantes.jsp" class="btn">Volver a la Lista de Vacantes</a>
        </div>
    </div>
</body>
</html>