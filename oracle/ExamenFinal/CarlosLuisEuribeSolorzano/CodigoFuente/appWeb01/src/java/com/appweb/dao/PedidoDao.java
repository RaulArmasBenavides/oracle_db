/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appweb.dao;

import com.appweb.dto.ClienteDto;
import com.appweb.dto.EmpleadoDto;
import com.appweb.dto.PedidoDto;
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
public class PedidoDao {

    public ArrayList obtenerPedidos(ClienteDto cliente) {
        System.out.println("--->Pedido Cliente:2");
        String sSQL = "{call SP_LISTARPEDIDOSXCLIENTE(?,?)}";
        Connection cnn = null;
        ArrayList aLista = new ArrayList();
        try {
            cnn = AccesoDB.getConnection();
            CallableStatement cps = cnn.prepareCall(sSQL);
            cps.setString(1, cliente.getIdCliente());
            cps.registerOutParameter(2, OracleTypes.CURSOR);
            cps.execute();
            ResultSet rs = (ResultSet) cps.getObject(2);

            while (rs.next()) {
                PedidoDto obj = new PedidoDto();
                obj.setIdPedido(rs.getInt(1));
                obj.setNumDocumento(rs.getString(2));
                obj.setFecha(rs.getString(3));
                obj.setImporte(rs.getDouble(4));
                obj.setDescuento(rs.getDouble(5));
                obj.setSubTotal(rs.getDouble(6));
                obj.setIgv(rs.getDouble(7));
                obj.setTotal(rs.getDouble(8));
                obj.setDesDelivery(rs.getString(9));
                obj.setDesEstado(rs.getString(10));
                obj.setNomEmpleado(rs.getString(11));
                obj.setTelEmpleado(rs.getString(12));
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
    
    public ArrayList obtenerPedidos(EmpleadoDto empleado) {
        String sSQL = "{call SP_LISTARPEDIDOSXEMPLEADO(?,?)}";
        Connection cnn = null;
        ArrayList aLista = new ArrayList();
        try {
            cnn = AccesoDB.getConnection();
            CallableStatement cps = cnn.prepareCall(sSQL);
            cps.setString(1, empleado.getIdEmpleado());
            cps.registerOutParameter(2, OracleTypes.CURSOR);
            cps.execute();
            ResultSet rs = (ResultSet) cps.getObject(2);

            while (rs.next()) {
                PedidoDto obj = new PedidoDto();
                obj.setIdPedido(rs.getInt(1));
                obj.setNumDocumento(rs.getString(2));
                obj.setFecha(rs.getString(3));
                obj.setImporte(rs.getDouble(4));
                obj.setDescuento(rs.getDouble(5));
                obj.setSubTotal(rs.getDouble(6));
                obj.setIgv(rs.getDouble(7));
                obj.setTotal(rs.getDouble(8));
                obj.setDesDelivery(rs.getString(9));
                obj.setDesEstado(rs.getString(10));
                obj.setNomCliente(rs.getString(11));
                obj.setDirCliente(rs.getString(12));
                obj.setTelCliente(rs.getString(13));
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
    
    public String entregaPedido(PedidoDto obj) {
        String sResultado = "FALSE";
        String sSQL = "{call SP_ENTREGAPEDIDOS(?,?)}";
        try {
            Connection cnn = AccesoDB.getConnection();
            CallableStatement cps = cnn.prepareCall(sSQL);

            cps.setLong(1, obj.getIdPedido());
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
}
