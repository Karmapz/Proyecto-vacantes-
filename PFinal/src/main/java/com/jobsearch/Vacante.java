package com.jobsearch;

import java.util.Date;
import java.util.List;

public class Vacante {
    private int id;
    private String nombre;
    private String descripcion;
    private List<String> palabrasClave;
    private double salario;
    private Date fechaPublicacion;
    private String estado;
    private String empresa;

    public Vacante(int id, String nombre, String descripcion, List<String> palabrasClave, 
                   double salario, Date fechaPublicacion, String estado, String empresa) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.palabrasClave = palabrasClave;
        this.salario = salario;
        this.fechaPublicacion = fechaPublicacion;
        this.estado = estado;
        this.empresa = empresa;
    }

    // Getters y setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }
    public List<String> getPalabrasClave() { return palabrasClave; }
    public void setPalabrasClave(List<String> palabrasClave) { this.palabrasClave = palabrasClave; }
    public double getSalario() { return salario; }
    public void setSalario(double salario) { this.salario = salario; }
    public Date getFechaPublicacion() { return fechaPublicacion; }
    public void setFechaPublicacion(Date fechaPublicacion) { this.fechaPublicacion = fechaPublicacion; }
    public String getEstado() { return estado; }
    public void setEstado(String estado) { this.estado = estado; }
    public String getEmpresa() { return empresa; }
    public void setEmpresa(String empresa) { this.empresa = empresa; }
}