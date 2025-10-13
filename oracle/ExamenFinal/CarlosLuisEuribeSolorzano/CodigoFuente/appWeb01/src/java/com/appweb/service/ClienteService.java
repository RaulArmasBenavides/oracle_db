/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appweb.service;

import com.appweb.dao.ClienteDao;
import com.appweb.dto.ClienteDto;
import java.util.ArrayList;

/**
 *
 * @author Carlos Euribe
 */
public class ClienteService {

    public String validarClientes(ClienteDto obj) {
        ClienteDao dao = new ClienteDao();
        return dao.validarClientes(obj);
    }

    public String insertarClientes(ClienteDto obj) {
        ClienteDao dao = new ClienteDao();
        return dao.insertarClientes(obj);
    }

    public ArrayList listarClientes() {
        ClienteDao dao = new ClienteDao();
        return dao.obtenerClientes();
    }

    public ArrayList traerClientes(ClienteDto obj) {
        ClienteDao dao = new ClienteDao();
        return dao.traerClientes(obj);
    }

    public String eliminarClientes(ClienteDto obj) {
        ClienteDao dao = new ClienteDao();
        return dao.eliminarClientes(obj);
    }

    public String actualizarClientes(ClienteDto obj) {
        ClienteDao dao = new ClienteDao();
        return dao.actualizarClientes(obj);
    }
}
