package dao;

import db.Conexion;
import model.Asistencia;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AsistenciaDAO {

    /** Llama al SP sp_VerAsistenciaPorAlumno(@IdAlumno) */
    public List<Asistencia> obtenerAsistenciaPorAlumno(int idAlumno) {
        List<Asistencia> lista = new ArrayList<>();
        String sql = "{call sp_VerAsistenciaPorAlumno(?)}";

        try (Connection con = Conexion.obtenerConexion();
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setInt(1, idAlumno);
            try (ResultSet rs = cs.executeQuery()) {
                while (rs.next()) {
                    Asistencia a = new Asistencia();
                    a.setCurso(rs.getString("Curso"));
                    a.setFecha(rs.getDate("Fecha"));
                    a.setEstado(rs.getString("EstadoAsistencia"));
                    lista.add(a);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
}
