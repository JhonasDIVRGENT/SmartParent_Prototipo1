package model;

public class Calificacion {

    private String curso;
    private double notaFinal;

    public Calificacion(String curso, double notaFinal) {
        this.curso = curso;
        this.notaFinal = notaFinal;
    }

    // Getters y Setters
    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }

    public double getNotaFinal() {
        return notaFinal;
    }

    public void setNotaFinal(double notaFinal) {
        this.notaFinal = notaFinal;
    }

}
