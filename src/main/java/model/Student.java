
package model;

import java.sql.Date;

public class Student {
    private int id;
    private String dni;
    private String nombres;
    private String apellidos;
    private Date fechaNacimiento;
    private Date fechaRegistro;

    public Student(int id, String dni, String nombres, String apellidos,
                   Date fechaNacimiento, Date fechaRegistro) {
        this.id = id;
        this.dni = dni;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.fechaNacimiento = fechaNacimiento;
        this.fechaRegistro = fechaRegistro;
    }

    // Getters
    public int getId()                   { return id; }
    public String getDni()               { return dni; }
    public String getNombres()           { return nombres; }
    public String getApellidos()         { return apellidos; }
    public Date getFechaNacimiento()     { return fechaNacimiento; }
    public Date getFechaRegistro()       { return fechaRegistro; }

    public String getNombreCompleto()    { return nombres + " " + apellidos; }
}
