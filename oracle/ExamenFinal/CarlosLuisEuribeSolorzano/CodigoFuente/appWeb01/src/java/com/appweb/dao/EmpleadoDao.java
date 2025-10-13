/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appweb.dao;

import com.appweb.dto.EmpleadoDto;
import com.appweb.lib.AccesoDB;
import java.sql.CallableStatement;
import java.sql.Connection;

/**
 *
 * @author Carlos Euribe
 */
public class EmpleadoDao {
    
    public String validarEmpleados(EmpleadoDto obj) {
        String sResultado = "FALSE";
        String sSQL = "{call SP_VALIDAREMPLEADO(?,?,?)}";
        try {
            Connection cnn = AccesoDB.getConnection();
            CallableStatement cps = cnn.prepareCall(sSQL);
            
            cps.setString(1, obj.getIdEmpleado());
            cps.setString(2, obj.getClaveEmpleado());
            cps.registerOutParameter(3, java.sql.Types.VARCHAR);
            
            cps.execute();
            sResultado = cps.getString(3);
            
            cps.close();
            cnn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sResultado;
    }
    
}
