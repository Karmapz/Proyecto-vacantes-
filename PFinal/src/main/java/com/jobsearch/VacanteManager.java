package com.jobsearch;

import java.util.*;

public class VacanteManager {
    private static List<Vacante> vacantes = new ArrayList<>();
    private static int nextId = 1;
    private static Map<Integer, List<Date>> aplicaciones = new HashMap<>();

    static {
        // Agregar algunas vacantes de ejemplo
        addVacante(new Vacante(0, "Desarrollador Web", "Buscamos un desarrollador web con experiencia en React y Node.js", 
                     Arrays.asList("React", "Node.js", "JavaScript"), 50000, new Date(), "disponible", "TechCorp"));
        addVacante(new Vacante(0, "Diseñador UX/UI", "Se busca diseñador UX/UI con experiencia en Figma y Adobe XD", 
                     Arrays.asList("UX", "UI", "Figma", "Adobe XD"), 45000, new Date(), "disponible", "DesignHub"));
        addVacante(new Vacante(0, "Ingeniero de Datos", "Necesitamos un ingeniero de datos con experiencia en Big Data y Apache Spark", 
                     Arrays.asList("Big Data", "Apache Spark", "Python"), 60000, new Date(), "disponible", "DataCo"));
        addVacante(new Vacante(0, "Gerente de Proyecto", "Buscamos un gerente de proyecto con certificación PMP", 
                     Arrays.asList("PMP", "Agile", "Scrum"), 70000, new Date(), "disponible", "ProjectPro"));
        addVacante(new Vacante(0, "Especialista en Ciberseguridad", "Se requiere especialista en ciberseguridad con experiencia en ethical hacking", 
                     Arrays.asList("Ciberseguridad", "Ethical Hacking", "Network Security"), 65000, new Date(), "disponible", "SecureNet"));
    }

    public static List<Vacante> getAllVacantes() {
        return new ArrayList<>(vacantes);
    }

    public static Vacante getVacante(int id) {
        for (Vacante vacante : vacantes) {
            if (vacante.getId() == id) {
                return vacante;
            }
        }
        return null;
    }

    public static void addVacante(Vacante vacante) {
        vacante.setId(nextId++);
        vacantes.add(vacante);
    }

    public static void updateVacante(Vacante vacante) {
        for (int i = 0; i < vacantes.size(); i++) {
            if (vacantes.get(i).getId() == vacante.getId()) {
                vacantes.set(i, vacante);
                break;
            }
        }
    }

    public static void deleteVacante(int id) {
        vacantes.removeIf(vacante -> vacante.getId() == id);
        aplicaciones.remove(id);
    }

    public static List<Vacante> filterVacantes(String keyword) {
        List<Vacante> filteredVacantes = new ArrayList<>();
        for (Vacante vacante : vacantes) {
            if (vacante.getNombre().toLowerCase().contains(keyword.toLowerCase()) ||
                vacante.getDescripcion().toLowerCase().contains(keyword.toLowerCase()) ||
                vacante.getPalabrasClave().stream().anyMatch(kw -> kw.toLowerCase().contains(keyword.toLowerCase()))) {
                filteredVacantes.add(vacante);
            }
        }
        return filteredVacantes;
    }

    public static void aplicarAVacante(int vacanteId, Date fechaAplicacion) {
        aplicaciones.computeIfAbsent(vacanteId, k -> new ArrayList<>()).add(fechaAplicacion);
    }

    public static Map<Vacante, Integer> getAplicacionesPorVacante(Date inicio, Date fin) {
        Map<Vacante, Integer> resultado = new HashMap<>();
        for (Map.Entry<Integer, List<Date>> entry : aplicaciones.entrySet()) {
            int vacanteId = entry.getKey();
            List<Date> fechasAplicacion = entry.getValue();
            
            int count = (int) fechasAplicacion.stream()
                .filter(fecha -> !fecha.before(inicio) && !fecha.after(fin))
                .count();
            
            if (count > 0) {
                Vacante vacante = getVacante(vacanteId);
                if (vacante != null) {
                    resultado.put(vacante, count);
                }
            }
        }
        return resultado;
    }
}