/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appweb.service;

import com.appweb.dao.PedidoDao;
import com.appweb.dto.ClienteDto;
import com.appweb.dto.EmpleadoDto;
import com.appweb.dto.PedidoDto;
import java.util.ArrayList;

/**
 *
 * @author Carlos Euribe
 */
public class PedidoService {

    public ArrayList listarPedidos(ClienteDto cliente) {
        PedidoDao dao = new PedidoDao();
        System.out.println("--->Pedido Cliente:SERVICE");
        return dao.obtenerPedidos(cliente);
    }

    public ArrayList listarPedidos(EmpleadoDto empleado) {
        PedidoDao dao = new PedidoDao();
        return dao.obtenerPedidos(empleado);
    }
    
    public String entregaPedido(PedidoDto pedido) {
        PedidoDao dao = new PedidoDao();
        return dao.entregaPedido(pedido);
    }
}
