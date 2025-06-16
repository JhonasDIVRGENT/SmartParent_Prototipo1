package dao;

import db.Conexion;
import model.ProbabilidadIngreso;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProbabilidadIngresoDAO {

    /**
     * Llama al SP sp_ProbabilidadIngreso(@IdAlumno) 
     * y devuelve un objeto con el promedio y la probabilidad.
     */
    public ProbabilidadIngreso obtenerProbabilidad(int idAlumno) {
        ProbabilidadIngreso pi = null;
        String sql = "{call sp_ProbabilidadIngreso(?)}";

        try (Connection con = Conexion.obtenerConexion();
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setInt(1, idAlumno);
            boolean hasResult = cs.execute();

            if (hasResult) {
                try (ResultSet rs = cs.getResultSet()) {
                    if (rs.next()) {
                        pi = new ProbabilidadIngreso();
                        pi.setPromedio(rs.getDouble("Promedio"));
                        pi.setProbabilidad(rs.getString("ProbabilidadIngreso"));
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return pi;
    }
}
