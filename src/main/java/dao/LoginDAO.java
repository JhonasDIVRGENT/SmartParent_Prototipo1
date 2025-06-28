package dao;

import db.Conexion;
import model.ParentStudent;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

public class LoginDAO {

    /**
     * Llama al SP sp_LoginPadreAlumno.
     * Retorna un ParentStudent si la pareja DNI existe, o null en caso contrario.
     */
    public ParentStudent login(String dniPadre, String dniHijo) throws Exception {
        String sql = "{ CALL sp_LoginPadreAlumno(?, ?) }";
        try (Connection conn = Conexion.obtenerConexion();
             CallableStatement cs = conn.prepareCall(sql)) {

            cs.setString(1, dniPadre);
            cs.setString(2, dniHijo);

            try (ResultSet rs = cs.executeQuery()) {
                if (rs.next()) {
                    int    pid  = rs.getInt("IdPadre");
                    String pNm  = rs.getString("NombrePadre") + " " + rs.getString("ApellidoPadre");
                    int    sid  = rs.getInt("IdAlumno");
                    String sNm  = rs.getString("NombreAlumno") + " " + rs.getString("ApellidoAlumno");
                    return new ParentStudent(pid, pNm, sid, sNm);
                } else {
                    return null;
                }
            }
        }
    }
}
