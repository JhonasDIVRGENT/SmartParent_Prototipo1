package model;

import java.sql.Date;

public class Asistencia {

    private Date fecha;
    private String curso;
    private String estado;

    // Constructor vacío
    public Asistencia() {
    }

    // Getters y Setters correctos para Date
    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}
