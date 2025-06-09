package model;

public class Asistencia {

    private String fecha;
    private String curso;
    private String estado;

    public Asistencia(String fecha, String curso, String estado) {
        this.fecha = fecha;
        this.curso = curso;
        this.estado = estado;
    }

    // Getters y Setters
    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
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
