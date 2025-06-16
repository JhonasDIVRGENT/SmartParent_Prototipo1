package dao;

import db.Conexion;
import model.ResultadoExamen;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ResultadoExamenDAO {

    /**
     * Llama al SP sp_VerResultadosExamen(@IdAlumno) y devuelve la lista de resultados.
     */
    public List<ResultadoExamen> obtenerResultadosPorAlumno(int idAlumno) {
        List<ResultadoExamen> lista = new ArrayList<>();
        String sql = "{call sp_VerResultadosExamen(?)}";

        try (Connection con = Conexion.obtenerConexion();
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setInt(1, idAlumno);
            try (ResultSet rs = cs.executeQuery()) {
                while (rs.next()) {
                    ResultadoExamen re = new ResultadoExamen();
                    re.setNombreExamen(rs.getString("NombreExamen"));
                    re.setTipo(rs.getString("Tipo"));
                    re.setFechaAplicacion(rs.getDate("FechaAplicacion"));
                    re.setNotaObtenida(rs.getDouble("NotaObtenida"));
                    lista.add(re);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }
}
