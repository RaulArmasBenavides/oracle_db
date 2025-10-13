/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appweb.dao;

import com.appweb.dto.ClienteDto;
import com.appweb.lib.AccesoDB;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import oracle.jdbc.OracleTypes;

/**
 *
 * @author Carlos Euribe
 */
public class ClienteDao {

    public String validarClientes(ClienteDto obj) {
        String sResultado = "FALSE";
        String sSQL = "{call SP_VALIDARCLIENTE(?,?,?)}";
        try {
            Connection cnn = AccesoDB.getConnection();
            CallableStatement cps = cnn.prepareCall(sSQL);
            
            cps.setString(1, obj.getIdCliente());
            cps.setString(2, obj.getClave());
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
    
    public String insertarClientes(ClienteDto obj) {
        String sResultado = "FALSE";
        String sSQL = "{call SP_INSERTARCLIENTES(?,?,?,?,?,?,?)}";
        try {
            Connection cnn = AccesoDB.getConnection();
            CallableStatement cps = cnn.prepareCall(sSQL);

            cps.setString(1, obj.getIdCliente());
            cps.setString(2, obj.getNomCliente());
            cps.setString(3, obj.getRuc());
            cps.setString(4, obj.getDirCliente());
            cps.setString(5, obj.getTelCliente());
            cps.setString(6, obj.getClave());
            cps.registerOutParameter(7, java.sql.Types.VARCHAR);

            cps.execute();
            sResultado = cps.getString(7);

            cps.close();
            cnn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sResultado;
    }

    public ArrayList obtenerClientes() {
        String sSQL = "{call SP_LISTARCLIENTES(?)}";
        Connection cnn = null;
        ArrayList aLista = new ArrayList();
        try {
            cnn = AccesoDB.getConnection();
            CallableStatement cps = cnn.prepareCall(sSQL);
            cps.registerOutParameter(1, OracleTypes.CURSOR);
            cps.execute();
            ResultSet rs = (ResultSet) cps.getObject(1);

            while (rs.next()) {
                ClienteDto obj = new ClienteDto();
                obj.setIdCliente(rs.getString(1));
                obj.setNomCliente(rs.getString(2));
                obj.setRuc(rs.getString(3));
                obj.setDirCliente(rs.getString(4));
                obj.setTelCliente(rs.getString(5));
                obj.setClave(rs.getString(6));
                obj.setNroPedidos(rs.getInt(7));
                obj.setTotalPedidos(rs.getDouble(8));
                aLista.add(obj);
            }

            rs.close();
            cps.close();
            cnn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return aLista;
    }

    public ArrayList traerClientes(ClienteDto obj) {
        String sSQL = "{call SP_TRAERCLIENTES(?,?)}";
        ArrayList aLista = new ArrayList();
        try {
            Connection cnn = AccesoDB.getConnection();
            CallableStatement cps = cnn.prepareCall(sSQL);
            cps.setString(1, obj.getIdCliente());
            cps.registerOutParameter(2, OracleTypes.CURSOR);
            cps.execute();
            ResultSet rs = (ResultSet) cps.getObject(2);

            while (rs.next()) {
                ClienteDto cliente = new ClienteDto();
                obj.setIdCliente(rs.getString(1));
                obj.setNomCliente(rs.getString(2));
                obj.setRuc(rs.getString(3));
                obj.setDirCliente(rs.getString(4));
                obj.setTelCliente(rs.getString(5));
                obj.setClave(rs.getString(6));
                aLista.add(cliente);
            }

            rs.close();
            cps.close();
            cnn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return aLista;
    }

    public String eliminarClientes(ClienteDto obj) {
        String sResultado = "FALSE";
        String sSQL = "{call SP_ELIMINARCLIENTES(?,?)}";
        try {
            Connection cnn = AccesoDB.getConnection();
            CallableStatement cps = cnn.prepareCall(sSQL);

            cps.setString(1, obj.getIdCliente());
            cps.registerOutParameter(2, java.sql.Types.VARCHAR);

            cps.execute();
            sResultado = cps.getString(2);

            cps.close();
            cnn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sResultado;
    }

    public String actualizarClientes(ClienteDto obj) {
        String sResultado = "FALSE";
        String sSQL = "{call SP_ACTUALIZARCLIENTES(?,?,?,?,?,?,?)}";
        try {
            Connection cnn = AccesoDB.getConnection();
            CallableStatement cps = cnn.prepareCall(sSQL);

            cps.setString(1, obj.getIdCliente());
            cps.setString(2, obj.getNomCliente());
            cps.setString(3, obj.getRuc());
            cps.setString(4, obj.getDirCliente());
            cps.setString(5, obj.getTelCliente());
            cps.setString(6, obj.getClave());
            cps.registerOutParameter(7, java.sql.Types.VARCHAR);

            cps.execute();
            sResultado = cps.getString(5);

            cps.close();
            cnn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sResultado;
    }
}
