/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appweb.service;

import com.appweb.dao.DetalleDao;
import com.appweb.dto.DetalleDto;
import java.util.ArrayList;

/**
 *
 * @author Carlos Euribe
 */
public class DetalleService {

    public ArrayList listarDetallePedido(DetalleDto detalle) {
        DetalleDao dao = new DetalleDao();
        return dao.obtenerDetallePedido(detalle);
    }
}
