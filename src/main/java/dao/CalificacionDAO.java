package dao;

import db.Conexion;
import model.Calificacion;
import java.sql.*;
import java.util.ArrayList;

public class CalificacionDAO {

    public ArrayList<Calificacion> obtenerNotasPorAlumno(int idAlumno) {
        ArrayList<Calificacion> lista = new ArrayList<>();
        String sql = "{call sp_VerNotasPorAlumno(?)}"; // Tu stored procedure

        try (Connection con = Conexion.obtenerConexion();
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setInt(1, idAlumno);
            ResultSet rs = cs.executeQuery();

            while (rs.next()) {
                Calificacion c = new Calificacion();
                c.setCurso(rs.getString("Curso"));         
                c.setNotaFinal(rs.getDouble("NotaFinal")); 
                lista.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }
}
