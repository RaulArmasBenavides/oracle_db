/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appweb.service;

import com.appweb.dao.ProductoDao;
import com.appweb.dto.ProductoDto;
import java.util.ArrayList;

/**
 *
 * @author alumno
 */
public class ProductoService {

    public String insertarProductos(ProductoDto obj) {
        ProductoDao dao = new ProductoDao();
        return dao.insertarProductos(obj);
    }

    public ArrayList listarProductos() {
        ProductoDao dao = new ProductoDao();
        return dao.obtenerProductos();
    }

    public ArrayList traerProductos(ProductoDto obj) {
        ProductoDao dao = new ProductoDao();
        return dao.traerProductos(obj);
    }
    
    public String eliminarProductos(ProductoDto obj) {
        ProductoDao dao = new ProductoDao();
        return dao.eliminarProductos(obj);
    }
    
    public String actualizarProductos(ProductoDto obj) {
        ProductoDao dao = new ProductoDao();
        return dao.actualizarProductos(obj);
    }
}
