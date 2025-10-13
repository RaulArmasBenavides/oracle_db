/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appweb.dao;

import com.appweb.dto.RespuestaDto;
import com.appweb.lib.AccesoDB;
import java.sql.Connection;
import java.sql.CallableStatement;

/**
 *
 * @author Carlos Euribe
 */
public class RespuestaDao {

    public int indiceCorrelativo() {
        int iIndice = 0;
        String sSQL = "{call SP_TOTALRESPUESTAS(?)}";
        try {
            Connection cnn = AccesoDB.getConnection();
            CallableStatement cps = cnn.prepareCall(sSQL);
            cps.registerOutParameter(1, java.sql.Types.INTEGER);
            
            cps.execute();
            iIndice = cps.getInt(1);
            
            cps.close();
            cnn.close();
        } catch (Exception e) {
            System.out.println(e + "--->" + sSQL);
        }
        return iIndice;
    }

    public String buscarCodigoUsuario(RespuestaDto obj) {
        String sCodigo = "";
        String sSQL = "{call sp_BUSCARCODIGOUSUARIO(?,?,?)}";
        try {
            Connection cnn = AccesoDB.getConnection();
            CallableStatement cps = cnn.prepareCall(sSQL);
            
            cps.setString(1, obj.getNombre());
            cps.setString(2, obj.getApellido());
            cps.registerOutParameter(3, java.sql.Types.VARCHAR);

            cps.execute();
            sCodigo = cps.getString(3);

            cps.close();
            cnn.close();
        } catch (Exception e) {
            System.out.println(e + "--->" + sSQL);
        }
        return sCodigo;
    }

    public String insertar(RespuestaDto obj) {
        String sResultado = "FALSE";
        String sSQL = "{call SP_INSERTARRESPUESTAS(?,?,?,?,?)}";
        try {
            int iCorrelativo = this.indiceCorrelativo() + 1;
            String sCodigo = this.buscarCodigoUsuario(obj);
            
            Connection cnn = AccesoDB.getConnection();
            CallableStatement cps = cnn.prepareCall(sSQL);
            
            cps.setInt(1, iCorrelativo);
            cps.setString(2, sCodigo);
            cps.setString(3, obj.getOpcion());
            cps.setString(4, obj.getComentario());
            cps.registerOutParameter(5, java.sql.Types.VARCHAR);

            cps.execute();
            sResultado = cps.getString(5);

            cps.close();
            cnn.close();
        } catch (Exception e) {
            System.out.println(e + "--->" + sSQL);
        }
        return sResultado;
    }
}
