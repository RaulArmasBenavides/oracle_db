/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appweb.dao;

import com.appweb.dto.DetalleDto;
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
public class DetalleDao {

    public ArrayList obtenerDetallePedido(DetalleDto detalle) {
        String sSQL = "{call SP_LISTARDETALLEXPEDIDO(?,?)}";
        Connection cnn = null;
        ArrayList aLista = new ArrayList();
        try {
            cnn = AccesoDB.getConnection();
            CallableStatement cps = cnn.prepareCall(sSQL);
            cps.setLong(1, detalle.getIdPedido());
            cps.registerOutParameter(2, OracleTypes.CURSOR);
            cps.execute();
            ResultSet rs = (ResultSet) cps.getObject(2);

            while (rs.next()) {
                DetalleDto obj = new DetalleDto();
                obj.setIdPedido(rs.getInt(1));
                obj.setIdArticulo(rs.getString(2));
                obj.setNombre(rs.getString(3));
                obj.setCantidad(rs.getDouble(4));
                obj.setPreVenta(rs.getLong(5));
                obj.setSubTotal(rs.getDouble(6));
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
}
