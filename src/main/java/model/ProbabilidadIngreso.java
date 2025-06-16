package model;

public class ProbabilidadIngreso {

    private double promedio;
    private String probabilidad;

    // Constructor vacío
    public ProbabilidadIngreso() {
    }

    // Constructor con parámetros (opcional)
    public ProbabilidadIngreso(double promedio, String probabilidad) {
        this.promedio = promedio;
        this.probabilidad = probabilidad;
    }

    // Getters y Setters
    public double getPromedio() {
        return promedio;
    }

    public void setPromedio(double promedio) {
        this.promedio = promedio;
    }

    public String getProbabilidad() {
        return probabilidad;
    }

    public void setProbabilidad(String probabilidad) {
        this.probabilidad = probabilidad;
    }
}
