package model;

public class ResultadoExamen {

    private String examen;
    private String tipoExamen;
    private double notaObtenida;

    public ResultadoExamen(String examen, String tipoExamen, double notaObtenida) {
        this.examen = examen;
        this.tipoExamen = tipoExamen;
        this.notaObtenida = notaObtenida;
    }

    // Getters y Setters
    public String getExamen() {
        return examen;
    }

    public void setExamen(String examen) {
        this.examen = examen;
    }

    public String getTipoExamen() {
        return tipoExamen;
    }

    public void setTipoExamen(String tipoExamen) {
        this.tipoExamen = tipoExamen;
    }

    public double getNotaObtenida() {
        return notaObtenida;
    }

    public void setNotaObtenida(double notaObtenida) {
        this.notaObtenida = notaObtenida;
    }

}
