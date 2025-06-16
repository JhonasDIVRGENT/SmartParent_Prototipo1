package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    
    private static final String URL =
        "jdbc:sqlserver://DESKTOP-HVD5TEJ;instanceName=SQLEXPRESS;"
      + "encrypt=false;trustServerCertificate=true";
    private static final String USER = "sa";
    private static final String PASS = "sql";

    public static Connection obtenerConexion() throws SQLException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException ex) {
            throw new SQLException("Driver JDBC no encontrado", ex);
        }
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
