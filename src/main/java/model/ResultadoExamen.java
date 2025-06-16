package model;

import java.sql.Date;

public class ResultadoExamen {

    private String nombreExamen;
    private String tipo;
    private Date fechaAplicacion;
    private double notaObtenida;

    // Constructor vacío n
    public ResultadoExamen() {
    }

    // Constructor completo 
    public ResultadoExamen(String nombreExamen, String tipo, Date fechaAplicacion, double notaObtenida) {
        this.nombreExamen   = nombreExamen;
        this.tipo            = tipo;
        this.fechaAplicacion = fechaAplicacion;
        this.notaObtenida    = notaObtenida;
    }

    // Getters y Setters
    public String getNombreExamen() {
        return nombreExamen;
    }

    public void setNombreExamen(String nombreExamen) {
        this.nombreExamen = nombreExamen;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Date getFechaAplicacion() {
        return fechaAplicacion;
    }

    public void setFechaAplicacion(Date fechaAplicacion) {
        this.fechaAplicacion = fechaAplicacion;
    }

    public double getNotaObtenida() {
        return notaObtenida;
    }

    public void setNotaObtenida(double notaObtenida) {
        this.notaObtenida = notaObtenida;
    }
}
