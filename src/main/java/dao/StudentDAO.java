
package dao;

import db.Conexion;
import model.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class StudentDAO {

    private static final String SQL_GET_BY_ID =
        "SELECT IdAlumno, DniAlumno, Nombres, Apellidos, FechaNacimiento, FechaRegistro " +
        "FROM Alumnos WHERE IdAlumno = ?";

    public Student getStudentById(int idAlumno) throws Exception {
        try (Connection conn = Conexion.obtenerConexion();
             PreparedStatement ps = conn.prepareStatement(SQL_GET_BY_ID)) {
            ps.setInt(1, idAlumno);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Student(
                        rs.getInt("IdAlumno"),
                        rs.getString("DniAlumno"),
                        rs.getString("Nombres"),
                        rs.getString("Apellidos"),
                        rs.getDate("FechaNacimiento"),
                        rs.getDate("FechaRegistro")
                    );
                } else {
                    return null;
                }
            }
        }
    }
}
