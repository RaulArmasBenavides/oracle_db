/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appweb.dao;

import com.appweb.dto.ProductoDto;
import com.appweb.lib.AccesoDB;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.CallableStatement;
import oracle.jdbc.OracleTypes;
/**
 *
 * @author alumno
 */
public class ProductoDao {

    public String insertarProductos(ProductoDto obj) {
        String sResultado = "FALSE";
        String sSQL = "{call SP_INSERTARPRODUCTOS(?,?,?,?,?)}";
        try {
            Connection cnn = AccesoDB.getConnection();
            CallableStatement cps = cnn.prepareCall(sSQL);

            cps.setString(1, obj.getCodigo());
            cps.setString(2, obj.getNombre());
            cps.setDouble(3, obj.getCosto());
            cps.setInt(4, obj.getStock());
            cps.registerOutParameter(5, java.sql.Types.VARCHAR);
            
            cps.execute();
            sResultado = cps.getString(5);
            
            cps.close();
            cnn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sResultado;
    }

    public ArrayList obtenerProductos() {
        String sSQL = "{call SP_LISTARPRODUCTOS(?)}";
        Connection cnn = null;
        ArrayList aLista = new ArrayList();
        try {
            cnn = AccesoDB.getConnection();
            CallableStatement cps = cnn.prepareCall(sSQL);
            cps.registerOutParameter(1, OracleTypes.CURSOR);
            cps.execute();
            ResultSet rs = (ResultSet) cps.getObject(1);
            
            while (rs.next()) {
                ProductoDto obj = new ProductoDto();
                obj.setCodigo(rs.getString(1));
                obj.setNombre(rs.getString(2));
                obj.setCosto(rs.getFloat(3));
                obj.setStock(rs.getInt(4));
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

    public ArrayList traerProductos(ProductoDto obj) {
        String sSQL = "{call SP_TRAERPRODUCTOS(?,?)}";
        ArrayList aLista = new ArrayList();
        try {
            Connection cnn = AccesoDB.getConnection();
            CallableStatement cps = cnn.prepareCall(sSQL); 
            cps.setString(1, obj.getCodigo());
            cps.registerOutParameter(2, OracleTypes.CURSOR);
            cps.execute();
            ResultSet rs = (ResultSet) cps.getObject(2);

            while (rs.next()) {
                ProductoDto producto = new ProductoDto();
                producto.setCodigo(rs.getString(1));
                producto.setNombre(rs.getString(2));
                producto.setCosto(rs.getFloat(3));
                producto.setStock(rs.getInt(4));
                aLista.add(producto);
            }

            rs.close();
            cps.close();
            cnn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return aLista;
    }

    public String eliminarProductos(ProductoDto obj) {
        String sResultado = "FALSE";
        String sSQL = "{call SP_ELIMINARPRODUCTOS(?,?)}";
        try {
            Connection cnn = AccesoDB.getConnection();
            CallableStatement cps = cnn.prepareCall(sSQL);
            
            cps.setString(1, obj.getCodigo());
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

    public String actualizarProductos(ProductoDto obj) {
        String sResultado = "FALSE";
        String sSQL = "{call SP_ACTUALIZARPRODUCTOS(?,?,?,?,?)}";
        try {
            Connection cnn = AccesoDB.getConnection();
            CallableStatement cps = cnn.prepareCall(sSQL);

            cps.setString(1, obj.getCodigo());
            cps.setString(2, obj.getNombre());
            cps.setDouble(3, obj.getCosto());
            cps.setInt(4, obj.getStock());
            cps.registerOutParameter(5, java.sql.Types.VARCHAR);

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
