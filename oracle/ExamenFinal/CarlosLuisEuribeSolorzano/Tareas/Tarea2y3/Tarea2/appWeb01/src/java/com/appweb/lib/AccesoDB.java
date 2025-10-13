package com.appweb.lib;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class AccesoDB {

    // constructor de la clase
    public AccesoDB() {
    }

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Connection cn;
        //cargar el driver en memoria
        Class.forName("oracle.jdbc.OracleDriver");
        // obtener objto conecion
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        cn = DriverManager.getConnection(url, "ceuribe", "cles9423421");
        return cn;
    }
}
